#!/usr/bin/env python3
"""Classify inline __asm__ data blobs embedded in src/**/*.c.

The audit is intentionally conservative: it identifies accepted event-script and
section-glue patterns to leave in place, and highlights extractable palette,
proc-script, graphics, and data-table blocks for follow-up extraction.
"""

from __future__ import annotations

import argparse
import csv
import json
import os
import re
from collections import Counter, defaultdict
from dataclasses import dataclass, asdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "src"

CATEGORIES = (
    "PALETTE",
    "PROC_SCRIPT",
    "GRAPHICS",
    "DATA_TABLE",
    "EVENT_SCRIPT",
    "SECTION_GLUE",
    "UNRESOLVED",
)

PROC_OPS = set(range(0x00, 0x1A))
EVENT_HINT_RE = re.compile(r"(EventListScr|Events?_ref|EventData|MapChanges|TileAnimations|Tutorial|Ch\d+|FinalEphraim|Prologue|TowerOfValni|LagdouRuins)")
PROC_HINT_RE = re.compile(r"(ProcScr|gProcScr|ProcCmd)")
PAL_HINT_RE = re.compile(r"(palette|_pal\b|pal_|agbpal|gbapal)", re.I)
GFX_HINT_RE = re.compile(r"(gfx|graphics|tiles|tile|sprite|anim_|banim|oam|tsa|img|bitmap|font|glyph|highlight|aurabg|opanim|dracozombie|ekrtriangle)", re.I)
SECTION_GLUE_RE = re.compile(r"\.section\s+[^,]*\.gap\d+\b")
SYMBOL_RE = re.compile(r"^[A-Za-z_]\w*(?:\s*[+-]\s*(?:0x[0-9A-Fa-f]+|\d+))?$")
LABEL_RE = re.compile(r"^([A-Za-z_]\w*):")
ITEM_RE = re.compile(r"\.(4byte|short|2byte|byte|incbin)\s+(.+)$")
SECTION_RE = re.compile(r"\.section\s+([^,\\]+)")
HEX_RE = re.compile(r"^-?(?:0x[0-9A-Fa-f]+|\d+)$")


@dataclass
class Block:
    file: str
    index: int
    start_line: int
    end_line: int
    section: str
    labels: list[str]
    directives: Counter
    numeric_words: list[int]
    numeric_shorts: list[int]
    numeric_bytes: list[int]
    symbolic_words: list[str]
    incbins: list[str]
    category: str
    confidence: str
    reason: str
    action: str


def unquote_asm_lines(lines: list[str]) -> list[str]:
    out = []
    for line in lines:
        if line.strip() in (");", ");\n"):
            continue
        # Inline asm blobs are C strings; decode the quoted payloads only.
        parts = re.findall(r'"((?:[^"\\]|\\.)*)"', line)
        if not parts:
            continue
        for part in parts:
            try:
                text = bytes(part, "utf-8").decode("unicode_escape")
            except UnicodeDecodeError:
                text = part.replace(r"\n", "\n").replace(r"\t", "\t")
            for asm_line in text.splitlines():
                s = asm_line.strip()
                if s:
                    out.append(s)
    return out


def split_operands(text: str) -> list[str]:
    out = []
    cur = []
    in_str = False
    esc = False
    for ch in text:
        if in_str:
            cur.append(ch)
            if esc:
                esc = False
            elif ch == "\\":
                esc = True
            elif ch == '"':
                in_str = False
            continue
        if ch == '"':
            in_str = True
            cur.append(ch)
        elif ch == ',':
            tok = ''.join(cur).strip()
            if tok:
                out.append(tok)
            cur = []
        else:
            cur.append(ch)
    tok = ''.join(cur).strip()
    if tok:
        out.append(tok)
    return out


def parse_int(tok: str) -> int | None:
    tok = tok.strip()
    if not HEX_RE.match(tok):
        return None
    try:
        return int(tok, 0)
    except ValueError:
        return None


def find_blocks(path: Path) -> list[tuple[int, int, list[str]]]:
    lines = path.read_text(encoding="utf-8", errors="surrogateescape").splitlines()
    blocks = []
    i = 0
    while i < len(lines):
        if "__asm__" not in lines[i]:
            i += 1
            continue
        start = i
        depth = lines[i].count("(") - lines[i].count(")")
        i += 1
        while i < len(lines):
            depth += lines[i].count("(") - lines[i].count(")")
            if lines[i].strip() == ");" or depth <= 0:
                break
            i += 1
        end = min(i, len(lines) - 1)
        blocks.append((start + 1, end + 1, lines[start:end + 1]))
        i = end + 1
    return blocks


def proc_score(words: list[int]) -> tuple[bool, str]:
    if len(words) < 2 or len(words) % 2:
        return False, "not even 4-byte ProcCmd word pairs"
    entries = []
    for i in range(0, min(len(words), 80), 2):
        opword = words[i]
        op16 = opword & 0xFFFF
        op8 = opword & 0xFF
        imm_high = (opword >> 16) & 0xFFFF
        if op16 not in PROC_OPS and op8 not in PROC_OPS:
            break
        entries.append((op16 if op16 in PROC_OPS else op8, imm_high))
        if (op16 if op16 in PROC_OPS else op8) == 0:
            return len(entries) >= 1, "valid ProcCmd opcode pairs ending in PROC_END"
    if len(entries) >= 3:
        return True, "several leading ProcCmd-looking opcode pairs"
    return False, "not ProcCmd-shaped"


def classify(rel: str, idx: int, start: int, end: int, raw: list[str]) -> Block:
    asm = unquote_asm_lines(raw)
    labels: list[str] = []
    dirs: Counter = Counter()
    words: list[int] = []
    shorts: list[int] = []
    bytes_: list[int] = []
    sym_words: list[str] = []
    incbins: list[str] = []
    sections: list[str] = []

    for line in asm:
        mg = re.search(r"\.global\s+([A-Za-z_]\w*)", line)
        if mg and mg.group(1) not in labels:
            labels.append(mg.group(1))
        ml = LABEL_RE.match(line)
        if ml and ml.group(1) not in labels:
            labels.append(ml.group(1))
        ms = SECTION_RE.search(line)
        if ms:
            sections.append(ms.group(1).strip())
        mi = ITEM_RE.search(line)
        if not mi:
            continue
        kind, rest = mi.group(1), mi.group(2).strip()
        if kind == "2byte":
            kind = "short"
        dirs[kind] += 1
        if kind == "incbin":
            incbins.append(rest)
            continue
        for tok in split_operands(rest):
            val = parse_int(tok)
            if kind == "4byte":
                if val is None:
                    sym_words.append(tok)
                else:
                    words.append(val & 0xFFFFFFFF)
            elif kind in ("short", "2byte") and val is not None:
                shorts.append(val & 0xFFFF)
            elif kind == "byte" and val is not None:
                bytes_.append(val & 0xFF)

    text = "\n".join(asm)
    label_text = " ".join(labels + [rel] + sections + incbins)
    section = sections[0] if sections else ""
    only_symbol_refs = bool(sym_words) and not words and not shorts and not bytes_ and not incbins
    proc_ok, proc_reason = proc_score(words)

    has_pal_name = bool(PAL_HINT_RE.search(" ".join(labels + incbins)))
    has_gfx_name = bool(GFX_HINT_RE.search(label_text))
    pal_sized_shorts = len(shorts) in (16, 32, 48, 64, 128, 256) and not words and not incbins and len(bytes_) == 0
    has_gbapal_incbin = any(".gbapal" in x or ".agbpal" in x for x in incbins)

    if ".set" in text and not (words or shorts or bytes_ or incbins or sym_words):
        cat, conf, reason, action = "SECTION_GLUE", "high", "global .set alias glue only", "LEFT relocatable alias glue"
    elif EVENT_HINT_RE.search(label_text) and not (has_pal_name or has_gfx_name):
        cat, conf, reason, action = "EVENT_SCRIPT", "high", "event/map/tile-animation naming pattern", "LEFT accepted event-script pattern"
    elif PROC_HINT_RE.search(label_text) or proc_ok:
        cat, conf, reason, action = "PROC_SCRIPT", "high" if proc_ok or PROC_HINT_RE.search(label_text) else "medium", proc_reason if proc_ok else "ProcScr naming pattern", "EXTRACT typed struct ProcCmd"
    elif (has_pal_name and not incbins and not words and not bytes_) or pal_sized_shorts:
        highbit = any(v & 0x8000 for v in shorts)
        why = "palette naming" if has_pal_name else f"{len(shorts)} RGB555-sized halfwords"
        cat, conf, reason, action = "PALETTE", "high" if has_pal_name else "medium", why, "EXTRACT .agbpal + INCBIN_U8" if highbit else "EXTRACT .pal source + INCBIN_U8"
    elif (incbins and has_gfx_name) or (len(bytes_) >= 32 and has_gfx_name) or (has_gfx_name and (len(words) + len(shorts) + len(bytes_) >= 16)):
        detail = "mixed graphics/palette asset bundle" if (has_gbapal_incbin or has_pal_name) else "graphics-like naming or embedded incbin/byte runs"
        cat, conf, reason, action = "GRAPHICS", "medium", detail, "EXTRACT graphics source where format is clear"
    elif SECTION_GLUE_RE.search(text) and only_symbol_refs:
        cat, conf, reason, action = "SECTION_GLUE", "high", "gap section with only symbolic relocatable refs", "LEFT relocatable section glue"
    elif words or sym_words or shorts or bytes_:
        falseptr = ""
        if sym_words and (words or shorts or bytes_):
            falseptr = "; mixed symbolic words with raw data: audit false pointers"
        cat, conf, reason, action = "DATA_TABLE", "medium", "structured scalar/pointer data" + falseptr, "EXTRACT typed C or fix false pointer after source/consumer/FE8U audit"
    else:
        cat, conf, reason, action = "UNRESOLVED", "low", "no recognized asm payload", "LEFT pending manual audit"

    return Block(
        file=rel,
        index=idx,
        start_line=start,
        end_line=end,
        section=section,
        labels=labels,
        directives=dirs,
        numeric_words=words,
        numeric_shorts=shorts,
        numeric_bytes=bytes_,
        symbolic_words=sym_words,
        incbins=incbins,
        category=cat,
        confidence=conf,
        reason=reason,
        action=action,
    )


def audit() -> list[Block]:
    records = []
    for path in sorted(SRC.rglob("*.c")):
        rel = path.relative_to(ROOT).as_posix()
        blocks = find_blocks(path)
        if not blocks:
            continue
        for idx, (start, end, raw) in enumerate(blocks, 1):
            records.append(classify(rel, idx, start, end, raw))
    return records


def write_tsv(records: list[Block], out: Path) -> None:
    out.parent.mkdir(parents=True, exist_ok=True)
    fields = [
        "category", "confidence", "file", "block", "lines", "section", "labels",
        "directives", "n_words", "n_sym_words", "n_shorts", "n_bytes", "n_incbins", "reason", "action",
    ]
    with out.open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fields, delimiter="\t", lineterminator="\n")
        w.writeheader()
        for r in records:
            w.writerow({
                "category": r.category,
                "confidence": r.confidence,
                "file": r.file,
                "block": r.index,
                "lines": f"{r.start_line}-{r.end_line}",
                "section": r.section,
                "labels": ",".join(r.labels[:8]) + (",..." if len(r.labels) > 8 else ""),
                "directives": json.dumps(dict(r.directives), sort_keys=True),
                "n_words": len(r.numeric_words),
                "n_sym_words": len(r.symbolic_words),
                "n_shorts": len(r.numeric_shorts),
                "n_bytes": len(r.numeric_bytes),
                "n_incbins": len(r.incbins),
                "reason": r.reason,
                "action": r.action,
            })


def print_summary(records: list[Block]) -> None:
    by_cat = Counter(r.category for r in records)
    file_cats: dict[str, set[str]] = defaultdict(set)
    for r in records:
        file_cats[r.file].add(r.category)
    print(f"Inline __asm__ audit: {len(records)} blocks in {len(file_cats)} files")
    print("Per-block counts:")
    for cat in CATEGORIES:
        print(f"  {cat}: {by_cat.get(cat, 0)}")
    print("Per-file lists:")
    for cat in CATEGORIES:
        files = sorted(f for f, cats in file_cats.items() if cat in cats)
        print(f"\n[{cat}] {len(files)} files")
        for f in files:
            print(f"  {f}")


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--tsv", default=None, help="write detailed TSV report")
    ap.add_argument("--json", default=None, help="write JSON report")
    args = ap.parse_args()
    records = audit()
    if args.tsv:
        write_tsv(records, ROOT / args.tsv)
    if args.json:
        out = ROOT / args.json
        out.parent.mkdir(parents=True, exist_ok=True)
        payload = []
        for r in records:
            d = asdict(r)
            d["directives"] = dict(r.directives)
            # Keep JSON useful but compact: counts, not full payload bytes.
            d["numeric_words"] = len(r.numeric_words)
            d["numeric_shorts"] = len(r.numeric_shorts)
            d["numeric_bytes"] = len(r.numeric_bytes)
            d["symbolic_words"] = len(r.symbolic_words)
            payload.append(d)
        out.write_text(json.dumps(payload, indent=2, sort_keys=True), encoding="utf-8")
    print_summary(records)


if __name__ == "__main__":
    main()
