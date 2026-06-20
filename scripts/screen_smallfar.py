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
cand=[]; seen=set()
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
out=[]
for nm,af,hx in cand:
    tu=find_tu(nm)
    if not tu: continue
    body=sh(f"python3 scripts/extract_func_only.py {tu} {nm}")
    if not body.strip(): continue
    open("/tmp/sf.c","w").write(body)
    ok=sh("cc -E -I tools/agbcc/include -iquote include -iquote . -nostdinc -undef /tmp/sf.c 2>/dev/null "
       "| iconv -f UTF-8 -t CP932 | tools/agbcc/bin/agbcc -mthumb-interwork -Wparentheses -O2 -fhex-asm "
       "-ffix-debug-line -g -o /tmp/sf.s 2>/dev/null && printf '\\t.text\\n\\t.align 2, 0\\n' >> /tmp/sf.s && "
       "arm-none-eabi-as -mcpu=arm7tdmi -mthumb-interwork -I include -I . /tmp/sf.s -o /tmp/sf.o 2>/dev/null && echo OK")
    if 'OK' not in ok or not os.path.exists("/tmp/sf.o"): continue
    sh("arm-none-eabi-objcopy -O binary --only-section=.text /tmp/sf.o /tmp/sf.bin")
    tb=open("/tmp/sf.bin","rb").read()
    rel=set()
    for l in sh("arm-none-eabi-objdump -r --section=.text /tmp/sf.o").splitlines():
        m=re.match(r'^([0-9a-f]{8})\s+R_ARM',l)
        if m:
            o=int(m.group(1),16)
            for k in range(4): rel.add(o+k)
    off=int(hx,16)&0xFFFFFF; rb=rom[off:off+len(tb)]
    if len(tb)!=len(rb): 
        os.remove("/tmp/sf.o"); continue   # size mismatch => not const-decode
    diffs=[i for i in range(len(tb)) if tb[i]!=rb[i] and i not in rel]
    n=len(diffs)
    if 9<=n<=40:
        out.append((n,nm,hx,len(tb),[ '%x:%02x->%02x'%(d,tb[d],rb[d]) for d in diffs[:10]]))
    os.remove("/tmp/sf.o")
out.sort()
print(f"SMALL-FAR (same-size, 9-40 nonreloc-diff): {len(out)}")
for n,nm,hx,sz,ds in out:
    print(f"{nm}\t{hx}\tdiff={n}\tsz={sz}\t{ds}")
