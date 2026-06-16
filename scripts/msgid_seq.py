#!/usr/bin/env python3
"""msgid_seq.py <FunctionName> — dump the JP asm's GetStringFromIndex msgid + screen-position
sequence (in call order) for a still-asm text-drawing function, so the US-body GetStringFromIndex()
args + positions can be substituted with JP values. Reads the gbadisasm asm at HEAD."""
import sys, re, subprocess, os
ROOT=os.path.dirname(os.path.dirname(os.path.abspath(__file__))); os.chdir(ROOT)
name=sys.argv[1]
m=subprocess.run(['python3','scripts/carve_recipe.py',name],capture_output=True,text=True).stdout
am=re.search(r'\((sub_[0-9A-Fa-f]+)\)',m)
if not am: print("no sub addr"); sys.exit(1)
addr=am.group(1).replace('sub_','')
asm=subprocess.run(f"git show HEAD:asm/sub_{addr}.s",shell=True,capture_output=True,text=True).stdout
# walk instructions, tracking pending r0 (msgid) and r1 (x) before each Text/GetString bl
out=[]; r0=None; r1=None
for ln in asm.splitlines():
    lm=re.search(r'ldr r0, _\w+ @ =0x0000([0-9A-Fa-f]+)',ln)
    if lm: r0=int(lm.group(1),16); continue
    mm=re.search(r'movs r0, #0x([0-9A-Fa-f]+)',ln)
    if mm: r0=('imm',int(mm.group(1),16)); continue
    sm=re.search(r'lsls r0, r0, #(0x)?([0-9A-Fa-f]+)',ln)
    if sm and isinstance(r0,tuple): r0=r0[1]<<int(sm.group(2),16); continue
    xm=re.search(r'movs r1, #0x?([0-9A-Fa-f]+)',ln)
    if xm: r1=int(xm.group(1),16); continue
    bm=re.search(r'bl (\w+)',ln)
    if bm:
        fn=bm.group(1)
        if fn in ('GetStringFromIndex','sub_8009FA8'):
            out.append(f"  GetStringFromIndex msgid=0x{r0:X}" if isinstance(r0,int) else f"  GetStringFromIndex msgid=?")
            r0=None
        elif 'Text_Insert' in fn or fn=='sub_80043B8' or 'DrawString' in fn or 'PutDrawText' in fn:
            out.append(f"  Text call  x={r1}" if r1 is not None else "  Text call")
            r1=None
print(f"== {name} (sub_{addr}) JP sequence ==")
print('\n'.join(out))
