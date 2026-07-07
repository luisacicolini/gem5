#!/usr/bin/env python3
"""
run_benchmarks.py -- assemble, link, and gem5-simulate a list of benchmarks
across multiple pipeline directories. Saves each run's gem5 stats uniquely
identified by the benchmark and pipeline name.

Usage:
  ./run_benchmarks.py --benchmarks matmul sort bfs \
                      --pipelines pipe_A pipe_B pipe_C \
                      --harness-dir src_harnesses \
                      [results_dir] [options]
"""

import argparse
import collections
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ATTRIBUTE5_RE = re.compile(r"^\s*\.attribute\s*5\s*,")


def patch_asm(text: str, func_name: str) -> str:
    """Strip the legacy '_b1p0' token, neutralize the in-file
    .attribute 5, and rename 'main' to the expected function name."""
    text = text.replace("_b1p0", "")

    # Workaround for MLIR tools forcibly renaming the entry function to 'main'
    text = re.sub(r"\bmain\b", func_name, text)

    out_lines = []
    for line in text.splitlines(keepends=True):
        if ATTRIBUTE5_RE.match(line):
            out_lines.append("# " + line)
        else:
            out_lines.append(line)
    return "".join(out_lines)


def run(cmd):
    """subprocess.run wrapper that always captures output as text."""
    return subprocess.run(cmd, capture_output=True, text=True)


def report_failure(name, pipeline, stage, result, failed):
    print(f"  ! [{pipeline}] {stage} failed:")
    output = (result.stderr or result.stdout or "").splitlines()
    for line in output[-20:]:
        print(f"    {line}")
    failed.append(f"{name} ({pipeline}): {stage}")


BENCHMARKS = [
    "fastntt.c",
    "sha256.c",
    "libdivide_s64_recover.c",
    "libdivide_s32_recover.c",
    "libdivide_s64_do_raw.c",
    "libdivide_s32_do_raw.c",
    "libdivide_u32_do_raw.c",
    "libdivide_s64_branchfree_do.c",
    "libdivide_s32_branchfree_do.c",
    "libdivide_internal_u64_gen.c",
    "libdivide_internal_s64_gen.c",
]

PIPELINES = [
    "LLC_ASM_globalisel",
    "LLC_ASM_selectiondag",
    "VEIR_REGALLOC_ASM",
]

harness_mapping = {
    "sha256.c": "/home/lc985/gem5/harnesses/harness_sha256.c",
    "libdivide_s64_recover.c": "/home/lc985/gem5/harnesses/harness_libdivide_recover.c",
    "libdivide_s32_recover.c": "/home/lc985/gem5/harnesses/harness_libdivide_recover.c",
    "libdivide_s64_do_raw.c": "/home/lc985/gem5/harnesses/harness_libdivide_do_raw.c",
    "libdivide_s32_do_raw.c": "/home/lc985/gem5/harnesses/harness_libdivide_do_raw.c",
    "libdivide_u32_do_raw.c": "/home/lc985/gem5/harnesses/harness_libdivide_do_raw.c",
    "libdivide_s64_branchfree_do.c": "/home/lc985/gem5/harnesses/harness_libdivide_branchfree.c",
    "libdivide_s32_branchfree_do.c": "/home/lc985/gem5/harnesses/harness_libdivide_branchfree.c",
    "libdivide_internal_u64_gen.c": "/home/lc985/gem5/harnesses/harness_libdivide_gen.c",
    "libdivide_internal_s64_gen.c": "/home/lc985/gem5/harnesses/harness_libdivide_gen.c",
}

entry_point_mapping = {
    "sha256.c": "sha256_block",
    # You can add the specific libdivide function names here later
    # if they also differ from their filenames.
}


def main():
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )

    parser.add_argument(
        "results_dir",
        type=Path,
        nargs="?",
        default=Path("results"),
        help="where to save <name>_<pipeline>.stats.txt (default: results/)",
    )
    parser.add_argument(
        "--gem5-dir",
        type=Path,
        default=Path(os.environ.get("GEM5_DIR", "/home/lc985/gem5")),
    )
    parser.add_argument(
        "--cpu-type", default=os.environ.get("CPU_TYPE", "TimingSimpleCPU")
    )
    parser.add_argument(
        "--default-march",
        default=os.environ.get("DEFAULT_MARCH", "rv64gc_zba_zbb_zicond"),
    )
    parser.add_argument("--sysroot", default="/usr/riscv64-linux-gnu")

    # Missing CLI arguments mapped to the global defaults
    parser.add_argument(
        "--benchmarks",
        nargs="+",
        default=BENCHMARKS,
        help="List of benchmarks to run",
    )
    parser.add_argument(
        "--pipelines",
        nargs="+",
        type=Path,
        default=[Path(p) for p in PIPELINES],
        help="List of pipeline directories",
    )
    parser.add_argument(
        "--harness-dir",
        type=Path,
        default=Path("src_harnesses"),
        help="Directory containing the harness source files",
    )

    args = parser.parse_args()

    gem5_bin = args.gem5_dir / "build" / "RISCV" / "gem5.opt"
    se_config = args.gem5_dir / "configs" / "deprecated" / "example" / "se.py"
    m5_include = args.gem5_dir / "include"
    m5_lib = args.gem5_dir / "util" / "m5" / "build" / "riscv" / "out"

    args.results_dir.mkdir(parents=True, exist_ok=True)
    work_dir = Path(tempfile.mkdtemp(prefix="riscv_bench_"))

    failed = []
    results_matrix = collections.defaultdict(dict)

    try:
        for bench_file in args.benchmarks:
            bench_path = Path(bench_file)
            name = bench_path.stem
            print(f"=== {name} ===")

            expected_func = entry_point_mapping.get(bench_path.name, name)

            # Resolve harness file using mapping or fallback to standard naming
            harness_filename = harness_mapping.get(
                bench_path.name, f"/home/lc985/gem5/harnesses/harness_{name}.c"
            )
            harness_src = args.harness_dir / harness_filename

            if not harness_src.is_file():
                print(f"  ! missing {harness_src.name} -- skipping entirely")
                for p in args.pipelines:
                    results_matrix[name][p.name] = "NO HARNESS"
                continue

            march_file = args.harness_dir / f"{name}.march"
            march = (
                march_file.read_text().strip()
                if march_file.is_file()
                else args.default_march
            )

            # Compile the harness once per benchmark
            bench_work_dir = work_dir / name
            bench_work_dir.mkdir(exist_ok=True)
            harness_obj = (
                bench_work_dir / f"/home/lc985/gem5/harnesses/harness_{name}.o"
            )

            res_harness = run(
                [
                    "clang",
                    "--target=riscv64-linux-gnu",
                    f"--sysroot=/usr/riscv64-linux-gnu",
                    f"-I/home/lc985/gem5/include",
                    f"-L/home/lc985/gem5/util/m5/build/riscv/out",
                    f"-lm5",
                    f"-I/home/lc985/gem5/libdivide.h",
                    "-c",
                    str(harness_src),
                    "-o",
                    str(harness_obj),
                ]
            )

            if res_harness.returncode != 0:
                report_failure(
                    name,
                    "ALL",
                    "/home/lc985/gem5/harnesses/harness compile",
                    res_harness,
                    failed,
                )
                for p in args.pipelines:
                    results_matrix[name][p.name] = "FAIL (harness)"
                continue

            # Iterate over the pipelines
            for pipe_path in args.pipelines:
                pipe_name = pipe_path.name
                print(f"  -> Pipeline: {pipe_name}")

                # Assume the assembly file is named <benchmark_name>.s within the pipeline directory
                asm_file = pipe_path / f"{name}.s"
                if not asm_file.is_file():
                    print(f"     ! missing {asm_file.name} in {pipe_name}")
                    results_matrix[name][pipe_name] = "NO ASM"
                    continue

                # --- Step 1: patch and assemble.
                work_asm = bench_work_dir / f"{name}_{pipe_name}.s"

                # Pass the benchmark 'name' so the regex knows what to rename 'main' to
                work_asm.write_text(
                    patch_asm(asm_file.read_text(), expected_func)
                )

                # Produces pipeline_name.o inside the benchmark's work directory
                obj_file = bench_work_dir / f"{pipe_name}.o"

                # Produces pipeline_name.o inside the benchmark's work directory
                obj_file = bench_work_dir / f"{pipe_name}.o"
                res_asm = run(
                    [
                        "riscv64-linux-gnu-gcc",
                        f"-march={march}",
                        "-c",
                        str(work_asm),
                        "-o",
                        str(obj_file),
                    ]
                )

                if res_asm.returncode != 0:
                    report_failure(
                        name,
                        pipe_name,
                        f"assemble (march={march})",
                        res_asm,
                        failed,
                    )
                    results_matrix[name][pipe_name] = "FAIL (asm)"
                    continue

                # --- Step 2: link harness object with the pipeline-specific kernel object
                bin_file = bench_work_dir / f"bench_{name}_{pipe_name}"
                res_link = run(
                    [
                        "clang",
                        "--target=riscv64-linux-gnu",
                        f"--sysroot={args.sysroot}",
                        "-fuse-ld=lld",
                        "-static",
                        str(harness_obj),
                        str(obj_file),
                        "-o",
                        str(bin_file),
                        f"-I{m5_include}",
                        f"-L{m5_lib}",
                        "-lm5",
                    ]
                )

                if res_link.returncode != 0:
                    report_failure(name, pipe_name, "link", res_link, failed)
                    results_matrix[name][pipe_name] = "FAIL (link)"
                    continue

                # --- Step 3: simulate.
                gem5_outdir = bench_work_dir / f"m5out_{pipe_name}"
                res_sim = run(
                    [
                        str(gem5_bin),
                        f"--outdir={gem5_outdir}",
                        str(se_config),
                        f"--cpu-type={args.cpu_type}",
                        "--caches",
                        "-c",
                        str(bin_file),
                    ]
                )

                if res_sim.returncode != 0:
                    report_failure(
                        name, pipe_name, "simulate", res_sim, failed
                    )
                    results_matrix[name][pipe_name] = "FAIL (sim)"
                    continue

                # Save specific stats file
                stats_src = gem5_outdir / "stats.txt"
                stats_dst = args.results_dir / f"{name}_{pipe_name}.stats.txt"
                shutil.copy(stats_src, stats_dst)
                results_matrix[name][pipe_name] = "ok"

    finally:
        shutil.rmtree(work_dir, ignore_errors=True)

    print("\n==================== Execution Summary ====================")

    # Render a pivoted matrix comparing status across all pipelines
    pipelines = [p.name for p in args.pipelines]
    bench_names = [Path(b).stem for b in args.benchmarks]

    header_row = ["Benchmark"] + pipelines

    # Calculate appropriate widths safely
    max_bench_len = max([len(b) for b in bench_names] + [15])
    col_widths = [max_bench_len] + [max(len(p), 12) for p in pipelines]

    header_str = " | ".join(
        f"{h:<{w}}" for h, w in zip(header_row, col_widths)
    )
    print(header_str)
    print("-+-".join("-" * w for w in col_widths))

    for name in bench_names:
        # Use .get() to avoid KeyErrors if a benchmark entirely failed or skipped
        row = [name] + [results_matrix[name].get(p, "N/A") for p in pipelines]
        row_str = " | ".join(
            f"{str(item):<{w}}" for item, w in zip(row, col_widths)
        )
        print(row_str)

    print("\n===========================================================")

    if failed:
        sys.exit(1)
    else:
        sys.exit(0)


if __name__ == "__main__":
    main()
