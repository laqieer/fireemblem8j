#!/usr/bin/env python3
"""Harvest VERIFIED matching runs (D2) into matching C for partially-ported TUs.

`port_run.py` ports only the single largest run of a TU, then `carved_objs()`
rejects that TU forever (its .o exists). `carve_exact.py` carves the remaining
runs, but ONLY the funcmap `exact`-tier ones. The `us_source_tracker.py`
inventory shows the bulk of ungraduated US-C functions are `no-funcmap` -- they
have no per-function funcmap correspondence, so neither path reaches them. Yet
`find_runs.py` proves many of them form VERIFIED runs: contiguous function blocks
whose compiled subset byte-matches the JP ROM at the run's base. This harvester
carves every such still-uncarved verified run into a SEPARATELY-NAMED object
`src/<tu>_<start>.c` (same trick as carve_exact's `exact_<addr>`), so the
object-name skip doesn't fire.

Safety is identical to carve_exact: port_run.port() does the full
extract -> compile -> resolve-refs -> `make compare` verify-or-revert, so a run
that masked-matches but can't be made byte-perfect (region-different data/EWRAM
layout) simply reverts -- ZERO risk. We additionally skip any run whose JP range
already overlaps a carved row (never double-carve -> never shift the ROM).

Each run's NEW manifest rows go to a per-task fragment (port_run `frag=`), so this
is parallel-safe and trivially revertible. We NEVER `git add` -- the caller stages
explicitly (NO `git add -A`, per the task).

Usage:
  scripts/harvest_verified_runs.py <TU> [<TU> ...]   # harvest these US TUs
  scripts/harvest_verified_runs.py --list <TU> ...    # show runs, carve nothing
"""
import glob
import os
import re
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
import port_run  # noqa: E402


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def carved_rows():
    """Every carved row as (vstart, vend, obj, manifest_path). Per-function
    gbadisasm fragments (gbadisasm_*.tsv) are flagged removable: those are
    descriptive asm that a verified C run can graduate (remove the row + the
    asm/<sym>.s, carve the C). All other coverage (src/*.o, shared/stranded asm
    fragments, the monolith) is treated as final -> never re-carve over it."""
    rows = []
    for path in (["layout/carved_rom.tsv"]
                 + sorted(glob.glob("layout/carved_rom.d/*.tsv"))):
        if not os.path.exists(path):
            continue
        base = os.path.basename(path)
        is_gbadisasm_frag = base.startswith("gbadisasm_")
        for ln in open(path):
            ln = ln.rstrip("\n")
            if not ln or ln.lstrip().startswith("#"):
                continue
            c = ln.split("\t")
            if len(c) < 3:
                continue
            try:
                s, e = int(c[0], 16), int(c[1], 16)
            except ValueError:
                continue
            rows.append((0x08000000 + s, 0x08000000 + e, c[2], path,
                         is_gbadisasm_frag))
    rows.sort()
    return rows


def cover(rows, s, e):
    """The carved rows overlapping [s,e)."""
    return [r for r in rows if r[0] < e and r[1] > s]


def asm_sym_file(obj):
    """For an `asm/<sym>.o(.text.<sym>)` row, the asm/<sym>.s source path."""
    m = re.match(r"asm/(\S+?)\.o\(", obj)
    return f"asm/{m.group(1)}.s" if m else None


def find_runs(tu):
    """[(start_hex, end_hex, [fns])] verified runs of TU, largest-first within."""
    out = sh(f"python3 scripts/find_runs.py {tu}").stdout
    runs = []
    for l in out.splitlines():
        p = l.split()
        if len(p) >= 3 and p[0].startswith("08") and p[1].startswith("08"):
            runs.append((p[0], p[1], p[2].split(",")))
    return runs


def main():
    args = sys.argv[1:]
    do_list = "--list" in args
    args = [a for a in args if not a.startswith("--")]
    if not args:
        print("usage: harvest_verified_runs.py [--list] <TU> ...")
        return 1

    total_runs = total_fns = 0
    carved_names = []
    for tu in args:
        rows = carved_rows()  # refresh after each TU's carves
        runs = find_runs(tu)
        if not runs:
            print(f"{tu}: no verified runs")
            continue
        # carve largest runs first so the highest-yield blocks land before any
        # adjacent-run interaction.
        runs_sorted = sorted(runs, key=lambda r: -len(r[2]))
        print(f"{tu}: {len(runs)} verified run(s), "
              f"{sum(len(r[2]) for r in runs)} fns")
        for start, end, fns in runs_sorted:
            s, e = int(start, 16), int(end, 16)
            name = f"{tu}_{start}"
            if os.path.exists(f"src/{name}.c"):
                continue
            cov = cover(rows, s, e)
            # classify coverage
            src_cov = [r for r in cov if "src/" in r[2]]
            nongbad_asm = [r for r in cov if "src/" not in r[2] and not r[4]]
            gbad = [r for r in cov if r[4]]
            if src_cov:
                continue  # already matching C (or partly) -> leave it
            if nongbad_asm:
                # shared/stranded asm fragment or non-per-function row -> too risky
                # to surgically remove; skip.
                if do_list:
                    print(f"  [skip-shared-asm] {name} ({len(fns)} fns)")
                continue
            # The run is covered ONLY by per-function gbadisasm fragments (or
            # nothing) -> a clean asm->C graduation.
            if do_list:
                tag = "graduate-asm" if gbad else "fresh"
                print(f"  [plan:{tag}] {name}  {len(fns):2d} fns "
                      f"({len(gbad)} asm frags): "
                      f"{', '.join(fns[:5])}{'...' if len(fns) > 5 else ''}")
                continue

            # snapshot the gbadisasm fragments + their asm/*.s so we can revert.
            removed = {}
            for (_rs, _re, obj, path, _g) in gbad:
                removed[path] = open(path).read()
                af = asm_sym_file(obj)
                if af and os.path.exists(af):
                    removed[af] = open(af).read()
            for p in removed:
                os.remove(p)

            ok = port_run.port(name, runs=[(start, end, fns)], src_tu=tu,
                               frag=f"harvest_{tu}", dedup_globals=True)
            if ok:
                total_runs += 1
                total_fns += len(fns)
                carved_names.append(name)
                rows = carved_rows()  # refresh (fragments gone, new C row added)
                print(f"  [CARVE] {name}  {len(fns)} fns "
                      f"(graduated {len(gbad)} asm frags)")
            else:
                # restore the gbadisasm fragments + asm we removed
                for p, content in removed.items():
                    open(p, "w").write(content)
                print(f"  [skip]  {name}  ({len(fns)} fns) -- reverted")

    sh("make layout")
    mc = sh("make compare")
    green = "fireemblem8.gba: OK" in mc.stdout
    print(f"\nharvest: carved {total_runs} runs / {total_fns} fns; "
          f"build {'GREEN' if green else 'RED'}")
    if carved_names:
        print("OBJECTS: " + " ".join(carved_names))
    return 0 if green else 1


if __name__ == "__main__":
    sys.exit(main())
