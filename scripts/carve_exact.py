#!/usr/bin/env python3
"""Carve the A1-EXACT layer: funcmap `exact`-tier functions STRANDED by D2.

D2 carved only the consecutive .text RUNS that whole-block match the JP ROM (no
per-function masked search -> no false positives). That stranded the funcmap
`exact`-tier functions that sit in the GAPS of an already-carved TU: the funcmap
proves each one's JP bytes UNIQUELY match the US compile of that function (tier
`exact` = the unmasked byte run anchors a single location), but they don't form a
run with their carved neighbours, so find_runs / carve_mapped skip them and
port_run's `carved_objs()` check rejects the TU (its .o already exists).

This carver carves each stranded exact run into a SEPARATELY-NAMED object
`src/exact_<start>.c` extracted from the same US TU, so the object-name skip
doesn't fire. port_run still runs the full resolve + verify-or-revert (`make
compare`), so an exact-tier row that nonetheless can't be made byte-perfect (a
region-different data dependency) simply reverts and is skipped -- zero risk.

Exact-tier safety: a per-function carve here is NOT the masked per-function carve
D2 forbade. `exact` means the function's UNMASKED bytes already pin a unique JP
location (no wildcards, no false-positive window), and port_run's make-compare
oracle is the final gate regardless.

Parallel-safe: NEW manifest rows go ONLY to per-task fragments
layout/<base>.d/exact_layer.tsv (via port_run's `frag=`), never the shared
monolith, so this runs concurrently with other carves.

Usage:
  scripts/carve_exact.py            # carve every eligible exact run
  scripts/carve_exact.py --list     # just print the candidate plan, carve nothing
  scripts/carve_exact.py --limit N  # carve at most N runs (smoke test)
  scripts/carve_exact.py TU [TU..]  # restrict to functions of these US TUs
"""
import os, re, sys, glob, subprocess
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u"
CODE_END = 0x080DC134           # first data byte; code region is jp_addr < this
FRAG = "exact_layer"            # this task's single fragment basename
import port_run


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def carved_rom_ranges():
    """All carved .text/data VMA ranges (monolith + every fragment) so we never
    re-carve a function already covered by a run."""
    ranges = []
    for path in ["layout/carved_rom.tsv"] + sorted(glob.glob("layout/carved_rom.d/*.tsv")):
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
            ranges.append((0x08000000 + s, 0x08000000 + e))
    ranges.sort()
    return ranges


def fn_to_tu():
    """Map each function name to its US translation unit, restricted to functions
    that actually fall inside that TU's .text span (mirrors carve_mapped.py)."""
    fn_tu, tu, tu_end = {}, None, 0
    for ln in open(f"{US}/fireemblem8.map"):
        m = re.match(r"\s+\.text\s+0x([0-9a-f]+)\s+0x([0-9a-f]+)\s+src/([\w-]+)\.o", ln)
        if m:
            tu = m.group(3); tu_end = int(m.group(1), 16) + int(m.group(2), 16)
        m2 = re.match(r"\s+0x([0-9a-f]+)\s+(\w+)\s*$", ln)
        if m2 and int(m2.group(1), 16) < tu_end:
            fn_tu[m2.group(2)] = tu
    return fn_tu


def candidates():
    """Exact-tier, code-region, not-yet-carved funcmap funcs grouped into maximal
    JP-address-consecutive runs per US TU. Returns [(tu, start_hex, end_hex,
    [funcs])] sorted by TU then address."""
    ranges = carved_rom_ranges()

    def covered(addr, size):
        for s, e in ranges:
            if addr < e and addr + size > s:     # any overlap
                return True
        return False

    fn_tu = fn_to_tu()
    rows = []                                    # (jp, size, name, tu)
    for ln in open("layout/us_jp_funcmap.tsv"):
        if ln.startswith("#"):
            continue
        c = ln.rstrip().split("\t")
        if len(c) < 5:
            continue
        jp, size, tier, name = int(c[0], 16), int(c[2]), c[3], c[4]
        if tier != "exact" or jp >= CODE_END:
            continue
        if covered(jp, size):
            continue
        tu = fn_tu.get(name)
        if not tu or not os.path.exists(f"{US}/src/{tu}.c"):
            continue                             # asm-only TU or no US source
        rows.append((jp, size, name, tu))

    # group by TU, then split each TU's funcs into JP-address-consecutive runs
    by_tu = {}
    for jp, size, name, tu in rows:
        by_tu.setdefault(tu, []).append((jp, size, name))
    out = []
    for tu in sorted(by_tu):
        fns = sorted(by_tu[tu])
        cur = [fns[0]]
        for jp, sz, n in fns[1:]:
            pj, ps, _ = cur[-1]
            if pj + ps == jp:
                cur.append((jp, sz, n))
            else:
                out.append((tu, cur)); cur = [(jp, sz, n)]
        out.append((tu, cur))
    runs = []
    for tu, g in out:
        start = g[0][0]; end = g[-1][0] + g[-1][1]
        runs.append((tu, f"{start:08X}", f"{end:08X}", [n for _, _, n in g]))
    return runs


def main():
    args = sys.argv[1:]
    do_list = "--list" in args
    limit = None
    if "--limit" in args:
        i = args.index("--limit"); limit = int(args[i + 1]); del args[i:i + 2]
    args = [a for a in args if not a.startswith("--")]
    only_tus = set(args)

    runs = candidates()
    if only_tus:
        runs = [r for r in runs if r[0] in only_tus]
    nfns = sum(len(r[3]) for r in runs)
    print(f"carve_exact: {len(runs)} candidate runs, {nfns} exact funcs "
          f"across {len({r[0] for r in runs})} TUs", flush=True)
    if do_list:
        for tu, s, e, fns in runs:
            print(f"  {tu:24s} {s}..{e}  {len(fns):2d} fns: {', '.join(fns[:4])}"
                  f"{'...' if len(fns) > 4 else ''}")
        return 0

    carved_runs = carved_fns = 0
    for tu, s, e, fns in runs:
        if limit is not None and carved_runs >= limit:
            break
        name = f"exact_{s.lower()}"
        if os.path.exists(f"src/{name}.c"):
            continue                             # already carved this exact run
        ok = port_run.port(name, runs=[(s, e, fns)], src_tu=tu, frag=FRAG)
        if ok:
            carved_runs += 1; carved_fns += len(fns)
            sh("git add -A")
            sh(f'git commit -q -m "carve(exact): {name} from {tu} '
               f'({len(fns)} stranded exact fns)\n\n'
               f'Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>"')
            print(f"  committed {name} ({len(fns)} fns)", flush=True)

    sh("make layout")
    mc = sh("make compare")
    green = "fireemblem8.gba: OK" in mc.stdout
    print(f"\ncarve_exact: carved {carved_runs} runs / {carved_fns} exact funcs; "
          f"build {'GREEN' if green else 'RED'}", flush=True)
    return 0 if green else 1


if __name__ == "__main__":
    sys.exit(main())
