#!/usr/bin/env python3
"""D306 JP-self graphics extraction: for JP-divergent graphics blobs (no byte-identical
fe8u match), round-trip the blob's OWN pixels through gbagfx into an editable .png:
  decompress if LZ77 -> 4bpp -> png (decode) -> RE-ENCODE png->4bpp[->lz -mindist 0..3]
  and keep ONLY if it RECONSTRUCTS the original .bin byte-identically (verify guard).
Name-gated to genuine graphics (Img_/Tsa_/Sprite_/AnimSpr_/Gfx_/cg_/Bg) so struct/text
data is never mislabeled as an image. Writes graphics/reuse/reuse.mk LZ_FLAGS for
compressed ones. Usage: extract_jpself_gfx.py [N]"""
import glob, os, hashlib, subprocess, re, sys, shutil
LIMIT = int(sys.argv[1]) if len(sys.argv) > 1 else 30
GFX = re.compile(r'^(Img|Tsa|TsaL|TsaR|Sprite|AnimSpr|Gfx|cg_|Bg|Backdrop|Reel|banim_.*sheet|Portrait)', re.I)
def sha(p):
    try: return hashlib.sha1(open(p, "rb").read()).hexdigest()
    except Exception: return None
def gg(*a): return subprocess.run(["tools/gbagfx/gbagfx", *a], capture_output=True).returncode
def is_lz(d): return len(d) > 4 and d[0] == 0x10
sites = {}
for cf in glob.glob("src/data/**/*.c", recursive=True):
    t = open(cf, errors="replace").read()
    for m in re.finditer(r'(INCBIN_U\d+)\("data/residual/([A-Za-z0-9_.]+\.bin)"\)', t):
        sites[m.group(2)] = (cf, m.group(1))
os.makedirs("graphics/reuse", exist_ok=True)
kept = []; mks = []; skipped = 0
for binp in sorted(glob.glob("data/residual/*.bin")):
    if len(kept) >= LIMIT: break
    bn = os.path.basename(binp); name = bn[:-4]
    if bn not in sites or not GFX.match(name): continue
    if os.path.exists("graphics/reuse/%s.png" % name): continue
    d = open(binp, "rb").read(); orig = sha(binp)
    # get the raw 4bpp (decompress if LZ)
    comp = is_lz(d)
    if comp:
        # gbagfx infers the op from the EXTENSION: a .lz input decompresses, but passing
        # the .bin directly would NOT. Copy to a .lz name first.
        if os.path.exists("/tmp/_j.4bpp"): os.remove("/tmp/_j.4bpp")
        shutil.copy(binp, "/tmp/_j.lz")
        if gg("/tmp/_j.lz", "/tmp/_j.4bpp") or not os.path.exists("/tmp/_j.4bpp"): skipped += 1; continue
        src4 = "/tmp/_j.4bpp"
    else:
        shutil.copy(binp, "/tmp/_j.4bpp"); src4 = "/tmp/_j.4bpp"
    # decode -> png, then re-encode and verify reconstruct
    if gg(src4, "/tmp/_j.png"): skipped += 1; continue
    if gg("/tmp/_j.png", "/tmp/_j2.4bpp"): skipped += 1; continue
    ext = None; mindist = None
    if not comp:
        if sha("/tmp/_j2.4bpp") == orig: ext = ".4bpp"
    else:
        for md in range(0, 16):
            gg("/tmp/_j2.4bpp", "/tmp/_j2.lz", "-mindist", str(md))
            if sha("/tmp/_j2.lz") == orig: ext = ".4bpp.lz"; mindist = md; break
    if ext is None: skipped += 1; continue
    shutil.copy("/tmp/_j.png", "graphics/reuse/%s.png" % name)
    cf, macro = sites[bn]; t = open(cf, errors="replace").read()
    t2 = t.replace('%s("data/residual/%s")' % (macro, bn),
                   '%s("graphics/reuse/%s%s")' % (macro, name, ext))
    if t2 == t: os.remove("graphics/reuse/%s.png" % name); skipped += 1; continue
    open(cf, "w").write(t2); kept.append((name, ext))
    if mindist: mks.append("graphics/reuse/%s.4bpp.lz: LZ_FLAGS := -mindist %d" % (name, mindist))
if mks:
    old = open("graphics/reuse/reuse.mk").read() if os.path.exists("graphics/reuse/reuse.mk") else \
        "# AUTO: per-asset LZ_FLAGS for reused/extracted compressed graphics (D306)\n"
    open("graphics/reuse/reuse.mk", "w").write(old.rstrip() + "\n" + "\n".join(mks) + "\n")
from collections import Counter
print("JP-self gfx: extracted %d (%s); skipped %d" % (len(kept), dict(Counter(e for _, e in kept)), skipped))
