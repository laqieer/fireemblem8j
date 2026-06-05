#!/usr/bin/env python3
"""Per-function location for run-based porting (decision D1).

Compiles a US translation unit, then for EACH function masks its placement/
relink-dependent bytes and searches the JP ROM for a unique match. Consecutive
functions (source order) that match AND are contiguous in the JP ROM are grouped
into a "run" — a span that can be compiled as a subset .c and carved as one
block. Functions that don't match are region-different and split the runs.

Usage: scripts/locate_funcs.py <name>
"""
import subprocess, sys, os, struct

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
NAME = sys.argv[1]
US_C = f"/home/laqieer/fireemblem8u/src/{NAME}.c"
CPPF = "-I tools/agbcc/include -iquote include -iquote . -nostdinc -undef"
CC1F = "-mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm -ffix-debug-line -g"
OBJ, SREC = f"/tmp/lf_{NAME}.o", f"/tmp/lf_{NAME}.s"

subprocess.run(f"cpp {CPPF} {US_C} 2>/dev/null | iconv -f UTF-8 -t CP932 | "
               f"tools/agbcc/bin/agbcc {CC1F} -o {SREC} 2>/dev/null", shell=True)
if not os.path.exists(SREC) or os.path.getsize(SREC) == 0:
    sys.exit(f"{NAME}: no assembly produced")
subprocess.run(f"echo '.ALIGN 2,0' >> {SREC}; arm-none-eabi-as -mcpu=arm7tdmi "
               f"-mthumb-interwork -I include -I . {SREC} -o {OBJ}", shell=True)
text = subprocess.run(["arm-none-eabi-objcopy", "-O", "binary", "-j", ".text", OBJ, "/dev/stdout"],
                      capture_output=True).stdout
jp = open("baserom.gba", "rb").read()

# functions: (name, offset, size) sorted by offset
funcs = []
for ln in subprocess.run(["arm-none-eabi-nm", "-S", "-n", OBJ], capture_output=True, text=True).stdout.splitlines():
    p = ln.split()
    if len(p) == 4 and p[2] in ("t", "T"):
        funcs.append((p[3], int(p[0], 16), int(p[1], 16)))

# relocations within .text
relocs = []
sec = None
for ln in subprocess.run(["arm-none-eabi-objdump", "-r", OBJ], capture_output=True, text=True).stdout.splitlines():
    if ln.startswith("RELOCATION RECORDS FOR ["):
        sec = ln.split("[")[1].split("]")[0]
    elif sec == ".text":
        p = ln.split()
        if len(p) >= 3 and p[1].startswith("R_ARM"):
            relocs.append(int(p[0], 16))


def locate(off, size):
    body = text[off:off + size]
    mask = bytearray([1]) * size
    for r in relocs:
        if off <= r < off + size:
            for k in range(4):
                if r - off + k < size:
                    mask[r - off + k] = 0
    # longest must-match run as needle
    bs = bl = 0; rs = None
    for i in range(size + 1):
        if i < size and mask[i]:
            if rs is None: rs = i
        else:
            if rs is not None and i - rs > bl: bl, bs = i - rs, rs
            rs = None if i >= size else (rs if (i < size and mask[i]) else None)
    if bl < 4:
        return None
    needle = bytes(body[bs:bs + bl])
    hits, start = [], 0
    while len(hits) < 2:
        j = jp.find(needle, start)
        if j < 0: break
        s = j - bs
        if 0 <= s and s + size <= len(jp) and all((not mask[k]) or jp[s + k] == body[k] for k in range(size)):
            hits.append(s)
        start = j + 1
    return (0x08000000 + hits[0]) if len(hits) == 1 else None


located = []
for name, off, size in funcs:
    located.append((name, off, size, locate(off, size)))

# Drop false positives: JP addresses must be non-decreasing in source order
# (JP function order == US order). Keep the longest non-decreasing subsequence
# of matched functions; everything else is treated as unmatched.
idx = [i for i, (n, o, s, a) in enumerate(located) if a is not None]
if idx:
    addrs = [located[i][3] for i in idx]
    n = len(addrs)
    best = [1] * n; prev = [-1] * n
    for i in range(n):
        for j in range(i):
            if addrs[j] <= addrs[i] and best[j] + 1 > best[i]:
                best[i] = best[j] + 1; prev[i] = j
    k = max(range(n), key=lambda i: best[i])
    keep = set()
    while k != -1:
        keep.add(idx[k]); k = prev[k]
    for i in range(len(located)):
        if located[i][3] is not None and i not in keep:
            located[i] = (located[i][0], located[i][1], located[i][2], None)

# group consecutive matched + JP-contiguous functions into runs
runs, cur = [], []
for name, off, size, jp_addr in located:
    if jp_addr is None:
        if cur: runs.append(cur); cur = []
        continue
    if cur and (cur[-1][3] + cur[-1][2] + 3) & ~3 != (jp_addr & ~3) and cur[-1][3] + cur[-1][2] != jp_addr:
        runs.append(cur); cur = []
    cur.append((name, off, size, jp_addr))
if cur: runs.append(cur)

nmatch = sum(1 for _, _, _, a in located if a)
print(f"{NAME}.c: {len(funcs)} functions, {nmatch} matched, {len(runs)} run(s)")
for r in runs:
    start = r[0][3]; end = r[-1][3] + r[-1][2]
    print(f"  RUN {start:08X}..{end:08X}  ({len(r)} fns: {', '.join(f[0] for f in r)})")
unm = [n for n, o, s, a in located if a is None]
if unm:
    print(f"  region-different / unmatched ({len(unm)}): {', '.join(unm)}")
