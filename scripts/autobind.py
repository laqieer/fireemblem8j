#!/usr/bin/env python3
"""autobind.py <Fn>... — carve named-asm functions that need MULTIPLE undefined symbols
bound + their proc-struct in scope. For each fn: carve US body, auto-extract proc structs
from the US .c (us_structs) + iterate us_decl decls, bind every still-undefined symbol to a
unique SENTINEL (0x09000000+i*0x10000), build, then read each symbol's REAL address from the
baserom at its sentinel literal slot (data: sentinel+offset for arrays; functions: from the
BL encoding), rebind, rebuild, verify 0/N. MATCH keeps + writes autobind_<fn>.tsv binding;
else auto-reverts. Companion to the static mnemonic screen (see memory static-mnemonic-screen).
"""
import sys, os, re, subprocess, glob, struct
sys.path.insert(0,"scripts"); os.chdir("/home/laqieer/fireemblem8j")
from decl_carve import us_decl, recipe, DEFINED
US_SRC=glob.glob("../fireemblem8u/src/*.c")
def sh(c): return subprocess.run(c,shell=True,capture_output=True,text=True).stdout
def us_inline_body(sym):
    for f in US_SRC:
        try: txt=open(f,errors='replace').read()
        except: continue
        m=re.search(r'^static\s+inline\b[^\n;{]*?\b'+re.escape(sym)+r'\s*\([^;{]*\)\s*\{', txt, re.M)
        if m:
            i=txt.index(m.group(0)); depth=0; j=txt.index('{',i)
            for k in range(j,len(txt)):
                if txt[k]=='{': depth+=1
                elif txt[k]=='}':
                    depth-=1
                    if depth==0: return txt[i:k+1]
    return None

def us_enums(name):
    for f in US_SRC:
        try: txt=open(f,errors='replace').read()
        except: continue
        if re.search(rf'^[A-Za-z_][\w \t\*]*?\b{re.escape(name)}\s*\([^;{{]*\)\s*\{{',txt,re.M):
            return "\n".join(m.group(0) for m in re.finditer(r'^enum\s*\{[^}]*\}\s*;',txt,re.M))
    return ""

def us_structs(name):
    for f in US_SRC:
        try: txt=open(f,errors='replace').read()
        except: continue
        if re.search(rf'^[A-Za-z_][\w \t\*]*?\b{re.escape(name)}\s*\([^;{{]*\)\s*\{{',txt,re.M):
            return "\n".join(m.group(0) for m in re.finditer(r'^struct\s+\w+\s*\{.*?^\};',txt,re.M|re.S))
    return ""

def is_func(sym):
    for f in US_SRC:
        try: t=open(f,errors='replace').read()
        except: continue
        if re.search(rf'^[A-Za-z_][\w \t\*]*?\b{re.escape(sym)}\s*\([^;{{]*\)\s*\{{',t,re.M): return True
    return False
def BINDF(n): return f"layout/baseline_syms.d/autobind_{n}.tsv"
def carve(name):
    r=recipe(name)
    if not r: return None,"no recipe"
    decls=[]; tried=set()
    for _ in range(15):
        open(f"src/{name}.c","w").write("".join(f'#include "{h}"\n' for h in r["inc"])+"\n"+us_enums(name)+"\n"+us_structs(name)+"\n"+"".join(d+"\n" for d in decls)+"\n"+re.sub(r"^static\s+","",r["body"])+"\n")
        err=sh(f"rm -f src/{name}.o; make src/{name}.o 2>&1")
        und=[u for u in re.findall(r"`([A-Za-z_]\w+)' undeclared",err)+re.findall(r"implicit declaration of function `([A-Za-z_]\w+)'",err) if u not in tried]
        if not und:
            if re.search(r' [Tt] '+re.escape(name),sh(f"arm-none-eabi-nm src/{name}.o 2>/dev/null")): break
            return None,"compile-other"
        for u in und:
            tried.add(u); ib=us_inline_body(u)
            d=ib if ib else us_decl(u)
            decls.append(d if d else f"int {u}();")
    else: return None,"decl-loop"
    # undefined (link) syms
    und=[ln.split()[-1] for ln in sh(f"arm-none-eabi-nm -u src/{name}.o").splitlines() if ln.strip()]
    miss=[u for u in und if u not in DEFINED]
    return (r,decls,miss),"ok"

def run(name):
    res,st=carve(name)
    if st!="ok": print(f"[{st}] {name}"); os.path.exists(f"src/{name}.c") and os.remove(f"src/{name}.c"); return
    r,decls,miss=res
    base=open("baserom.gba","rb").read()
    # sentinel-bind each missing sym
    sent={u:0x09000000+(i+1)*0x10000 for i,u in enumerate(miss)}
    func={u:is_func(u) for u in miss}
    with open(BINDF(name),"w") as f:
        for u,a in sent.items(): f.write(f"{u}\t{a:08X}\t{'thumb' if func[u] else 'data'}\t{name}\n")
    s,e=int(r['start'],16),int(r['end'],16)
    sh(f"git rm -q asm/sub_{r['addr']}.s layout/carved_rom.d/gbadisasm_sub_{r['addr']}.tsv")
    open(f"layout/carved_rom.d/handdecomp_{name}.tsv","w").write(f"{r['start']}\t{r['end']}\tsrc/{name}.o(.text)\thanddecomp\n")
    open(f"layout/baseline_syms_drop.d/handdecomp_{name}.tsv","w").write(name+"\n")
    subprocess.run(["python3","scripts/gen_layout.py"],capture_output=True)
    sh("rm -f fireemblem8.gba; make -k >/dev/null 2>&1")
    if not os.path.exists("fireemblem8.gba"): print(f"[LINK] {name}: {miss}"); revert(name,r); return
    mine=open("fireemblem8.gba","rb").read()
    real={}
    for u,sv in sent.items():
        if func[u]:
            sle=None
            for i in range(s,e-3,2):
                h1=struct.unpack("<H",mine[i:i+2])[0]; h2=struct.unpack("<H",mine[i+2:i+4])[0]
                if 0xF000<=h1<=0xF7FF and 0xF800<=h2<=0xFFFF:
                    o=((h1&0x7ff)<<12)|((h2&0x7ff)<<1); o-=0x800000 if o&0x400000 else 0
                    if (0x08000000+i+4+o)&0xFFFFFFFF in (sv,sv|1): 
                        b1=struct.unpack("<H",base[i:i+2])[0]; b2=struct.unpack("<H",base[i+2:i+4])[0]
                        bo=((b1&0x7ff)<<12)|((b2&0x7ff)<<1); bo-=0x800000 if bo&0x400000 else 0
                        real[u]=(0x08000000+i+4+bo)&0xFFFFFFFF; break
        else:
            for i in range(s,e-3):
                mv=struct.unpack("<I",mine[i:i+4])[0]
                if sv<=mv<sv+0x8000:
                    real[u]=struct.unpack("<I",base[i:i+4])[0]-(mv-sv); break
    if len(real)<len(miss):
        print(f"[UNMAPPED] {name}: {[u for u in miss if u not in real]}"); revert(name,r); return
    with open(BINDF(name),"w") as f:
        for u,a in real.items(): f.write(f"{u}\t{a:08X}\t{'thumb' if func[u] else 'data'}\t{name}\n")
    subprocess.run(["python3","scripts/gen_layout.py"],capture_output=True)
    sh("rm -f fireemblem8.gba; make -k >/dev/null 2>&1")
    mine=open("fireemblem8.gba","rb").read()
    bad=[i for i in range(s,e) if mine[i]!=base[i]]
    if not bad:
        print(f"[MATCH] {name}: 0/{e-s}  binds={ {u:hex(a) for u,a in real.items()} }")
    else:
        print(f"[DIFF] {name}: {len(bad)}/{e-s} " + " ".join(f"{i-s:#x}:{mine[i]:#x}->{base[i]:#x}" for i in bad[:10]) + f"  binds={ {u:hex(a) for u,a in real.items()} }")
        if len(bad)>4: revert(name,r)
def revert(name,r):
    sh(f"git checkout HEAD -- asm/sub_{r['addr']}.s layout/carved_rom.d/gbadisasm_sub_{r['addr']}.tsv")
    for p in (f"src/{name}.c",f"src/{name}.o",f"layout/carved_rom.d/handdecomp_{name}.tsv",f"layout/baseline_syms_drop.d/handdecomp_{name}.tsv",BINDF(name)):
        os.path.exists(p) and os.remove(p)
    subprocess.run(["python3","scripts/gen_layout.py"],capture_output=True)
for nm in sys.argv[1:]: run(nm)
