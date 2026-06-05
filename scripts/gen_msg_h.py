#!/usr/bin/env python3
"""Generate the JP include/constants/msg.h from the US one + layout/msg_map.tsv.

Message names are MSG_<index>; only the VALUES differ JP<->US. For each define
whose US value is in the map, substitute the JP id. Unmapped defines keep the US
value (correct for offset-0 messages; wrong only for not-yet-mapped shifted ones).
"""
import re, os
msg = {}
for ln in open("layout/msg_map.tsv"):
    if not ln.startswith("#"):
        u, j = (int(x, 16) for x in ln.split("\t")[:2])
        msg[u] = j
src = open("/home/laqieer/fireemblem8u/include/constants/msg.h").read()
changed = 0
def sub(m):
    global changed
    name, val = m.group(1), int(m.group(2), 16)
    if val in msg and msg[val] != val:
        changed += 1
        return f"#define {name} 0x{msg[val]:04X}"
    return m.group(0)
out = re.sub(r"#define (MSG_\w+) (0x[0-9A-Fa-f]+)", sub, src)
os.makedirs("include/constants", exist_ok=True)
open("include/constants/msg.h", "w").write(out)
print(f"JP msg.h written; {changed} message ids remapped to JP values")
