#!/usr/bin/env python3
"""Scan for raw absolute ROM-pointer literals hidden in DATA that the
relocation-based shiftcheck (scan_relocs.py / opinfo) cannot see, because they
live in opaque blobs emitted as raw `.4byte`/`.word` bytes with NO relocation.

This complements scan_raw_casts.sh: that shell scan only covers hand-written
`data_*.s` / `asm/*.s` and C pointer *casts*. It MISSES raw `.4byte 0x08..`
pointer literals embedded inside `__asm__("...")` string blocks in .c files
(e.g. src/data/frontier_df4_misc_lo/frontier_df4_misc_lo.c), which is exactly
where the #143 stat-screen crash pointer (DisplayPage0/1/2) was hiding.

A raw ROM-range literal is flagged as a genuine (stale-under-shift) pointer when
its value -- or value with the Thumb bit cleared -- lands EXACTLY on a symbol
start in fireemblem8.elf. Such a word must relocate under a ROM shift; left raw
it points into the injected gap and crashes. The fix is to replace the literal
with a bare `.4byte Symbol` (ld re-adds the Thumb bit for STT_FUNC), which keeps
`make compare` byte-identical while creating a relocation.

Usage: scripts/shiftcheck/scan_raw_rom_ptrs.py [--elf fireemblem8.elf]
Exit nonzero if any genuine pointer literal is found.
"""
import argparse
import os
import re
import subprocess
import sys

ROM_LO = 0x08000000
ROM_HI = 0x0A000000

LIT_RE = re.compile(r'\.(?:4byte|word|long)\b([^\n"]*)', re.IGNORECASE)
HEX_RE = re.compile(r'0x0[89A-Fa-f][0-9A-Fa-f]{6}\b')


def load_symbols(elf):
    """address(int) -> (name, kind) for FUNC/OBJECT/NOTYPE symbols with a name."""
    out = subprocess.check_output(
        ["arm-none-eabi-readelf", "-sW", elf], text=True, errors="replace")
    starts = {}
    for line in out.splitlines():
        parts = line.split()
        # Num: Value Size Type Bind Vis Ndx Name
        if len(parts) < 8 or not parts[0].endswith(":"):
            continue
        try:
            val = int(parts[1], 16)
        except ValueError:
            continue
        typ = parts[3]
        name = parts[7]
        if typ not in ("FUNC", "OBJECT", "NOTYPE"):
            continue
        if not name or name.startswith("$") or name == ".gcc2_compiled.":
            continue
        if not (ROM_LO <= val < ROM_HI):
            continue
        # Prefer FUNC/OBJECT over NOTYPE at same address.
        prio = {"FUNC": 3, "OBJECT": 2, "NOTYPE": 1}[typ]
        cur = starts.get(val)
        if cur is None or prio > cur[2]:
            starts[val] = (name, typ, prio)
    return {a: (n, t) for a, (n, t, _) in starts.items()}


def iter_lit_files():
    files = subprocess.check_output(
        ["git", "ls-files", "src", "asm"], text=True).splitlines()
    for f in files:
        if f.endswith((".c", ".s", ".inc")):
            yield f


def resolve(val, syms):
    if val in syms:
        return syms[val]
    if (val & 1) and (val & ~1) in syms:  # Thumb pointer
        n, t = syms[val & ~1]
        return (n, t + "|thumb")
    return None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--elf", default="fireemblem8.elf")
    ap.add_argument("--all", action="store_true",
                    help="also list ROM literals that do NOT resolve to a symbol")
    args = ap.parse_args()
    root = subprocess.check_output(
        ["git", "rev-parse", "--show-toplevel"], text=True).strip()
    os.chdir(root)
    if not os.path.exists(args.elf):
        sys.stderr.write("error: %s missing (run `make compare` first)\n" % args.elf)
        return 2
    syms = load_symbols(args.elf)
    hits = []
    for f in iter_lit_files():
        try:
            with open(f, encoding="utf-8", errors="replace") as fh:
                lines = fh.readlines()
        except OSError:
            continue
        for i, line in enumerate(lines, 1):
            for m in LIT_RE.finditer(line):
                for hm in HEX_RE.finditer(m.group(1)):
                    val = int(hm.group(0), 16)
                    if not (ROM_LO <= val < ROM_HI):
                        continue
                    r = resolve(val, syms)
                    if r:
                        hits.append((f, i, val, r[0], r[1], line.strip()))
                    elif args.all:
                        hits.append((f, i, val, "?", "unresolved", line.strip()))
    # Compiler-intermediate .s (git-ignored) are already excluded by git ls-files.
    if not hits:
        print("RESULT: no raw ROM-pointer literals resolve to a symbol (class clean)")
        return 0
    resolved = [h for h in hits if h[4] != "unresolved"]
    by_file = {}
    for h in hits:
        by_file.setdefault(h[0], []).append(h)
    for f in sorted(by_file):
        print("\n%s" % f)
        for _, ln, val, name, kind, _txt in by_file[f]:
            print("  L%-6d 0x%08X -> %s (%s)" % (ln, val, name, kind))
    print("\nRESULT: %d ROM-pointer literal(s) resolve to a symbol -> symbolize each"
          % len(resolved))
    return 1 if resolved else 0


if __name__ == "__main__":
    sys.exit(main())
