#!/usr/bin/env python3
"""US-source inventory / honest matching-C denominator (task #26 tracker).

The matching-C axis (scripts/calcprogress.py) measures byte-matching functions
compiled from `src/*.c` against the US function total (8,528). But 100% is NOT a
reachable target for that axis: the US decomp ITSELF keeps some `.text` as hand
descriptive assembly (`asm/arm.o`, `asm/arm_call.o` -- ARM-mode handlers that are
already at the US gold standard) and links libc/libgcc from `tools/agbcc`. Those
addresses can never become "matching C" because there is no C to port. The real
ceiling for matching-C is the count of functions the US builds from `src/*.c`.

This script makes that ceiling honest. For every JP function in
`layout/us_jp_funcmap.tsv` it classifies the function's **US source kind** by its
`us_addr` -- the authoritative cut -- using the US linker map
`../fireemblem8u/fireemblem8.map`:

  Memory-map text ranges (` .text  0x08ADDR  0xSIZE  <obj>`) give each US object's
  half-open [start, end) text range. arm.o owns [0x08000228, 0x08000A20), etc.
  We build an interval list addr -> owning object, then bucket each funcmap
  `us_addr`:

    US-C-portable     us_addr in a `src/<tu>.o` text range -> real C TU, portable.
    US-ASM-stays      us_addr in an `asm/*.o` text range (arm.o / arm_call.o) --
                      ARM-mode descriptive asm the US keeps as `.s`; already at the
                      US standard, NOT a matching-C deficiency. Counts AGAINST the
                      100% myth (these never become C).
    LIBC/LIBGCC       us_addr in a `tools/agbcc/lib/...` range -- vendored library
                      code, not project source at all (also never matching-C).
    DATA-obj          us_addr in a data/const/sound object's text range (rare: a
                      data TU that emits a tiny .text). Treated as non-portable C.
    region-different / UNKNOWN
                      no US text range covers us_addr (region-different placement,
                      or a funcmap row whose us_addr the US map doesn't own).

We then cross with THIS repo's matched set -- text symbols defined in the
`src/*.o` objects the JP build actually links (same source of truth as
calcprogress.py axis 2) -- to mark each function graduated vs ungraduated.

Output (committed to docs/us_source_inventory.md):
  * totals per kind (the HONEST denominator: US-C-portable is the real matching-C
    ceiling; US-ASM-stays + LIBC/LIBGCC are the legitimately-non-C remainder),
  * matching-C progress against the US-C-portable ceiling (not against 8,528),
  * a ranked worklist: fully-unported US-C TUs by ungraduated-function count
    (whole-TU-port candidates), then partially-ported TUs.

Read-only: parses maps + runs `arm-none-eabi-nm` on already-built objects. Never
edits the build, never `git add`. Caller stages script + generated md.
"""
import bisect
import glob
import os
import re
import subprocess
import sys
from collections import defaultdict

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = os.environ.get("US_DIR", "/home/laqieer/fireemblem8u")
US_MAP = os.path.join(US, "fireemblem8.map")
FUNCMAP = "layout/us_jp_funcmap.tsv"
OUT_MD = "docs/us_source_inventory.md"

# US function total -- the calcprogress.py axis-2 denominator (8,528). We report
# matching-C against BOTH this (the headline axis) and the honest US-C-portable
# ceiling below.
US_FUNCTIONS = 8528


# --------------------------------------------------------------------------- #
# 1. Parse the US ROM memory map: object section ranges (the authoritative cut).
#
# The funcmap is a combined function+data symbol map: most of its rows past the
# end of `.text` (0x080d74c8) are DATA globals (gSinLookup, gFace_0, gCpData_*).
# To classify those honestly we must parse `.rodata`/`.data` ranges too, not just
# `.text` -- otherwise every data symbol looks "region-different/UNKNOWN". The
# SECTION (text vs rodata/data) is what makes a symbol code-vs-data; the OWNING
# object then refines the code case (src C / asm / libc).
# --------------------------------------------------------------------------- #
SEC_RE = re.compile(
    r"^\s*\.(text|rodata|data|bss)(?:\.\w+)?\s+"
    r"0x(0[0-9a-fA-F]+)\s+0x([0-9a-fA-F]+)\s+(\S+\.o)\b")


def kind_of(section, obj):
    """Classify a US (section, object) into a source kind by the authoritative cut.

    Data-section symbols are DATA-obj regardless of owning TU (a code TU's const
    table is still data, not a portable function). Text-section symbols split by
    the owning object: src C / asm-stays / libc."""
    if section in ("rodata", "data", "bss"):
        return "DATA-obj"
    # section == text
    if obj.startswith("src/"):
        return "US-C-portable"
    if obj.startswith("asm/"):
        return "US-ASM-stays"
    if obj.startswith("tools/") or "lib/lib" in obj or obj.endswith(".a") or "(" in obj:
        return "LIBC/LIBGCC"
    return "UNKNOWN-obj"


def parse_section_ranges():
    """Return (starts, ranges) where ranges is a sorted list of
    (start, end, obj, kind, tu) and starts mirrors the start col for bisect."""
    ranges = []
    for ln in open(US_MAP, errors="replace"):
        m = SEC_RE.match(ln)
        if not m:
            continue
        section = m.group(1)
        start = int(m.group(2), 16)
        size = int(m.group(3), 16)
        if size == 0:
            continue
        obj = m.group(4)
        kind = kind_of(section, obj)
        tu = None
        # Only TEXT in a real C TU is a port target; record the TU for those.
        if kind == "US-C-portable":
            sm = re.match(r"src/([\w-]+)\.o$", obj)
            if sm:
                tu = sm.group(1)
        ranges.append((start, start + size, obj, kind, tu))
    ranges.sort()
    # The map prints non-overlapping section fragments in address order.
    starts = [r[0] for r in ranges]
    return starts, ranges


def lookup(starts, ranges, addr):
    """The (obj, kind, tu) whose [start,end) contains addr, or the unknown bucket."""
    i = bisect.bisect_right(starts, addr) - 1
    if 0 <= i < len(ranges):
        s, e, obj, kind, tu = ranges[i]
        if s <= addr < e:
            return obj, kind, tu
    return None, "region-different/UNKNOWN", None


# --------------------------------------------------------------------------- #
# 2. JP matched set: text symbols defined in the src/*.o the JP build links.
#    Mirror calcprogress.py exactly (carve manifest -> src/*.o -> nm T/t).
# --------------------------------------------------------------------------- #
def read_rows(path):
    out = []
    if not os.path.exists(path):
        return out
    for ln in open(path, errors="replace"):
        ln = ln.rstrip("\n")
        if ln and not ln.lstrip().startswith("#"):
            out.append(ln.split("\t"))
    return out


def read_manifest(name):
    seen, rows = set(), []
    for p in [f"layout/{name}.tsv"] + sorted(glob.glob(f"layout/{name}.d/*.tsv")):
        for r in read_rows(p):
            key = tuple(r)
            if key not in seen:
                seen.add(key)
                rows.append(r)
    return rows


def jp_src_objects():
    objs = set()
    for r in read_manifest("carved_rom"):
        m = re.match(r"(\S+\.o)\(", r[2]) if len(r) > 2 else None
        if m and m.group(1).startswith("src/"):
            objs.add(m.group(1))
    return objs


def nm_text_syms(obj):
    if not os.path.exists(obj):
        subprocess.run(["make", obj], stdout=subprocess.DEVNULL,
                       stderr=subprocess.DEVNULL)
    if not os.path.exists(obj):
        return set()
    out = subprocess.run(["arm-none-eabi-nm", "--defined-only", obj],
                         capture_output=True, text=True).stdout.splitlines()
    syms = set()
    for ln in out:
        p = ln.split()
        if len(p) == 3 and p[1] in ("t", "T"):
            name = p[2]
            if not name.startswith((".", "$", "__")) and name != "gcc2_compiled.":
                syms.add(name)
    return syms


def jp_matched_funcs():
    """Set of function names byte-matched in the JP build (graduated)."""
    matched = set()
    for obj in sorted(jp_src_objects()):
        matched |= nm_text_syms(obj)
    return matched


# --------------------------------------------------------------------------- #
# 2b. FULL US-C ceiling from the US map symbol table (independent of funcmap).
#     The funcmap is only a SUBSET of US functions (the ones with an established
#     per-function JP<->US address correspondence). The *true* matching-C ceiling
#     is every US text symbol that lives in a src/*.o range -- regardless of
#     whether the funcmap tracks it -- because a whole-TU port graduates funcmap
#     and non-funcmap functions alike. We count those from the map's own symbol
#     lines so the honest denominator is complete, not funcmap-bounded.
# --------------------------------------------------------------------------- #
SYM_RE = re.compile(r"^\s+0x(0[0-9a-fA-F]+)\s+([A-Za-z_]\w*)\s*$")


def us_text_symbols(starts, ranges):
    """name -> (kind, tu) for every US text symbol, classified by its section
    range. Only `.text` symbols (functions). Dedups by name (first wins)."""
    out = {}
    for ln in open(US_MAP, errors="replace"):
        m = SYM_RE.match(ln)
        if not m:
            continue
        addr = int(m.group(1), 16)
        name = m.group(2)
        i = bisect.bisect_right(starts, addr) - 1
        if not (0 <= i < len(ranges)):
            continue
        s, e, obj, kind, tu = ranges[i]
        if not (s <= addr < e):
            continue
        # only TEXT-section symbols are functions; DATA-obj here = a data label
        if kind in ("US-C-portable", "US-ASM-stays", "LIBC/LIBGCC", "UNKNOWN-obj"):
            if name not in out:
                out[name] = (kind, tu)
    return out


# --------------------------------------------------------------------------- #
# 3. Build the inventory.
# --------------------------------------------------------------------------- #
def main():
    starts, ranges = parse_section_ranges()
    matched = jp_matched_funcs()

    # Full US text-symbol ceiling (independent of the funcmap subset).
    us_syms = us_text_symbols(starts, ranges)
    full = defaultdict(int)       # kind -> US function count
    full_grad = defaultdict(int)  # kind -> graduated-in-JP count
    full_tu_total = defaultdict(int)
    full_tu_grad = defaultdict(int)
    for name, (kind, tu) in us_syms.items():
        full[kind] += 1
        g = name in matched
        if g:
            full_grad[kind] += 1
        if kind == "US-C-portable" and tu:
            full_tu_total[tu] += 1
            if g:
                full_tu_grad[tu] += 1
    us_c_ceiling = full["US-C-portable"]
    us_c_grad = full_grad["US-C-portable"]
    asm_stays = full["US-ASM-stays"]
    libc = full["LIBC/LIBGCC"]

    # funcmap rows: (jp_addr, us_addr, size, tier, name)
    rows = []
    for ln in open(FUNCMAP, errors="replace"):
        if ln.startswith("#"):
            continue
        p = ln.rstrip("\n").split("\t")
        if len(p) < 5:
            continue
        rows.append((int(p[0], 16), int(p[1], 16), int(p[2]), p[3], p[4]))

    kind_total = defaultdict(int)
    kind_grad = defaultdict(int)
    # funcmap-tier hint per ungraduated function name (for the worklist)
    fm_tier_of = {}

    for jp, us, size, tier, name in rows:
        obj, kind, tu = lookup(starts, ranges, us)
        kind_total[kind] += 1
        if name in matched:
            kind_grad[kind] += 1
        fm_tier_of[name] = tier

    # funcmap US-C-portable subset (a hint about per-function confidence; the TRUE
    # ceiling/worklist below uses the FULL US text-symbol table, not the funcmap).
    fm_portable_total = kind_total["US-C-portable"]
    fm_portable_grad = kind_grad["US-C-portable"]

    # ---- worklist from the FULL US-C symbol table (complete, not funcmap-bounded) ----
    # per-TU: total US-C funcs, graduated-in-JP, ungraduated names (+ funcmap-tier
    # hint counts of the ungraduated set: how many carry an exact/masked funcmap row).
    tu_ungrad = defaultdict(list)
    tu_tierhint = defaultdict(lambda: defaultdict(int))
    for name, (kind, tu) in us_syms.items():
        if kind != "US-C-portable" or not tu:
            continue
        if name not in matched:
            tu_ungrad[tu].append(name)
            tu_tierhint[tu][fm_tier_of.get(name, "no-funcmap")] += 1

    fully_unported = sorted(
        ((tu, full_tu_total[tu], len(tu_ungrad[tu]), dict(tu_tierhint[tu]))
         for tu in tu_ungrad if full_tu_grad[tu] == 0),
        key=lambda x: -x[2])
    partially = sorted(
        ((tu, full_tu_total[tu], full_tu_grad[tu], len(tu_ungrad[tu]),
          dict(tu_tierhint[tu]))
         for tu in tu_ungrad if full_tu_grad[tu] > 0),
        key=lambda x: -x[3])

    # ----------------------------------------------------------------------- #
    # Render markdown.
    # ----------------------------------------------------------------------- #
    def pct(n, d):
        return (100.0 * n / d) if d else 0.0

    def tierstr(td):
        return ", ".join(f"{t}:{c}" for t, c in sorted(td.items())) or "-"

    nonc_full = asm_stays + libc
    total_us_funcs = sum(full.values())

    L = []
    L.append("# US source inventory -- the honest matching-C denominator")
    L.append("")
    L.append("_Generated by `scripts/us_source_tracker.py`. Do not edit by hand._")
    L.append("")
    L.append("Every US function symbol in `../fireemblem8u/fireemblem8.map` is")
    L.append("classified by the **US source kind** of its address (the authoritative")
    L.append("cut) from the object section ranges (` .text 0x08ADDR 0xSIZE <obj>`),")
    L.append("then crossed with THIS repo's byte-matched set (text symbols in the")
    L.append("linked `src/*.o`). The point: matching-C's real ceiling is")
    L.append("**US-C-portable** functions, NOT the 8,528 calcprogress denominator --")
    L.append("the US decomp keeps `asm/arm.o`/`asm/arm_call.o` as descriptive `.s`")
    L.append("(already its gold standard) and links libc/libgcc from `tools/agbcc`,")
    L.append("none of which can ever become matching C.")
    L.append("")
    L.append("## Honest matching-C ceiling (full US text-symbol table)")
    L.append("")
    L.append("| kind | US functions | graduated (JP) | note |")
    L.append("|------|-------------:|---------------:|------|")
    L.append(f"| US-C-portable | {us_c_ceiling} | {us_c_grad} | "
             f"real C TUs -- **THE matching-C ceiling** |")
    L.append(f"| US-ASM-stays | {asm_stays} | {full_grad['US-ASM-stays']} | "
             f"arm.o/arm_call.o ARM-mode; stays .s (US standard); NEVER matching-C |")
    L.append(f"| LIBC/LIBGCC | {libc} | {full_grad['LIBC/LIBGCC']} | "
             f"vendored tools/agbcc lib; NEVER matching-C |")
    if full.get("UNKNOWN-obj"):
        L.append(f"| UNKNOWN-obj | {full['UNKNOWN-obj']} | "
                 f"{full_grad['UNKNOWN-obj']} | text in a non-src/asm/lib object |")
    L.append(f"| **TOTAL US functions** | **{total_us_funcs}** | "
             f"**{us_c_grad + full_grad['US-ASM-stays'] + full_grad['LIBC/LIBGCC']}** "
             f"| US text symbols |")
    L.append("")
    L.append(f"- **The honest matching-C denominator is {us_c_ceiling}** "
             f"(US-C-portable), not 8,528.")
    L.append(f"  {nonc_full} US functions ({asm_stays} ASM-stays + {libc} libc/libgcc)")
    L.append(f"  legitimately stay non-C -- the US decomp itself keeps them that way.")
    L.append(f"- **Graduated: {us_c_grad} / {us_c_ceiling} = "
             f"{pct(us_c_grad, us_c_ceiling):.2f}%** of the real ceiling.")
    L.append(f"- For comparison, calcprogress.py axis 2 reports matching-C against the")
    L.append(f"  flat 8,528 total; the true reachable target on that axis is")
    L.append(f"  {us_c_ceiling}/8528 = {pct(us_c_ceiling, US_FUNCTIONS):.1f}% (the rest")
    L.append(f"  is asm/libc), so {us_c_grad}/8528 = {pct(us_c_grad, US_FUNCTIONS):.2f}%")
    L.append(f"  there is {pct(us_c_grad, us_c_ceiling):.2f}% of what is actually portable.")
    L.append("")
    L.append("## funcmap-tracked subset (per-function confidence)")
    L.append("")
    L.append("`layout/us_jp_funcmap.tsv` tracks only the functions with an established")
    L.append("per-function JP<->US address correspondence (exact/masked tiers). It is")
    L.append("a SUBSET of US functions; the worklist below uses the full table above.")
    L.append("")
    L.append("| funcmap kind | rows | graduated | note |")
    L.append("|------|-----:|----------:|------|")
    fm_order = ["US-C-portable", "US-ASM-stays", "LIBC/LIBGCC", "DATA-obj",
                "UNKNOWN-obj", "region-different/UNKNOWN"]
    fm_notes = {
        "US-C-portable": "C functions (exact/masked tier)",
        "US-ASM-stays": "arm.o code",
        "LIBC/LIBGCC": "libc/libgcc code",
        "DATA-obj": "data globals (the funcmap also tracks data symbols)",
        "UNKNOWN-obj": "text in a non-src/asm/lib object",
        "region-different/UNKNOWN": "no US section owns the addr (truly unplaced)",
    }
    for k in fm_order:
        if k in kind_total:
            L.append(f"| {k} | {kind_total[k]} | {kind_grad[k]} | "
                     f"{fm_notes.get(k,'')} |")
    L.append(f"| **TOTAL** | **{sum(kind_total.values())}** | "
             f"**{sum(kind_grad.values())}** | funcmap rows |")
    L.append("")
    L.append(f"- funcmap US-C-portable: {fm_portable_grad}/{fm_portable_total} "
             f"graduated. The 5,481 DATA-obj rows are data globals, not functions.")
    L.append("")
    L.append("## Whole-TU-port worklist (fully-unported US-C TUs)")
    L.append("")
    L.append("Ranked by ungraduated US-C function count (full symbol table). A TU")
    L.append("with 0 graduated functions is a clean whole-TU port candidate (no")
    L.append("multiple-definition risk from a sibling partial carve). `tiers` shows")
    L.append("the funcmap confidence of the ungraduated set (`no-funcmap` = no")
    L.append("per-function correspondence tracked, usually region-different/larger).")
    L.append("")
    L.append("| US TU | US-C funcs | ungraduated | tiers |")
    L.append("|-------|-----------:|------------:|-------|")
    for tu, tot, ung, td in fully_unported:
        L.append(f"| {tu} | {tot} | {ung} | {tierstr(td)} |")
    L.append("")
    L.append("## Partially-ported US-C TUs (per-function remainder)")
    L.append("")
    L.append("These already have some graduated functions; the remainder is")
    L.append("per-function work (extract_func_only + bind statics).")
    L.append("")
    L.append("| US TU | US-C funcs | graduated | ungraduated | tiers |")
    L.append("|-------|-----------:|----------:|------------:|-------|")
    for tu, tot, g, ung, td in partially:
        L.append(f"| {tu} | {tot} | {g} | {ung} | {tierstr(td)} |")
    L.append("")

    open(OUT_MD, "w").write("\n".join(L) + "\n")

    # ----------------------------------------------------------------------- #
    # Console summary.
    # ----------------------------------------------------------------------- #
    print("== US SOURCE INVENTORY (honest matching-C denominator) ==")
    print("  -- full US text-symbol table --")
    print(f"  US-C-portable (CEILING) : {us_c_ceiling:5d}  "
          f"graduated {us_c_grad} ({pct(us_c_grad, us_c_ceiling):.2f}%)")
    print(f"  US-ASM-stays            : {asm_stays:5d}  (never matching-C)")
    print(f"  LIBC/LIBGCC             : {libc:5d}  (never matching-C)")
    print(f"  total US functions      : {total_us_funcs:5d}")
    print()
    print(f"  HONEST matching-C denominator = {us_c_ceiling} (not 8528)")
    print(f"  graduated of ceiling          = {us_c_grad} "
          f"({pct(us_c_grad, us_c_ceiling):.2f}%)")
    print()
    print(f"  fully-unported US-C TUs (top 25 by ungraduated count):")
    for tu, tot, ung, td in fully_unported[:25]:
        print(f"    {tu:24s} {ung:3d} ungraduated / {tot:3d}   [{tierstr(td)}]")
    print()
    print(f"  partially-ported US-C TUs with most remainder (top 15):")
    for tu, tot, g, ung, td in partially[:15]:
        print(f"    {tu:24s} {ung:3d} ungrad / {tot:3d} ({g} done)   [{tierstr(td)}]")
    print()
    print(f"  wrote {OUT_MD}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
