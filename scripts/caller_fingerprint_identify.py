import re, os, glob, subprocess, bisect
os.chdir("/home/laqieer/fireemblem8j")
US_ELF="../fireemblem8u/fireemblem8.elf"
PH=re.compile(r'sub_|nullsub_|^_|^j_|^loc_|^unk_')
dis=subprocess.run(f"arm-none-eabi-objdump -d {US_ELF}",shell=True,capture_output=True,text=True).stdout
us_callees={}; us_addr={}; cur=None
fnhdr=re.compile(r'^([0-9a-f]{8}) <([A-Za-z_]\w+)>:'); blpat=re.compile(r'\bbl\s+[0-9a-f]+ <([A-Za-z_]\w+)>')
for ln in dis.splitlines():
    m=fnhdr.match(ln)
    if m: cur=m.group(2); us_callees.setdefault(cur,set()); us_addr[cur]=int(m.group(1),16); continue
    if cur:
        b=blpat.search(ln)
        if b and not PH.match(b.group(1)): us_callees[cur].add(b.group(1))
mapped=set()
for ln in open("layout/us_jp_funcmap.tsv"):
    if ln.startswith("#"): continue
    p=ln.rstrip("\n").split("\t")
    if len(p)>=5: mapped.add(p[4])
existing=set(); cdef=re.compile(r'^[A-Za-z_][\w \t\*]*?\b([A-Za-z_]\w+)\s*\(')
for f in glob.glob("asm/**/*.s",recursive=True)+glob.glob("src/**/*.c",recursive=True):
    t=open(f,errors='replace').read()
    for mm in re.finditer(r'\.global\s+(\w+)',t): existing.add(mm.group(1))
    if f.endswith(".c"):
        for line in t.splitlines():
            if line.endswith((";",",")) or line.lstrip().startswith(("//","*","/*")): continue
            mm=cdef.match(line)
            if mm and mm.group(1) not in ("if","for","while","switch","return","sizeof","do"): existing.add(mm.group(1))
for ln in open("layout/baseline_syms.tsv"): existing.add(ln.split('\t')[0])
fm=[]
for ln in open("layout/us_jp_funcmap.tsv"):
    if ln.startswith("#"): continue
    p=ln.rstrip("\n").split("\t")
    if len(p)>=5: fm.append((int(p[0],16),int(p[1],16)))
fm.sort(); fm_jp=[a for a,_ in fm]
# index: which JP files bl each sub_; and each file's own name (global)
def file_global(f):
    for ln in open(f,errors='replace'):
        m=re.match(r'\s*\.global\s+(\w+)',ln)
        if m and not PH.match(m.group(1)): return m.group(1)
    return None
# collect callers of each sub_
callers_of={}
allfiles=glob.glob("asm/**/*.s",recursive=True)
fglob={f:file_global(f) for f in allfiles}
for f in allfiles:
    g=fglob[f]
    if not g or g not in us_callees: continue   # caller must be a NAMED, US-known func
    for m in re.finditer(r'\bbl\s+(sub_[0-9A-Fa-f]+)\b',open(f,errors='replace').read()):
        callers_of.setdefault(m.group(1),set()).add(g)
hits=[]
for sub,callers in callers_of.items():
    if len(callers)<2: continue
    jpa=int(sub[4:],16)
    # candidate identities: unmapped US callees shared by ALL named callers' US-equivs
    sets=[ {c for c in us_callees[cl] if c not in mapped and c not in existing} for cl in callers ]
    inter=set.intersection(*sets) if sets else set()
    if len(inter)!=1: continue
    nm=next(iter(inter))
    i=bisect.bisect_right(fm_jp,jpa)-1
    if not (0<=i<len(fm)): continue
    ajp,aus=fm[i]; pred=aus+(jpa-ajp)
    if nm not in us_addr or abs(us_addr[nm]-pred)>=0x600: continue  # tight delta = 2nd signal
    hits.append((sub[4:].upper().zfill(8),nm,len(callers),hex(abs(us_addr[nm]-pred))))
hits.sort(key=lambda h:-h[2])
print(f"caller-fingerprint + delta hits: {len(hits)}")
for h in hits[:40]: print("  ",*h)
open("/tmp/caller_fp.tsv","w").write("".join(f"{h[0]}\t{h[1]}\n" for h in hits))
