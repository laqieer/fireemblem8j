#!/usr/bin/env python3
"""Callee-fingerprint function identifier for region-different sub_*.s (reliable naming).

A region-different JP sub_<hex> can't be byte-matched, but its set of RESOLVED
real-name callees (BL targets gbadisasm already named) is a behavioral fingerprint.
Match it against US function callee-sets (from fe8u ELF disasm). When EXACTLY ONE
US function -- not already mapped to another JP address -- has a callee-set that
CONTAINS all of the JP function's resolved callees (>=3), that's a unique
behavior-confirmed identification. Prints (jp_addr, name) for high-confidence hits.

Far stricter than positional bracketing (which mislabeled 7/9 in testing): a unique
callee-superset match is independent behavioral evidence, satisfying D105's
"confirm by behavior". make compare still gates: renaming is byte-neutral.
"""
import re, os, glob, subprocess, sys
ROOT=os.path.dirname(os.path.dirname(os.path.abspath(__file__))); os.chdir(ROOT)
US_ELF="../fireemblem8u/fireemblem8.elf"
PH=re.compile(r'sub_|nullsub_|^_|^j_|^loc_|^unk_')

# 1) US functions -> callee-name set, via one objdump pass
print("# disassembling US ELF ...", file=sys.stderr)
dis=subprocess.run(f"arm-none-eabi-objdump -d {US_ELF}",shell=True,capture_output=True,text=True).stdout
us_callees={}; us_order=[]; cur=None
fnhdr=re.compile(r'^[0-9a-f]{8} <([A-Za-z_]\w+)>:')
blpat=re.compile(r'\bbl\s+[0-9a-f]+ <([A-Za-z_]\w+)>')
for ln in dis.splitlines():
    m=fnhdr.match(ln)
    if m: cur=m.group(1); us_callees.setdefault(cur,set()); us_order.append(cur); continue
    if cur:
        b=blpat.search(ln)
        if b and not PH.match(b.group(1)): us_callees[cur].add(b.group(1))

# 2) US names already mapped to a JP addr (exclude -- can't be at a 2nd JP addr)
mapped=set()
for ln in open("layout/us_jp_funcmap.tsv"):
    if ln.startswith("#"): continue
    p=ln.rstrip("\n").split("\t")
    if len(p)>=5: mapped.add(p[4])
# names already used as a .global anywhere (avoid dup-define)
existing=set()
for f in glob.glob("asm/**/*.s",recursive=True)+glob.glob("src/**/*.c",recursive=True):
    try: t=open(f,errors='replace').read()
    except: continue
    for mm in re.finditer(r'\.global\s+(\w+)',t): existing.add(mm.group(1))
for ln in open("layout/baseline_syms.tsv"):
    existing.add(ln.split('\t')[0])

# 3) JP sub_ -> callee set; unique-superset match
hits=[]
for f in glob.glob("asm/sub_*.s"):
    jaddr=re.match(r'sub_([0-9A-Fa-f]+)\.s$',os.path.basename(f)).group(1)
    txt=open(f,errors='replace').read()
    jc=set()
    for m in re.finditer(r'\bbl\s+([A-Za-z_]\w+)',txt):
        if not PH.match(m.group(1)): jc.add(m.group(1))
    if len(jc)<3: continue
    # candidate US funcs whose callee-set is a superset of jc, not already placed
    cands=[u for u,cs in us_callees.items()
           if jc<=cs and u not in mapped and u not in existing]
    if len(cands)==1:
        hits.append((jaddr.upper().zfill(8), cands[0], len(jc)))
hits.sort(key=lambda h:-h[2])
print(f"# {len(hits)} unique-superset behavior-confirmed identifications (jp_addr name n_callees)")
for ja,nm,n in hits:
    print(f"{ja}\t{nm}\t{n}")
