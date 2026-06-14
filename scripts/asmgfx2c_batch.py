#!/usr/bin/env python3
"""Robust batch: convert clean single-section full-incbin graphics asm/dat_*.s ->
src/data/<sub>/*.c via asmgfx2c.py, parallel compile-check, auto-revert any that
fail to compile, then wire layout + Makefile DATA_INCBIN_ASM_EXCLUDE for survivors.
The build is NEVER left broken: bad files are reverted before wiring.
After this, run COLD `make compare` yourself to confirm byte-identity + commit.

Usage: python3 scripts/asmgfx2c_batch.py [N]    (default N=40)
"""
import subprocess, re, os, glob, sys

N = next((int(a) for a in sys.argv[1:] if a.isdigit()), 40)

def excl_block(mk):
    return re.search(r'DATA_INCBIN_ASM_EXCLUDE :=(.*?)\nASM_OBJECTS', mk, re.S).group(1)

mk = open('Makefile').read()
already = set(re.findall(r'asm/[\w]+\.s', excl_block(mk)))

INCLUDE_DATA = '--data' in sys.argv   # also relocate committed data/residual *.bin incbins to src
cands = []
for f in glob.glob('asm/*.s'):
    if f in already:
        continue
    t = open(f).read()
    if '.incbin "' not in t:
        continue
    if not INCLUDE_DATA and ('incbin "graphics/' not in t or 'incbin "data/' in t):
        continue
    if re.search(r'\.incbin\s+"[^"]+",', t):   # partial incbin (offset/length)
        continue
    cands.append((os.path.getsize(f), f))
cands.sort(reverse=True)
batch = [f for _, f in cands[:N]]

def subdir(name):
    s = name.replace('dat_data_', '').replace('dat_', '')
    return re.sub(r'_p?\d+$', '', s) or 'gfx'

conv = []; skip = []
for asm in batch:
    name = os.path.basename(asm)[:-2]
    d = f'src/data/{subdir(name)}'; os.makedirs(d, exist_ok=True)
    r = subprocess.run(['python3', 'scripts/asmgfx2c.py', asm], capture_output=True, text=True)
    if r.returncode != 0:
        skip.append((name, (r.stderr.strip().splitlines() or ['?'])[-1][:50])); continue
    cp = f'{d}/{name}.c'; open(cp, 'w').write(r.stdout)
    conv.append((asm, cp, f'{asm[:-2]}.o', f'{cp[:-2]}.o'))

# parallel compile-check (one make invocation, keep-going): failed targets leave no .o
if conv:
    for _, _, _, oc in conv:
        if os.path.exists(oc):
            os.remove(oc)
    subprocess.run(['make', '-k', '-s'] + [c[3] for c in conv], capture_output=True, text=True)

new = []
for asm, cp, oa, oc in conv:
    if not os.path.exists(oc):          # compile failed -> revert this file
        os.remove(cp); skip.append((os.path.basename(asm)[:-2], 'compile-fail')); continue
    done = False
    for lf in ['layout/carved_rom.tsv'] + sorted(glob.glob('layout/carved_rom.d/*.tsv')):
        t = open(lf).read()
        if oa in t:
            open(lf, 'w').write(t.replace(oa, oc)); done = True; break
    if not done:
        os.remove(cp); skip.append((os.path.basename(asm)[:-2], 'no-layout-entry')); continue
    new.append(asm)

if new:
    mk = open('Makefile').read()
    ordered = list(re.findall(r'asm/[\w]+\.s', excl_block(mk))) + new
    block = 'DATA_INCBIN_ASM_EXCLUDE := ' + ' \\\n                           '.join(ordered) + '\n'
    open('Makefile', 'w').write(re.sub(r'DATA_INCBIN_ASM_EXCLUDE :=.*?\n(?=ASM_OBJECTS)', block, mk, flags=re.S))

print(f"GOOD {len(new)}; SKIPPED {len(skip)}")
for s in skip[:20]:
    print("  skip", s)
