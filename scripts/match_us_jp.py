#!/usr/bin/env python3
"""Discover JP ROM layout by matching US functions to JP addresses.

Reads US function symbols (addr/size/name) from the US decomp ELF, then for each
function searches the JP ROM (baserom.gba) for its byte pattern.

Two tiers:
  exact  - the function's exact bytes occur in JP exactly once (no relinked
           pointers; a guaranteed-correct anchor, immediately portable).
  masked - same length, all non-pointer-literal words match exactly and the
           match is unique (pointer words wildcarded). High confidence.

Outputs layout/us_jp_funcmap.tsv:  jp_addr  us_addr  size  tier  name
"""
import subprocess, sys, os, struct

US_ELF = "/home/laqieer/fireemblem8u/fireemblem8.elf"
US_ROM = "/home/laqieer/fireemblem8u/fireemblem8.gba"
JP_ROM = "baserom.gba"
BASE = 0x08000000
OUT = "layout/us_jp_funcmap.tsv"

us_rom = open(US_ROM, "rb").read()
jp = open(JP_ROM, "rb").read()

# --- US function symbols (addr, size, name) ---
nm = subprocess.run(["arm-none-eabi-nm", "-S", "-n", US_ELF],
                    capture_output=True, text=True).stdout.splitlines()
funcs = []
seen_addr = set()
for ln in nm:
    p = ln.split()
    if len(p) != 4:
        continue
    addr_s, size_s, typ, name = p
    if typ not in ("t", "T"):
        continue
    if not addr_s.startswith("08"):
        continue
    try:
        addr = int(addr_s, 16); size = int(size_s, 16)
    except ValueError:
        continue
    if size < 8 or size > 0x4000:
        continue
    if addr in seen_addr:
        continue
    seen_addr.add(addr)
    funcs.append((addr, size, name))
print(f"US functions considered: {len(funcs)}")

def is_ptr_word(w):
    # ROM (0x08/0x09), EWRAM (0x02), IWRAM (0x03) absolute addresses -> relinked
    top = w >> 24
    return top in (0x08, 0x09, 0x02, 0x03)

def count_occurrences(hay, needle, limit=3):
    n = 0; i = hay.find(needle)
    while i != -1:
        n += 1
        if n >= limit:
            break
        i = hay.find(needle, i + 1)
    return n

exact = []      # (jp_addr, us_addr, size, name)
masked = []
no_match = 0
ambiguous = 0
for addr, size, name in funcs:
    off = addr - BASE
    b = us_rom[off:off + size]
    if len(b) != size:
        continue
    # Tier 1: exact unique
    c = count_occurrences(jp, b, limit=2)
    if c == 1:
        jp_off = jp.find(b)
        exact.append((BASE + jp_off, addr, size, name))
        continue
    if c >= 2:
        ambiguous += 1
        continue
    # Tier 2: masked (wildcard pointer-looking words). Only for word-aligned funcs.
    if size % 2 != 0 or size < 16:
        no_match += 1
        continue
    # Build a regex-free masked scan: collect fixed (offset->byte) constraints,
    # skipping 4-byte words that look like pointers (aligned to 4 within func).
    fixed = bytearray(b)
    mask = bytearray([1]) * size  # 1 = must match
    for w in range(0, size - 3, 4):
        word = struct.unpack_from("<I", b, w)[0]
        if is_ptr_word(word):
            for k in range(4):
                mask[w + k] = 0
    # Use the LONGEST run of consecutive must-match bytes as the search needle
    # (few candidates), then verify the full masked pattern at each hit.
    best_start = best_len = 0
    run_start = None
    for i in range(size + 1):
        if i < size and mask[i]:
            if run_start is None:
                run_start = i
        else:
            if run_start is not None:
                rl = i - run_start
                if rl > best_len:
                    best_len = rl; best_start = run_start
                run_start = None
    if best_len < 4:
        no_match += 1
        continue
    needle = bytes(fixed[best_start:best_start + best_len])
    hits = []
    start = 0
    while len(hits) < 2:
        j = jp.find(needle, start)
        if j == -1:
            break
        s = j - best_start
        if s >= 0 and s + size <= len(jp):
            cand = jp[s:s + size]
            ok = True
            for k in range(size):
                if mask[k] and cand[k] != fixed[k]:
                    ok = False; break
            if ok:
                hits.append(s)
        start = j + 1
    if len(hits) == 1:
        masked.append((BASE + hits[0], addr, size, name))
    elif len(hits) >= 2:
        ambiguous += 1
    else:
        no_match += 1

exact.sort(); masked.sort()
exact_bytes = sum(s for _, _, s, _ in exact)
masked_bytes = sum(s for _, _, s, _ in masked)
print(f"exact-unique matches : {len(exact):6d}  ({exact_bytes:#x} bytes)")
print(f"masked  matches      : {len(masked):6d}  ({masked_bytes:#x} bytes)")
print(f"ambiguous (>=2 hits) : {ambiguous:6d}")
print(f"no match             : {no_match:6d}")
same = sum(1 for j, u, s, n in exact if j == u)
print(f"exact matches at SAME address as US: {same}/{len(exact)}")

os.makedirs("layout", exist_ok=True)
with open(OUT, "w") as f:
    f.write("# jp_addr\tus_addr\tsize\ttier\tname\n")
    rows = [(j, u, s, "exact", n) for j, u, s, n in exact] + \
           [(j, u, s, "masked", n) for j, u, s, n in masked]
    rows.sort()
    for j, u, s, tier, n in rows:
        f.write(f"{j:08X}\t{u:08X}\t{s}\t{tier}\t{n}\n")
print(f"wrote {OUT} ({len(exact)+len(masked)} entries)")
