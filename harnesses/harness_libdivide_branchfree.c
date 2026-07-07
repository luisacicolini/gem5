#include <libdivide.h>
#include <stdint.h>

#include <gem5/m5ops.h>

#define NUM_DIVISORS 8
#define NUM_NUMERATORS 256

/*
 * NOTE: libdivide's branchfree path does not support divisors of 1 or -1
 * (the magic-number scheme it uses is undefined for those). Keep 1/-1
 * out of this set -- everything else (powers of two and arbitrary odd
 * values, both signs) is fine.
 */
static const int64_t divisors[NUM_DIVISORS] = {2, -2, 64,      -128,
                                               3, -7, 1000003, -999983};

static struct libdivide_s64_branchfree_t magics[NUM_DIVISORS];
static int64_t numerators[NUM_NUMERATORS];
static int64_t results[NUM_DIVISORS][NUM_NUMERATORS];

static void
init_numerators(void)
{
    /* Deterministic LCG -- same sequence every run. */
    uint64_t x = 12345;
    for (int i = 0; i < NUM_NUMERATORS; i++) {
        x = x * 6364136223846793005ULL + 1442695040888963407ULL;
        numerators[i] = (int64_t)x;
    }

    /* A few deliberate edge cases (0 and INT64_MAX are safe with
     * branchfree; just avoid divisors of +-1, handled above). */
    numerators[0] = 0;
    numerators[1] = 1;
    numerators[2] = -1;
    numerators[3] = INT64_MAX;
}

int
main(void)
{
    init_numerators();

    /*
     * Setup: generate the branchfree magic/shift pair for each divisor.
     * libdivide_internal_s64_gen(d, branchfree, out) writes into a
     * libdivide_s64_t; libdivide_s64_branchfree_t has the identical
     * {magic, more} layout, so we just copy the two fields across.
     * Not measured -- gen() runs once per divisor, the divide itself
     * (do()) is the hot path in real use.
     */
    for (int d = 0; d < NUM_DIVISORS; d++) {
        struct libdivide_s64_t tmp;
        libdivide_internal_s64_gen(divisors[d], /*branchfree=*/1, &tmp);
        magics[d].magic = tmp.magic;
        magics[d].more = tmp.more;
    }

    m5_reset_stats(0, 0);
    for (int d = 0; d < NUM_DIVISORS; d++) {
        for (int i = 0; i < NUM_NUMERATORS; i++) {
            libdivide_s64_branchfree_do(numerators[i], &magics[d],
                                        &results[d][i]);
        }
    }
    m5_dump_stats(0, 0);

    /* Correctness check against native division; also prevents the
     * results array from being optimized away. */
    volatile int64_t mismatches = 0;
    for (int d = 0; d < NUM_DIVISORS; d++) {
        for (int i = 0; i < NUM_NUMERATORS; i++) {
            int64_t expected = numerators[i] / divisors[d];
            if (results[d][i] != expected) {
                mismatches++;
            }
        }
    }

    return (int)mismatches;
}
