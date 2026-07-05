#!/usr/bin/env python3
"""Symbolize absolute `.set NAME, 0x08XXXXXX[+1]` call/data-target aliases in
hand-written asm so they relocate under the +0x40000 shifted-ROM harness.

Each `.set NAME, 0xADDR+bit` defines a LOCAL ABSOLUTE symbol that shadows the
real relocatable global at 0xADDR. In the normal build both resolve to the same
address (byte-identical), but when the same .o is relinked at ROM base +0x40000
the real global moves while the absolute constant does not, so `bl NAME` targets
stale bytes and crashes.

Fix per directive:
  * same-name  (a real global named NAME exists at 0xADDR): delete the `.set`.
  * diff-name  (real global REALNAME != NAME at 0xADDR): rename NAME -> REALNAME
    everywhere in the file (word-boundary) and delete the `.set`.
The result is byte-identical in the normal build (verify with `make compare`).

Usage:
  scripts/tools/symbolize_abs_set.py --elf fireemblem8.elf [--apply] [FILES...]
Without --apply it only reports. FILES default to asm/*.s minus generated glue
(jp_syms.s is regenerated shifted by the harness; baserom.s is the raw baseline).
"""
import argparse
import collections
import glob
import re
import subprocess
import sys

SET_RE = re.compile(r'^(\s*)\.set\s+(\w+),\s*(0x08[0-9A-Fa-f]+)\s*(\+\s*1)?\s*$')
CODE_TYPES = set('TtWw')
DATA_TYPES = set('DdRrBbVv')


def load_symbols(elf):
    nm = subprocess.run(["arm-none-eabi-nm", elf], capture_output=True, text=True).stdout
    addr2syms = collections.defaultdict(list)
    for line in nm.splitlines():
        parts = line.split()
        if len(parts) < 3:
            continue
        addr_s, typ, name = parts[0], parts[1], parts[2]
        if typ in ('a', 'U', 'n'):
            continue
        if name.startswith('.') or name.startswith('$') or name == '.gcc2_compiled.':
            continue
        try:
            addr2syms[int(addr_s, 16)].append((typ, name))
        except ValueError:
            pass
    return addr2syms


def pick_real(addr2syms, addr, alias, thumb):
    cands = [(t, n) for (t, n) in addr2syms.get(addr, []) if n != alias]
    if not cands:
        return None
    # Prefer a code symbol for thumb/bl targets, else data, else anything.
    prefer = CODE_TYPES if thumb else DATA_TYPES
    for t, n in cands:
        if t in prefer:
            return n
    for t, n in cands:
        if t in CODE_TYPES:
            return n
    return cands[0][1]


def process_file(path, addr2syms):
    lines = open(path).read().splitlines(keepends=True)
    renames = {}      # alias -> real
    delete_idx = set()
    reports = []
    same_name_aliases = set()
    for i, line in enumerate(lines):
        m = SET_RE.match(line)
        if not m:
            continue
        alias, addr_s, thumb = m.group(2), m.group(3), bool(m.group(4))
        addr = int(addr_s, 16)
        exact = addr2syms.get(addr, [])
        if any(n == alias for (_t, n) in exact):
            delete_idx.add(i)
            same_name_aliases.add(alias)
            reports.append((alias, addr_s, "same-name", alias))
            continue
        real = pick_real(addr2syms, addr, alias, thumb)
        if real is None:
            reports.append((alias, addr_s, "NO-SYMBOL", None))
            continue
        renames[alias] = real
        delete_idx.add(i)
        reports.append((alias, addr_s, "diff-name", real))

    if not delete_idx and not renames:
        return None, reports

    out = []
    for i, line in enumerate(lines):
        if i in delete_idx:
            continue
        if renames:
            def repl(mo):
                w = mo.group(0)
                return renames.get(w, w)
            line = re.sub(r'\w+', repl, line)
        out.append(line)
    return "".join(out), reports


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--elf", default="fireemblem8.elf")
    ap.add_argument("--apply", action="store_true")
    ap.add_argument("files", nargs="*")
    args = ap.parse_args()

    files = args.files or [f for f in sorted(glob.glob("asm/*.s"))
                           if not f.endswith(("jp_syms.s", "baserom.s"))]
    addr2syms = load_symbols(args.elf)

    total = collections.Counter()
    changed = []
    for path in files:
        new_text, reports = process_file(path, addr2syms)
        for alias, addr_s, cat, real in reports:
            total[cat] += 1
            if cat == "NO-SYMBOL":
                print(f"  !! {path}: .set {alias}, {addr_s} has no relocatable symbol", file=sys.stderr)
        if new_text is not None:
            changed.append(path)
            if args.apply:
                open(path, "w").write(new_text)
    print(f"files changed: {len(changed)}")
    for k, v in total.most_common():
        print(f"  {v:4d}  {k}")
    if not args.apply:
        print("(dry run; pass --apply to write)")
    else:
        print("applied. now run: make compare && make shiftcheck")


if __name__ == "__main__":
    main()
