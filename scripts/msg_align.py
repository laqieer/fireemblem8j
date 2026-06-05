#!/usr/bin/env python3
"""Build the US<->JP message-ID map (decision D4) for a JP msg.h.

A region-different .rodata table of message IDs is logically identical US/JP, just
with different MSG values. layout/addr_map.tsv already pairs US->JP *addresses*
(from located functions' literal pools), so a referenced MSG table appears there.
For each address pair, read consecutive entries from both ROMs; a run of >=5
plausible message ids on both sides is a MSG table -> emit US-index<->JP-index
pairs. Majority-vote per US id; keep unambiguous ones.

Offsets are piecewise-constant (large offset-0 prefix, then shifted segments from
inserted/removed messages), so the map must be harvested, then interpolated
within each constant-offset segment to cover gaps.

Outputs layout/msg_map.tsv:  us_id  jp_id  source
"""
import os
from collections import Counter, defaultdict

US = open("/home/laqieer/fireemblem8u/fireemblem8.gba", "rb").read()
JP = open("baserom.gba", "rb").read()
B = 0x08000000
JP_COUNT = 0xD0C

def rd(rom, off, sz):
    return int.from_bytes(rom[off:off+sz], "little") if 0 <= off and off+sz <= len(rom) else -1

def valid(x):
    return 1 <= x < JP_COUNT

votes = defaultdict(Counter)
src_of = {}
ntables = 0

# Validated seed tables whose referencing function is region-different (so they
# are NOT in addr_map): (us_addr, jp_addr, count, entry_size, source).
SEED = [
    (0x080D7C14 + 4, 0x080DC948 + 4, 8, 4, "seed:bmreliance-affinity"),
]
for ua, ja, cnt, sz, src in SEED:
    uo, jo = ua - B, ja - B
    for k in range(cnt):
        uv, jv = rd(US, uo+k*sz, sz), rd(JP, jo+k*sz, sz)
        if valid(uv) and valid(jv):
            votes[uv][jv] += 2  # seed weighted to win ties
            src_of[uv] = src
    ntables += 1

for ln in open("layout/addr_map.tsv"):
    if ln.startswith("#"):
        continue
    ua, ja = (int(x, 16) for x in ln.split("\t")[:2])
    if not (B <= ua < B + 0x1000000 and B <= ja < B + 0x1000000):
        continue
    for sz in (2, 4):
        uo, jo = ua - B, ja - B
        run = []
        for k in range(64):
            uv, jv = rd(US, uo+k*sz, sz), rd(JP, jo+k*sz, sz)
            if valid(uv) and valid(jv):
                run.append((uv, jv))
            else:
                break
        if len(run) >= 5:
            ntables += 1
            tag = "auto:same" if ua == ja else "auto:shifted"
            for uv, jv in run:
                votes[uv][jv] += 1
                src_of.setdefault(uv, tag)
            break

pairs = {}
for uv, c in votes.items():
    jv, n = c.most_common(1)[0]
    if sum(c.values()) - n == 0:  # unambiguous
        pairs[uv] = jv

os.makedirs("layout", exist_ok=True)
with open("layout/msg_map.tsv", "w") as f:
    f.write("# us_id\tjp_id\tsource\n")
    for uv in sorted(pairs):
        f.write(f"{uv:04X}\t{pairs[uv]:04X}\t{src_of.get(uv,'auto')}\n")
print(f"{ntables} candidate tables -> {len(pairs)} US->JP message-id pairs "
      f"({100*len(pairs)//JP_COUNT}% of JP messages) -> layout/msg_map.tsv")
shifted = sum(1 for uv, jv in pairs.items() if uv != jv)
print(f"  offset-0 (same id): {len(pairs)-shifted}, shifted (relinked): {shifted}")
