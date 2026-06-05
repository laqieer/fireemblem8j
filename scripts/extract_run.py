#!/usr/bin/env python3
"""Extract a subset .c containing only the named functions (D1 run porting).

Keeps the file header (everything before the first top-level function: includes,
typedefs, file-scope statics / EWRAM_DATA) and then only the requested
functions, in source order. Compiling this subset reproduces those functions'
bytes (they are independent given the same headers/statics), so a contiguous run
of matching functions can be carved as one block while region-different
functions stay in the incbin baseline.

Usage: scripts/extract_run.py <us_src.c> <Func1> <Func2> ...  > subset.c
"""
import re, sys

src = open(sys.argv[1]).read()
wanted = sys.argv[2:]

# Walk the file tracking brace depth, skipping strings/chars/comments, to find
# each top-level {...} body and the signature that precedes it.
i, n = 0, len(src)
depth = 0
seg_start = 0          # start of the current top-level segment (after last ; or })
func_start = None      # where the current top-level function's text begins
brace_open = None      # position of the function body's opening brace
spans = []             # (name, start, end) for each top-level function
header_end = None

def skip_string(i, q):
    i += 1
    while i < n:
        if src[i] == "\\":
            i += 2; continue
        if src[i] == q:
            return i + 1
        i += 1
    return i

while i < n:
    c = src[i]
    if c == "/" and i + 1 < n and src[i+1] == "/":
        i = src.find("\n", i);  i = n if i < 0 else i;  continue
    if c == "/" and i + 1 < n and src[i+1] == "*":
        i = src.find("*/", i);  i = n if i < 0 else i + 2;  continue
    if c in "\"'":
        i = skip_string(i, c);  continue
    if c == "{":
        if depth == 0:
            func_start = seg_start
            brace_open = i
        depth += 1
    elif c == "}":
        depth -= 1
        if depth == 0:
            # top-level body just closed: name comes from the SIGNATURE only
            sig = src[seg_start:brace_open]
            m = list(re.finditer(r"([A-Za-z_]\w*)\s*\(", sig))
            name = m[-1].group(1) if m else None
            # struct/enum/union/array initialisers have no call-style sig
            if name and not re.search(r"\b(struct|enum|union)\b", sig):
                spans.append((name, func_start, i + 1))
                if header_end is None:
                    header_end = func_start
            seg_start = i + 1
    elif c == ";" and depth == 0:
        seg_start = i + 1
    i += 1

header = src[:header_end] if header_end is not None else src
out = [header.rstrip("\n")]
byname = {nm: (s, e) for nm, s, e in spans}
missing = [w for w in wanted if w not in byname]
if missing:
    sys.stderr.write(f"WARNING: functions not found: {missing}\n")
for w in wanted:
    if w in byname:
        s, e = byname[w]
        out.append("\n" + src[s:e].strip("\n"))
sys.stdout.write("\n".join(out) + "\n")
