#!/usr/bin/env python3
"""D306 foundation: classify every LIVE residual data region by its game-asset TYPE
(text / graphics / battle-anim / music-sfx / map / struct-logic / unknown), cross-
referenced against fe8u, to produce the typed-asset extraction work-list. Lane-agnostic:
it tells us WHAT is there and how fe8u represents it, so extraction can be planned."""
import glob, os, re, subprocess, struct

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FE8U = os.path.join(ROOT, "..", "fireemblem8u")

# name-pattern -> asset type (positive evidence; checked in order)
PATTERNS = [
    ("TEXT",      re.compile(r'Msg|Text|CompressedText|Huffman|Dialog|Conversation', re.I)),
    ("MUSIC_SFX", re.compile(r'^song|DirectSound|^wave|_m4a|MPlay|SoundRoom|^se_', re.I)),
    ("BATTLE_ANIM", re.compile(r'AnimScr|AnimSpr|banim|opanim|^Efx|Wfx|_motion|_modes|Reel', re.I)),
    ("GRAPHICS",  re.compile(r'Img|Tsa|^Pal|Chr|Gfx|Sprite|Portrait|Icon|^cg_|btl_bg|Menu.*Obj|tiles$|_tileset|palette|Backdrop|Bg\d', re.I)),
    ("MAP",       re.compile(r'Map(?!anim)|Tileset|tilemap|Terrain|gMapData|Mar\b', re.I)),
    ("STRUCT_LOGIC", re.compile(r'UnitDef|EventScr|ProcScr|^lut|Ai[A-Z]|Reinforce|Shop|Chapter|gUnit|Battle', re.I)),
]

def fe8u_has(sym):
    """Does fe8u define this symbol (reusable) and how?"""
    try:
        out = subprocess.run(["grep", "-rl", r'\b' + re.escape(sym) + r'\b',
                              os.path.join(FE8U, "include"), os.path.join(FE8U, "src")],
                             capture_output=True, text=True, timeout=20).stdout
        return bool(out.strip())
    except Exception:
        return False

def live_bins():
    inc = subprocess.run(["grep", "-rhoE", r'data/residual/[A-Za-z0-9_.]+\.bin',
                          os.path.join(ROOT, "src", "data")], capture_output=True, text=True).stdout
    return {os.path.basename(x) for x in set(inc.split())}

def classify():
    live = live_bins()
    from collections import Counter
    by_type = Counter(); bytes_by_type = Counter(); examples = {}
    unknown = []
    for binp in sorted(glob.glob(os.path.join(ROOT, "data", "residual", "*.bin"))):
        bn = os.path.basename(binp)
        if bn not in live:
            continue
        name = bn[:-4]; sz = os.path.getsize(binp)
        t = None
        for label, rx in PATTERNS:
            if rx.search(name):
                t = label; break
        if t is None:
            t = "UNKNOWN"
            if len(unknown) < 40:
                unknown.append((sz, name))
        by_type[t] += 1; bytes_by_type[t] += sz
        examples.setdefault(t, []).append(name)
    print("== RESIDUAL DATA by ASSET TYPE (live, D306 work-list) ==")
    tot_b = sum(bytes_by_type.values()); tot_n = sum(by_type.values())
    for t, n in by_type.most_common():
        kb = bytes_by_type[t] / 1024.0
        print(f"  {t:14} {n:5d} regions  {kb:9.1f} KB   e.g. {', '.join(examples[t][:3])}")
    print(f"  {'TOTAL':14} {tot_n:5d} regions  {tot_b/1024.0:9.1f} KB")
    unknown.sort(reverse=True)
    print("\n  -- biggest UNKNOWN regions (need fe8u cross-ref to type) --")
    for sz, name in unknown[:20]:
        print(f"   {sz:7d}B  {name}")

if __name__ == "__main__":
    classify()
