#include <stdint.h>

#include <gem5/m5ops.h>

#define N 128
extern void sha256_block(uint32_t *H, const uint32_t *M, const uint32_t *K,
                         uint32_t *W);

/* Global buffers to ensure they are in the .data segment */
static uint32_t H[8];
static uint32_t M[16];
static uint32_t K[64];
static uint32_t W[64];

/*
 * Note: If sha256_block is marked 'always_inline' in a header,
 * do not use extern. If it is a standalone function in a C file,
 * this declaration is required.
 */
extern void sha256_block(uint32_t *H, const uint32_t *M, const uint32_t *K,
                         uint32_t *W);

int
main(void)
{
    /* Initialize buffers with dummy data */
    for (int i = 0; i < 8; i++) {
        H[i] = i;
    }
    for (int i = 0; i < 16; i++) {
        M[i] = i * 2;
    }
    for (int i = 0; i < 64; i++) {
        K[i] = i * 3;
        W[i] = 0;
    }

    m5_reset_stats(0, 0);

    for (int j = 0; j < 1000; j++) {
        /* Run the target function */
        sha256_block(H, M, K, W);
    }
    m5_dump_stats(0, 0);

    return 0;
}
