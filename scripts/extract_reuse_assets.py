#!/usr/bin/env python3
"""D306 unified reuse-asset extractor: pull JP residual graphics/palette blobs that are
byte-identical to a fe8u asset (with a .png source) into editable PNG assets reusing
fe8u's source. Auto-VERIFIES each reproduces the ROM bytes before extracting, so it never
breaks the build:
  .4bpp     : gbagfx png->4bpp must == .bin
  .gbapal   : gbagfx png->gbapal must == .bin
  .4bpp.lz  : gbagfx png->4bpp->lz, brute-force -mindist 0..3, keep the one that == .bin
              (writes graphics/reuse/reuse.mk per-asset LZ_FLAGS overrides)
After running: python3 scripts/gen_data_incbin_deps.py && make compare. Prove D299
effectiveness by removing the .bin and rebuilding.  Usage: extract_reuse_assets.py [N]"""
import glob, os, hashlib, subprocess, re, sys, shutil
FE8U = "../fireemblem8u"; LIMIT = int(sys.argv[1]) if len(sys.argv) > 1 else 10**9
def sha(p):
    try: return hashlib.sha1(open(p, "rb").read()).hexdigest()
    except Exception: return None
def gbagfx(*a): return subprocess.run(["tools/gbagfx/gbagfx", *a], capture_output=True).returncode
# fe8u index: hash -> (png, ext)
idx = {}
for ext in (".4bpp.lz", ".gbapal", ".4bpp"):
    for f in glob.glob(FE8U + "/graphics/**/*" + ext, recursive=True):
        base = f[:-len(ext)]
        if os.path.exists(base + ".png"):
            h = sha(f)
            if h: idx.setdefault(h, (base + ".png", ext))
sites = {}
for cf in glob.glob("src/data/**/*.c", recursive=True):
    t = open(cf, errors="replace").read()
    for m in re.finditer(r'(INCBIN_U\d+)\("data/residual/([A-Za-z0-9_.]+\.bin)"\)', t):
        sites[m.group(2)] = (cf, m.group(1))
os.makedirs("graphics/reuse", exist_ok=True)
kept = []; mks = []; skipped = 0
for binp in sorted(glob.glob("data/residual/*.bin")):
    if len(kept) >= LIMIT: break
    bn = os.path.basename(binp)
    if bn not in sites: continue
    h = sha(binp)
    if h not in idx: continue
    name = bn[:-4]
    if os.path.exists("graphics/reuse/%s.png" % name): continue
    png, ext = idx[h]; mindist = None
    if gbagfx(png, "/tmp/_r.4bpp" if ext != ".gbapal" else "/tmp/_r.gbapal"): skipped += 1; continue
    if ext == ".gbapal":
        if sha("/tmp/_r.gbapal") != h: skipped += 1; continue
    elif ext == ".4bpp":
        if sha("/tmp/_r.4bpp") != h: skipped += 1; continue
    else:  # .4bpp.lz
        for md in (0, 1, 2, 3):
            gbagfx("/tmp/_r.4bpp", "/tmp/_r.lz", "-mindist", str(md))
            if sha("/tmp/_r.lz") == h: mindist = md; break
        if mindist is None: skipped += 1; continue
    shutil.copy(png, "graphics/reuse/%s.png" % name)
    cf, macro = sites[bn]; t = open(cf, errors="replace").read()
    t2 = t.replace('%s("data/residual/%s")' % (macro, bn),
                   '%s("graphics/reuse/%s%s")' % (macro, name, ext))
    if t2 == t: os.remove("graphics/reuse/%s.png" % name); skipped += 1; continue
    open(cf, "w").write(t2); kept.append((name, ext))
    if mindist: mks.append("graphics/reuse/%s.4bpp.lz: LZ_FLAGS := -mindist %d" % (name, mindist))
if mks:
    old = open("graphics/reuse/reuse.mk").read() if os.path.exists("graphics/reuse/reuse.mk") else \
        "# AUTO: per-asset LZ_FLAGS for fe8u-reused compressed graphics (D306)\n"
    open("graphics/reuse/reuse.mk", "w").write(old.rstrip() + "\n" + "\n".join(mks) + "\n")
from collections import Counter
print("extracted %d (%s); skipped %d" %
      (len(kept), dict(Counter(e for _, e in kept)), skipped))
