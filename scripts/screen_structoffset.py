#!/usr/bin/env python3
"""screen_structoffset.py — find funclib-named still-asm functions whose ONLY non-reloc diffs
are struct-FIELD-OFFSET changes (JP proc-struct layout differs). These show as FAR in a normal
NEAR screen (one diff per field access) but are CARVEABLE via per-field raw pointer casts.

A diff is "struct-offset" if the US instruction at that offset is a load/store with an immediate
field offset (ldr/ldrh/ldrsh/ldrb/str/strh/strb [rN,#imm]) OR a `movs rN,#imm` (offset loaded for
ldrsh [rM,rN]) AND the diff bytes fall in the immediate field. Output: candidates + their diff
instructions, so each can be hand-mapped (US field -> JP offset) and carved with autobind+DECL_SUBST.
"""
import os, re, subprocess, glob

ROOT = "/home/laqieer/fireemblem8j"; US = "/home/laqieer/fireemblem8u"
os.chdir(ROOT)
def sh(c): return subprocess.run(c, shell=True, capture_output=True, text=True).stdout

fl = {}
for ln in open("reference/maps/funclib_us_jp.tsv"):
    p = ln.rstrip().split("\t")
    if len(p) >= 3 and p[0].startswith("0x"): fl[int(p[0], 16)] = p[2]
tu_of = {}
for ln in open("layout/nofuncmap_region_different.tsv"):
    p = ln.rstrip().split("\t")
    if len(p) >= 4: tu_of[p[2]] = p[3]
existing = set(os.path.basename(f)[:-2] for f in glob.glob("src/**/*.c", recursive=True))
rom = open("baserom.gba", "rb").read()

# US name -> TU (by definition grep), cached
_tucache = {}
def find_tu(name):
    if name in _tucache: return _tucache[name]
    r = sh(f"grep -rlE '^[A-Za-z_][A-Za-z0-9_ \\t\\*]*\\b{re.escape(name)}\\s*\\(' {US}/src/*.c")
    tu = None
    for f in r.split():
        if f.endswith(".c"):
            tu = os.path.basename(f)[:-2]; break
    _tucache[name] = tu
    return tu

LOADSTORE = re.compile(r'\b(ldr|ldrh|ldrsh|ldrb|str|strh|strb)\b.*\[.*#0x[0-9a-f]+\]')
MOVS = re.compile(r'\bmovs\s+r\d+, #\d+')

def disasm_at(objpath):
    out = {}
    for ln in sh(f"arm-none-eabi-objdump -d {objpath}").splitlines():
        m = re.match(r'\s+([0-9a-f]+):\s+[0-9a-f ]+\t(.*)', ln)
        if m: out[int(m.group(1), 16)] = m.group(2).strip()
    return out

cands = []
funclib_asm = []
for f in sorted(glob.glob("asm/sub_*.s")):
    m = re.match(r'sub_([0-9A-Fa-f]+)\.s$', os.path.basename(f))
    if not m: continue
    nm = fl.get(int(m.group(1), 16))
    if not nm or nm.startswith(('sub_', 'j_', 'loc_', 'unk_', '_')) or nm in existing: continue
    tu = find_tu(nm)
    if not tu or not os.path.exists(f"{US}/src/{tu}.c"): continue
    funclib_asm.append((m.group(1), nm, tu))

print(f"funclib-named still-asm to screen: {len(funclib_asm)}", flush=True)
for hx, nm, tu in funclib_asm:
    base = int(hx, 16) | 0x08000000
    body = sh(f"python3 scripts/extract_func_only.py {US}/src/{tu}.c {nm}")
    if not body.strip(): continue
    open("/tmp/so.c", "w").write(body)
    c = sh("cc -E -I tools/agbcc/include -iquote include -iquote . -nostdinc -undef /tmp/so.c "
           "| iconv -f UTF-8 -t CP932 | tools/agbcc/bin/agbcc -mthumb-interwork -Wparentheses -O2 -fhex-asm "
           "-ffix-debug-line -g -o /tmp/so.s 2>/dev/null && printf '\\t.text\\n\\t.align 2, 0\\n' >> /tmp/so.s && "
           "arm-none-eabi-as -mcpu=arm7tdmi -mthumb-interwork -I include -I . /tmp/so.s -o /tmp/so.o")
    if not os.path.exists("/tmp/so.o"): continue
    sh("arm-none-eabi-objcopy -O binary --only-section=.text /tmp/so.o /tmp/so.bin")
    tb = open("/tmp/so.bin", "rb").read()
    off = base & 0xFFFFFF
    rb = rom[off:off + len(tb)]
    rel = set()
    for l in sh("arm-none-eabi-objdump -r --section=.text /tmp/so.o").splitlines():
        mm = re.match(r'^([0-9a-f]{8})\s+R_ARM', l)
        if mm:
            o = int(mm.group(1), 16)
            for k in range(4): rel.add(o + k)
    diffs = [i for i in range(min(len(tb), len(rb))) if tb[i] != rb[i] and i not in rel]
    if not diffs or len(diffs) > 40:
        continue
    sh("rm -f /tmp/so.o2; arm-none-eabi-as -mcpu=arm7tdmi -mthumb-interwork -I include -I . /tmp/so.s -o /tmp/so.o2 2>/dev/null")
    dis = disasm_at("/tmp/so.o2")
    # group diffs into halfwords; each diff halfword's instruction must be load/store-imm or movs
    hwset = sorted(set(d & ~1 for d in diffs))
    allso = True; insns = []
    for hw in hwset:
        ins = dis.get(hw) or dis.get(hw - 2) or ""
        insns.append(f"{hex(hw)}:{ins}")
        if not (LOADSTORE.search(ins) or MOVS.search(ins)):
            allso = False
    if allso and insns:
        cands.append((nm, hx, tu, insns))
        print(f"STRUCT-OFFSET? {nm} sub_{hx} ({tu}): {insns}", flush=True)

print(f"\n==== struct-offset candidates: {len(cands)} ====")
for nm, hx, tu, insns in cands:
    print(f"{nm}\tsub_{hx}\t{tu}")
