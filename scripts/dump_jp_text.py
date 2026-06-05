#!/usr/bin/env python3
"""Decode all JP messages from the ROM to a text dump (text-extraction epic #12).

Uses the validated JP Huffman parameters. Leaf values are the game's text bytes:
>=0x100 -> a 2-byte Shift-JIS char; control codes (<0x20) are shown as [XX].
"""
import struct, sys
jp = open("baserom.gba", "rb").read()
HUF, TBL, ROOT, COUNT = 0x14929C, 0x14D088, 3961, 0xD0C
def w(o): return struct.unpack_from("<I", jp, o)[0]
def is_leaf(n): return (n & 0xFFFF0000) == 0xFFFF0000

def decode(off):
    out = []; cur = ROOT; cb = 0; bp = -1; n = 0
    while n < 8000:
        n += 1
        if bp < 0: cb = jp[off]; off += 1; bp = 7
        bit = cb & 1; cb >>= 1; bp -= 1
        node = w(HUF + cur * 4)
        cur = (node & 0xFFFF) if bit == 0 else ((node >> 16) & 0xFFFF)
        leaf = w(HUF + cur * 4)
        if is_leaf(leaf):
            d = leaf & 0xFFFF
            if d == 0: return out
            out.append(d); cur = ROOT
    return out

def render(vals):
    b = bytearray(); s = []
    def flush():
        if b:
            s.append(bytes(b).decode("shift_jis", errors="replace")); b.clear()
    for d in vals:
        if d < 0x20:
            flush(); s.append(f"[{d:02X}]")
        elif d < 0x100:
            b.append(d)
        else:
            b.append(d >> 8); b.append(d & 0xFF)
    flush()
    return "".join(s)

clean = 0
out = []
for idx in range(COUNT):
    vals = decode(w(TBL + 4 * idx) & 0xFFFFFF)
    txt = render(vals)
    if "�" not in txt: clean += 1
    out.append(f"# msg {idx} (0x{idx:X})\n{txt}\n")
open("texts/jp_messages.txt", "w").write("\n".join(out))
print(f"decoded {COUNT} JP messages -> texts/jp_messages.txt; {clean} ({100*clean//COUNT}%) with no replacement chars")
