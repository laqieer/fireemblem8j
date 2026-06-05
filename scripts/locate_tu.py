#!/usr/bin/env python3
"""Locate a US translation unit's .text in the JP ROM and resolve its references.

Compiles ../fireemblem8u/src/<name>.c with the JP toolchain, masks the
placement-/relink-dependent bytes (every relocation site: data literals, libgcc
BL offsets, internal jump tables), and searches the JP ROM for the unique match
of the remaining instruction skeleton.

If found, prints the JP .text base, size, and the JP address of every external
data symbol (read straight from the matched literal pool) plus every called
function (from layout/us_jp_funcmap.tsv). If not found, the TU is
region-different (its code differs between US and JP) and must be decompiled
against JP behaviour rather than copied.

Usage: scripts/locate_tu.py <name>   (e.g. rng, time, hardware)
"""
import subprocess, sys, os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
NAME = sys.argv[1]
US_C = f"/home/laqieer/fireemblem8u/src/{NAME}.c"
CPPF = "-I tools/agbcc/include -iquote include -iquote . -nostdinc -undef".split()
CC1F = "-mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm -ffix-debug-line -g".split()
OBJ = f"/tmp/locate_{NAME}.o"
SREC = f"/tmp/locate_{NAME}.s"


def sh(cmd):
    return subprocess.run(cmd, shell=True, capture_output=True, text=True)


# compile
sh(f"cpp {' '.join(CPPF)} {US_C} 2>/dev/null | iconv -f UTF-8 -t CP932 | "
   f"tools/agbcc/bin/agbcc {' '.join(CC1F)} -o {SREC} 2>/dev/null")
if not os.path.exists(SREC) or os.path.getsize(SREC) == 0:
    sys.exit(f"{NAME}: compile produced no assembly (missing headers / not a C TU?)")
sh(f"echo '.ALIGN 2,0' >> {SREC}; arm-none-eabi-as -mcpu=arm7tdmi -mthumb-interwork "
   f"-I include -I . {SREC} -o {OBJ}")
if not os.path.exists(OBJ):
    sys.exit(f"{NAME}: assembly failed")

text = subprocess.run(["arm-none-eabi-objcopy", "-O", "binary", "-j", ".text", OBJ, "/dev/stdout"],
                      capture_output=True).stdout
size = len(text)
if size == 0:
    sys.exit(f"{NAME}: empty .text")

# relocations within .text
r = subprocess.run(["arm-none-eabi-objdump", "-r", OBJ], capture_output=True, text=True).stdout
section = None
relocs = []  # (offset, type, symbol)
for ln in r.splitlines():
    if ln.startswith("RELOCATION RECORDS FOR ["):
        section = ln.split("[")[1].split("]")[0]
        continue
    p = ln.split()
    if section == ".text" and len(p) >= 3 and p[1].startswith("R_ARM"):
        try:
            relocs.append((int(p[0], 16), p[1], p[2]))
        except ValueError:
            pass

mask = bytearray([1]) * size
for off, typ, sym in relocs:
    for k in range(4):
        if off + k < size:
            mask[off + k] = 0

# unique masked search using longest must-match run as needle
best_s = best_l = 0
rs = None
for i in range(size + 1):
    if i < size and mask[i]:
        if rs is None:
            rs = i
    else:
        if rs is not None:
            if i - rs > best_l:
                best_l, best_s = i - rs, rs
            rs = None
jp = open("baserom.gba", "rb").read()
needle = bytes(text[best_s:best_s + best_l])
hits = []
start = 0
while True:
    j = jp.find(needle, start)
    if j < 0:
        break
    s = j - best_s
    if 0 <= s and s + size <= len(jp) and all((not mask[k]) or jp[s + k] == text[k] for k in range(size)):
        hits.append(s)
    start = j + 1

print(f"{NAME}.c: .text size {size:#x}, {len(relocs)} relocs, anchor run {best_l:#x}")
if len(hits) != 1:
    print(f"  NOT UNIQUELY LOCATED ({len(hits)} hits) -> likely region-different; decompile against JP.")
    sys.exit(0)
base = hits[0]
print(f"  JP .text: {0x08000000+base:08X} .. {0x08000000+base+size:08X}  (carved_rom: "
      f"{base:06X}\\t{base+size:06X}\\tsrc/{NAME}.o(.text))")

# function map for called functions
fmap = {}
for ln in open("layout/us_jp_funcmap.tsv"):
    if not ln.startswith("#"):
        c = ln.rstrip("\n").split("\t")
        fmap[c[4]] = int(c[0], 16)

data_syms, func_syms = {}, {}
for off, typ, sym in relocs:
    if sym.startswith("."):
        continue
    if typ == "R_ARM_ABS32":
        data_syms.setdefault(sym, set()).add(int.from_bytes(jp[base + off:base + off + 4], "little"))
    elif typ == "R_ARM_THM_CALL":
        func_syms.setdefault(sym, fmap.get(sym))
if data_syms:
    print("  external data symbols (address read from JP literal pool):")
    for sym, vals in data_syms.items():
        v = ", ".join(f"{x:08X}" for x in sorted(vals))
        print(f"    {sym:28s} -> {v}{'   (INCONSISTENT)' if len(vals) > 1 else ''}")
if func_syms:
    print("  called functions (from funcmap):")
    for sym, a in func_syms.items():
        print(f"    {sym:28s} -> {a:08X}" if a else f"    {sym:28s} -> NOT IN MAP")
