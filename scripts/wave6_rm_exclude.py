#!/usr/bin/env python3
"""Remove a set of asm stub paths from the Makefile DATA_INCBIN_ASM_EXCLUDE
backslash-continuation block, then re-fix the trailing backslash so the LAST
remaining entry has NO trailing '\\' (critical: a stray trailing backslash would
swallow the next Makefile line).

Usage: wave6_rm_exclude.py <stub1.s> [stub2.s ...]   (or read from stdin)
"""
import re, sys

stubs = set(a.strip() for a in sys.argv[1:] if a.strip())
if not stubs:
    stubs = set(l.strip() for l in sys.stdin if l.strip())

mk = open("Makefile").read().split("\n")

# locate the block
start = None
for i, ln in enumerate(mk):
    if ln.startswith("DATA_INCBIN_ASM_EXCLUDE"):
        start = i
        break
if start is None:
    sys.exit("DATA_INCBIN_ASM_EXCLUDE not found")

# the block is the contiguous run of continued lines from `start` while the
# previous physical line ended with '\'. Find the end = first line NOT ending '\'.
end = start
while mk[end].rstrip().endswith("\\"):
    end += 1
# `end` is now the last (non-continued) line of the block.

block = mk[start:end + 1]
kept = []
removed = 0
for ln in block:
    # path on this line?
    m = re.search(r'(asm/[^\s\\]+\.s)', ln)
    if m and m.group(1) in stubs:
        removed += 1
        continue
    kept.append(ln)

# normalize continuations: every kept line except the last gets a trailing ' \',
# the last gets none. Preserve indentation/content (strip existing trailing '\').
norm = []
for j, ln in enumerate(kept):
    base = ln.rstrip()
    if base.endswith("\\"):
        base = base[:-1].rstrip()
    if j < len(kept) - 1:
        norm.append(base + " \\")
    else:
        norm.append(base)

mk2 = mk[:start] + norm + mk[end + 1:]
open("Makefile", "w").write("\n".join(mk2))
print(f"removed {removed} exclude lines; block now {len(norm)} lines")
