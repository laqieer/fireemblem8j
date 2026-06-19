#!/usr/bin/env python3
"""screen_named_rd.py — FAST pre-filter for the NAMED region-different asm functions.
For each NAMED `.global` in asm/sub_*.s whose descriptive name has a US source and isn't carved:
compile the US body standalone (agbcc, .align 2,0 tail fix), byte-diff vs the JP ROM range
EXCLUDING reloc offsets, bucket by non-reloc diff count. CARVE(0)/NEAR(1-8) -> feed to autobind;
FAR(>8) -> region-different skip; COMPILE-FAIL -> macro/decl issue (inspect).
Read-only (no tree mutation): compiles to /tmp only. ~2s/fn vs autobind's ~3.5min.
"""
import os, re, subprocess, glob
ROOT="/home/laqieer/fireemblem8j"; US="/home/laqieer/fireemblem8u"
os.chdir(ROOT)
def sh(c): return subprocess.run(c,shell=True,capture_output=True,text=True).stdout

carved=set(os.path.basename(f)[:-2] for f in glob.glob("src/**/*.c",recursive=True))
USNAMES=set()
for f in glob.glob(f"{US}/src/*.c"):
    for mm in re.finditer(r'^(?:static\s+)?\w[\w \*]*\b([A-Z]\w+)\s*\([^;]*\)\s*$',open(f,errors='replace').read(),re.M):
        USNAMES.add(mm.group(1))
PLACE=re.compile(r'^(sub_[0-9A-Fa-f]+|data_|nullsub_|banim_|gfx_|snd_|loc_|unk_|j_)')

# name -> (asm_file, jp_hex)
cand=[]
seen=set()
for f in sorted(glob.glob("asm/sub_*.s")):
    hx=re.match(r'sub_([0-9A-Fa-f]+)\.s$',os.path.basename(f)).group(1)
    txt=open(f,errors='replace').read()
    for mm in re.finditer(r'^\s*\.global\s+(\w+)',txt,re.M):
        nm=mm.group(1)
        if PLACE.match(nm) or nm in carved or nm not in USNAMES or nm in seen: continue
        seen.add(nm); cand.append((nm,f,hx)); break

rom=open("baserom.gba","rb").read()
_tu={}
def find_tu(name):
    if name in _tu: return _tu[name]
    r=sh(f"grep -rlE '^[A-Za-z_][A-Za-z0-9_ \\t\\*]*\\b{re.escape(name)}\\s*\\(' {US}/src/*.c")
    tu=None
    for x in r.split():
        if x.endswith(".c"): tu=x; break
    _tu[name]=tu; return tu

print(f"named region-diff candidates: {len(cand)}",flush=True)
buckets={'CARVE':[],'NEAR':[],'FAR':[],'CFAIL':[],'NOTU':[]}
for nm,af,hx in cand:
    tu=find_tu(nm)
    if not tu: buckets['NOTU'].append(nm); continue
    body=sh(f"python3 scripts/extract_func_only.py {tu} {nm}")
    if not body.strip(): buckets['NOTU'].append(nm); continue
    open("/tmp/sn.c","w").write(body)
    err=sh("cc -E -I tools/agbcc/include -iquote include -iquote . -nostdinc -undef /tmp/sn.c 2>/dev/null "
           "| iconv -f UTF-8 -t CP932 | tools/agbcc/bin/agbcc -mthumb-interwork -Wparentheses -O2 -fhex-asm "
           "-ffix-debug-line -g -o /tmp/sn.s 2>/tmp/sn.err && printf '\\t.text\\n\\t.align 2, 0\\n' >> /tmp/sn.s && "
           "arm-none-eabi-as -mcpu=arm7tdmi -mthumb-interwork -I include -I . /tmp/sn.s -o /tmp/sn.o 2>>/tmp/sn.err")
    if not os.path.exists("/tmp/sn.o"):
        e=open("/tmp/sn.err",errors='replace').read()
        um=re.findall(r"`(\w+)' undeclared|implicit declaration of function `(\w+)'",e)
        syms=sorted(set(x for t in um for x in t if x))[:3]
        buckets['CFAIL'].append(f"{nm} [{','.join(syms)}]"); continue
    sh("arm-none-eabi-objcopy -O binary --only-section=.text /tmp/sn.o /tmp/sn.bin")
    tb=open("/tmp/sn.bin","rb").read()
    rel=set()
    for l in sh("arm-none-eabi-objdump -r --section=.text /tmp/sn.o").splitlines():
        m=re.match(r'^([0-9a-f]{8})\s+R_ARM',l)
        if m:
            o=int(m.group(1),16)
            for k in range(4): rel.add(o+k)
    off=int(hx,16)&0xFFFFFF
    rb=rom[off:off+len(tb)]
    diffs=[i for i in range(min(len(tb),len(rb))) if tb[i]!=rb[i] and i not in rel]
    szmis = len(tb)!=len(rb)  # different size strongly => region-diff
    n=len(diffs)
    rec=f"{nm}\t{hx}\tdiffs={n}\tsz={len(tb)}/{len(rb)}{' SZMIS' if szmis else ''}"
    if n==0 and not szmis: buckets['CARVE'].append(rec)
    elif n<=8 and not szmis: buckets['NEAR'].append(rec+f"\t{['%x:%02x->%02x'%(d,tb[d],rb[d]) for d in diffs[:8]]}")
    else: buckets['FAR'].append(rec)
    os.remove("/tmp/sn.o")

for k in ('CARVE','NEAR','CFAIL'):
    print(f"\n==== {k} ({len(buckets[k])}) ====")
    for r in buckets[k]: print(r)
print(f"\n==== SUMMARY: CARVE={len(buckets['CARVE'])} NEAR={len(buckets['NEAR'])} FAR={len(buckets['FAR'])} CFAIL={len(buckets['CFAIL'])} NOTU={len(buckets['NOTU'])} ====")
