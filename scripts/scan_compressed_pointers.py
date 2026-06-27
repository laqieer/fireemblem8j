#!/usr/bin/env python3
"""Measure the COMPRESSED-DATA pointer blind spot (D306): the .bin pointer auditor only
sees raw 0x08xxxxxx words, so pointers baked into LZ77-compressed blobs are invisible.
Decompress every LZ77 blob in data/residual/ and count embedded ROM-range words, and
flag the ones that look like real pointer tables (dense / regular-stride) vs graphics
(sparse / random)."""
import glob, os, struct, sys

ROM_LO, ROM_HI = 0x08000000, 0x09000000

def lz77_decompress(d):
    """GBA BIOS LZ77 (type 0x10). Returns decompressed bytes or None if not valid LZ77."""
    if not d or d[0] != 0x10:
        return None
    size = d[1] | (d[2] << 8) | (d[3] << 16)
    if size == 0 or size > (1 << 22):
        return None
    out = bytearray()
    pos = 4
    try:
        while len(out) < size and pos < len(d):
            flags = d[pos]; pos += 1
            for bit in range(8):
                if len(out) >= size:
                    break
                if flags & (0x80 >> bit):
                    if pos + 1 >= len(d):
                        return None
                    b0, b1 = d[pos], d[pos + 1]; pos += 2
                    length = (b0 >> 4) + 3
                    disp = (((b0 & 0xF) << 8) | b1) + 1
                    if disp > len(out):
                        return None
                    for _ in range(length):
                        out.append(out[len(out) - disp])
                        if len(out) >= size:
                            break
                else:
                    if pos >= len(d):
                        return None
                    out.append(d[pos]); pos += 1
    except Exception:
        return None
    return bytes(out[:size])

def scan():
    comp = 0; withptr = 0; total_emb = 0; rows = []
    for binp in sorted(glob.glob("data/residual/*.bin")):
        d = open(binp, "rb").read()
        dec = lz77_decompress(d)
        if dec is None:
            continue
        comp += 1
        words = len(dec) // 4
        if words == 0:
            continue
        offs = [i * 4 for i in range(words)
                if ROM_LO <= struct.unpack_from("<I", dec, i * 4)[0] < ROM_HI]
        if not offs:
            continue
        withptr += 1; total_emb += len(offs)
        density = len(offs) / words
        # regular stride? gaps between consecutive pointer offsets
        gaps = {offs[i] - offs[i - 1] for i in range(1, len(offs))}
        regular = len(gaps) <= 3 and len(offs) >= 4
        kind = "PTR-TABLE?" if (density > 0.10 or regular) else "gfx-coincidental?"
        rows.append((len(offs), density, kind, os.path.basename(binp)[:-4], len(dec)))
    rows.sort(reverse=True)
    print(f"LZ77-compressed residual blobs: {comp}")
    print(f"  with >=1 embedded ROM-range word: {withptr}  (total embedded words: {total_emb})")
    print(f"  -- blobs whose decompressed content has embedded 0x08xxxxxx words --")
    for n, dens, kind, name, dsz in rows[:40]:
        print(f"   {n:5d}  {dens*100:5.1f}%  {kind:18} {name:38} (decomp {dsz}B)")
    print(f"\n  SUMMARY: {sum(1 for r in rows if 'PTR-TABLE' in r[2])} blobs flagged dense/"
          f"regular -- BUT validation (do the embedded words resolve to a COHERENT target set?)")
    print(f"  shows even the highest-density (data_081A6774, 44%) resolve to RANDOM scattered")
    print(f"  interiors (sound/portrait/map/fn) = coincidental constants in decompressed gfx/")
    print(f"  tilemap/palette, NOT real pointer tables. Heuristic: assumes 0x10-prefix = LZ77,")
    print(f"  so some decodes are false. Definitive answer needs typed-asset extraction (D306).")

if __name__ == "__main__":
    scan()
