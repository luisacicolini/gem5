1. compile fastntt assembly, after commenting out the attribute 5
    riscv64-linux-gnu-gcc -march=rv64gc_zba -c fastntt.s -o fastNTT.o

    -> for the veir file we need to replace the `main` in the asm with a specific name, for fastntt it's fasgtNTT (done already)

2. compile harness and fun
    clang --target=riscv64-linux-gnu   --sysroot=/usr/riscv64-linux-gnu   -fuse-ld=lld -static   harness.o fastNTT.o -o bench_fastNTT -I/home/lc985/gem5/include         -L/home/lc985/gem5/util/m5/build/riscv/out -lm5

3. simulate:
    build/RISCV/gem5.opt     configs/deprecated/example/se.py     --cpu-type=TimingSimpleCPU     --caches     -c bench_fastNTT
