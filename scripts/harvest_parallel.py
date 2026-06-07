#!/usr/bin/env python3
"""Parallel decomp harvester (decisions.md D7, tier 2).

Run discovery (`find_runs`) across every uncarved TU IN PARALLEL — find_runs is
read-only on the repo and uses per-process scratch, so it fans across all cores
cleanly — then carve the carve-able TUs serially. The serial carve is cheap now
that port_run no longer does a per-carve `make clean` (tier 1, D7) and reuses the
pre-discovered runs, so the wall-clock is dominated by the parallel discovery.

  Discovery was the bottleneck (compile full TU + every candidate subset). On 16
  cores this is ~Nx faster than the old serial sweep.

Usage: scripts/harvest_parallel.py [-j N] [TU ...]
  No TU args  -> sweep every uncarved US TU (.text size 0x40..0x8000) in ROM order.
  Carves and commits each success; always byte-perfect (port_run verify-or-revert).
"""
import os, re, sys, subprocess, multiprocessing, argparse

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u"


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def candidates():
    carved = set(re.findall(r"src/([\w-]+)\.o", open("layout/carved_rom.tsv").read()))
    sz = {}
    for ln in open(f"{US}/fireemblem8.map"):
        m = re.match(r"^\s*\.text\s+0x[0-9a-f]+\s+0x([0-9a-f]+)\s+src/([\w-]+)\.o", ln)
        if m:
            sz[m.group(2)] = int(m.group(1), 16)
    return [f for f in sorted(sz)
            if f not in carved and os.path.exists(f"{US}/src/{f}.c") and 0x40 <= sz[f] <= 0x8000]


def discover(name):
    """find_runs for one TU -> (name, runs). Read-only + per-process temp = parallel-safe."""
    out = sh(f"python3 scripts/find_runs.py {name}").stdout
    runs = [(l.split()[0], l.split()[1], l.split()[2].split(","))
            for l in out.splitlines() if l.strip()]
    return name, runs


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-j", type=int, default=min(16, os.cpu_count() or 4),
                    help="discovery workers (default: min(16, cores))")
    ap.add_argument("tus", nargs="*", help="TUs to sweep (default: all uncarved)")
    a = ap.parse_args()

    cands = a.tus or candidates()
    if not cands:
        print("no candidates"); return 0
    print(f"discovering runs for {len(cands)} TUs on {a.j} cores...", flush=True)
    with multiprocessing.Pool(a.j) as pool:
        results = pool.map(discover, cands)
    carveable = [(n, runs) for n, runs in results if runs]
    print(f"{len(carveable)}/{len(cands)} TUs have verified runs; carving serially "
          f"(fast — no per-carve make clean)...", flush=True)

    def cleanup_stray():
        # If interrupted mid-carve, port_run may leave an uncommitted src/<tu>.c
        # that isn't placed in ldscript -> the build wildcards it in and fails to
        # link. Drop any tracked-clean src/*.c whose object isn't carved.
        carved = set(re.findall(r"src/([\w-]+)\.o", open("layout/carved_rom.tsv").read()))
        for f in os.listdir("src"):
            if f.endswith(".c"):
                base = f[:-2]
                tracked = sh(f"git ls-files --error-unmatch src/{f}").returncode == 0
                if base not in carved and not tracked:  # stray, uncommitted, unplaced
                    sh(f"rm -f src/{base}.c src/{base}.o src/{base}.s")
        sh("make layout")

    import port_run  # carve in-process, passing pre-discovered runs (skip re-discovery)
    ported = 0
    try:
        for name, runs in carveable:
            # port() returns True only after `make compare` is OK at its base (verify-or-revert),
            # so a True result is a byte-perfect carve safe to commit.
            if port_run.port(name, runs=runs):
                sh("git add -A")
                sh('git commit -q -m "Harvest (parallel): %s\n\n'
                   'Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>"' % name)
                ported += 1
                print(f"  carved {name}", flush=True)
    finally:
        cleanup_stray()  # never leave a broken build, even on Ctrl-C / kill

    sh("make clean")
    green = "fireemblem8.gba: OK" in sh("make compare").stdout
    print(f"\nparallel harvest: carved {ported}/{len(carveable)} carve-able TUs; "
          f"build {'GREEN' if green else 'RED'}")
    return 0 if green else 1


if __name__ == "__main__":
    sys.exit(main())
