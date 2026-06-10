#!/usr/bin/env python3
"""Per-TU DATA-BINDING harvest (decision D41 follow-up -> D42).

The verified-run harvester (harvest_verified_runs.py) carves matching runs of a
partially-ported TU, but reverts the ones whose code body byte-matches yet whose
FULL build fails on an UNPLACED TU-private static / shared rodata (statscreen
gMid_*/sPage*TextInfo/sStatScreenInfo, etc.). Root cause: it extracts via
extract_run.py, which RE-EMITS the TU's file-scope data definitions -- so the
region-different `.rodata`/EWRAM tables either grow the ROM or mismatch.

This harvester instead extracts via extract_func_only.py (DROP all file-scope
data; the run's data references become externs declared in the project headers),
and lets port_run's auto-resolver BIND each referenced data symbol as an ABS
baseline_syms entry at its JP literal-pool address (the D34 ABS-symbol pattern,
automated). The function's code body -- already byte-matching -- then links and
graduates.

Safety is IDENTICAL to harvest_verified_runs / carve_exact: port_run.port() does
the full extract -> compile -> bind-refs -> `make compare` verify-or-revert, so a
run that can't be made byte-perfect (genuinely region-different codegen) simply
reverts at ZERO risk. We skip any run already covered by a src/*.o or a
shared/stranded asm fragment (never double-carve -> never shift the ROM). New
manifest rows go to a per-task fragment (parallel-safe). We NEVER `git add`.

Usage:
  scripts/bind_tu_data.py <TU> [<TU> ...]          # data-bind + carve these TUs
  scripts/bind_tu_data.py --list <TU> ...           # show the plan, carve nothing
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
    """Every carved row as (vstart, vend, obj, manifest_path, is_gbadisasm_frag).
    Mirrors harvest_verified_runs.carved_rows: per-function gbadisasm fragments are
    flagged removable (a verified C run can graduate them); all other coverage is
    final."""
    rows = []
    for path in (["layout/carved_rom.tsv"]
                 + sorted(glob.glob("layout/carved_rom.d/*.tsv"))):
        if not os.path.exists(path):
            continue
        is_gbad = os.path.basename(path).startswith("gbadisasm_")
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
            rows.append((0x08000000 + s, 0x08000000 + e, c[2], path, is_gbad))
    rows.sort()
    return rows


def cover(rows, s, e):
    return [r for r in rows if r[0] < e and r[1] > s]


def asm_sym_file(obj):
    m = re.match(r"asm/(\S+?)\.o\(", obj)
    return f"asm/{m.group(1)}.s" if m else None


def find_runs(tu):
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
        print("usage: bind_tu_data.py [--list] <TU> ...")
        return 1

    total_runs = total_fns = total_binds = 0
    carved_names = []
    for tu in args:
        runs = find_runs(tu)
        if not runs:
            print(f"{tu}: no verified runs")
            continue
        # Largest-first so the highest-yield blocks land before any adjacent-run
        # interaction. Refresh carved_rows after each carve (fragments are gone).
        runs_sorted = sorted(runs, key=lambda r: -len(r[2]))
        print(f"{tu}: {len(runs)} verified run(s), "
              f"{sum(len(r[2]) for r in runs)} fns")
        for start, end, fns in runs_sorted:
            rows = carved_rows()
            s, e = int(start, 16), int(end, 16)
            name = f"{tu}_{start}"
            if os.path.exists(f"src/{name}.c"):
                continue
            cov = cover(rows, s, e)
            src_cov = [r for r in cov if "src/" in r[2]]
            nongbad_asm = [r for r in cov if "src/" not in r[2] and not r[4]]
            gbad = [r for r in cov if r[4]]
            if src_cov:
                continue  # already matching C
            if nongbad_asm:
                if do_list:
                    print(f"  [skip-shared-asm] {name} ({len(fns)} fns)")
                continue
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

            # count baseline binds this run adds (for the hypothesis report).
            frag = f"harvest_databind_{tu}"
            bs_frag = f"layout/baseline_syms.d/{frag}.tsv"
            before = (len([l for l in open(bs_frag) if l.strip()
                           and not l.startswith("#")])
                      if os.path.exists(bs_frag) else 0)

            ok = port_run.port(name, runs=[(start, end, fns)], src_tu=tu,
                               frag=frag, func_only=True)
            if ok:
                after = (len([l for l in open(bs_frag) if l.strip()
                              and not l.startswith("#")])
                         if os.path.exists(bs_frag) else 0)
                binds = max(0, after - before)
                total_runs += 1
                total_fns += len(fns)
                total_binds += binds
                carved_names.append(name)
                print(f"  [CARVE] {name}  {len(fns)} fns "
                      f"(graduated {len(gbad)} asm frags, +{binds} data binds)")
            else:
                for p, content in removed.items():
                    open(p, "w").write(content)
                print(f"  [skip]  {name}  ({len(fns)} fns) -- reverted")

    sh("make layout")
    mc = sh("make compare")
    green = "fireemblem8.gba: OK" in mc.stdout
    print(f"\nbind_tu_data: carved {total_runs} runs / {total_fns} fns "
          f"/ +{total_binds} data binds; build "
          f"{'GREEN' if green else 'RED'}")
    if carved_names:
        print("OBJECTS: " + " ".join(carved_names))
    return 0 if green else 1


if __name__ == "__main__":
    sys.exit(main())
