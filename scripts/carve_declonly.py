#!/usr/bin/env python3
"""carve_declonly.py <Fn>... — carve a DEDICATED named asm/<Name>.s fn that compile-fails ONLY
because it references a symbol that is BOUND in the JP build but UNDECLARED in JP headers, with a
SPECIFIC type (autobind's generic `int X()` guess is wrong). Extract the symbol's real type from
the US source -> `extern <TYPE> <sym>[...];`, recompile, byte-check, wire handdecomp, FULL make
compare (D126). [MATCH]+OK -> commit-ready (left in tree); else revert. No sentinel-bind: the
symbol must already be in the link (baseline_syms / ELF)."""
import sys, os, re, subprocess, glob
os.chdir("/home/laqieer/fireemblem8j")
def sh(c): return subprocess.run(c,shell=True,capture_output=True,text=True).stdout
US_SRC=glob.glob("../fireemblem8u/src/*.c")
DEFINED=set()
for ln in sh("arm-none-eabi-nm fireemblem8.elf").splitlines():
    p=ln.split()
    if len(p)>=3 and p[1] not in ('U','u','w','v'): DEFINED.add(p[2])

def find_tu(name):
    for f in US_SRC:
        try: t=open(f,errors='replace').read()
        except: continue
        if re.search(rf'^[A-Za-z_][\w \t\*]*?\b{re.escape(name)}\s*\([^;{{]*\)\s*\{{',t,re.M): return f
    return None

def us_type_decl(sym):
    # find a file-scope definition `[static] <TYPE> sym[...] [= ...];` and return `extern <TYPE> sym[...];`
    for f in US_SRC+glob.glob("../fireemblem8u/include/*.h"):
        try: t=open(f,errors='replace').read()
        except: continue
        m=re.search(rf'^(?:static\s+|extern\s+)?((?:struct\s+\w+|union\s+\w+|unsigned\s+\w+|signed\s+\w+|\w+)\s*\**)\s*\b{re.escape(sym)}\s*(\[[^\]]*\])?\s*(?:=|;)',t,re.M)
        if m:
            typ=m.group(1).strip(); arr="[]" if m.group(2) else ""
            return f"extern {typ} {sym}{arr};"
    return None

def carve(name):
    gt=f"layout/carved_rom.d/gbadisasm_{name}.tsv"
    asmf=f"asm/{name}.s"
    if not os.path.exists(gt) or not os.path.exists(asmf): return print(f"[no-files] {name}")
    c=open(gt).readline().rstrip("\n").split("\t")
    start,end=c[0].strip(),c[1].strip()
    tu=find_tu(name)
    if not tu: return print(f"[no-tu] {name}")
    inc=sh(f"python3 scripts/extract_func_only.py {tu} {name}")
    if not inc.strip(): return print(f"[no-body] {name}")
    incs="\n".join(l for l in inc.split("\n") if l.startswith("#include"))
    body=re.sub(r"^#include.*\n","",inc,flags=re.M)
    body=re.sub(rf"\bstatic\s+(?=[\w \t\*]*?\b{re.escape(name)}\s*\()","",body)  # export the fn
    decls=[]; tried=set(); ok=False
    for _ in range(12):
        open(f"src/{name}.c","w").write(incs+"\n"+"\n".join(decls)+"\n"+body)
        err=sh(f"rm -f src/{name}.o; make src/{name}.o 2>&1")
        und=[u for u in re.findall(r"`(\w+)' undeclared",err)+re.findall(r"implicit declaration of function `(\w+)'",err) if u not in tried]
        if not und:
            if re.search(r' [Tt] '+re.escape(name),sh(f"arm-none-eabi-nm src/{name}.o 2>/dev/null")): ok=True; break
            os.path.exists(f"src/{name}.c") and os.remove(f"src/{name}.c"); return print(f"[compile-other] {name}")
        for u in und:
            tried.add(u)
            d=us_type_decl(u)
            decls.append(d if d else f"extern int {u}[];")
    if not ok:
        for x in (f"src/{name}.c",f"src/{name}.o",f"src/{name}.s"): os.path.exists(x) and os.remove(x)
        return print(f"[decl-loop] {name}")
    # check all link syms are DEFINED (no sentinel-bind here)
    und=[ln.split()[-1] for ln in sh(f"arm-none-eabi-nm -u src/{name}.o").splitlines() if ln.strip()]
    miss=[u for u in und if u not in DEFINED]
    if miss:
        for x in (f"src/{name}.c",f"src/{name}.o",f"src/{name}.s"): os.path.exists(x) and os.remove(x)
        return print(f"[LINK-undef] {name}: {miss[:4]}")
    # wire + full compare
    sh(f"git rm -qf {asmf} {gt} 2>/dev/null; rm -f {asmf} {gt}")
    open(f"layout/carved_rom.d/handdecomp_{name}.tsv","w").write(f"{start}\t{end}\tsrc/{name}.o(.text)\thanddecomp\n")
    open(f"layout/baseline_syms_drop.d/handdecomp_{name}.tsv","w").write(name+"\n")
    subprocess.run(["python3","scripts/gen_layout.py"],capture_output=True)
    sh("rm -f fireemblem8.elf fireemblem8.gba")
    mc=sh("make compare 2>&1 | tail -1")
    if "fireemblem8.gba: OK" in mc:
        print(f"[MATCH+OK] {name} ({start}-{end})")
    else:
        print(f"[FULL-FAIL] {name}")
        sh(f"git checkout HEAD -- {asmf} {gt} 2>/dev/null")
        for x in (f"src/{name}.c",f"src/{name}.o",f"src/{name}.s",f"layout/carved_rom.d/handdecomp_{name}.tsv",f"layout/baseline_syms_drop.d/handdecomp_{name}.tsv"): os.path.exists(x) and os.remove(x)
        subprocess.run(["python3","scripts/gen_layout.py"],capture_output=True)

for nm in sys.argv[1:]: carve(nm)
