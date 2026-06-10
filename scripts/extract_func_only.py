#!/usr/bin/env python3
"""Extract ONLY the named function bodies (+ the US file's #include lines) from a
US translation unit, DROPPING all file-scope data definitions.

Difference from extract_run.py: extract_run keeps the TU's file-scope data
(EWRAM_DATA globals, statics) so a whole RUN can be ported with its data placed
into carved_ram. That re-DEFINES the TU's globals -- which COLLIDES (multiple
definition) when those globals are already emitted by a sibling carve of the same
TU (the partial-TU case). For graduating a SINGLE stranded exact-tier function
whose TU data is already placed and whose globals are declared `extern` in the
project headers, we want the function alone: its data references then resolve to
the already-placed globals via the header externs, and only the function's .text
is added (no .data/.bss, no collision).

Keeps:  every top-level `#include` / `#define` from the US file header, plus the
        requested function definitions in source order, plus same-file-helper
        prototypes (so agbcc -Wimplicit -Werror is satisfied for forward refs).
Drops:  file-scope variable definitions (EWRAM_DATA / CONST_DATA / plain globals
        and statics), struct/enum/typedef defs (the headers already provide them;
        re-including is harmless but unnecessary -- we drop to stay minimal).

Usage: scripts/extract_func_only.py <us_src.c> <Func1> [<Func2> ...] > subset.c
"""
import re, sys

src = open(sys.argv[1]).read()
wanted = sys.argv[2:]
n = len(src)


def skip_string(i, q):
    i += 1
    while i < n:
        if src[i] == "\\":
            i += 2; continue
        if src[i] == q:
            return i + 1
        i += 1
    return i


# Collect the leading #include / #define block (header), and each top-level
# function body span. We walk top level tracking brace depth.
includes = []
spans = []           # (name, start, end)
i = 0
depth = 0
seg_start = 0
func_start = None

while i < n:
    c = src[i]
    if c == "#" and (i == 0 or src[i - 1] == "\n"):
        j = src.find("\n", i)
        while j != -1 and src[j - 1] == "\\":
            j = src.find("\n", j + 1)
        line_end = n if j == -1 else j + 1
        line = src[i:line_end]
        if depth == 0 and re.match(r"#\s*include", line):
            includes.append(line.rstrip("\n"))
        i = line_end
        if depth == 0:
            seg_start = i
            func_start = None
        continue
    if c in '"\'':
        i = skip_string(i, c)
        continue
    if c == "/" and i + 1 < n and src[i + 1] == "/":
        j = src.find("\n", i)
        i = n if j == -1 else j + 1
        continue
    if c == "/" and i + 1 < n and src[i + 1] == "*":
        j = src.find("*/", i)
        i = n if j == -1 else j + 2
        continue
    if c == "{":
        if depth == 0:
            brace_open = i
            # the function/aggregate signature is seg_start..i
        depth += 1
        i += 1
        continue
    if c == "}":
        depth -= 1
        i += 1
        if depth == 0:
            sig = src[seg_start:brace_open]
            mname = re.search(r"([A-Za-z_]\w*)\s*\([^;{]*$", sig)
            after = src[i:i + 4]
            is_func = bool(mname) and "(" in sig
            # skip aggregate defs (struct/enum/union/typedef ... { } ;)
            if re.search(r"\b(struct|union|enum|typedef)\b", sig.split("(")[0]) and not is_func:
                is_func = False
            if is_func:
                spans.append((mname.group(1), seg_start, i))
            seg_start = i
            func_start = None
        continue
    if c == ";" and depth == 0:
        seg_start = i + 1
        func_start = None
    i += 1

# Build output: includes, then helper prototypes for same-file callees of the
# wanted funcs (best-effort, so forward references compile), then the funcs.
out = []
out.append('#include "global.h"')
for inc in includes:
    if 'global.h' not in inc:
        out.append(inc)
out.append("")

bodies = []
allnames = {nm for nm, _, _ in spans}
for nm, s, e in spans:
    if nm in wanted:
        bodies.append((s, src[s:e].lstrip("\n")))
bodies.sort()

# same-file helper prototypes: any wanted-func body calls a same-file function
# defined AFTER it -> emit a prototype. Best-effort: emit prototypes for all
# same-file funcs the bodies reference and that are defined later.
proto_lines = []
body_text = "\n".join(b for _, b in bodies)
for nm, s, e in spans:
    if nm in wanted:
        continue
    if re.search(r"\b" + re.escape(nm) + r"\s*\(", body_text):
        sig = src[:s]
        # find this function's signature (text before its body's '{')
        m = re.search(r"([A-Za-z_][\w\s\*]*?\b" + re.escape(nm) + r"\s*\([^;{]*\))\s*$",
                      src[max(0, s - 400):e].split("{")[0])
        if m:
            proto = re.sub(r"\s+", " ", m.group(1).strip())
            proto_lines.append(proto + ";")

for p in sorted(set(proto_lines)):
    out.append(p)
if proto_lines:
    out.append("")

for _, b in bodies:
    out.append(b)
    out.append("")

sys.stdout.write("\n".join(out).rstrip() + "\n")
