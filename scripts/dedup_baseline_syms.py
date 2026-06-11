#!/usr/bin/env python3
"""Cross-branch baseline_syms dedup (post-merge integration step).

When parallel harvest branches each ABS-bind a function they reference as an
extern (via layout/baseline_syms.d/<task>.tsv), and a *sibling* branch graduates
that same function to a real src/ definition, merging both yields a linker
`multiple definition` error -- the generated asm/jp_syms.o defines the ABS symbol
AND src/<fn>.o defines the real one. git merges cleanly (different files), so the
conflict only surfaces at `make compare`.

This script resolves it deterministically: any GLOBAL symbol that is (a) defined
in an object actually linked by ldscript.txt and (b) still baseline-bound, is
written to layout/baseline_syms_drop.d/integration_dedup.tsv (the parallel-safe
drop mechanism gen_layout.py already honours). Run it after a multi-branch merge,
then `make layout && make compare`.

Precision matters (a wrong drop makes a baseline-resident symbol UNDEFINED):
  - GLOBAL defs only (nm T/D/R/B, never lowercase locals).
  - Only objects referenced in ldscript.txt (ignore stale src/*.o on disk).
"""
import glob
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
NM = subprocess.run(["bash", "-lc", "command -v arm-none-eabi-nm || command -v nm"],
                    capture_output=True, text=True).stdout.strip() or "nm"
DROP = "layout/baseline_syms_drop.d/integration_dedup.tsv"


def linked_objects():
    objs = set()
    with open("ldscript.txt") as f:
        for line in f:
            objs.update(re.findall(r"(src/[\w./-]+\.o)", line))
    return objs


def global_defs(objs):
    defs = set()
    for o in sorted(objs):
        if not os.path.exists(o):
            continue
        try:
            out = subprocess.run([NM, o], capture_output=True, text=True, timeout=30).stdout
        except Exception:
            continue
        for line in out.splitlines():
            p = line.split()
            if len(p) >= 3 and p[1] in ("T", "D", "R", "B"):  # GLOBAL only
                defs.add(p[2])
    return defs


def baseline_bound():
    bound = set()
    files = ["layout/baseline_syms.tsv"] + sorted(glob.glob("layout/baseline_syms.d/*.tsv"))
    for f in files:
        if not os.path.exists(f):
            continue
        for line in open(f):
            line = line.rstrip("\n")
            if line and not line.startswith("#"):
                bound.add(line.split("\t")[0])
    return bound


def already_dropped():
    dropped = set()
    d = "layout/baseline_syms_drop.d"
    if os.path.isdir(d):
        for fn in os.listdir(d):
            if fn == os.path.basename(DROP):
                continue
            for line in open(os.path.join(d, fn)):
                line = line.strip()
                if line and not line.startswith("#"):
                    dropped.add(line.split("\t")[0])
    return dropped


def main():
    defs = global_defs(linked_objects())
    conflicts = sorted((defs & baseline_bound()) - already_dropped())
    os.makedirs(os.path.dirname(DROP), exist_ok=True)
    with open(DROP, "w") as w:
        w.write("# AUTO (scripts/dedup_baseline_syms.py): GLOBAL symbols graduated to real\n")
        w.write("# src/ defs but still ABS-bound by a sibling branch -- dropped to avoid\n")
        w.write("# linker multiple-definition. Regenerate with: python3 scripts/dedup_baseline_syms.py\n")
        for s in conflicts:
            w.write(s + "\n")
    print(f"baseline_syms dedup: {len(conflicts)} cross-branch dup(s) dropped -> {DROP}")
    for s in conflicts:
        print("  drop:", s)
    return 0


if __name__ == "__main__":
    sys.exit(main())
