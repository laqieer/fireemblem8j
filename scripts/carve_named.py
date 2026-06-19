#!/usr/bin/env python3
"""carve_named.py <Fn>... — carve a NAMED region-diff asm function (its own asm/<Name>.s, NOT
sub_<hex>.s) to matching C. extract_func_only gives a complete US TU (includes+structs+fn);
add extern decls for undeclared syms via a compile-loop; remove asm/<Name>.s + its gbadisasm
tsv; add a handdecomp carved_rom row at the JP range; build; byte-check the fn range.
NO sentinel-binding (assumes all callee/data syms are already in the JP link — true for core
fns). [MATCH] keeps (caller cold-compares+commits); else REVERTS. DECL_SUBST honored."""
import sys, os, re, subprocess, glob
os.chdir("/home/laqieer/fireemblem8j")
def sh(c): return subprocess.run(c,shell=True,capture_output=True,text=True).stdout
US_SRC=glob.glob("../fireemblem8u/src/*.c")
def find_tu(name):
    for f in US_SRC:
        try: t=open(f,errors='replace').read()
        except: continue
        if re.search(rf'^[A-Za-z_][\w \t\*]*?\b{re.escape(name)}\s*\([^;{{]*\)\s*\{{',t,re.M): return f
    return None

def revert(name, asmf, gt):
    sh(f"git checkout HEAD -- {asmf} {gt} 2>/dev/null")
    for p in (f"src/{name}.c",f"src/{name}.o",f"layout/carved_rom.d/handdecomp_{name}.tsv",
              f"layout/baseline_syms_drop.d/handdecomp_{name}.tsv"):
        os.path.exists(p) and os.remove(p)
    subprocess.run(["python3","scripts/gen_layout.py"],capture_output=True)

def carve(name):
    gt=f"layout/carved_rom.d/gbadisasm_{name}.tsv"
    if not os.path.exists(gt): return print(f"[no-tsv] {name}")
    c=open(gt).readline().rstrip("\n").split("\t")
    if len(c)<3: return print(f"[bad-tsv] {name}")
    start,end=c[0].strip(),c[1].strip()
    m=re.match(r'(asm/.+?\.o)',c[2]); asmf=(m.group(1)[:-2]+".s") if m else None
    if not asmf or not os.path.exists(asmf):
        g=sh(f"grep -rl '\\.global {name}$' asm/*.s").split("\n")[0].strip()
        asmf=g if g else None
    if not asmf: return print(f"[no-asm] {name}")
    tu=find_tu(name)
    if not tu: return print(f"[no-tu] {name}")
    body=sh(f"python3 scripts/extract_func_only.py {tu} {name}")
    if not body.strip(): return print(f"[no-body] {name}")
    for s in os.environ.get("DECL_SUBST","").split(";"):
        if "=>" in s: o,n=s.split("=>"); body=body.replace(o,n)
    # insertion point for extern decls: right before the function definition line
    fm=re.search(rf'^([A-Za-z_][\w \t\*]*?\b{re.escape(name)}\s*\([^;{{]*\)\s*)$',body,re.M) or \
       re.search(rf'^([A-Za-z_][\w \t\*]*?\b{re.escape(name)}\s*\()',body,re.M)
    ins=fm.start() if fm else len(body)
    decls=[]; tried=set(); ok=False
    for _ in range(15):
        txt=body[:ins]+"".join(d+"\n" for d in decls)+body[ins:]
        open(f"src/{name}.c","w").write(txt)
        err=sh(f"rm -f src/{name}.o; make src/{name}.o 2>&1")
        und=[u for u in re.findall(r"`([A-Za-z_]\w+)' undeclared",err)+
             re.findall(r"implicit declaration of function `([A-Za-z_]\w+)'",err) if u not in tried]
        if not und:
            if re.search(r' [Tt] '+re.escape(name),sh(f"arm-none-eabi-nm src/{name}.o 2>/dev/null")): ok=True; break
            return (print(f"[compile-other] {name}"), revert(name,asmf,gt))[0]
        for u in und:
            tried.add(u)
            if re.search(rf'\b{re.escape(u)}\s*\(',body): decls.append(f"int {u}();")
            else: decls.append(f"extern int {u}[];")
    if not ok: return (print(f"[decl-loop] {name}"), revert(name,asmf,gt))[0]
    # wire: remove asm, add handdecomp row
    sh(f"git rm -qf {asmf} {gt} 2>/dev/null; rm -f {asmf} {gt}")
    open(f"layout/carved_rom.d/handdecomp_{name}.tsv","w").write(f"{start}\t{end}\tsrc/{name}.o(.text)\thanddecomp\n")
    open(f"layout/baseline_syms_drop.d/handdecomp_{name}.tsv","w").write(name+"\n")
    subprocess.run(["python3","scripts/gen_layout.py"],capture_output=True)
    sh("rm -f fireemblem8.gba; make -k >/dev/null 2>&1")
    if not os.path.exists("fireemblem8.gba"): print(f"[LINK] {name}"); return revert(name,asmf,gt)
    mine=open("fireemblem8.gba","rb").read(); base=open("baserom.gba","rb").read()
    s,e=int(start,16),int(end,16)
    bad=[i for i in range(s,e) if mine[i]!=base[i]]
    if not bad: print(f"[MATCH] {name}: 0/{e-s}")
    else:
        print(f"[DIFF] {name}: {len(bad)}/{e-s} "+" ".join(f"{i-s:#x}:{mine[i]:#x}->{base[i]:#x}" for i in bad[:8]))
        revert(name,asmf,gt)

for nm in sys.argv[1:]: carve(nm)
