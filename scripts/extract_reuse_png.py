#!/usr/bin/env python3
"""D306 batch: extract JP residual graphics blobs that are byte-identical to a fe8u asset
WITH a .png source, into editable PNG assets (reusing fe8u's source). For each: copy
fe8u's .png (JP-named) into graphics/reuse/, re-point the INCBIN from data/residual/*.bin
to the built .4bpp. Caller then regenerates the dep map + clean-builds; make compare is
the gate. Only handles the .4bpp (graphics) case (palettes/.lz have different rules).
Usage: extract_reuse_png.py [N]   (N = max assets this run, default 20)"""
import glob, os, hashlib, subprocess, re, sys, shutil

ROOT = "."; FE8U = "../fireemblem8u"
LIMIT = int(sys.argv[1]) if len(sys.argv) > 1 else 20

def sha(p):
    try: return hashlib.sha1(open(p, "rb").read()).hexdigest()
    except Exception: return None

# fe8u index: hash -> .4bpp path that HAS a .png source
idx = {}
for f in glob.glob(FE8U + "/graphics/**/*.4bpp", recursive=True):
    if os.path.exists(f[:-5] + ".png"):
        h = sha(f)
        if h: idx.setdefault(h, f)

# JP INCBIN sites: symbol .bin -> (cfile, incbin_macro)
sites = {}
for cf in glob.glob("src/data/**/*.c", recursive=True):
    t = open(cf, errors="replace").read()
    for m in re.finditer(r'INCBIN_U(\d+)\("data/residual/([A-Za-z0-9_.]+\.bin)"\)', t):
        sites[m.group(2)] = (cf, "INCBIN_U" + m.group(1))

os.makedirs("graphics/reuse", exist_ok=True)
done = []
for binp in sorted(glob.glob("data/residual/*.bin")):
    if len(done) >= LIMIT: break
    bn = os.path.basename(binp)
    if bn not in sites: continue
    h = sha(binp)
    if h not in idx: continue
    name = bn[:-4]
    png_src = idx[h][:-5] + ".png"
    jp_png = "graphics/reuse/%s.png" % name
    if os.path.exists(jp_png): continue
    shutil.copy(png_src, jp_png)
    cf, macro = sites[bn]
    t = open(cf, errors="replace").read()
    t2 = t.replace('%s("data/residual/%s")' % (macro, bn),
                   '%s("graphics/reuse/%s.4bpp")' % (macro, name))
    if t2 == t:
        os.remove(jp_png); continue
    open(cf, "w").write(t2)
    done.append((name, cf))
print("extracted %d reuse PNG assets:" % len(done))
for name, cf in done:
    print("  %-40s <- %s" % (name, os.path.basename(cf)))
