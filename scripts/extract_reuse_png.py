#!/usr/bin/env python3
"""D306 batch: extract JP residual graphics/palette blobs byte-identical to a fe8u asset
(.4bpp / .4bpp.lz / .gbapal) that HAS a .png source, into editable PNG assets reusing
fe8u's source. Copies fe8u's .png (JP-named) to graphics/reuse/, re-points the INCBIN to
the built artifact (.4bpp / .4bpp.lz / .gbapal). Caller regen deps + clean-builds; make
compare gates byte-identity; remove the .bin to prove D299 effectiveness.
Usage: extract_reuse_png.py [N]"""
import glob, os, hashlib, subprocess, re, sys, shutil

FE8U = "../fireemblem8u"
LIMIT = int(sys.argv[1]) if len(sys.argv) > 1 else 50

def sha(p):
    try: return hashlib.sha1(open(p, "rb").read()).hexdigest()
    except Exception: return None

# fe8u index: hash -> (png_source, built_ext) for each reusable asset kind
idx = {}
for ext in (".4bpp",):  # .4bpp.lz/.gbapal need per-asset compression/palette flags -- see D306
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
done = []
for binp in sorted(glob.glob("data/residual/*.bin")):
    if len(done) >= LIMIT: break
    bn = os.path.basename(binp)
    if bn not in sites: continue
    h = sha(binp)
    if h not in idx: continue
    name = bn[:-4]
    jp_png = "graphics/reuse/%s.png" % name
    if os.path.exists(jp_png): continue
    png_src, ext = idx[h]
    shutil.copy(png_src, jp_png)
    cf, macro = sites[bn]
    t = open(cf, errors="replace").read()
    t2 = t.replace('%s("data/residual/%s")' % (macro, bn),
                   '%s("graphics/reuse/%s%s")' % (macro, name, ext))
    if t2 == t:
        os.remove(jp_png); continue
    open(cf, "w").write(t2)
    done.append((name, ext))
print("extracted %d reuse assets (%s)" %
      (len(done), ", ".join(sorted({e for _, e in done}))))
