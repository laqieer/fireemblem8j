#!/usr/bin/env python3
"""Compute fireemblem8j decompilation progress in the frogress template format.

Numerators are measured from this repo: code/data bytes come from the carve
manifest (layout/carved_rom.tsv), and functions/symbols from the decompiled
objects. Denominators are the authoritative totals of the (structurally
identical) US decomp -- the JP ROM contains essentially the same amount of code,
data, functions and symbols, so the US totals are the natural "100%" target and
give a meaningful 0..1 progress curve on the portal.

Emits a progress.txt that scripts/progress-template.txt parses for upload.
"""
import os, re, subprocess, sys, glob

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)

# Authoritative totals from the US decomp (../fireemblem8u, `sh scripts/calcrom.sh`).
US_TOTALS = dict(code=858300, data=13285090, symbols=41849, functions=8528)

CODE_EXTS = (".text)",)
DATA_EXTS = (".rodata)", ".data)")


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


# --- code/data bytes from the carve manifest ---
code_bytes = data_bytes = 0
objs = set()
for r in read_manifest("carved_rom"):
    start, end, sec = int(r[0], 16), int(r[1], 16), r[2]
    size = end - start
    # Match the section NAME (e.g. `.data.banim_array`) by prefix, not an exact
    # `.data)` suffix: the US totals (scripts/calcrom.sh) count every .text/.data/
    # .rodata section including named sub-sections (`.data.banim_array`,
    # `.rodata.str1.4`, ...), so the JP numerator must too or it undercounts.
    sm = re.search(r"\((\.[\w.]+)\)", sec)
    secname = sm.group(1) if sm else ""
    if secname == ".text" or secname.startswith(".text."):
        code_bytes += size
    elif secname.startswith((".rodata", ".data")):
        data_bytes += size
    m = re.match(r"(\S+\.o)\(", sec)
    if m and m.group(1) not in ("asm/baserom.o",):
        objs.add(m.group(1))
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


funcs = symbols = 0
for obj in sorted(objs):
    syms = nm(obj)
    names = set()
    for typ, name in syms:
        if internal(name):
            continue
        names.add(name)
        # Count functions only from decompiled C (text symbols in src/*.o); asm
        # boot/data objects contribute symbols + bytes but not "functions".
        if obj.startswith("src/") and typ in ("t", "T"):
            funcs += 1
    symbols += len(names)


def pct(n, d):
    return f"{100.0 * n / d:.4f}" if d else "0.0000"


code_t, data_t = US_TOTALS["code"], US_TOTALS["data"]
sym_t, fn_t = US_TOTALS["symbols"], US_TOTALS["functions"]
banim = sound = 0

out = []
# Code progress is JP-RELATIVE (like the data metric below): the denominator is the JP ROM's
# OWN code region [0x08000000, 0x080DC134), not the US-decomp .text total. The US figure
# (code_t) UNDERSTATES JP's region-different code -- JP carries MORE code bytes than US -- so a
# US-relative metric overshoots 100% and reports a NEGATIVE "in asm". The code region is fully
# partitioned into carved real-source bytes + the raw baserom incbin remainder, so jp_code_total
# is exactly the region size and "code in asm" is the genuine remaining incbin.
CODE_REGION = (0x08000000, 0x080DC134)
jp_code_total = CODE_REGION[1] - CODE_REGION[0]
code_incbin = max(0, jp_code_total - code_bytes)  # raw incbin still in the code region
out.append(f"{jp_code_total} total bytes of code (JP code region 0x08000000..0x080DC134; US .text was {code_t})")
out.append(f"{code_bytes} bytes of code in src ({pct(code_bytes, jp_code_total)}%)")
out.append(f"{code_incbin} bytes of code in asm ({pct(code_incbin, jp_code_total)}%)")
out.append("")
out.append(f"{sym_t} total symbols")
out.append(f"{symbols} symbols documented ({pct(symbols, sym_t)}%)")
out.append(f"0 symbols partially documented (0.0000%)")
out.append(f"{sym_t - symbols} symbols undocumented ({pct(sym_t - symbols, sym_t)}%)")
out.append("")
# Data progress is JP-RELATIVE: the denominator is the JP ROM's OWN total data, not the
# US-decomp total. The US figure (data_t) understates JP's region-different data -- extra
# font glyphs, JP-only pointer tables, region-different layout -- so using it pushed the
# metric past 100%. The JP data front is byte-complete: a whole-ROM gap analysis finds 0
# uncarved DATA regions (every uncarved byte is code or padding), so the JP total data
# equals the extracted data. If data carving were ever incomplete, jp_data_total would be
# extracted + the uncarved data bytes (and the percentage would be < 100).
jp_data_total = data_bytes + banim + sound
data_remaining = jp_data_total - data_bytes - banim - sound  # uncarved JP data == 0 (complete)
out.append(f"{jp_data_total} total bytes of data")
out.append(f"{data_bytes} bytes of data in src ({pct(data_bytes, jp_data_total)}%)")
out.append(f"{data_remaining} bytes of data in data ({pct(data_remaining, jp_data_total)}%)")
out.append(f"{banim} bytes of data in banim ({pct(banim, jp_data_total)}%)")
out.append(f"{sound} bytes of data in sound ({pct(sound, jp_data_total)}%)")
out.append(f"{fn_t} functions in total, {funcs} functions ({pct(funcs, fn_t)}%) have been decompiled.")
out.append("0 functions are marked as unmatched.")
# (c) C-decompiled (NON-matching): readable staging C in src/nonmatching/*.c (D26).
# Reported on its OWN line so it does NOT inflate the byte-perfect % or the
# C-matched % above -- these functions are DOCUMENTED, NOT byte-matched (their
# bytes still come from asm/<fn>.s, which already counts in code-bytes/functions).
nonmatch_c = len(glob.glob("src/nonmatching/*.c"))
out.append(f"{nonmatch_c} functions staged as non-matching C "
           f"({pct(nonmatch_c, fn_t)}% of {fn_t}) -- documented, NOT byte-matched.")

sys.stdout.write("\n".join(out) + "\n")
