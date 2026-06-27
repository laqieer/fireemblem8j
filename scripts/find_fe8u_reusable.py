#!/usr/bin/env python3
"""D306 reuse map: hash every fe8u data asset, then hash every LIVE JP residual blob and
report exact (byte-identical) matches. A match = the JP blob is a SHARED asset that can
be re-pointed to / reused from fe8u (the user's premise: most assets reusable, JP delta
is text). Non-matches = JP-divergent or JP-only, needing per-region extraction."""
import glob, os, hashlib, subprocess, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FE8U = os.path.normpath(os.path.join(ROOT, "..", "fireemblem8u"))

def sha(path):
    try:
        with open(path, "rb") as f:
            return hashlib.sha1(f.read()).hexdigest()
    except Exception:
        return None

def build_fe8u_index():
    idx = {}
    for ext in ("*.bin", "*.4bpp", "*.gbapal", "*.lz", "*.tsa", "*.gbagfx"):
        for f in glob.glob(os.path.join(FE8U, "**", ext), recursive=True):
            if "/.git/" in f or "/build/" in f:
                continue
            h = sha(f)
            if h:
                idx.setdefault(h, os.path.relpath(f, FE8U))
    return idx

def live_bins():
    inc = subprocess.run(["grep", "-rhoE", r'data/residual/[A-Za-z0-9_.]+\.bin',
                          os.path.join(ROOT, "src", "data")], capture_output=True, text=True).stdout
    return {os.path.basename(x) for x in set(inc.split())}

def main():
    idx = build_fe8u_index()
    print(f"fe8u asset index: {len(idx)} unique data files hashed")
    live = live_bins()
    matched = 0; matched_b = 0; unmatched = 0; unmatched_b = 0; samples = []
    for binp in sorted(glob.glob(os.path.join(ROOT, "data", "residual", "*.bin"))):
        if os.path.basename(binp) not in live:
            continue
        sz = os.path.getsize(binp); h = sha(binp)
        if h in idx:
            matched += 1; matched_b += sz
            if len(samples) < 15:
                samples.append((os.path.basename(binp)[:-4], idx[h]))
        else:
            unmatched += 1; unmatched_b += sz
    print(f"JP live residual blobs        : {matched+unmatched}  ({(matched_b+unmatched_b)/1024:.1f} KB)")
    print(f"  byte-identical to fe8u (REUSE): {matched}  ({matched_b/1024:.1f} KB)")
    print(f"  no fe8u match (JP-divergent)  : {unmatched}  ({unmatched_b/1024:.1f} KB)")
    print("  sample reuse matches (JP blob -> fe8u asset):")
    for jp, fe in samples:
        print(f"    {jp:36} = {fe}")

if __name__ == "__main__":
    main()
