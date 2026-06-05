#!/usr/bin/env python3
"""Extract US<->JP message-ID correspondence pairs (decision D4).

A region-different .rodata table of message IDs is logically the same US and JP,
just with different MSG values. Given the US and JP table addresses + entry count
(found by matching the referencing function/run), read both and emit the pairs.
Aggregated across the ROM these build the US MSG_* -> JP index map for msg.h.

Seed table: bmreliance affinity name lookup (validated). Extend with more tables
(from port_run's region-different-data detections / matched MSG-referencing code).

Outputs layout/msg_map.tsv:  us_id  jp_id  source
"""
import struct, os
US = open("/home/laqieer/fireemblem8u/fireemblem8.gba", "rb").read()
JP = open("baserom.gba", "rb").read()

# (us_table_addr, jp_table_addr, first_entry_idx, count, entry_size, source)
TABLES = [
    # bmreliance affinity-name lookup: 8 u32 entries after a 4-byte icon word.
    (0x080D7C14 + 4, 0x080DC948 + 4, 0, 8, 4, "bmreliance:affinity"),
]

pairs = {}
for us_a, jp_a, _, cnt, sz, src in TABLES:
    uo, jo = us_a - 0x08000000, jp_a - 0x08000000
    for k in range(cnt):
        u = int.from_bytes(US[uo+k*sz:uo+k*sz+sz], "little")
        j = int.from_bytes(JP[jo+k*sz:jo+k*sz+sz], "little")
        if 0 < u < 0xE00 and 0 < j < 0xE00:  # plausible message ids
            pairs[u] = (j, src)

os.makedirs("layout", exist_ok=True)
with open("layout/msg_map.tsv", "w") as f:
    f.write("# us_id\tjp_id\tsource\n")
    for u in sorted(pairs):
        j, src = pairs[u]
        f.write(f"{u:04X}\t{j:04X}\t{src}\n")
print(f"{len(pairs)} US->JP message-id pairs -> layout/msg_map.tsv")
for u in sorted(pairs):
    print(f"  MSG US 0x{u:X} -> JP 0x{pairs[u][0]:X}  (offset {pairs[u][0]-u:+#x})")
