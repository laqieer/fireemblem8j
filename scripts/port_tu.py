#!/usr/bin/env python3
"""Port one US translation unit into the JP build, end to end, safely.

Runs locate_tu.py, applies its ready-to-paste manifest rows (deduping
baseline_syms against what's already there), copies the US .c, regenerates the
layout and runs `make compare`. On success it leaves the changes staged for
commit; on any failure it reverts everything so the build stays green.

Usage: scripts/port_tu.py <name> [<name> ...]
"""
import subprocess, sys, os, re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)


def sh(cmd):
    return subprocess.run(cmd, shell=True, capture_output=True, text=True)


def existing_sym_names():
    names = set()
    for ln in open("layout/baseline_syms.tsv"):
        if ln.strip() and not ln.lstrip().startswith("#"):
            names.add(ln.split("\t")[0])
    return names


def carved_objs():
    objs = set()
    for ln in open("layout/carved_rom.tsv"):
        m = re.search(r"(src/\S+\.o)\(", ln)
        if m:
            objs.add(m.group(1))
    return objs


def port(name):
    out = sh(f"python3 scripts/locate_tu.py {name}").stdout
    if "NOT UNIQUELY LOCATED" in out or "carved_rom.tsv:" not in out:
        print(f"{name}: not locatable (region-different) — skipping")
        return False
    if f"src/{name}.o" in carved_objs():
        print(f"{name}: already ported — skipping")
        return False

    crow = rrow = None
    syms = []
    for ln in out.splitlines():
        s = ln.strip()
        if s.startswith("carved_rom.tsv:"):
            crow = s.split(":", 1)[1].strip()
        elif s.startswith("carved_ram.tsv:"):
            rrow = s.split(":", 1)[1].strip()
        elif "\tthumb\t" in s or "\tdata\t" in s:
            syms.append(s.split("#")[0].strip())

    have = existing_sym_names()
    new_syms, seen = [], set()
    for row in syms:
        n = row.split("\t")[0]
        if n in have or n in seen:
            continue
        seen.add(n)
        new_syms.append(row)

    MANIFESTS = ["layout/carved_rom.tsv", "layout/carved_ram.tsv", "layout/baseline_syms.tsv"]
    snapshot = {p: open(p).read() for p in MANIFESTS}

    sh(f"cp /home/laqieer/fireemblem8u/src/{name}.c src/{name}.c")
    with open("layout/carved_rom.tsv", "a") as f:
        f.write(crow + "\n")
    if rrow:
        with open("layout/carved_ram.tsv", "a") as f:
            f.write(rrow + "\n")
    if new_syms:
        with open("layout/baseline_syms.tsv", "a") as f:
            f.write("\n".join(new_syms) + "\n")

    sh("make layout")
    sh("make clean")
    res = sh("make compare")
    if "fireemblem8.gba: OK" in res.stdout:
        print(f"{name}: OK ({crow.split(chr(9))[0]}..{crow.split(chr(9))[1]}, "
              f"{len(new_syms)} new syms{', +ewram' if rrow else ''})")
        return True
    # surgical revert: restore manifests to their pre-port snapshot
    print(f"{name}: FAILED make compare — reverting")
    for p, content in snapshot.items():
        open(p, "w").write(content)
    sh(f"rm -f src/{name}.c")
    sh("make layout")
    return False


if __name__ == "__main__":
    ok = 0
    for n in sys.argv[1:]:
        if port(n):
            ok += 1
    sh("make clean"); sh("make compare")
    print(f"\nported {ok}/{len(sys.argv)-1}; build is "
          + ("GREEN" if "OK" in sh("make compare").stdout else "RED"))
