1. compile fastntt assembly, after commenting out the attribute 5
    riscv64-linux-gnu-gcc -static -O2 harness.c fastNTT.o

2. compile harness and fun
    riscv64-linux-gnu-gcc -static -O2 harness.c fastNTT.o \
  -I/home/lc985/gem5/include \
  -L/home/lc985/gem5/util/m5/build/riscv/out/ \
  -lm5 -o bench_fastNTT

3. simulate:
    build/RISCV/gem5.opt     configs/deprecated/example/se.py     --cpu-type=TimingSimpleCPU     --caches     -c bench_fastNTT
