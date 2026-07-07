#include <libdivide.h>
#include <stdint.h>

#include <gem5/m5ops.h>

#define NUM_DIVISORS 1024

/*
 * Fixed, deterministic divisor set. Like the signed version, this
 * function branches on properties of `d` (the power-of-two check, plus
 * a data-dependent correction inside the general 65-bit path), so the
 * dynamic instruction/cycle count depends on which divisors you feed
 * it. Keep this array identical across every variant you compare.
 */
static uint64_t divisors[NUM_DIVISORS];
static struct libdivide_u64_t results[NUM_DIVISORS];

static void
init_divisors(void)
{
    /* Deterministic LCG -- same sequence every run. */
    uint64_t x = 1;
    for (int i = 0; i < NUM_DIVISORS; i++) {
        x = x * 6364136223846793005ULL + 1442695040888963407ULL;
        uint64_t d = x;
        if (d == 0) {
            d = 1; /* divisor must be non-zero */
        }
        divisors[i] = d;
    }

    /* Force in a few deliberate edge cases: powers of two exercise the
     * shift path, everything else exercises the general 65-bit path. */
    divisors[0] = 1;
    divisors[1] = 2;
    divisors[2] = 64;
    divisors[3] = UINT64_MAX;
    divisors[4] = 3;
    divisors[5] = 7;
}

int
main(void)
{
    init_divisors();

    m5_reset_stats(0, 0);
    for (int i = 0; i < NUM_DIVISORS; i++) {
        /* branchfree = 0: standard (branching) codegen path.
         * Pass 1 instead if you want the branchfree-mode generation. */
        libdivide_internal_u64_gen(divisors[i], 0, &results[i]);
    }
    m5_dump_stats(0, 0);

    /* Touch every result so the loop can't be optimized away or hoisted
     * out from under m5_reset_stats/m5_dump_stats. */
    volatile uint64_t sink = 0;
    for (int i = 0; i < NUM_DIVISORS; i++) {
        sink += results[i].magic ^ results[i].more;
    }

    return (int)sink;
}
