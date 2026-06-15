#!/usr/bin/env python3
"""Positional-bracket identity finder for region-different sub_*.s functions (D105).

For each asm/sub_*.s (region-different gbadisasm backlog, no funcmap name), find its
funcmap predecessor/successor (matched JP->US neighbors). If the US gap between them
holds EXACTLY ONE US function, the bracket holds EXACTLY ONE JP sub_, and the sub_'s
JP address matches the predecessor's US->JP delta (within 0x30), the sub_ IS that US
function (1:1 positional correspondence). Prints high-confidence (jp_addr, name) pairs.

This RECONSTRUCTS identities funcmap missed. Verify behavior + carve from US source
(make compare gates byte-identity: region-same carves, region-different reverts).
Never assert a name byte-neutrally on this alone -- confirm by behavior or a passing carve.
"""
import re, glob, os, bisect, sys
ROOT=os.path.dirname(os.path.dirname(os.path.abspath(__file__))); os.chdir(ROOT)
US=os.environ.get('US_MAP','../fireemblem8u/fireemblem8.map')
usfuncs=[]; seen=set()
pat=re.compile(r'^\s+0x0*([0-9a-fA-F]{7,8})\s+([A-Za-z_]\w+)\s*$')
for ln in open(US, errors='replace'):
    m=pat.match(ln)
    if not m: continue
    a=int(m.group(1),16); n=m.group(2)
    if not (0x08000000<=a<0x08800000): continue
    if re.match(r'(sub_|data_|nullsub_|byte_|word_|off_|unk_|loc_|j_|_)',n): continue
    if a in seen: continue
    seen.add(a); usfuncs.append((a,n))
usfuncs.sort(); us_addrs=[a for a,_ in usfuncs]
fmrows=[]
for ln in open('layout/us_jp_funcmap.tsv'):
    if ln.startswith('#') or not ln.strip(): continue
    p=ln.rstrip('\n').split('\t')
    if len(p)>=5: fmrows.append((int(p[0],16),int(p[1],16),p[4]))
fmrows.sort(); fm_jp=[r[0] for r in fmrows]
existing=set()
for f in glob.glob('asm/**/*.s',recursive=True)+glob.glob('src/**/*.c',recursive=True):
    try: t=open(f,errors='replace').read()
    except: continue
    for mm in re.finditer(r'\.global\s+(\w+)',t): existing.add(mm.group(1))
for ln in open('layout/baseline_syms.tsv'): existing.add(ln.split('\t')[0])
sub_addrs=sorted(int(re.match(r'sub_([0-9A-Fa-f]+)\.s$',os.path.basename(f)).group(1),16)
                 for f in glob.glob('asm/sub_*.s'))
cands=[]
for f in glob.glob('asm/sub_*.s'):
    m=re.match(r'sub_([0-9A-Fa-f]+)\.s$',os.path.basename(f))
    if not m: continue
    jp=int(m.group(1),16)
    i=bisect.bisect_left(fm_jp,jp)
    if i==0 or i>=len(fmrows): continue
    jp_pred,us_pred,_=fmrows[i-1]; jp_succ,us_succ,_=fmrows[i]
    if not (us_pred<us_succ and jp_pred<jp_succ): continue
    lo=bisect.bisect_right(us_addrs,us_pred); hi=bisect.bisect_left(us_addrs,us_succ)
    gap=usfuncs[lo:hi]
    if len(gap)!=1: continue
    us_cand,name=gap[0]
    if name in existing: continue
    if abs(jp-(us_cand-(us_pred-jp_pred)))>0x30: continue
    if sum(1 for s in sub_addrs if jp_pred<s<jp_succ)!=1: continue
    ni=len([l for l in open(f,errors='replace') if re.match(r'^\t[a-z]',l)])
    cands.append((ni,jp,name,us_cand))
cands.sort()
print(f"# {len(cands)} delta-consistent 1:1 bracket candidates (insn jp_addr name us_addr)")
for ni,jp,name,ua in cands:
    print(f"{ni}\t{jp:08X}\t{name}\t{ua:08X}")
