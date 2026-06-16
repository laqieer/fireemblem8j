#!/usr/bin/env python3
"""decl_carve.py [<Fn>...] — carve named-but-still-asm functions that COMPILE-fail
ONLY because a referenced symbol is bound in the JP ELF but undeclared in JP headers
(the DECL_ONLY vein). Auto-extracts the symbol's type from the US source, injects an
`extern` decl into the carved .c, checks link-resolvability (nm -u subset of ELF),
then byte-diffs ALONE. MATCH->keep, else revert. No arg = sweep all named-asm.
"""
import sys, os, re, subprocess, glob
ROOT=os.path.dirname(os.path.dirname(os.path.abspath(__file__))); os.chdir(ROOT)
US_SRC=glob.glob("../fireemblem8u/src/*.c")+glob.glob("../fireemblem8u/include/*.h")

def sh(c): return subprocess.run(c,shell=True,capture_output=True,text=True).stdout
def defined_elf():
    s=set()
    for ln in sh("arm-none-eabi-nm fireemblem8.elf").splitlines():
        p=ln.split()
        if len(p)>=3 and p[1] not in ('U','u','w','v'): s.add(p[2])
    return s
DEFINED=defined_elf()

def us_decl(sym):
    """Find a declaration for sym in US source; return an `extern ...;` line or None."""
    # data: `<type> [EWRAM_DATA|CONST_DATA|const] sym[dims] = ...` or `extern <type> sym`
    for f in US_SRC:
        try: t=open(f,errors='replace').read()
        except: continue
        # function definition: rettype sym(args) {
        m=re.search(rf'^([A-Za-z_][\w \t\*]*?\b)({re.escape(sym)})\s*\(([^;{{]*)\)\s*\{{',t,re.M)
        if m:
            ret=m.group(1).strip(); args=m.group(3).strip()
            return f"{ret} {sym}({args});"
        # data definition (skip 'static'/'EWRAM_DATA'/'CONST_DATA' qualifiers -> extern)
        m=re.search(rf'^(?:static\s+|EWRAM_DATA\s+|CONST_DATA\s+|const\s+)*([A-Za-z_][\w \t\*]*?\b{re.escape(sym)}\s*(\[[^\]=]*\])?)\s*(=|;)',t,re.M)
        if m:
            decl=m.group(1).strip()
            # strip a leading EWRAM_DATA/CONST_DATA that landed inside (rare)
            decl=re.sub(r'\b(EWRAM_DATA|CONST_DATA)\b','',decl).strip()
            return f"extern {decl};"
    return None

def recipe(name):
    out=sh(f"python3 scripts/carve_recipe.py {name}")
    inc=re.search(r'US includes:\s*(.*)',out); body=re.search(r'---- US body ----\n(.*?)\n---- JP',out,re.S)
    rng=re.search(r'carve range:\s*([0-9A-Fa-f]+)\s+([0-9A-Fa-f]+)',out)
    m=re.search(r'\(sub_([0-9A-Fa-f]+)\)',out)
    if not (body and rng and m) or "(def body not extracted" in body.group(1): return None
    incs=re.findall(r'"([^"]+)"',inc.group(1)) if inc else []
    keep=[h for h in incs if os.path.exists("include/"+h)]
    if "global.h" not in keep: keep.insert(0,"global.h")
    return dict(start=rng.group(1).upper(),end=rng.group(2).upper(),addr=m.group(1).upper(),inc=keep,body=body.group(1))

def write(name,r,decls):
    body=r["body"]
    for s in os.environ.get("DECL_SUBST","").split(";"):
        if "=>" in s: o,n=s.split("=>"); body=body.replace(o,n)
    open(f"src/{name}.c","w").write("".join(f'#include "{h}"\n' for h in r["inc"])+"\n"+
        "".join(d+"\n" for d in decls)+"\n"+body+"\n")

def wire(name,r):
    sh(f"git rm -q asm/sub_{r['addr']}.s layout/carved_rom.d/gbadisasm_sub_{r['addr']}.tsv")
    open(f"layout/carved_rom.d/handdecomp_{name}.tsv","w").write(f"{r['start']}\t{r['end']}\tsrc/{name}.o(.text)\thanddecomp: {name} (decl_carve)\n")
    open(f"layout/baseline_syms_drop.d/handdecomp_{name}.tsv","w").write(name+"\n")

def revert(name,addr):
    sh(f"git checkout HEAD -- asm/sub_{addr}.s layout/carved_rom.d/gbadisasm_sub_{addr}.tsv")
    for p in (f"src/{name}.c",f"src/{name}.o",f"src/{name}.s",f"layout/carved_rom.d/handdecomp_{name}.tsv",f"layout/baseline_syms_drop.d/handdecomp_{name}.tsv"):
        if os.path.exists(p): os.remove(p)

def main():
    names=sys.argv[1:]
    if not names:
        done=set(os.path.basename(f)[:-2] for f in glob.glob("src/*.c"))
        for f in glob.glob("asm/sub_*.s"):
            g=re.search(r'\.global\s+([A-Za-z_]\w+)',open(f,errors='replace').read())
            if g and not re.match(r'sub_|nullsub_|_0',g.group(1)) and g.group(1) not in done: names.append(g.group(1))
    results=[]
    for name in names:
        r=recipe(name)
        if not r: print(f"[skip ] {name}: no body"); continue
        # iteratively add decls until compile-clean or stuck
        decls=[]; tried=set(); ok=False
        for _ in range(6):
            write(name,r,decls)
            err=sh(f"rm -f src/{name}.o; make src/{name}.o 2>&1")
            und=re.findall(r"`([A-Za-z_]\w+)' undeclared",err)
            und=[u for u in und if u not in tried]
            if not und:
                if re.search(r' (T|t) '+re.escape(name),sh(f"arm-none-eabi-nm src/{name}.o 2>/dev/null")): ok=True
                break
            stuck=True
            for u in und:
                tried.add(u); d=us_decl(u)
                if d: decls.append(d); stuck=False
            if stuck: break
        if not ok:
            # only count as carve attempt if it's purely missing decls we couldn't supply
            os.path.exists(f"src/{name}.c") and os.remove(f"src/{name}.c")
            os.path.exists(f"src/{name}.o") and os.remove(f"src/{name}.o")
            results.append((name,"COMPILE")); continue
        # link-resolvability
        und=[ln.split()[-1] for ln in sh(f"arm-none-eabi-nm -u src/{name}.o").splitlines() if ln.strip()]
        miss=[u for u in und if u not in DEFINED]
        if miss:
            print(f"[LINK ] {name}: {miss[:3]}"); os.remove(f"src/{name}.c"); os.path.exists(f"src/{name}.o") and os.remove(f"src/{name}.o")
            results.append((name,"LINK")); continue
        wire(name,r)
        subprocess.run(["python3","scripts/gen_layout.py"],capture_output=True)
        sh("rm -f fireemblem8.gba; make -k >/dev/null 2>&1")
        if not os.path.exists("fireemblem8.gba"):
            print(f"[LINK2] {name}: ROM fail"); revert(name,r['addr']); subprocess.run(["python3","scripts/gen_layout.py"],capture_output=True); results.append((name,"LINK")); continue
        mine=open("fireemblem8.gba","rb").read(); base=open("baserom.gba","rb").read()
        s,e=int(r['start'],16),int(r['end'],16); bad=[i for i in range(s,e) if mine[i]!=base[i]]
        if not bad:
            print(f"[MATCH] {name}: 0/{e-s}  decls={decls}"); results.append((name,"MATCH"))
        elif len(bad)<=8:
            # NEAR is usually a MISBINDING (auto-declared sym resolves to garbage e.g.
            # 0x09000000) not a fixable const-diff -> revert, FLAG for manual look.
            ctx=" ".join(f"{i-s:#x}:{mine[i]:#x}->{base[i]:#x}" for i in bad)
            print(f"[NEAR ] {name}: {len(bad)}/{e-s} {ctx} -> revert (inspect)")
            revert(name,r['addr']); subprocess.run(["python3","scripts/gen_layout.py"],capture_output=True); results.append((name,"NEAR"))
        else:
            print(f"[REGION] {name}: {len(bad)}/{e-s}"); revert(name,r['addr']); subprocess.run(["python3","scripts/gen_layout.py"],capture_output=True); results.append((name,"REGION"))
    sh("rm -f fireemblem8.gba; make compare >/dev/null 2>&1")
    keep=[n for n,s in results if s=="MATCH"]
    print("\n=== KEPT(MATCH):",", ".join(keep) if keep else "(none)")
    print("=== NEAR(reverted, inspect):",", ".join(n for n,s in results if s=="NEAR") or "(none)")


if __name__ == "__main__":
    main()
