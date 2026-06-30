#!/usr/bin/env python3
"""Wave-6 orphan-.bin audit (read-only, precise, fast).

Builds ONE map: data-path -> list of (kind, file) build references, by scanning
all asm/*.s and src/**/*.{c,s} once for real .incbin / INCBIN directives. Then
classifies each candidate .bin.

LIVE  = referenced (as a real incbin) by a built object:
          * asm/*.s NOT in DATA_INCBIN_ASM_EXCLUDE, OR
          * any src/** .c (INCBIN_U*/embedded __asm__ .incbin) or .s (.incbin), OR
          * a deps.mk / graphics-mk prerequisite.
ORPHAN = real incbin refs come ONLY from DATA_INCBIN_ASM_EXCLUDE'd asm stubs
         (dead/unlinked), or none at all. Comment-only mentions are IGNORED.
"""
import os, re, sys, glob

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)

mk = open("Makefile").read()
m = re.search(r'DATA_INCBIN_ASM_EXCLUDE\s*:=\s*((?:.*\\\n)*.*\n)', mk)
excl_block = m.group(1) if m else ""
excluded = set(re.findall(r'(asm/[^\s\\]+\.s)', excl_block))

deps_text = open("layout/data_incbin_deps.mk").read() if os.path.exists("layout/data_incbin_deps.mk") else ""
gfx_mk = ""
for f in glob.glob("graphics/**/*.mk", recursive=True):
    gfx_mk += open(f, errors="replace").read()

INCBIN_C = re.compile(r'INCBIN_(?:U8|U16|U32)\(([^)]*)\)')
ASM_INCBIN_IN_C = re.compile(r'\\[tn]\.incbin\s+\\"([^"\\]+)\\"')
ASM_INCBIN = re.compile(r'\.incbin\s+"([^"]+)"')

# path -> list of (kind, file)
refmap = {}
def add(path, kind, f):
    refmap.setdefault(path, []).append((kind, f))

for f in glob.glob("asm/*.s"):
    text = open(f, errors="replace").read()
    for p in ASM_INCBIN.findall(text):
        kind = "DEAD-ASM" if f in excluded else "LIVE-ASM"
        add(p, kind, f)

for f in glob.glob("src/**/*.c", recursive=True):
    text = open(f, errors="replace").read()
    paths = []
    for args in INCBIN_C.findall(text):
        paths += re.findall(r'"([^"]+)"', args)
    paths += ASM_INCBIN_IN_C.findall(text)
    for p in paths:
        add(p, "LIVE-SRC-C", f)

for f in glob.glob("src/**/*.s", recursive=True):
    text = open(f, errors="replace").read()
    for p in ASM_INCBIN.findall(text):
        add(p, "LIVE-SRC-S", f)

def classify(binpath):
    refs = refmap.get(binpath, [])
    live, dead = [], []
    for kind, f in refs:
        if kind == "DEAD-ASM":
            dead.append(f)
        else:
            live.append((kind, f))
    if binpath in deps_text:
        live.append(("DEPS-MK", "layout/data_incbin_deps.mk"))
    if binpath in gfx_mk:
        live.append(("GFX-MK", "graphics/**/*.mk"))
    return ("ORPHAN" if not live else "LIVE"), live, dead

def main():
    cands = []
    for p in sys.argv[1:]:
        cands += sorted(glob.glob(p))
    orphan, livel = [], []
    for b in cands:
        v, lr, da = classify(b)
        (orphan if v == "ORPHAN" else livel).append((b, lr, da))
    print(f"# audited {len(cands)} candidates: {len(orphan)} ORPHAN, {len(livel)} LIVE")
    for b, lr, da in livel:
        print(f"LIVE   {b}  <- {lr}")
    for b, lr, da in orphan:
        print(f"ORPHAN {b}  deadasm={da}")

if __name__ == "__main__":
    main()
