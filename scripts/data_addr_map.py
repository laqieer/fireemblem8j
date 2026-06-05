#!/usr/bin/env python3
"""Build a US->JP data/function address map from located functions' literal pools.

For every function located by match_us_jp.py (JP address known, same instruction
stream as US), the PC-relative literal pools sit at identical offsets in the US
and JP bodies. A literal that looks like an absolute address (ROM/EWRAM/IWRAM) is
a pointer; pairing US_word[i] with JP_word[i] yields "US address X lives at JP
address Y". Aggregated across thousands of functions and filtered for agreement,
this resolves where relinked globals/tables/functions moved in the JP ROM.

Outputs layout/addr_map.tsv:  us_addr  jp_addr  votes  conflicts
"""
import struct, collections

US_ROM = "/home/laqieer/fireemblem8u/fireemblem8.gba"
JP_ROM = "baserom.gba"
BASE = 0x08000000
us = open(US_ROM, "rb").read()
jp = open(JP_ROM, "rb").read()

def is_ptr(w):
    return (w >> 24) in (0x08, 0x09, 0x02, 0x03)

votes = collections.defaultdict(collections.Counter)  # us_addr -> Counter(jp_addr)
pairs = 0
for ln in open("layout/us_jp_funcmap.tsv"):
    if ln.startswith("#"):
        continue
    j, u, s, t, n = ln.rstrip("\n").split("\t")
    jp_a, us_a, size = int(j, 16), int(u, 16), int(s)
    uo, jo = us_a - BASE, jp_a - BASE
    if uo < 0 or jo < 0 or uo + size > len(us) or jo + size > len(jp):
        continue
    for k in range(0, size - 3, 4):
        uw = struct.unpack_from("<I", us, uo + k)[0]
        if not is_ptr(uw):
            continue
        jw = struct.unpack_from("<I", jp, jo + k)[0]
        if not is_ptr(jw):
            continue
        votes[uw][jw] += 1
        pairs += 1

# Resolve each US address to its majority JP address; record agreement strength.
rows = []
clean = 0
for ua, c in votes.items():
    jw, v = c.most_common(1)[0]
    conflicts = sum(c.values()) - v
    rows.append((ua, jw, v, conflicts))
    if conflicts == 0:
        clean += 1
rows.sort()
with open("layout/addr_map.tsv", "w") as f:
    f.write("# us_addr\tjp_addr\tvotes\tconflicts\n")
    for ua, jw, v, conf in rows:
        f.write(f"{ua:08X}\t{jw:08X}\t{v}\t{conf}\n")

same = sum(1 for ua, jw, v, c in rows if ua == jw)
print(f"literal pairs examined : {pairs}")
print(f"distinct US addresses   : {len(rows)}")
print(f"  unambiguous (no conflict): {clean}")
print(f"  resolve to SAME addr     : {same}")
print(f"  relinked (US!=JP)        : {len(rows)-same}")
print("wrote layout/addr_map.tsv")
