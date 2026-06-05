#!/usr/bin/env python3
"""Find VERIFIED runs of a US TU (decision D2).

Per-function masked search only PROPOSES which functions match and roughly where.
A run is accepted only if the compiled subset of its functions emits a `.text`
that byte-matches the JP ROM (modulo relocation sites) at the proposed base.
Runs that don't verify are shrunk to their longest matching prefix; the rest is
retried. This makes the carve self-validating.

Prints one line per verified run:  <jp_start> <jp_end> <fn1,fn2,...>
"""
import subprocess, sys, os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
NAME = sys.argv[1]
US = "/home/laqieer/fireemblem8u/src"
CPPF = "-I tools/agbcc/include -iquote include -iquote . -nostdinc -undef"
CC1F = "-mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm -ffix-debug-line -g"
jp = open("baserom.gba", "rb").read()


def compile_funcs(funcs):
    """Extract a subset of funcs, compile; return (text bytes, set of reloc offsets)."""
    sub = subprocess.run(f"python3 scripts/extract_run.py {US}/{NAME}.c {' '.join(funcs)}",
                         shell=True, capture_output=True, text=True).stdout
    open("/tmp/fr.c", "w").write(sub)
    subprocess.run(f"cpp {CPPF} /tmp/fr.c 2>/dev/null | iconv -f UTF-8 -t CP932 | "
                   f"tools/agbcc/bin/agbcc {CC1F} -o /tmp/fr.s 2>/dev/null", shell=True)
    if not os.path.exists("/tmp/fr.s") or os.path.getsize("/tmp/fr.s") == 0:
        return None, None
    subprocess.run("echo '.ALIGN 2,0' >> /tmp/fr.s; arm-none-eabi-as -mcpu=arm7tdmi "
                   "-mthumb-interwork -I include -I . /tmp/fr.s -o /tmp/fr.o 2>/dev/null", shell=True)
    text = subprocess.run("arm-none-eabi-objcopy -O binary -j .text /tmp/fr.o /dev/stdout",
                          shell=True, capture_output=True).stdout
    relocs = set()
    sec = None
    for ln in subprocess.run("arm-none-eabi-objdump -r /tmp/fr.o", shell=True,
                             capture_output=True, text=True).stdout.splitlines():
        if "RELOCATION RECORDS FOR [" in ln:
            sec = ln.split("[")[1].split("]")[0]
        elif sec == ".text":
            p = ln.split()
            if len(p) >= 3 and all(c in "0123456789abcdef" for c in p[0]):
                relocs.add(int(p[0], 16))
    return text, relocs


def matches_at(text, relocs, base):
    """True if every non-reloc byte of text equals the JP ROM at base."""
    if base < 0 or base + len(text) > len(jp):
        return False
    for i in range(len(text)):
        if any(i - k in relocs and 0 <= i - k for k in range(4)):
            continue
        if text[i] != jp[base + i]:
            return False
    return True


def search_unique(text, relocs):
    """Masked-search the whole .text; return its unique JP file-offset base or None."""
    n = len(text)
    mask = [1] * n
    for r in relocs:
        for k in range(4):
            if r + k < n:
                mask[r + k] = 0
    bs = bl = 0; rs = None
    for i in range(n + 1):
        if i < n and mask[i]:
            if rs is None: rs = i
        elif rs is not None:
            if i - rs > bl: bl, bs = i - rs, rs
            rs = None
    if bl < 6:
        return None
    needle = bytes(text[bs:bs + bl]); hits = []; start = 0
    while len(hits) < 2:
        j = jp.find(needle, start)
        if j < 0: break
        s = j - bs
        if matches_at(text, relocs, s):
            hits.append(s)
        start = j + 1
    return hits[0] if len(hits) == 1 else None


# functions in source order (from the full-file object)
subprocess.run(f"cpp {CPPF} {US}/{NAME}.c 2>/dev/null | iconv -f UTF-8 -t CP932 | "
               f"tools/agbcc/bin/agbcc {CC1F} -o /tmp/full.s 2>/dev/null", shell=True)
subprocess.run("echo '.ALIGN 2,0' >> /tmp/full.s; arm-none-eabi-as -mcpu=arm7tdmi "
               "-mthumb-interwork -I include -I . /tmp/full.s -o /tmp/full.o 2>/dev/null", shell=True)
order = [l.split()[2] for l in subprocess.run("arm-none-eabi-nm -n /tmp/full.o", shell=True,
         capture_output=True, text=True).stdout.splitlines()
         if len(l.split()) == 3 and l.split()[1] in "tT"]

runs = []
i = 0
while i < len(order):
    # grow the candidate run as far as it still verifies as a block
    best = None  # (k, base, textlen)
    text, relocs = compile_funcs(order[i:i + 1])
    if text:
        base = search_unique(text, relocs)
        if base is not None:
            best = (1, base, len(text))
            # extend greedily; require the block to still match at the SAME base
            k = 2
            while i + k <= len(order):
                t2, r2 = compile_funcs(order[i:i + k])
                if t2 and matches_at(t2, r2, base):
                    best = (k, base, len(t2)); k += 1
                else:
                    break
    if best:
        k, base, tl = best
        runs.append((base, base + tl, order[i:i + k]))
        i += k
    else:
        i += 1

for s, e, fns in runs:
    print(f"{0x08000000+s:08X} {0x08000000+e:08X} {','.join(fns)}")
nfn = sum(len(f) for _, _, f in runs)
sys.stderr.write(f"{NAME}: {len(runs)} verified run(s), {nfn}/{len(order)} functions\n")
