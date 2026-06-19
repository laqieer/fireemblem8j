#!/usr/bin/env python3
"""carve_stranded.py <Fn>... — carve a function out of a multi-fn stranded_<TU>.s (section-per-fn,
.incbin residual bytes) to matching C. Find the fn's row in layout/carved_rom.d/stranded_func_*.tsv
(cols: start end asm/stranded_<TU>.o(.text.s_<ADDR>) <TU>:<Name> ...); extract US unit + decl-loop
compile; REMOVE that one `.section .text.s_<ADDR>` block from the .s; DELETE its tsv row; add a
handdecomp carved_rom row at the JP range; build; byte-check. [MATCH] keeps else REVERTS. No bind."""
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

def locate(name):
    for tsv in glob.glob("layout/carved_rom.d/stranded_func_*.tsv"):
        for ln in open(tsv):
            c=ln.rstrip("\n").split("\t")
            if len(c)>=4 and re.search(rf':{re.escape(name)}(\s|$)',c[3]):
                m=re.match(r'(asm/stranded_[\w-]+\.o)\((\.text\.[\w]+)\)',c[2])
                if m: return dict(tsv=tsv,start=c[0],end=c[1],asmf=m.group(1)[:-2]+".s",sec=m.group(2),row=ln)
    return None

def remove_section(asmf, sec):
    lines=open(asmf).read().split("\n"); out=[]; i=0; removed=False
    while i<len(lines):
        if re.match(rf'\s*\.section\s+{re.escape(sec)}[,\s]',lines[i]):
            removed=True; i+=1
            while i<len(lines) and not re.match(r'\s*\.section\s',lines[i]): i+=1
        else: out.append(lines[i]); i+=1
    if removed: open(asmf,"w").write("\n".join(out))
    return removed

def revert(name, info):
    sh(f"git checkout HEAD -- {info['asmf']} {info['tsv']} 2>/dev/null")
    for p in (f"src/{name}.c",f"src/{name}.o",f"layout/carved_rom.d/handdecomp_{name}.tsv",
              f"layout/baseline_syms_drop.d/handdecomp_{name}.tsv"):
        os.path.exists(p) and os.remove(p)
    subprocess.run(["python3","scripts/gen_layout.py"],capture_output=True)

def carve(name):
    info=locate(name)
    if not info: return print(f"[not-stranded] {name}")
    tu=find_tu(name)
    if not tu: return print(f"[no-tu] {name}")
    body=sh(f"python3 scripts/extract_func_only.py {tu} {name}")
    if not body.strip(): return print(f"[no-body] {name}")
    for s in os.environ.get("DECL_SUBST","").split(";"):
        if "=>" in s: o,n=s.split("=>"); body=body.replace(o,n)
    fm=re.search(rf'^([A-Za-z_][\w \t\*]*?\b{re.escape(name)}\s*\([^;{{]*\)\s*)$',body,re.M) or \
       re.search(rf'^([A-Za-z_][\w \t\*]*?\b{re.escape(name)}\s*\()',body,re.M)
    ins=fm.start() if fm else len(body)
    decls=[]; tried=set(); ok=False
    for _ in range(15):
        open(f"src/{name}.c","w").write(body[:ins]+"".join(d+"\n" for d in decls)+body[ins:])
        err=sh(f"rm -f src/{name}.o; make src/{name}.o 2>&1")
        und=[u for u in re.findall(r"`([A-Za-z_]\w+)' undeclared",err)+
             re.findall(r"implicit declaration of function `([A-Za-z_]\w+)'",err) if u not in tried]
        if not und:
            if re.search(r' [Tt] '+re.escape(name),sh(f"arm-none-eabi-nm src/{name}.o 2>/dev/null")): ok=True; break
            return (print(f"[compile-other] {name}"), revert(name,info))[0]
        for u in und:
            tried.add(u)
            decls.append(f"int {u}();" if re.search(rf'\b{re.escape(u)}\s*\(',body) else f"extern int {u}[];")
    if not ok: return (print(f"[decl-loop] {name}"), revert(name,info))[0]
    if not remove_section(info['asmf'], info['sec']): return (print(f"[no-section] {name}"), revert(name,info))[0]
    # delete the tsv row
    rows=[l for l in open(info['tsv']) if l!=info['row']]
    open(info['tsv'],"w").write("".join(rows))
    open(f"layout/carved_rom.d/handdecomp_{name}.tsv","w").write(f"{info['start']}\t{info['end']}\tsrc/{name}.o(.text)\thanddecomp\n")
    open(f"layout/baseline_syms_drop.d/handdecomp_{name}.tsv","w").write(name+"\n")
    subprocess.run(["python3","scripts/gen_layout.py"],capture_output=True)
    sh("rm -f fireemblem8.gba; make -k >/dev/null 2>&1")
    if not os.path.exists("fireemblem8.gba"): print(f"[LINK] {name}"); return revert(name,info)
    mine=open("fireemblem8.gba","rb").read(); base=open("baserom.gba","rb").read()
    s,e=int(info['start'],16),int(info['end'],16)
    bad=[i for i in range(s,e) if mine[i]!=base[i]]
    if not bad: print(f"[MATCH] {name}: 0/{e-s}")
    else:
        print(f"[DIFF] {name}: {len(bad)}/{e-s} "+" ".join(f"{i-s:#x}:{mine[i]:#x}->{base[i]:#x}" for i in bad[:8]))
        revert(name,info)

for nm in sys.argv[1:]: carve(nm)
