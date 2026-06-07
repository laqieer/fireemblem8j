#!/usr/bin/env python3
"""Find VERIFIED runs of a US TU (decision D2).

Per-function masked search only PROPOSES which functions match and roughly where.
A run is accepted only if the compiled subset of its functions emits a `.text`
that byte-matches the JP ROM (modulo relocation sites) at the proposed base.
Runs that don't verify are shrunk to their longest matching prefix; the rest is
retried. This makes the carve self-validating.

Prints one line per verified run:  <jp_start> <jp_end> <fn1,fn2,...>
"""
import subprocess, sys, os, tempfile, atexit, shutil

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
NAME = sys.argv[1]
US = "/home/laqieer/fireemblem8u/src"
CPPF = "-I tools/agbcc/include -iquote include -iquote . -nostdinc -undef"
CC1F = "-mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm -ffix-debug-line -g"
jp = open("baserom.gba", "rb").read()
# Per-process scratch dir so many find_runs can run in parallel (one per TU/core)
# without colliding on shared /tmp files. find_runs is otherwise read-only on the
# repo, so this is the only thing needed to parallelize discovery.
TMP = tempfile.mkdtemp(prefix="findruns_")
atexit.register(lambda: shutil.rmtree(TMP, ignore_errors=True))
FR, FULL = f"{TMP}/fr", f"{TMP}/full"


def compile_funcs(funcs):
    """Extract a subset of funcs, compile; return (text bytes, set of reloc offsets)."""
    sub = subprocess.run(f"python3 scripts/extract_run.py {US}/{NAME}.c {' '.join(funcs)}",
                         shell=True, capture_output=True, text=True).stdout
    open(f"{FR}.c", "w").write(sub)
    subprocess.run(f"cpp {CPPF} {FR}.c 2>/dev/null | iconv -f UTF-8 -t CP932 | "
                   f"tools/agbcc/bin/agbcc {CC1F} -o {FR}.s 2>/dev/null", shell=True)
    if not os.path.exists(f"{FR}.s") or os.path.getsize(f"{FR}.s") == 0:
        return None, None
    subprocess.run(f"echo '.ALIGN 2,0' >> {FR}.s; arm-none-eabi-as -mcpu=arm7tdmi "
                   f"-mthumb-interwork -I include -I . {FR}.s -o {FR}.o 2>/dev/null", shell=True)
    text = subprocess.run(f"arm-none-eabi-objcopy -O binary -j .text {FR}.o /dev/stdout",
                          shell=True, capture_output=True).stdout
    relocs = set()
    sec = None
    for ln in subprocess.run(f"arm-none-eabi-objdump -r {FR}.o", shell=True,
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


def search_bases(text, relocs, cap=3):
    """Masked-search the whole .text. Return (needle_len_or_None, [matching JP bases]).

    needle_len is None when the longest unmasked run is too short to search (<6);
    otherwise the list holds up to `cap` file-offset bases where the WHOLE masked
    .text matches. With an adequate needle: 0 bases => the code isn't in the JP ROM
    (region-different); 1 => uniquely located; >=2 => ambiguous (extend the block)."""
    n = len(text); mask = [1] * n
    for r in relocs:
        for k in range(4):
            if r + k < n:
                mask[r + k] = 0
    bs = bl = 0; rs = None
    for x in range(n + 1):
        if x < n and mask[x]:
            if rs is None: rs = x
        elif rs is not None:
            if x - rs > bl: bl, bs = x - rs, rs
            rs = None
    if bl < 6:
        return None, []
    needle = bytes(text[bs:bs + bl]); hits = []; start = 0
    while len(hits) < cap:
        j = jp.find(needle, start)
        if j < 0: break
        s = j - bs
        if matches_at(text, relocs, s):
            hits.append(s)
        start = j + 1
    return bl, hits


# functions in source order (from the full-file object)
subprocess.run(f"cpp {CPPF} {US}/{NAME}.c 2>/dev/null | iconv -f UTF-8 -t CP932 | "
               f"tools/agbcc/bin/agbcc {CC1F} -o {FULL}.s 2>/dev/null", shell=True)
subprocess.run(f"echo '.ALIGN 2,0' >> {FULL}.s; arm-none-eabi-as -mcpu=arm7tdmi "
               f"-mthumb-interwork -I include -I . {FULL}.s -o {FULL}.o 2>/dev/null", shell=True)
order = [l.split()[2] for l in subprocess.run(f"arm-none-eabi-nm -n {FULL}.o", shell=True,
         capture_output=True, text=True).stdout.splitlines()
         if len(l.split()) == 3 and l.split()[1] in "tT"]

MAXK = 6  # functions to append while disambiguating an ambiguous start: a
          # function whose masked bytes appear at several JP spots usually becomes
          # uniquely located once a neighbour or two is added, which both resolves
          # it AND keeps the carve safe -- we only ever emit a unique block.
runs = []
i = 0
while i < len(order):
    best = None  # (k, base, textlen)
    for k0 in range(1, min(MAXK, len(order) - i) + 1):
        text, relocs = compile_funcs(order[i:i + k0])
        if not text:
            break  # block won't compile -> can't grow this start
        nl, bases = search_bases(text, relocs)
        if nl is not None and not bases:
            break  # adequate needle, no JP match -> region-different, stop growing
        if len(bases) == 1:  # uniquely located -> accept, then greedy-extend further
            base, k, tl = bases[0], k0, len(text)
            while i + k + 1 <= len(order):
                t2, r2 = compile_funcs(order[i:i + k + 1])
                if t2 and matches_at(t2, r2, base):
                    k, tl = k + 1, len(t2)
                else:
                    break
            best = (k, base, tl)
            break
        # bases >= 2 (ambiguous) or needle too short -> append the next fn and retry
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
