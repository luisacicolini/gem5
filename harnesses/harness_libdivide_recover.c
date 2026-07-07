#include <libdivide.h>
#include <stdint.h>

#include <gem5/m5ops.h>

#define NUM_DIVISORS 1024
/*
 * libdivide_s64_recover takes a previously-generated magic/shift struct
 * and recovers the original divisor. To get valid structs we have to
 * call libdivide_internal_s64_gen() first -- that's setup, done before
 * m5_reset_stats, so only libdivide_s64_recover's own work is measured.
 *
 * recover() branches on properties of the input struct (shift-path vs
 * mult-path, negative-divisor bit), so which path each call takes
 * depends on the original divisor. Keep this divisor set identical
 * across every variant you compare -- same fairness rule as before.
 */
static int64_t divisors[NUM_DIVISORS];
static struct libdivide_s64_t magics[NUM_DIVISORS];
static int64_t recovered[NUM_DIVISORS];

static void
init_divisors(void)
{
    /* Deterministic LCG -- same sequence every run. */
    uint64_t x = 1;
    for (int i = 0; i < NUM_DIVISORS; i++) {
        x = x * 6364136223846793005ULL + 1442695040888963407ULL;
        int64_t d = (int64_t)(x >> 1); /* avoid INT64_MIN edge case */
        if (d == 0) {
            d = 1; /* divisor must be non-zero */
        }
        divisors[i] = d;
    }

    /* Force in edge cases so both the shift path (power-of-two divisor)
     * and the mult path, plus both signs, are exercised every run. */
    divisors[0] = 1;
    divisors[1] = -1;
    divisors[2] = 64;   /* power of two -> shift path, positive */
    divisors[3] = -128; /* power of two -> shift path, negative */
    divisors[4] = 3;    /* odd -> mult path, positive */
    divisors[5] = -7;   /* odd -> mult path, negative */
}

int
main(void)
{
    init_divisors();

    /* Setup: generate the magic/shift struct for each divisor. Not
     * measured -- mirrors real usage, where gen() runs once and
     * recover()/the actual division runs many times after. */
    for (int i = 0; i < NUM_DIVISORS; i++) {
        libdivide_internal_s64_gen(divisors[i], 0, &magics[i]);
    }

    m5_reset_stats(0, 0);
    for (int i = 0; i < 1000; i++) {
        libdivide_s64_recover(&magics[i], &recovered[i]);
    }
    m5_dump_stats(0, 0);

    /* Correctness check + prevents dead-code elimination: recovered[i]
     * should exactly equal divisors[i] for every entry, so this should
     * sum to 0. */
    volatile int64_t sink = 0;
    for (int i = 0; i < NUM_DIVISORS; i++) {
        sink += recovered[i] - divisors[i];
    }

    return (int)sink;
}
