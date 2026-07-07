#include <stdint.h>

#include <gem5/m5ops.h>

#define N 128
static int64_t data[N];
static int64_t data_orig[N];
static int64_t twiddle[2048];
extern void fastNTT(int64_t *coeffs, long n, long cmod, int64_t *roots,
                    long inverse, long degree);

int
main(void)
{
    for (int i = 0; i < N; i++) {
        data_orig[i] = i + 1;
        twiddle[i] = (i * 7 + 3) % 97;
    }
    for (int i = 0; i < N; i++) {
        data[i] = data_orig[i];
    }

    m5_reset_stats(0, 0);
    // Pass 6 arguments here
    for (int j = 0; j < 10000; j++) {
        fastNTT(data, N, 998244353, twiddle, 1, N);
    }
    m5_dump_stats(0, 0);

    return 0;
}
