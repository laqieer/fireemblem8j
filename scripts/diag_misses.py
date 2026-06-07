#!/usr/bin/env python3
"""Categorize every carve-able-but-failing TU by its failure signature.

For each uncarved candidate TU, run port_run (PORTRUN_DEBUG) and parse the
outcome: no-runs / compile-fail / carved / FAILED-with-diff. For FAILED, record
the diff byte count, first diff offset, and whether the run touches RAM
(ewram/.bss) or ROM data — so we can spot the next *class* of blocker (like the
addend bug) instead of grinding TUs one at a time.

Serial (port_run mutates shared layout/ + reverts), but each TU is cheap now.
Output: a sorted table, smallest diffs first (most tractable near-misses).
"""
import os, re, subprocess, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u"


def candidates():
    carved = set(re.findall(r"src/([\w-]+)\.o", open("layout/carved_rom.tsv").read()))
    sz = {}
    for ln in open(f"{US}/fireemblem8.map"):
        m = re.match(r"^\s*\.text\s+0x[0-9a-f]+\s+0x([0-9a-f]+)\s+src/([\w-]+)\.o", ln)
        if m:
            sz[m.group(2)] = int(m.group(1), 16)
    return [f for f in sorted(sz)
            if f not in carved and os.path.exists(f"{US}/src/{f}.c") and 0x40 <= sz[f] <= 0x8000]


def main():
    cands = sys.argv[1:] or candidates()
    rows = []
    for i, name in enumerate(cands):
        env = dict(os.environ, PORTRUN_DEBUG="1")
        r = subprocess.run(f"python3 scripts/port_run.py {name}", shell=True,
                           capture_output=True, text=True, env=env, timeout=300)
        out = r.stdout + r.stderr
        if f"{name}: OK" in out:
            sig = "CARVED"
            diff = 0
        elif "no verified runs" in out:
            sig, diff = "no-runs", -1
        elif "subset compile failed" in out or "compile failed after" in out:
            sig, diff = "compile-fail", -1
        else:
            m = re.findall(r"diff: (\d+) bytes, first @ (\S+)", out)
            ram = "+ram" if re.search(r"ram=\{[^}]*0[23]0", out) else ""
            rdata = "+romdata" if re.search(r"romdata=\{[^}]*0[0-9a-f]", out) else ""
            if m:
                diff = min(int(x[0]) for x in m)
                firsts = ",".join(sorted({x[1] for x in m}))
                sig = f"FAILED diff={diff} @{firsts} {ram}{rdata}".strip()
            else:
                diff, sig = 10**9, f"FAILED (no diff parsed) {ram}{rdata}".strip()
        rows.append((diff, name, sig))
        print(f"[{i+1}/{len(cands)}] {name}: {sig}", flush=True)
    print("\n===== SORTED (smallest diff first = most tractable) =====")
    for diff, name, sig in sorted(rows, key=lambda r: (r[0] if r[0] >= 0 else 10**8, r[1])):
        print(f"  {name:28} {sig}")
    # quick class tally
    from collections import Counter
    cls = Counter()
    for diff, name, sig in rows:
        if sig.startswith("FAILED diff"):
            cls["near-miss(diff<=4)" if diff <= 4 else "diff(5..64)" if diff <= 64 else "diff(>64)"] += 1
        else:
            cls[sig.split()[0]] += 1
    print("\n===== CLASS TALLY =====")
    for k, v in cls.most_common():
        print(f"  {k:22} {v}")


if __name__ == "__main__":
    main()
