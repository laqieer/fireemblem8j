#!/usr/bin/env python3
"""Carve funcmap-mapped functions that find_runs SKIPS.

match_us_jp.py locates ~7739 functions in the JP ROM (exact + masked tiers), but
find_runs only PROPOSES a run when it can uniquely locate the block by masked
search — it skips functions that are too small or too pointer-heavy to anchor
(their unmasked byte run is < the search threshold). Those functions are still
byte-verified present in JP (the funcmap proves it), so they're carveable: feed
port_run the run directly, bypassing find_runs discovery. port_run still does the
full verify-or-revert (`make compare`), so a wrong group simply reverts.

For each uncarved TU we group its funcmap-mapped functions into maximal runs of
JP-address-consecutive functions and hand the largest to port_run.port(); on
success we commit and move to the next TU (port_run carves one run per object).
"""
import os, re, sys, subprocess
sys.path.insert(0, os.path.join(os.path.dirname(__file__)))
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u"
import port_run


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def main():
    carved = set(re.findall(r"src/([\w-]+)\.o", open("layout/carved_rom.tsv").read()))
    # function -> US TU (only funcs inside the TU's .text range)
    fn_tu, tu, tu_end = {}, None, 0
    for ln in open(f"{US}/fireemblem8.map"):
        m = re.match(r"\s+\.text\s+0x([0-9a-f]+)\s+0x([0-9a-f]+)\s+src/([\w-]+)\.o", ln)
        if m:
            tu = m.group(3); tu_end = int(m.group(1), 16) + int(m.group(2), 16)
        m2 = re.match(r"\s+0x([0-9a-f]+)\s+(\w+)\s*$", ln)
        if m2 and int(m2.group(1), 16) < tu_end:
            fn_tu[m2.group(2)] = tu
    # funcmap rows for funcs in uncarved TUs that have US source
    by_tu = {}
    for ln in open("layout/us_jp_funcmap.tsv"):
        if ln.startswith("#"):
            continue
        c = ln.rstrip().split("\t")
        if len(c) < 5:
            continue
        jp, us_a, size, tier, name = int(c[0], 16), int(c[1], 16), int(c[2]), c[3], c[4]
        t = fn_tu.get(name)
        if t and t not in carved and os.path.exists(f"{US}/src/{t}.c"):
            by_tu.setdefault(t, []).append((jp, size, name))

    only = sys.argv[1:]
    ported = 0
    for t in sorted(by_tu):
        if only and t not in only:
            continue
        fns = sorted(by_tu[t])
        # group JP-address-consecutive functions into maximal runs
        runs, cur = [], [fns[0]]
        for jp, sz, n in fns[1:]:
            pj, ps, pn = cur[-1]
            if pj + ps == jp:
                cur.append((jp, sz, n))
            else:
                runs.append(cur); cur = [(jp, sz, n)]
        runs.append(cur)
        # build (start,end,[names]) per group, try largest-first via port_run fallback
        run_specs = []
        for g in runs:
            start = g[0][0]; end = g[-1][0] + g[-1][1]
            run_specs.append((f"{start:08X}", f"{end:08X}", [n for _, _, n in g]))
        run_specs.sort(key=lambda r: -len(r[2]))
        if port_run.port(t, runs=run_specs):
            sh("git add -A")
            sh('git commit -q -m "Carve %s via direct funcmap run (find_runs skipped)\n\n'
               'Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>"' % t)
            ported += 1
            print(f"  committed {t}", flush=True)
    sh("make clean")
    green = "fireemblem8.gba: OK" in sh("make compare").stdout
    print(f"\ncarve_mapped: carved {ported}/{len(by_tu)} uncarved TUs with mapped funcs; "
          f"build {'GREEN' if green else 'RED'}")
    return 0 if green else 1


if __name__ == "__main__":
    sys.exit(main())
