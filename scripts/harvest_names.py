#!/usr/bin/env python3
"""harvest_names.py — corrected rename_confirmed: name funclib-hinted sub_<addr> (no baseline
alias) whose US-compiled mnemonic sequence EXACTLY matches the JP asm mnemonics (2-signal:
funclib hint + mnemonic-exact => it IS that US fn, region-different in operands only). Byte-neutral
rename. FIXES vs ~/rename_confirmed.py: (1) excludes names already declared `.global` ANYWHERE in
asm/ (set-dedup => 0 named gain), (2) single VERIFIED commit (checks HEAD moved + named rose)."""
import re, os, glob, subprocess
os.chdir("/home/laqieer/fireemblem8j")
US = "../fireemblem8u/src"
def sh(c): return subprocess.run(c, shell=True, capture_output=True, text=True).stdout

fl = {}
for ln in open("reference/maps/funclib_us_jp.tsv"):
    p = ln.rstrip().split("\t")
    if len(p) >= 3 and p[0].startswith("0x"): fl[int(p[0], 16)] = p[2]
tu_of = {}
for ln in open("layout/nofuncmap_region_different.tsv"):
    p = ln.rstrip().split("\t")
    if len(p) >= 4: tu_of[p[2]] = p[3]
base = set()
for f in ["layout/baseline_syms.tsv"] + glob.glob("layout/baseline_syms.d/*.tsv"):
    for ln in open(f, errors='replace'): base.add(ln.split('\t')[0].strip())
existing = set(os.path.basename(f)[:-2] for f in glob.glob("src/**/*.c", recursive=True))
# FIX (1): ALL .global names across asm/ (the set calcprogress dedups against)
asm_global = set()
for f in glob.glob("asm/**/*.s", recursive=True):
    for mm in re.finditer(r'^\s*\.global\s+(\S+)', open(f, errors='replace').read(), re.M):
        asm_global.add(mm.group(1))

def jp_mnem(path):
    out = []; start = False
    for ln in open(path, errors='replace'):
        s = ln.strip()
        if re.match(r'^(sub_[0-9A-Fa-f]+|[A-Za-z_]\w*):', s): start = True; continue
        if not start or s.startswith(('.', '@')) or not s: continue
        if re.match(r'^_[0-9A-F]+:', s): break
        m = re.match(r'([a-z][a-z0-9.]+)', s)
        if m: out.append(m.group(1).split('.')[0])
    return out

def us_mnem(name, tu):
    ext = sh(f"python3 scripts/extract_func_only.py {US}/{tu}.c {name}")
    if not ext.strip(): return None
    open(f"src/{name}.c", "w").write(ext)
    sh(f"rm -f src/{name}.o; make src/{name}.o >/dev/null 2>&1")
    mn = None
    if os.path.exists(f"src/{name}.o"):
        mn = []; f2 = False
        for ln in sh(f"arm-none-eabi-objdump -d src/{name}.o").splitlines():
            if re.match(r'^0+ <' + re.escape(name) + r'>:', ln): f2 = True; continue
            if f2:
                m = re.match(r'\s+[0-9a-f]+:\s+[0-9a-f ]+\t(\w+)', ln)
                if m: mn.append(m.group(1).split('.')[0])
    for x in (f"src/{name}.c", f"src/{name}.o", f"src/{name}.s"):
        os.path.exists(x) and os.remove(x)
    return mn

cand = []; seen = {}
for f in sorted(glob.glob("asm/sub_*.s")):
    m = re.match(r'sub_([0-9A-Fa-f]+)\.s$', os.path.basename(f))
    if not m: continue
    nm = fl.get(int(m.group(1), 16))
    if not nm or nm.startswith(('sub_', 'j_', 'loc_', 'unk_', '_')): continue
    if nm in base or nm in existing or nm in asm_global: continue   # FIX (1)
    seen[nm] = seen.get(nm, 0) + 1
    tu = tu_of.get(nm)
    if not tu or not os.path.exists(f"{US}/{tu}.c"): continue
    cand.append((f, f"sub_{m.group(1)}", nm, tu))
cand = [c for c in cand if seen[c[2]] == 1]
print(f"hinted candidates (non-global): {len(cand)}", flush=True)
confirmed = []
for f, sub, nm, tu in cand:
    jm = jp_mnem(f); um = us_mnem(nm, tu)
    if um and len(jm) >= 4 and um == jm:
        confirmed.append((f, sub, nm))
print(f"mnemonic-CONFIRMED: {len(confirmed)} -> {[c[2] for c in confirmed]}", flush=True)
if not confirmed:
    print("nothing to rename"); raise SystemExit

named0 = sh("python3 scripts/calcprogress.py 2>/dev/null")
n0 = re.search(r'NAMED.*?\((\d+)/', named0); n0 = int(n0.group(1)) if n0 else 0
head0 = sh("git rev-parse HEAD").strip()
for f, sub, nm in confirmed:
    sh(f"sed -i '/\\.section/!s/\\b{sub}\\b/{nm}/g' {f}")
subprocess.run(["python3", "scripts/gen_layout.py"], capture_output=True)
sh("rm -f asm/baserom.o asm/jp_syms.o fireemblem8.elf fireemblem8.gba")
sh("mv baserom.gba /tmp/hn.gba")
mc = "fireemblem8.gba: OK" in sh("make compare 2>&1")
sh("mv /tmp/hn.gba baserom.gba")
named1 = sh("python3 scripts/calcprogress.py 2>/dev/null")
n1 = re.search(r'NAMED.*?\((\d+)/', named1); n1 = int(n1.group(1)) if n1 else 0
print(f"make compare OK={mc}  named {n0}->{n1}", flush=True)
if not mc:
    print("mc FAIL -> revert"); sh("git checkout HEAD -- asm/"); subprocess.run(["python3", "scripts/gen_layout.py"], capture_output=True); raise SystemExit
sh("git add asm/")
sh(f'git commit -q -m "name: {len(confirmed)} mnemonic-confirmed sub_ -> US names (byte-neutral, +{n1-n0} named)"')
head1 = sh("git rev-parse HEAD").strip()
if head1 != head0:
    sh("git push origin main >/dev/null 2>&1")
    print(f"COMMITTED {head1[:9]} (+{n1-n0} named)")
else:
    print("COMMIT DID NOT LAND -- staged diff:"); print(sh("git diff --cached --stat | tail -3"))
