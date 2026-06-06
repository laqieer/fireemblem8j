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
    if c == "#" and (i == 0 or src[i-1] == "\n"):
        # Preprocessor directive: skip the (possibly line-continued) line and,
        # at top level, treat its end as a segment boundary. Without this the
        # first function's segment starts at 0 when only #includes/#defines (no
        # ';') precede it, so header_end becomes 0 and the whole include block is
        # dropped -> undeclared externals -> agbcc -Wimplicit -Werror failure.
        j = src.find("\n", i)
        while j != -1 and src[j-1] == "\\":
            j = src.find("\n", j + 1)
        i = n if j == -1 else j + 1
        if depth == 0:
            seg_start = i
        continue
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
            # A function's signature ends with its parameter list ')'. Struct/enum
            # definitions and array/struct initialisers do not (they end in a name,
            # '=', etc.) — this correctly keeps functions that *return* a struct.
            if name and sig.rstrip().endswith(")"):
                spans.append((name, func_start, i + 1, sig))
                if header_end is None:
                    header_end = func_start
            seg_start = i + 1
    elif c == ";" and depth == 0:
        seg_start = i + 1
    i += 1

header = src[:header_end] if header_end is not None else src
# De-`static` forward declarations of functions NOT in this subset: their bodies
# aren't included, so a `static` decl triggers agbcc's "used but never defined"
# (-Werror). Making them extern lets the linker resolve them (port_run adds the
# baseline sym). Functions kept in the subset keep their static decl+def.
wantset = set(wanted)
def _destatic(m):
    return m.group(0) if m.group(1) in wantset else m.group(0).replace("static", "", 1)
header = re.sub(r"static\s+[\w\s\*]+?\b(\w+)\s*\([^;{]*\)\s*;", _destatic, header)
out = [header.rstrip("\n")]
byname = {nm: (s, e) for nm, s, e, sg in spans}

# Forward-declare same-file functions the run CALLS but that are defined outside
# the subset with no header prototype -> otherwise agbcc -Wimplicit -Werror (e.g.
# bmtarget's ForEachUnitInRange, cg's GetCG). ONLY functions actually called are
# declared, so unrelated helpers (whose signatures may reference file-local
# structs) aren't dragged in. The name is parsed from the FIRST '(' so a
# function-pointer parameter like void(*f)(...) can't masquerade as the name.
# De-static'd -> the linker binds each to the carved/baseline JP symbol.
wanted_bodies = "".join(src[byname[w][0]:byname[w][1]] for w in wanted if w in byname)
def _sig_name(sig):
    m = re.search(r"([A-Za-z_]\w*)\s*\(", sig)
    return m.group(1) if m else None
def _clean_sig(sig):
    sig = sig.lstrip()
    while sig[:2] in ("//", "/*"):
        if sig.startswith("//"):
            nl = sig.find("\n");  sig = sig[nl+1:].lstrip() if nl != -1 else ""
        else:
            end = sig.find("*/");  sig = sig[end+2:].lstrip() if end != -1 else ""
    if re.search(r"\binline\b", sig):
        return None  # an inline can't be extern'd; needs its body if used (rare)
    return " ".join(re.sub(r"\bstatic\b", "", sig).split())
fwd, seen = [], set()
for nm, s, e, sg in spans:
    real = _sig_name(sg)
    if not real or real in wantset or real in seen:
        continue
    if not re.search(r"\b" + re.escape(real) + r"\s*\(", wanted_bodies):
        continue  # not called by any function in the run
    cs = _clean_sig(sg)
    if cs:
        seen.add(real)
        fwd.append(cs + ";")
if fwd:
    out.append("\n/* prototypes for same-file helpers called by this run */\n" + "\n".join(fwd))

missing = [w for w in wanted if w not in byname]
if missing:
    sys.stderr.write(f"WARNING: functions not found: {missing}\n")
for w in wanted:
    if w in byname:
        s, e = byname[w]
        out.append("\n" + src[s:e].strip("\n"))
sys.stdout.write("\n".join(out) + "\n")
