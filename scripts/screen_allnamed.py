#!/usr/bin/env python3
"""screen_allnamed.py — generalized fast screen for NAMED region-diff asm funcs in ANY asm/*.s
(not just sub_*.s). Addr from `nm fireemblem8.elf` (T symbols — they're linked). Compile US body,
auto-declare undeclared data/func syms + retry, byte-diff vs JP ROM EXCLUDING reloc offsets.
Bucket CARVE(0)/NEAR(1-8)/FAR/CFAIL. Read-only (/tmp compiles). argv = candidate names, or auto-scan."""
import os, re, subprocess, glob, sys
ROOT="/home/laqieer/fireemblem8j"; US="/home/laqieer/fireemblem8u"
os.chdir(ROOT)
def sh(c): return subprocess.run(c,shell=True,capture_output=True,text=True).stdout

# name -> JP addr from nm (T = thumb text)
addr={}
for ln in sh("arm-none-eabi-nm fireemblem8.elf").splitlines():
    p=ln.split()
    if len(p)==3 and p[1] in ('T','t'): addr[p[2]]=int(p[0],16)

carved=set(os.path.basename(f)[:-2] for f in glob.glob("src/**/*.c",recursive=True))
USNAMES=set()
for f in glob.glob(f"{US}/src/*.c"):
    for mm in re.finditer(r'^(?:static\s+)?[A-Za-z_][\w \*]*\b([A-Z]\w+)\s*\([^;{]*\)\s*\{?',open(f,errors='replace').read(),re.M):
        USNAMES.add(mm.group(1))
PLACE=re.compile(r'^(sub_[0-9A-Fa-f]+|data_|nullsub_|banim_|gfx_|snd_|loc_|unk_|j_|_)')

names=sys.argv[1:]
if not names:
    seen=set()
    for f in sorted(glob.glob("asm/**/*.s",recursive=True)):
        for mm in re.finditer(r'^\s*\.global\s+(\w+)',open(f,errors='replace').read(),re.M):
            nm=mm.group(1)
            if PLACE.match(nm) or nm in carved or nm not in USNAMES or nm in seen: continue
            seen.add(nm); names.append(nm)

rom=open("baserom.gba","rb").read()
def find_tu(name):
    r=sh(f"grep -rlE '^[A-Za-z_][A-Za-z0-9_ \\t\\*]*\\b{re.escape(name)}\\s*\\(' {US}/src/*.c")
    for x in r.split():
        if x.endswith(".c"): return x
    return None

res={'CARVE':[],'NEAR':[],'FAR':[],'CFAIL':[],'NOADDR':[],'NOTU':[]}
for nm in names:
    if nm not in addr: res['NOADDR'].append(nm); continue
    tu=find_tu(nm)
    if not tu: res['NOTU'].append(nm); continue
    body=sh(f"python3 scripts/extract_func_only.py {tu} {nm}")
    if not body.strip(): res['NOTU'].append(nm); continue
    decls=[]; ok=False
    for _ in range(12):
        open("/tmp/sa.c","w").write("".join(decls)+"\n"+body)
        sh("rm -f /tmp/sa.o /tmp/sa.s")
        sh("cc -E -I tools/agbcc/include -iquote include -iquote . -nostdinc -undef /tmp/sa.c 2>/dev/null "
           "| iconv -f UTF-8 -t CP932 | tools/agbcc/bin/agbcc -mthumb-interwork -Wparentheses -O2 -fhex-asm "
           "-ffix-debug-line -g -o /tmp/sa.s 2>/tmp/sa.err && printf '\\t.text\\n\\t.align 2, 0\\n' >> /tmp/sa.s && "
           "arm-none-eabi-as -mcpu=arm7tdmi -mthumb-interwork -I include -I . /tmp/sa.s -o /tmp/sa.o 2>>/tmp/sa.err")
        if os.path.exists("/tmp/sa.o"): ok=True; break
        e=open("/tmp/sa.err",errors='replace').read()
        und=re.findall(r"`(\w+)' undeclared",e)+re.findall(r"implicit declaration of function `(\w+)'",e)
        und=[u for u in und if not any(u in d for d in decls)]
        if not und: break
        for u in set(und):
            if re.search(rf'\b{re.escape(u)}\s*\(',body): decls.append(f"int {u}();\n")
            else: decls.append(f"extern int {u}[];\n")
    if not ok: res['CFAIL'].append(nm); continue
    sh("arm-none-eabi-objcopy -O binary --only-section=.text /tmp/sa.o /tmp/sa.bin")
    tb=open("/tmp/sa.bin","rb").read()
    rel=set()
    for l in sh("arm-none-eabi-objdump -r --section=.text /tmp/sa.o").splitlines():
        m=re.match(r'^([0-9a-f]{8})\s+R_ARM',l)
        if m:
            o=int(m.group(1),16)
            for k in range(4): rel.add(o+k)
    off=addr[nm]&0xFFFFFF
    rb=rom[off:off+len(tb)]
    diffs=[i for i in range(min(len(tb),len(rb))) if tb[i]!=rb[i] and i not in rel]
    n=len(diffs); szm=len(tb)!=len(rb)
    rec=f"{nm}\t{addr[nm]:07x}\tdiffs={n}\tsz={len(tb)}/{len(rb)}{' SZMIS' if szm else ''}"
    if n==0 and not szm: res['CARVE'].append(rec)
    elif n<=8 and not szm: res['NEAR'].append(rec+f"\t{['%x:%02x->%02x'%(d,tb[d],rb[d]) for d in diffs[:8]]}")
    else: res['FAR'].append(rec)

for k in ('CARVE','NEAR'):
    print(f"==== {k} ({len(res[k])}) ====")
    for r in res[k]: print(r)
print(f"==== SUM CARVE={len(res['CARVE'])} NEAR={len(res['NEAR'])} FAR={len(res['FAR'])} CFAIL={len(res['CFAIL'])} NOADDR={len(res['NOADDR'])} NOTU={len(res['NOTU'])} ====")
