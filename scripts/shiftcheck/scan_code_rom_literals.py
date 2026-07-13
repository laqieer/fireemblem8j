#!/usr/bin/env python3
"""Reject raw ROM-address-shaped numeric literals in linked C code.

agbcc can place a numeric C constant such as ``0x080E334E`` directly in a
function's literal pool without emitting ``R_ARM_ABS32``.  Relocation-only
audits therefore report a false zero for this class even though the word stays
stale in a shifted-ROM link.

This scanner covers every linked ``src/**/*.c`` translation unit except
``src/data/**``.  It removes comments plus string/character literals while
preserving byte offsets and newlines, so ordinary code and preprocessor
expressions (including ``#define`` bodies) remain visible.

Only three proven packed-value contexts are accepted:

* ROM-looking words inside the ``gMsgHuffmanTable`` initializer;
* the exact ``0x08001000`` coefficient in ``gWorldmapMapmu_1``;
* the exact ``0x08A708A7`` OpSubtitle palette-fill word.
"""

import argparse
from collections import Counter
from dataclasses import dataclass
from pathlib import Path
import re
import subprocess
import sys


ROM_LITERAL_RE = re.compile(
    r"(?<![A-Za-z0-9_])"
    r"(?P<core>0[xX]0[89][0-9A-Fa-f]{6})"
    r"(?P<suffix>[uUlL]*)"
    r"(?![A-Za-z0-9_])"
)

ALLOW_HUFFMAN = "gMsgHuffmanTable packed values"
ALLOW_WORLDMAP = "gWorldmapMapmu_1 spline coefficient"
ALLOW_OPSUBTITLE = "OpSubtitle palette fill word"
ALLOW_ORDER = (ALLOW_HUFFMAN, ALLOW_WORLDMAP, ALLOW_OPSUBTITLE)


@dataclass(frozen=True)
class Finding:
    path: str
    line: int
    token: str
    context: str


def strip_non_code(text):
    """Replace comments and string/character contents with spaces.

    Newlines and total string length are preserved, so match offsets still map
    to the original source and ``#define`` expressions remain scannable.
    """

    out = list(text)
    i = 0
    state = "code"

    while i < len(text):
        char = text[i]
        nxt = text[i + 1] if i + 1 < len(text) else ""

        if state == "code":
            if char == "/" and nxt == "/":
                out[i] = out[i + 1] = " "
                i += 2
                state = "line-comment"
                continue
            if char == "/" and nxt == "*":
                out[i] = out[i + 1] = " "
                i += 2
                state = "block-comment"
                continue
            if char == '"':
                out[i] = " "
                i += 1
                state = "string"
                continue
            if char == "'":
                out[i] = " "
                i += 1
                state = "char"
                continue

        elif state == "line-comment":
            if char == "\n":
                state = "code"
            else:
                out[i] = " "
            i += 1
            continue

        elif state == "block-comment":
            if char == "*" and nxt == "/":
                out[i] = out[i + 1] = " "
                i += 2
                state = "code"
                continue
            if char != "\n":
                out[i] = " "
            i += 1
            continue

        else:
            if char == "\\":
                out[i] = " "
                if i + 1 < len(text) and text[i + 1] != "\n":
                    out[i + 1] = " "
                i += 2
                continue

            terminator = '"' if state == "string" else "'"
            if char == terminator:
                out[i] = " "
                state = "code"
            elif char != "\n":
                out[i] = " "
            i += 1
            continue

        i += 1

    return "".join(out)


def find_initializer_span(clean, name):
    """Return the brace span for a named array initializer, if present."""

    pattern = re.compile(
        r"\b" + re.escape(name) + r"\b"
        r"(?:\s*\[[^\]]*\])?\s*=\s*\{"
    )
    match = pattern.search(clean)
    if match is None:
        return None

    start = clean.find("{", match.start(), match.end())
    depth = 0
    for index in range(start, len(clean)):
        if clean[index] == "{":
            depth += 1
        elif clean[index] == "}":
            depth -= 1
            if depth == 0:
                return start, index + 1

    return None


def _inside(offset, span):
    return span is not None and span[0] <= offset < span[1]


def _palette_literal_offsets(clean):
    pattern = re.compile(
        r"\bCpuFastFill\s*\(\s*"
        r"(?P<token>0[xX]08A708A7)\s*,\s*"
        r"PAL_BG\s*\(\s*0[xX]E\s*\)\s*,\s*"
        r"0[xX]20\s*\)",
        re.IGNORECASE,
    )
    return {match.start("token") for match in pattern.finditer(clean)}


def _source_context(text, start, end, limit=180):
    line_start = text.rfind("\n", 0, start) + 1
    line_end = text.find("\n", end)
    if line_end < 0:
        line_end = len(text)

    line = text[line_start:line_end].strip()
    if len(line) <= limit:
        return line

    token_column = start - line_start
    left = max(0, token_column - limit // 2)
    right = min(len(text[line_start:line_end]), left + limit)
    excerpt = text[line_start + left:line_start + right].strip()
    if left:
        excerpt = "..." + excerpt
    if right < line_end - line_start:
        excerpt += "..."
    return excerpt


def scan_source(path, text):
    """Return ``(findings, allowed_counts)`` for one repository-relative path."""

    clean = strip_non_code(text)
    huffman_span = None
    worldmap_span = None
    palette_offsets = set()

    if path == "src/msg_data.c":
        huffman_span = find_initializer_span(clean, "gMsgHuffmanTable")
    elif path == "src/worldmap_mapmu_080C2224.c":
        worldmap_span = find_initializer_span(clean, "gWorldmapMapmu_1")
    elif path == "src/opsubtitle_080C9644.c":
        palette_offsets = _palette_literal_offsets(clean)

    findings = []
    allowed = Counter()

    for match in ROM_LITERAL_RE.finditer(clean):
        core = match.group("core").lower()
        label = None

        if path == "src/msg_data.c" and _inside(match.start(), huffman_span):
            label = ALLOW_HUFFMAN
        elif (
            path == "src/worldmap_mapmu_080C2224.c"
            and core == "0x08001000"
            and _inside(match.start(), worldmap_span)
        ):
            label = ALLOW_WORLDMAP
        elif (
            path == "src/opsubtitle_080C9644.c"
            and core == "0x08a708a7"
            and match.start() in palette_offsets
        ):
            label = ALLOW_OPSUBTITLE

        if label is not None:
            allowed[label] += 1
            continue

        findings.append(
            Finding(
                path=path,
                line=clean.count("\n", 0, match.start()) + 1,
                token=match.group(0),
                context=_source_context(text, match.start(), match.end()),
            )
        )

    return findings, allowed


def filter_linked_sources(paths, object_names):
    """Keep C paths whose same-stem object appears in ``objects.lst``."""

    linked = []
    for path in paths:
        obj = str(Path(path).with_suffix(".o"))
        if obj in object_names:
            linked.append(path)
    return linked


def linked_code_sources(repo, objects_list):
    tracked = subprocess.check_output(
        ["git", "-C", str(repo), "ls-files", "src"],
        text=True,
        errors="replace",
    ).splitlines()
    candidates = sorted(
        path
        for path in tracked
        if path.endswith(".c") and not path.startswith("src/data/")
    )

    object_names = set(objects_list.read_text(encoding="utf-8").split())
    return filter_linked_sources(candidates, object_names)


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo", help="repository root (default: git toplevel)")
    parser.add_argument(
        "--objects-list",
        default="objects.lst",
        help="linked object response file, relative to the repository root",
    )
    args = parser.parse_args(argv)

    if args.repo:
        repo = Path(args.repo).resolve()
    else:
        repo = Path(
            subprocess.check_output(
                ["git", "rev-parse", "--show-toplevel"], text=True
            ).strip()
        )

    objects_list = Path(args.objects_list)
    if not objects_list.is_absolute():
        objects_list = repo / objects_list
    if not objects_list.is_file():
        print(
            f"error: linked object list not found: {objects_list}",
            file=sys.stderr,
        )
        return 2

    sources = linked_code_sources(repo, objects_list)
    findings = []
    allowed = Counter()

    for relpath in sources:
        text = (repo / relpath).read_text(encoding="utf-8", errors="replace")
        source_findings, source_allowed = scan_source(relpath, text)
        findings.extend(source_findings)
        allowed.update(source_allowed)

    print("CODE RAW-ROM LITERAL AUDIT")
    print(
        f"linked code C sources scanned: {len(sources)} "
        "(src/**/*.c, excluding src/data/**)"
    )
    print("classified packed-value contexts:")
    for label in ALLOW_ORDER:
        print(f"  {label}: {allowed[label]}")
    print(f"classified packed-value tokens: {sum(allowed.values())}")
    print(f"unexplained raw ROM literals: {len(findings)}")

    if findings:
        print()
        for finding in findings:
            print(
                f"{finding.path}:{finding.line}: {finding.token}: "
                "unclassified raw ROM literal"
            )
            print(f"  {finding.context}")
        print("\nRESULT: FAIL (symbolize every unexplained code literal)")
        return 1

    print("RESULT: PASS (no unexplained raw code ROM literals)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
