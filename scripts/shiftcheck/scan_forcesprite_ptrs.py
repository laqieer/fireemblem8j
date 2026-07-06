#!/usr/bin/env python3
"""Scan for ANIM FORCESPRITE instruction words that embed an absolute ROM
pointer (issue #143). A FORCESPRITE anim-script instruction has bit31 clear
(ANFMT_NOT_FORCESPRITE=0x80000000) and encodes a sprite-data address as
(word & ~0xF0000003) -- see ANINS_FORCESPRITE_GET_ADDRESS in include/anime.h.
These appear as raw `.4byte 0x7xXXXXXX`/`0x0xXXXXXX` words inside anim-script
data blobs and carry NO relocation, so under the +0x40000 shifted-ROM relink
they still point at the vanilla sprite data -> battle-animation sprites vanish.

A word W is a candidate iff:
  (W >> 31) == 0                        # FORCESPRITE (not the NOT_FORCESPRITE bit)
  ((W & 0x0FFFFFFC) >> 24) in (8,9)     # masked address lands in ROM space
  the masked address resolves to a defined symbol (exact or within its extent)
We only look at real `.4byte`/`.word`/`.long` directives (comments stripped).
"""
import re,sys,subprocess,os,glob

ELF=os.environ.get('ELF','fireemblem8.elf')

def load_syms():
    syms=[]  # (addr,size,name,type)
    out=subprocess.run(['arm-none-eabi-readelf','-sW',ELF],capture_output=True,text=True).stdout
    for ln in out.splitlines():
        p=ln.split()
        if len(p)<8 or not re.match(r'^\d+:$',p[0]): continue
        try: addr=int(p[1],16)
        except: continue
        size=int(p[2]) if p[2].isdigit() else int(p[2],16) if re.match(r'^[0-9a-fA-F]+$',p[2]) else 0
        typ=p[3]; bind=p[4]; name=p[7]
        if typ in ('SECTION','FILE') or not name: continue
        if 0x08000000<=addr<0x0A000000:
            syms.append((addr,size,name,typ))
    syms.sort()
    return syms

import bisect
_ADDRS=None
def resolve(syms,addr):
    global _ADDRS
    if _ADDRS is None: _ADDRS=[s[0] for s in syms]
    idx=bisect.bisect_right(_ADDRS,addr)-1
    best=None
    for j in range(idx,max(-1,idx-8),-1):
        if j<0: break
        a,size,name,typ=syms[j]
        if a==addr:
            return (a,name,typ,0)
        if size and a<=addr<a+size:
            return (a,name,typ,addr-a)
        if best is None:
            best=(a,name,typ,addr-a)
    return best

DIRRE=re.compile(r'^\s*\.(?:4byte|word|long)\s+0x([0-9A-Fa-f]{8})\s*$')

def scan(paths,syms):
    hits=[]
    for f in paths:
        try: lines=open(f,encoding='utf-8',errors='replace').read().split('\n')
        except: continue
        for i,raw in enumerate(lines,1):
            line=re.sub(r'@.*$','',raw); line=re.sub(r'/\*.*?\*/','',line)
            m=DIRRE.match(line)
            if not m: continue
            W=int(m.group(1),16)
            if (W>>31)!=0: continue
            masked=W & 0x0FFFFFFC
            if (masked>>24) not in (8,9): continue
            r=resolve(syms,masked)
            if not r: continue
            a,name,typ,off=r
            # require exact symbol hit or within a sized OBJECT/NOTYPE data symbol
            if off!=0 and typ not in ('OBJECT','NOTYPE'): continue
            # skip if masked addr not actually inside a sized symbol and off large
            hits.append((f,i,W,masked,name,typ,off,a))
    return hits

def apply_hits(hits):
    """Rewrite each hit's raw `.4byte 0xW` to `.4byte Sym + 0xADDEND`, byte-exact
    (Sym+addend == W numerically). Idempotent: only touches lines still matching
    the exact raw hex directive. Returns count rewritten."""
    byfile={}
    for h in hits: byfile.setdefault(h[0],[]).append(h)
    n=0
    for f,fhits in byfile.items():
        lines=open(f,encoding='utf-8',errors='replace').read().split('\n')
        for f_,i,W,masked,name,typ,off,a in fhits:
            nonaddr=W & 0xF0000003
            addend=(masked-a)+nonaddr
            idx=i-1
            raw=lines[idx]
            want=re.match(r'^(\s*\.(?:4byte|word|long)\s+)0x([0-9A-Fa-f]{8})\s*$',raw)
            if not want or int(want.group(2),16)!=W:
                continue  # already rewritten or shifted; skip
            assert (a+addend)&0xFFFFFFFF == W, f"addend mismatch {f}:{i}"
            lines[idx]=f"{want.group(1)}{name} + 0x{addend:08X}"
            n+=1
        open(f,'w',encoding='utf-8').write('\n'.join(lines))
    return n

def main():
    import argparse
    ap=argparse.ArgumentParser()
    ap.add_argument('--apply',action='store_true',help='rewrite matched raw words in place (byte-exact)')
    ap.add_argument('--filter',default=r'^AnimSprite_',help='only act on hits whose target symbol name matches this regex (default: AnimSprite_ battle-anim sprite scripts)')
    args=ap.parse_args()
    filt=re.compile(args.filter)
    syms=load_syms()
    paths=[]
    for root in ('src','asm'):
        paths+=glob.glob(root+'/**/*.s',recursive=True)
    hits=scan(paths,syms)
    hits=[h for h in hits if filt.search(h[4])]
    for f,i,W,masked,name,typ,off,a in hits:
        nonaddr=W & 0xF0000003
        addend=(masked-a)+nonaddr
        print(f"{f}:{i}\t0x{W:08X}\t-> {name}({typ})@0x{a:08X} +0x{off:X}  masked=0x{masked:08X}  => .4byte {name} + 0x{addend:08X}")
    print(f"# TOTAL forcesprite-ptr candidates (filter={args.filter!r}): {len(hits)}",file=sys.stderr)
    if args.apply:
        n=apply_hits(hits)
        print(f"# REWROTE {n} force-sprite words in place",file=sys.stderr)
        return 0
    return len(hits)

if __name__=='__main__':
    sys.exit(0 if main()==0 else 1)
