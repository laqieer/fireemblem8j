#!/usr/bin/env python3
"""Compute fireemblem8j decompilation progress -- HONESTLY.

The real goal is NOT "asm/baserom.s has zero incbins" (cosmetic, already gamed by
relocating 12,462 incbins into 2,319 other committed .s files). The real goal is:
reproduce the ROM byte-for-byte from COMMITTED SOURCE alone, with baserom.gba used
ONLY as the `make compare` verification target -- never as a build input. See
docs/decomp-completion-standard.md.

This script publishes the HONEST four axes (each with today's value and the 100%
target), then -- so the FE Decomp Portal stays truthful too -- emits the
frogress-template lines (scripts/progress-template.txt) with corrected,
non-inflated numbers:

  1. BUILD SELF-CONTAINMENT  = (ROM - baserom.gba incbin bytes) / 16,777,216
     The single ungameable number (from scripts/check_selfcontained.py). ~17%.
  2. MATCHING-C FUNCTIONS    = matching-C funcs in src/*.o / 8,528.  ~25.6%.
     (gbadisasm descriptive asm is DISASSEMBLY, not decompilation -- NOT counted.)
  3. EXTRACTED DATA          = genuinely-extracted asset bytes (C structs / PNG)
     / real data total.  ~0.12%.  (named `.incbin "baserom"` is NOT extraction.)
  4. NAMED SYMBOLS           = named labels / total labels, with NO overflow.
     `sub_/data_/nullsub_/banim_/gfx_` auto-placeholders count as UNNAMED.  ~59%.

Prior bugs this fixes (per the audit, docs/decomp-completion-standard.md front d):
  * "data in src 100%": denominator was data_bytes itself (tautology). FIXED:
    numerator is extracted-to-source data only; denominator is the real data total.
  * "225.28% documented": symbol count overflowed past the denominator and treated
    every auto-placeholder as documented. FIXED: placeholders are UNNAMED and the
    denominator is the true label total (no value can exceed 100%).
"""
import glob
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
sys.path.insert(0, os.path.join(ROOT, "scripts"))

# Reuse the ungameable self-containment scan (axis 1) so there is one source of truth.
import check_selfcontained as sc  # noqa: E402

ROM_SIZE = sc.ROM_SIZE  # 16,777,216

# Authoritative denominators from the US decomp (../fireemblem8u, `sh scripts/calcrom.sh`).
# Functions: 8,528 US-target functions is the honest "100%" for the C axis.
US_FUNCTIONS = 8528
# JP code region [0x08000000, 0x080DC134): used only for the portal `code` byte metric.
CODE_REGION = (0x08000000, 0x080DC134)

# Auto-generated placeholder label prefixes -- these are UNNAMED for the symbol axis.
# `sub_<hex>` (gbadisasm functions), `data_<hex>`, `nullsub_<n>`, and the auto
# asset-sheet labels `banim_`/`gfx_`/`snd_`. Everything else is a real name.
PLACEHOLDER_RE = re.compile(r"^(sub_[0-9A-Fa-f]+|data_|nullsub_|banim_|gfx_|snd_)")


def read_rows(path):
    out = []
    if not os.path.exists(path):
        return out
    for ln in open(path):
        ln = ln.rstrip("\n")
        if ln and not ln.lstrip().startswith("#"):
            out.append(ln.split("\t"))
    return out


def read_manifest(name):
    """Union the monolith layout/<name>.tsv with per-task fragments
    layout/<name>.d/*.tsv (mirrors gen_layout + the Makefile LAYOUT_INPUTS) so the
    metric counts fragment-carved objects exactly as the build links them. Dedups
    byte-identical rows."""
    seen, rows = set(), []
    for p in [f"layout/{name}.tsv"] + sorted(glob.glob(f"layout/{name}.d/*.tsv")):
        for r in read_rows(p):
            key = tuple(r)
            if key not in seen:
                seen.add(key)
                rows.append(r)
    return rows


# --- code/data bytes from the carve manifest, split by SOURCE object ---
# A byte is genuinely "extracted to source" only if it comes from a src/*.o (compiled
# C: real struct tables, INCBIN'd PNG, etc). Bytes from asm/*.o are descriptive asm OR
# named `.incbin "baserom.gba"` -- assembled, but NOT decompiled/extracted.
code_src = code_asm = 0          # .text bytes by source kind
data_src = data_asm = 0          # .data/.rodata bytes by source kind
objs = set()
for r in read_manifest("carved_rom"):
    start, end, sec = int(r[0], 16), int(r[1], 16), r[2]
    size = end - start
    sm = re.search(r"\((\.[\w.]+)\)", sec)
    secname = sm.group(1) if sm else ""
    om = re.match(r"(\S+\.o)\(", sec)
    obj = om.group(1) if om else ""
    is_src = obj.startswith("src/")
    if secname == ".text" or secname.startswith(".text."):
        if is_src:
            code_src += size
        else:
            code_asm += size
    elif secname.startswith((".rodata", ".data")):
        if is_src:
            data_src += size
        else:
            data_asm += size
    if obj and obj not in ("asm/baserom.o",):
        objs.add(obj)
for r in read_manifest("carved_ram"):
    for spec in r[2].split():
        m = re.match(r"(\S+\.o)\(", spec)
        if m:
            objs.add(m.group(1))

# Never count the baseline-symbol shim or the raw incbin as decompiled.
objs.discard("asm/jp_syms.o")
objs.discard("asm/baserom.o")


def nm(obj):
    if not os.path.exists(obj):
        subprocess.run(["make", obj], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    if not os.path.exists(obj):
        return []
    out = subprocess.run(["arm-none-eabi-nm", "--defined-only", obj],
                         capture_output=True, text=True).stdout.splitlines()
    syms = []
    for ln in out:
        p = ln.split()
        if len(p) == 3:
            syms.append((p[1], p[2]))  # (type, name)
    return syms


def internal(name):
    return name.startswith((".", "$", "__")) or name == "gcc2_compiled."


# --- matching-C functions (axis 2): text symbols compiled from src/*.o ---
funcs = 0
for obj in sorted(objs):
    if not obj.startswith("src/"):
        continue
    for typ, name in nm(obj):
        if internal(name):
            continue
        if typ in ("t", "T"):
            funcs += 1


# --- named symbols (axis 4): scan every `.global` label across asm/, no overflow ---
def ensure_layout():
    """asm/baserom.s + asm/jp_syms.s are GENERATED (gitignored) from the layout
    manifests by gen_layout.py. jp_syms.s holds the 1,259 baseline-symbol-shim
    labels (US-inherited names for still-incbin'd regions) that BELONG in the
    symbol-axis denominator. On a fresh checkout they don't exist yet, which would
    undercount labels; regenerate them so the metric is reproducible everywhere."""
    if os.path.exists("asm/jp_syms.s"):
        return
    subprocess.run([sys.executable, "scripts/gen_layout.py"],
                   stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)


def label_stats():
    ensure_layout()
    labels = set()
    for dirpath, _dn, files in os.walk(os.path.join(ROOT, "asm")):
        for fn in files:
            if not fn.endswith((".s", ".inc")):
                continue
            try:
                text = open(os.path.join(dirpath, fn), errors="replace").read()
            except OSError:
                continue
            for m in re.finditer(r"^\s*\.global\s+(\S+)", text, re.M):
                labels.add(m.group(1))
    total = len(labels)
    placeholders = sum(1 for n in labels if PLACEHOLDER_RE.match(n))
    return total, placeholders


sym_total, sym_placeholder = label_stats()
sym_named = sym_total - sym_placeholder


def pct(n, d):
    return (100.0 * n / d) if d else 0.0


# === Axis values ===========================================================
dep_bytes, sc_directives, sc_files = sc.scan()
self_bytes = ROM_SIZE - dep_bytes
selfcontain_pct = pct(self_bytes, ROM_SIZE)

func_pct = pct(funcs, US_FUNCTIONS)

# Real data total = all data the linked ROM accounts for (extracted-to-source +
# still-as-incbin/descriptive-asm). NOT data_src (that was the tautology).
data_total = data_src + data_asm
data_pct = pct(data_src, data_total)

named_pct = pct(sym_named, sym_total)


# === Honest 4-axis scorecard (primary output) ==============================
out = []
out.append("== FE8J HONEST DECOMP SCORECARD (target: 100% on every axis) ==")
out.append(f"1. BUILD SELF-CONTAINMENT : {selfcontain_pct:6.2f}%  "
           f"({self_bytes}/{ROM_SIZE} bytes from source; "
           f"{dep_bytes} still .incbin baserom)  -> target 100%")
out.append(f"2. MATCHING-C FUNCTIONS   : {func_pct:6.2f}%  "
           f"({funcs}/{US_FUNCTIONS} funcs compiled from src/*.c; "
           f"gbadisasm asm NOT counted)  -> target 100%")
out.append(f"3. EXTRACTED DATA         : {data_pct:6.2f}%  "
           f"({data_src}/{data_total} bytes in C/PNG assets; "
           f"named .incbin is NOT extraction)  -> target 100%")
out.append(f"4. NAMED SYMBOLS          : {named_pct:6.2f}%  "
           f"({sym_named}/{sym_total} labels named; "
           f"{sym_placeholder} sub_/data_/nullsub_/sheet placeholders)  -> target 100%")
out.append("The #1 number is the only ungameable one: remove baserom.gba and see "
           "if `make` still builds.  See docs/decomp-completion-standard.md.")
out.append("")

# === frogress-template lines (scripts/progress-template.txt) ================
# Kept in the EXACT wording the TTP template parses, but with HONEST numbers so the
# FE Decomp Portal cannot show an inflated curve. Bug fixes vs the old script:
#   * data total is the REAL total (not data_bytes) -> data% is genuine (~0.12%).
#   * symbols never exceed total (placeholders are undocumented) -> no >100%.
jp_code_total = CODE_REGION[1] - CODE_REGION[0]
code_incbin = max(0, jp_code_total - code_src - code_asm)
out.append(f"{jp_code_total} total bytes of code")
out.append(f"{code_src + code_asm} bytes of code in src ({pct(code_src + code_asm, jp_code_total):.4f}%)")
out.append(f"{code_incbin} bytes of code in asm ({pct(code_incbin, jp_code_total):.4f}%)")
out.append("")
out.append(f"{sym_total} total symbols")
out.append(f"{sym_named} symbols documented ({named_pct:.4f}%)")
out.append(f"0 symbols partially documented (0.0000%)")
out.append(f"{sym_placeholder} symbols undocumented ({pct(sym_placeholder, sym_total):.4f}%)")
out.append("")
out.append(f"{data_total} total bytes of data")
out.append(f"{data_src} bytes of data in src ({data_pct:.4f}%)")
out.append(f"{data_asm} bytes of data in data ({pct(data_asm, data_total):.4f}%)")
out.append(f"0 bytes of data in banim (0.0000%)")
out.append(f"0 bytes of data in sound (0.0000%)")
out.append(f"{US_FUNCTIONS} functions in total, {funcs} functions ({func_pct:.4f}%) have been decompiled.")
out.append("0 functions are marked as unmatched.")

# (c) C-decompiled (NON-matching): readable staging C in src/nonmatching/*.c (D26).
# Reported on its OWN line so it does NOT inflate any axis above -- these functions
# are DOCUMENTED, NOT byte-matched (their bytes still come from asm/<fn>.s).
nonmatch_c = len(glob.glob("src/nonmatching/*.c"))
out.append(f"{nonmatch_c} functions staged as non-matching C "
           f"({pct(nonmatch_c, US_FUNCTIONS):.4f}% of {US_FUNCTIONS}) -- documented, NOT byte-matched.")

sys.stdout.write("\n".join(out) + "\n")
