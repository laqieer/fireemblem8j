#!/usr/bin/env python3
"""screen_msgid_offset.py — batch const-decode screen for hardcoded-msgid functions.
For each still-asm NAMED fn whose US body has GetStringFromIndex(0xNNN) literals:
compile the US body, require SAME-SIZE as the JP range (region-diff => skip), then
substitute each US msgid with (US - offset) where offset is derived by aligning the
US msgids to the JP asm literal pool. Report fns that reach 0 non-reloc diff.
Read-only screen (writes only /tmp); prints carve-ready (fn, offset, range)."""
import os, re, subprocess, glob, sys
ROOT="/home/laqieer/fireemblem8j"; US="/home/laqieer/fireemblem8u"
os.chdir(ROOT)
def sh(c): return subprocess.run(c,shell=True,capture_output=True,text=True).stdout
carved=set(os.path.basename(f)[:-2] for f in glob.glob("src/**/*.c",recursive=True))
# US functions that contain a hardcoded GetStringFromIndex(0xNNN)
usfn_file={}
for f in glob.glob(f"{US}/src/*.c"):
    txt=open(f,errors='replace').read()
    if 'GetStringFromIndex(0x' not in txt: continue
    for mm in re.finditer(r'^(?:static\s+)?\w[\w \*]*\b([A-Z]\w+)\s*\([^;]*\)\s*$',txt,re.M):
        usfn_file.setdefault(mm.group(1),f)
rom=open("baserom.gba","rb").read()
INC='#include "global.h"\n#include "bmunit.h"\n#include "bmitem.h"\n#include "bmsave.h"\n#include "hardware.h"\n#include "fontgrp.h"\n#include "ctc.h"\n#include "proc.h"\n#include "bmlib.h"\n#include "statscreen.h"\n#include "prepscreen.h"\n#include "icon.h"\n#include "bmio.h"\n#include "constants/items.h"\n#include "constants/classes.h"\n'
wins=[]; nears=[]
for af in sorted(glob.glob("asm/sub_*.s")):
    hx=re.match(r'sub_([0-9A-Fa-f]+)\.s$',os.path.basename(af)).group(1)
    txt=open(af,errors='replace').read()
    m=re.search(r'^\s*\.global\s+(\w+)',txt,re.M)
    if not m: continue
    nm=m.group(1)
    if nm in carved or nm not in usfn_file: continue
    body=sh(f"python3 scripts/extract_func_only.py {usfn_file[nm]} {nm}")
    us_ids=sorted(set(int(x,16) for x in re.findall(r'GetStringFromIndex\((0x[0-9A-Fa-f]+)\)',body)))
    if not us_ids: continue
    # range
    rng=sh(f"awk -F'\\t' 'NR==1{{print $1,$2}}' layout/carved_rom.d/gbadisasm_{os.path.basename(af)[:-2]}.tsv").split()
    if len(rng)!=2: continue
    s,e=int(rng[0],16),int(rng[1],16); exp=e-s
    jp_ids=sorted(set(int(x,16) for x in re.findall(r'\.4byte 0x0000([0-9A-Fa-f]{3})',txt)))
    # derive offset: try each candidate = us_min - jp candidate; pick offset s.t. all (us-off) in jp set
    off=None
    for cand in range(0,0x200):
        if all((u-cand) in jp_ids for u in us_ids):
            off=cand; break
    if off is None: continue
    cbody="\n".join(l for l in body.splitlines() if not l.startswith('#include'))
    cbody=re.sub(r'GetStringFromIndex\((0x[0-9A-Fa-f]+)\)', lambda mm: f"GetStringFromIndex(0x{int(mm.group(1),16)-off:X})", cbody)
    open("/tmp/mo.c","w").write(INC+cbody)
    ok=sh("cc -E -I tools/agbcc/include -iquote include -iquote . -nostdinc -undef /tmp/mo.c 2>/dev/null | iconv -f UTF-8 -t CP932 | tools/agbcc/bin/agbcc -mthumb-interwork -Wparentheses -O2 -fhex-asm -ffix-debug-line -g -o /tmp/mo.s 2>/tmp/mo.err && arm-none-eabi-as -mcpu=arm7tdmi -mthumb-interwork -I include -I . /tmp/mo.s -o /tmp/mo.o 2>>/tmp/mo.err && echo OK")
    if 'OK' not in ok: continue
    sh("arm-none-eabi-objcopy -O binary --only-section=.text /tmp/mo.o /tmp/mo.bin")
    tb=open("/tmp/mo.bin","rb").read()
    if len(tb)!=exp: continue  # region-diff size
    rel=set()
    for l in sh("arm-none-eabi-objdump -r --section=.text /tmp/mo.o").splitlines():
        mm=re.match(r'^([0-9a-f]{8})\s+R_ARM',l)
        if mm:
            o=int(mm.group(1),16)
            for k in range(4): rel.add(o+k)
    rb=rom[s&0xFFFFFF:(s&0xFFFFFF)+exp]
    d=[i for i in range(exp) if tb[i]!=rb[i] and i not in rel]
    rec=f"{nm}\t{hx}\toff=0x{off:X}\tsz={exp}\tdiff={len(d)}"
    if len(d)==0: wins.append(rec)
    elif len(d)<=6: nears.append(rec+f"\t{[hex(x) for x in d[:6]]}")
    os.remove("/tmp/mo.o")
print("=== CLEAN msgid-offset carves (0 diff, same-size) ===")
for w in wins: print(w)
print("\n=== NEAR (<=6 diff after offset) ===")
for n in nears: print(n)
print(f"\nTOTAL clean={len(wins)} near={len(nears)}")
