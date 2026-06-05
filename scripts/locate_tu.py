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

def bl_target(off):
    h1 = jp[base + off] | (jp[base + off + 1] << 8)
    h2 = jp[base + off + 2] | (jp[base + off + 3] << 8)
    v = ((h1 & 0x7ff) << 12) | ((h2 & 0x7ff) << 1)
    if v & 0x400000:
        v -= 0x800000
    return 0x08000000 + base + off + 4 + v

data_syms, func_syms = {}, {}
for off, typ, sym in relocs:
    if sym.startswith("."):
        continue
    if typ == "R_ARM_ABS32":
        data_syms.setdefault(sym, set()).add(int.from_bytes(jp[base + off:base + off + 4], "little"))
    elif typ == "R_ARM_THM_CALL":
        tgt = bl_target(off)
        mapped = fmap.get(sym)
        # prefer the map; fall back to the decoded BL target (and flag a mismatch)
        func_syms.setdefault(sym, (mapped if mapped else tgt, mapped is not None,
                                   mapped is not None and mapped != tgt))

undefined = set(subprocess.run(["arm-none-eabi-nm", "-u", OBJ], capture_output=True, text=True)
                .stdout.split()) - {"U"}

extra = []
for ln in subprocess.run(["arm-none-eabi-size", "-A", OBJ], capture_output=True, text=True).stdout.splitlines():
    p = ln.split()
    if len(p) == 3 and p[0] in (".data", ".rodata", ".bss") and p[1].isdigit() and int(p[1]) > 0:
        extra.append(f"{p[0]}={p[1]}")
# COMMON (uninitialised statics) don't show in .bss size and aren't "undefined";
# they still need RAM placement at their JP addresses (carved_ram.tsv).
commons = [p[2] for p in (l.split() for l in
           subprocess.run(["arm-none-eabi-nm", OBJ], capture_output=True, text=True).stdout.splitlines())
           if len(p) == 3 and p[1] == "C"]
if commons:
    extra.append("COMMON:" + ",".join(commons))
if extra:
    print(f"  NOTE: this TU also has {', '.join(extra)} — those need separate")
    print(f"        carve/placement (carved_ram for .bss/COMMON); .text-only rows below are incomplete.")

print("  --- ready-to-paste manifest rows ---")
print(f"  carved_rom.tsv: {base:06X}\t{base+size:06X}\tsrc/{NAME}.o(.text)\t{NAME}")
print("  baseline_syms.tsv (only add symbols not already present):")
for sym in sorted(data_syms):
    if sym not in undefined:
        continue  # defined in this TU, not a baseline ref
    vals = sorted(data_syms[sym])
    flag = "  # INCONSISTENT - verify!" if len(vals) > 1 else ""
    print(f"    {sym}\t{vals[0]:08X}\tdata\t{NAME}{flag}")
for sym in sorted(func_syms):
    if sym not in undefined:
        continue
    addr, inmap, mismatch = func_syms[sym]
    flag = "  # map!=BL, verify!" if mismatch else ("" if inmap else "  # via BL decode")
    print(f"    {sym}\t{addr:08X}\tthumb\t{NAME}{flag}")
