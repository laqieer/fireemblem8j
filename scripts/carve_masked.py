#!/usr/bin/env python3
"""Carve the A1-MASKED layer: funcmap `masked`-tier functions STRANDED by D2.

Sibling of scripts/carve_exact.py for the next mechanical backlog after the
exact layer. D2 carved only the consecutive .text RUNS that whole-block match
the JP ROM; that stranded the funcmap `masked`-tier functions sitting in the
GAPS of an already-carved (or asm-baseline) TU. A `masked` row is a function
whose bytes equal the US compile EXCEPT for pointer-looking words (JP pointers
!= US pointers); match_us_jp.py masks those words, searches the JP ROM, and
records the row ONLY when there is EXACTLY ONE hit (`len(hits) == 1`) -- the
same D2 uniqueness guarantee that `find_runs` enforces. So every masked row is a
uniquely-located JP function; carving it is NOT the forbidden ambiguous
per-function masked carve.

This carver extracts each stranded masked run into a SEPARATELY-NAMED object
`src/masked_<start>.c` from the same US TU, so port_run's object-name skip
(`carved_objs()`, keyed on the OUTPUT object) doesn't reject it. port_run then
runs its full resolve pipeline -- which REBINDS every external pointer (data
literals + decoded BL targets + EWRAM/RAM placement) to the JP address -- and
the verify-or-revert `make compare` oracle. A masked row that nonetheless can't
be made byte-perfect (a region-different data layout, or a rare false positive)
simply reverts and is skipped -- zero risk, no asm regression.

Parallel-safe: NEW manifest rows go ONLY to per-task fragments
layout/<base>.d/masked_layer.tsv (via port_run's `frag=`), never the shared
monolith, so this runs concurrently with other carves. The
baseline_syms_drop.d/masked_layer.tsv fragment (redundant-alias drops) MUST be
committed too -- check_layout / make check verifies all fragments are tracked.

Usage:
  scripts/carve_masked.py            # carve every eligible masked run
  scripts/carve_masked.py --list     # just print the candidate plan, carve nothing
  scripts/carve_masked.py --limit N  # carve at most N runs (smoke test)
  scripts/carve_masked.py TU [TU..]  # restrict to functions of these US TUs
"""
import os, re, sys, glob, subprocess
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u"
CODE_END = 0x080DC134           # first data byte; code region is jp_addr < this
FRAG = "masked_layer"           # this task's single fragment basename
TIER = "masked"
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
    """Masked-tier, code-region, not-yet-carved funcmap funcs grouped into maximal
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
        if tier != TIER or jp >= CODE_END:
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
    print(f"carve_masked: {len(runs)} candidate runs, {nfns} masked funcs "
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
        name = f"masked_{s.lower()}"
        if os.path.exists(f"src/{name}.c"):
            continue                             # already carved this masked run
        ok = port_run.port(name, runs=[(s, e, fns)], src_tu=tu, frag=FRAG)
        if ok:
            carved_runs += 1; carved_fns += len(fns)
            sh("git add -A")
            sh(f'git commit -q -m "carve(masked): {name} from {tu} '
               f'({len(fns)} stranded masked fns)\n\n'
               f'Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>"')
            print(f"  committed {name} ({len(fns)} fns)", flush=True)

    sh("make layout")
    mc = sh("make compare")
    green = "fireemblem8.gba: OK" in mc.stdout
    print(f"\ncarve_masked: carved {carved_runs} runs / {carved_fns} masked funcs; "
          f"build {'GREEN' if green else 'RED'}", flush=True)
    return 0 if green else 1


if __name__ == "__main__":
    sys.exit(main())
