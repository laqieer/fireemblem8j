#!/usr/bin/env python3
"""screen_cfail.py — fast-screen the CFAIL names from screen_named_rd.py: the standalone compile
fails only on UNDECLARED data/func symbols. Add extern decls (func if used as `SYM(`, else array),
retry, then byte-diff vs JP ROM EXCLUDING reloc offsets. CARVE(0)/NEAR(1-8) -> feed to autobind.
Input: names on argv, or auto-parse /tmp/screen_named.log CFAIL block. Read-only (/tmp compiles)."""
import os, re, subprocess, glob, sys
ROOT="/home/laqieer/fireemblem8j"; US="/home/laqieer/fireemblem8u"
os.chdir(ROOT)
def sh(c): return subprocess.run(c,shell=True,capture_output=True,text=True).stdout

# name -> asm hex
name2hx={}
PLACE=re.compile(r'^(sub_[0-9A-Fa-f]+|data_|nullsub_|banim_|gfx_|snd_|loc_|unk_|j_)')
for f in sorted(glob.glob("asm/sub_*.s")):
    hx=re.match(r'sub_([0-9A-Fa-f]+)\.s$',os.path.basename(f)).group(1)
    for mm in re.finditer(r'^\s*\.global\s+(\w+)',open(f,errors='replace').read(),re.M):
        nm=mm.group(1)
        if not PLACE.match(nm): name2hx.setdefault(nm,hx)

names=sys.argv[1:]
if not names:
    blk=re.search(r'==== CFAIL.*?====(.*?)====',open("/tmp/screen_named.log").read(),re.S)
    names=[l.split()[0] for l in blk.group(1).splitlines() if l.strip()] if blk else []

rom=open("baserom.gba","rb").read()
def find_tu(name):
    r=sh(f"grep -rlE '^[A-Za-z_][A-Za-z0-9_ \\t\\*]*\\b{re.escape(name)}\\s*\\(' {US}/src/*.c")
    for x in r.split():
        if x.endswith(".c"): return x
    return None

res={'CARVE':[],'NEAR':[],'FAR':[],'STILLFAIL':[]}
for nm in names:
    hx=name2hx.get(nm)
    if not hx: continue
    tu=find_tu(nm)
    if not tu: continue
    body=sh(f"python3 scripts/extract_func_only.py {tu} {nm}")
    if not body.strip(): continue
    decls=[]; ok=False
    for _ in range(12):
        open("/tmp/sc.c","w").write("".join(decls)+"\n"+body)
        sh("rm -f /tmp/sc.o /tmp/sc.s")
        sh("cc -E -I tools/agbcc/include -iquote include -iquote . -nostdinc -undef /tmp/sc.c 2>/dev/null "
           "| iconv -f UTF-8 -t CP932 | tools/agbcc/bin/agbcc -mthumb-interwork -Wparentheses -O2 -fhex-asm "
           "-ffix-debug-line -g -o /tmp/sc.s 2>/tmp/sc.err && printf '\\t.text\\n\\t.align 2, 0\\n' >> /tmp/sc.s && "
           "arm-none-eabi-as -mcpu=arm7tdmi -mthumb-interwork -I include -I . /tmp/sc.s -o /tmp/sc.o 2>>/tmp/sc.err")
        if os.path.exists("/tmp/sc.o"): ok=True; break
        e=open("/tmp/sc.err",errors='replace').read()
        und=re.findall(r"`(\w+)' undeclared",e)+re.findall(r"implicit declaration of function `(\w+)'",e)
        und=[u for u in und if not any(f"\\b{u}\\b" in d or u in d for d in decls)]
        if not und: break
        for u in set(und):
            if re.search(rf'\b{re.escape(u)}\s*\(',body): decls.append(f"int {u}();\n")
            else: decls.append(f"extern int {u}[];\n")
    if not ok: res['STILLFAIL'].append(nm); continue
    sh("arm-none-eabi-objcopy -O binary --only-section=.text /tmp/sc.o /tmp/sc.bin")
    tb=open("/tmp/sc.bin","rb").read()
    rel=set()
    for l in sh("arm-none-eabi-objdump -r --section=.text /tmp/sc.o").splitlines():
        m=re.match(r'^([0-9a-f]{8})\s+R_ARM',l)
        if m:
            o=int(m.group(1),16)
            for k in range(4): rel.add(o+k)
    off=int(hx,16)&0xFFFFFF
    rb=rom[off:off+len(tb)]
    diffs=[i for i in range(min(len(tb),len(rb))) if tb[i]!=rb[i] and i not in rel]
    n=len(diffs); szm=len(tb)!=len(rb)
    rec=f"{nm}\t{hx}\tdiffs={n}\tsz={len(tb)}/{len(rb)}{' SZMIS' if szm else ''}"
    if n==0 and not szm: res['CARVE'].append(rec)
    elif n<=8 and not szm: res['NEAR'].append(rec+f"\t{['%x:%02x->%02x'%(d,tb[d],rb[d]) for d in diffs[:8]]}")
    else: res['FAR'].append(rec)

for k in ('CARVE','NEAR'):
    print(f"==== {k} ({len(res[k])}) ====")
    for r in res[k]: print(r)
print(f"==== SUM: CARVE={len(res['CARVE'])} NEAR={len(res['NEAR'])} FAR={len(res['FAR'])} STILLFAIL={len(res['STILLFAIL'])} ====")
