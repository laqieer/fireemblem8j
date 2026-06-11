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
defines = []         # (macro_name, full #define text) -- TU-private helper macros
aggregates = []      # (tag_name, full text) -- TU-private struct/union/enum/typedef defs
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
        elif depth == 0:
            md = re.match(r"#\s*define\s+([A-Za-z_]\w*)", line)
            if md:
                defines.append((md.group(1), line.rstrip("\n")))
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
            else:
                # A TU-private aggregate definition (`struct PalFadeProc { .. };`,
                # `typedef struct { .. } Foo;`, `enum { .. };`). The headers usually
                # provide such types, but some are file-LOCAL (bmlib's PalFadeProc) --
                # dropping them leaves the run's bodies dereferencing an incomplete
                # type ("dereferencing pointer to incomplete type" -Werror). Record
                # the full `... { } <trailer> ;` span keyed by its tag/typedef name so
                # the emitter can re-include only the ones the bodies reference.
                head = sig.split("(")[0] if mname else sig
                if re.search(r"\b(struct|union|enum|typedef)\b", head):
                    end_semi = src.find(";", i)
                    agg_end = end_semi + 1 if end_semi != -1 else i
                    agg_text = src[seg_start:agg_end].lstrip("\n")
                    # the type name is the tag after struct/union/enum, AND/OR the
                    # typedef alias just before the closing ';'. Capture both.
                    names = set()
                    tag = re.search(r"\b(?:struct|union|enum)\s+([A-Za-z_]\w*)", head)
                    if tag:
                        names.add(tag.group(1))
                    trailer = src[i:agg_end]            # `} Alias;` for typedefs
                    alias = re.search(r"\}\s*([A-Za-z_]\w*)\s*;", trailer)
                    if alias:
                        names.add(alias.group(1))
                    if names:
                        aggregates.append((names, agg_text))
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
body_text = "\n".join(b for _, b in bodies)

# TU-private aggregate definitions (e.g. bmlib's file-local `struct PalFadeProc`)
# that the headers do NOT provide: emit only the ones the extracted bodies
# REFERENCE by name, so a body dereferencing the type isn't left with an
# incomplete type ("dereferencing pointer to incomplete type" -Werror). Emit
# BEFORE the funcs (and before the #defines, which may use the type). Re-emitting
# a type the headers DO provide would be a redefinition, but agbcc (C89) tolerates
# an identical struct re-declaration only via tag, not typedef -- so restrict to
# names that don't already resolve from headers is not possible at this layer;
# verify-or-revert (make compare) guards a wrong emit, and in practice the dropped
# file-local types are exactly the ones headers lack.
emitted_aggs = []
for names, atext in aggregates:
    if any(re.search(r"\b" + re.escape(nm) + r"\b", body_text) for nm in names):
        emitted_aggs.append(atext)
for atext in emitted_aggs:
    out.append(atext)
if emitted_aggs:
    out.append("")

# TU-private helper #defines (e.g. scene's function-like TALK_TEXT_BY_LINE) that
# the headers do NOT provide: emit only the ones the extracted bodies REFERENCE,
# so a referenced macro doesn't look like an undeclared function (an
# `implicit declaration of function TALK_TEXT_BY_LINE` -Werror failure). Limiting
# to referenced names avoids redefining a header macro the run doesn't use.
for mname, mtext in defines:
    if re.search(r"\b" + re.escape(mname) + r"\b", body_text):
        out.append(mtext)
if any(re.search(r"\b" + re.escape(m) + r"\b", body_text) for m, _ in defines):
    out.append("")

# same-file helper prototypes: any wanted-func body calls a same-file function
# defined AFTER it -> emit a prototype. Best-effort: emit prototypes for all
# same-file funcs the bodies reference and that are defined later.
proto_lines = []
for nm, s, e in spans:
    if nm in wanted:
        continue
    if re.search(r"\b" + re.escape(nm) + r"\s*\(", body_text):
        # find this function's signature (text before its body's '{').
        # Strip // and /* */ comments first: a preceding `//! FE8U = 0x...`
        # annotation otherwise leaks into the captured signature (the
        # `[A-Za-z_]` start can latch onto the `x` of a `0x...` literal),
        # producing invalid C like `x08007838 int Foo(int)` -> compile fail.
        region = src[max(0, s - 400):e].split("{")[0]
        region = re.sub(r"//[^\n]*", "", region)
        region = re.sub(r"/\*.*?\*/", "", region, flags=re.S)
        m = re.search(r"([A-Za-z_][\w\s\*]*?\b" + re.escape(nm) + r"\s*\([^;{]*\))\s*$",
                      region)
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
