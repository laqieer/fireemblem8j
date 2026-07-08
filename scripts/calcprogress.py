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
  2. MATCHING-C FUNCTIONS    = decompiled funcs (src/*.o + libc/libgcc) / TRUE JP
     function total (decompiled + still-as-asm objects), NOT the US count -- so the
     % can't read ~100% while JP functions remain as descriptive asm.
     (gbadisasm descriptive asm is DISASSEMBLY, not decompilation -- NOT counted.)
  3. EXTRACTED DATA (C/PNG-SCOPED)
                              = strict C/PNG-scoped extracted bytes under src/
     / real data total.  Named `.incbin "baserom"` is NOT extraction.  This
     intentionally remains a narrow portal/decomp.dev-compatible number.
     SOURCE-FORM DATA is surfaced separately: data already built from committed
     editable source even when the object root is banim/, sound/, or asm/fe6sio.o.
  4. NAMED SYMBOLS           = named labels / total labels, with NO overflow.
     `sub_/data_/nullsub_/banim_/gfx_` auto-placeholders count as UNNAMED.  ~59%.

Prior bugs this fixes (per the audit, docs/decomp-completion-standard.md front d):
  * "data in src 100%": denominator was data_bytes itself (tautology). FIXED:
    numerator is extracted-to-source data only; denominator is the real data total.
  * "225.28% documented": symbol count overflowed past the denominator and treated
    every auto-placeholder as documented. FIXED: placeholders are UNNAMED and the
    denominator is the true label total (no value can exceed 100%).
"""
import collections
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

# US reference function count (../fireemblem8u, `sh scripts/calcrom.sh`). Kept ONLY
# as a cross-reference -- it is NOT the matching-C denominator. JP has region-different
# and JP-only functions the US ROM lacks, so using the US count understated the JP
# remainder (the % read ~100% while dozens of JP functions were still descriptive asm).
# The honest denominator is the TRUE JP function total = funcs + func_lib + func_asm,
# computed below, so 100% is reached only when ZERO functions remain as asm.
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
code_src = code_asm = code_lib = 0  # .text bytes by source kind (lib = libc.a/libgcc.a)
data_src = data_asm = data_lib = 0  # .data/.rodata bytes by source kind (lib = archives)
source_form_data = 0
source_form_data_groups = collections.Counter()
objs = set()
asm_text_objs = set()  # distinct asm/*.o objects still placed in .text (= still-asm funcs)


def source_form_data_group(obj):
    """Classify non-src data objects that are already built from editable source.

    The strict EXTRACTED DATA axis deliberately credits only src/*.o C/PNG assets.
    This supplemental SOURCE-FORM DATA axis credits other object roots only when the
    Makefile documents a committed editable-source build chain with no baserom.gba
    fallback. This is an evidence allow-list, not a generic path promotion:
      * banim/data_banim.o: arm_compressing_linker from banim/*_motion.s plus
        graphics/banim PNG/AGBPAL assets.
      * sound/songs/midi/*.o: mid2agb output from committed .mid files.
      * sound/voicegroups/*.o: hand-ported voice_* macro .s tables.
      * asm/fe6sio.o: compressed FE6 multiboot payload from mgfembp source, not
        the FE8J baserom.
      * sound/*.o table/wave helpers: descriptive .s or committed PCM assets.
    Anything unrecognized remains in the residual data bucket.
    """
    if obj == "banim/data_banim.o":
        return "banim/data_banim.o (compressing-linker: banim/*.s + graphics/banim PNG/AGBPAL)"
    if obj.startswith("sound/songs/midi/"):
        return "sound/songs/midi/*.o (mid2agb from committed .mid)"
    if obj.startswith("sound/voicegroups/"):
        return "sound/voicegroups/*.o (editable voice_* macro .s)"
    if obj == "asm/fe6sio.o":
        return "asm/fe6sio.o (FE6 multiboot payload from mgfembp source)"
    if obj in {"sound/song_table.o", "sound/songs/dummy_song.o"}:
        return "sound/song_table.o + dummy_song.o (descriptive song table .s)"
    if obj in {
        "sound/music_player_table.o",
        "sound/programmable_wave_data.o",
        "sound/keysplit_tables.o",
    }:
        return "m4a sound tables/waves/keysplit (descriptive .s + committed PCM)"
    return None


for r in read_manifest("carved_rom"):
    start, end, sec = int(r[0], 16), int(r[1], 16), r[2]
    size = end - start
    sm = re.search(r"\((\.[\w.]+)\)", sec)
    secname = sm.group(1) if sm else ""
    om = re.match(r"(\S+\.o)\(", sec)
    obj = om.group(1) if om else ""
    is_src = obj.startswith("src/")
    # Code linked directly from the toolchain archives (libc.a/libgcc.a), like
    # fe8u does -- this is REAL-SOURCE library code, NOT hand-disassembly to
    # decompile. Track it separately so it is not lumped with "still as asm".
    is_lib = ".a:" in obj
    if secname == ".text" or secname.startswith(".text."):
        if is_src:
            code_src += size
        elif is_lib:
            code_lib += size
        else:
            code_asm += size
            if obj:
                asm_text_objs.add(obj)
    elif secname.startswith((".rodata", ".data")):
        if is_src:
            data_src += size
        elif is_lib:
            # .rodata/.data linked from libc.a/libgcc.a -- real-source library data
            # (like fe8u), NOT named .incbin baserom. Counts as completed/extracted.
            data_lib += size
        else:
            data_asm += size
            group = source_form_data_group(obj)
            if group:
                source_form_data += size
                source_form_data_groups[group] += size
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


_nm_cache = {}


def _nm_parse_symbols(lines):
    """Parse `arm-none-eabi-nm --defined-only` output into [(type, name), ...].
    Header lines (`path:`) and blanks split to != 3 fields and are skipped, so a block
    parses byte-identically whether nm was invoked on one object or many."""
    syms = []
    for ln in lines:
        p = ln.split()
        if len(p) == 3:
            syms.append((p[1], p[2]))  # (type, name)
    return syms


def nm_prime(obj_list):
    """Batch `arm-none-eabi-nm --defined-only` over many objects in a FEW invocations
    instead of one process per object (the ~5-min hotspot in issue #144). Missing
    objects are `make`d first, exactly like the lazy per-object path, so the resulting
    symbol lists -- and therefore progress.txt -- are byte-identical, only faster.
    When nm is given multiple files it prefixes each block with a `path:` header line;
    a single-file invocation emits none, so that case is handled explicitly."""
    todo = []
    for obj in obj_list:
        if obj in _nm_cache:
            continue
        if not os.path.exists(obj):
            subprocess.run(["make", obj], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        if os.path.exists(obj):
            todo.append(obj)
        else:
            _nm_cache[obj] = []
    CHUNK = 1500  # thousands of ~30-char paths stay far under ARG_MAX (2 MB)
    for i in range(0, len(todo), CHUNK):
        chunk = todo[i:i + CHUNK]
        out = subprocess.run(["arm-none-eabi-nm", "--defined-only", *chunk],
                             capture_output=True, text=True).stdout.splitlines()
        chunkset = set(chunk)
        cur = chunk[0] if len(chunk) == 1 else None  # 1-file nm emits no path header
        buf = []
        for ln in out:
            if ln.endswith(":") and ln[:-1] in chunkset:
                if cur is not None:
                    _nm_cache[cur] = _nm_parse_symbols(buf)
                cur, buf = ln[:-1], []
            else:
                buf.append(ln)
        if cur is not None:
            _nm_cache[cur] = _nm_parse_symbols(buf)
    for obj in todo:
        _nm_cache.setdefault(obj, [])


def nm(obj):
    if obj in _nm_cache:
        return _nm_cache[obj]
    if not os.path.exists(obj):
        subprocess.run(["make", obj], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    if not os.path.exists(obj):
        _nm_cache[obj] = []
        return []
    out = subprocess.run(["arm-none-eabi-nm", "--defined-only", obj],
                         capture_output=True, text=True).stdout.splitlines()
    syms = _nm_parse_symbols(out)
    _nm_cache[obj] = syms
    return syms


# gbadisasm marks every internal branch target with a `_<hexaddr>` local label; these
# are NOT functions and must not be counted as still-asm function entries.
GBADISASM_LABEL = re.compile(r"^_[0-9A-Fa-f]{6,8}$")

# The GBA cartridge header (src/rom_header.s, like fe8u) labels each header DATA field
# -- RomHeaderNintendoLogo (the logo bytes), RomHeaderGameTitle/GameCode/MakerCode,
# RomHeaderChecksum, ... -- all of which are `.byte`/`.ascii`/`.space` DATA, not
# functions. Only `Init` (the `b crt0` entry stub) is a real function there. Exclude
# the `RomHeader*` data labels from the function census so the count is stable whether
# the header lives in asm/ or src/ (and never inflates the matching-C denominator).
def internal(name):
    return (name.startswith((".", "$", "__", "RomHeader")) or name == "gcc2_compiled."
            or GBADISASM_LABEL.match(name) is not None)


# Prime the nm cache in a FEW batched invocations (issue #144 speedup): resolve every
# object the two function-census loops below will query -- the src/*.o subset of `objs`
# (matching-C axis) plus the asm/*.o still-in-.text objects (still-asm axis) -- up front,
# instead of spawning one `arm-none-eabi-nm` per object. Byte-identical result, ~5min ->
# seconds; the loops' nm(obj) calls become cache hits.
nm_prime([o for o in sorted(objs) if o.startswith("src/")] + sorted(asm_text_objs))


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

# Functions linked directly from libc.a/libgcc.a (real-source library, like fe8u)
# are COMPLETED -- not hand-disassembly to decompile. Count their exported (global)
# functions toward the matching/completed axis alongside src/*.o. The `__`-prefixed
# libgcc/newlib functions (e.g. __divsi3, __adddf3) are REAL functions in the JP
# funcmap, so they count here (only $/. mapping symbols and gcc2_compiled. excluded).
func_lib = 0
_lib_members = set()
_archive_nm_cache = {}


def nm_archive_member(arpath, member):
    """Return nm lines for one archive member without writing a temporary object."""
    if arpath not in _archive_nm_cache:
        current = None
        members = collections.defaultdict(list)
        out = subprocess.run(["arm-none-eabi-nm", "--defined-only", arpath],
                             capture_output=True, text=True).stdout.splitlines()
        for ln in out:
            if ln.endswith(":") and " " not in ln:
                current = ln[:-1]
            elif current:
                members[current].append(ln)
        _archive_nm_cache[arpath] = members
    return _archive_nm_cache[arpath].get(member, [])


for obj in sorted(objs):
    m = re.match(r"\*(\S+\.a):(\S+\.o)$", obj)
    if not m:
        continue
    arpath = os.path.join("tools/agbcc/lib", m.group(1))
    key = (arpath, m.group(2))
    if key in _lib_members or not os.path.exists(arpath):
        continue
    _lib_members.add(key)
    for ln in nm_archive_member(arpath, m.group(2)):
        p = ln.split()
        if len(p) == 3 and p[1] == "T" and not p[2].startswith(("$", ".")) and p[2] != "gcc2_compiled.":
            func_lib += 1


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


def opaque_data_bytes():
    """Bytes still carried as opaque raw-incbin assets, not source-form data."""
    GFX = ("Map","Tile","Object","Chr","Pal","Gfx","Img","Sprite","Anim","OBJ","_gf","Reel","Portrait","Icon")
    opaque = struct_b = 0
    for binp in glob.glob(os.path.join(ROOT, "data", "residual", "*.bin")):
        name = os.path.basename(binp)[:-4]
        cpath = os.path.join(ROOT, "src", "data", name + "_ref", "dat_%s_ref.c" % name)
        if os.path.exists(cpath):
            with open(cpath, errors="replace") as f:
                if "INCBIN" not in f.read():
                    continue
        sz = os.path.getsize(binp); opaque += sz
        if not any(k in os.path.basename(binp) for k in GFX):
            struct_b += sz
    return opaque, struct_b


# === Axis values ===========================================================
dep_bytes, sc_directives, sc_files = sc.scan()
self_bytes = ROM_SIZE - dep_bytes
selfcontain_pct = pct(self_bytes, ROM_SIZE)

func_done = funcs + func_lib          # decompiled (src) + linked from real-source library
# Still-as-descriptive-asm FUNCTIONS: count exported (uppercase-T) function-entry
# symbols across the asm/*.o code objects still placed in .text -- NOT per-object and
# NOT per-label. Per-object would undercount the few multi-function library blobs
# (asm/m4a_1.o alone is 33 ARM functions, asm/arm.o 15, asm/arm_call.o 5); per-label
# would wildly OVERcount because gbadisasm marks every internal branch target a `_hex`
# local label (a 2,936-byte function emits ~200) -- those are filtered by internal().
# Counting the global-T entries gives the true per-function tail (a couple of ROM-header
# entry labels marginally over- and one newlib static helper under-count, ~offsetting).
func_asm = 0
for obj in sorted(asm_text_objs):
    for typ, name in nm(obj):
        if not internal(name) and typ == "T":
            func_asm += 1
# HONEST denominator = the TRUE JP function total (decompiled + still-asm), NOT the US
# count. As a function moves asm->src the numerator rises and func_asm falls by the same
# amount, so the total is stable and the % reaches 100% only at func_asm == 0.
func_total = func_done + func_asm
func_pct = pct(func_done, func_total)

# Real data total = all data the linked ROM accounts for (extracted-to-source +
# real-source library + still-as-incbin/descriptive-asm). NOT data_src (tautology).
# Library data (data_lib) is real-source like fe8u, so it counts as COMPLETED in
# the extracted numerator alongside data_src (mirrors code_lib for the code axis).
data_total = data_src + data_lib + data_asm
data_pct = pct(data_src + data_lib, data_total)
_opaque, _struct_opaque = opaque_data_bytes()
source_form_data_done = data_src + data_lib + source_form_data - _opaque
source_form_data_residual = max(0, data_total - source_form_data_done)
source_form_data_pct = pct(source_form_data_done, data_total)

named_pct = pct(sym_named, sym_total)


# === Honest 4-axis scorecard (primary output) ==============================
out = []
out.append("== FE8J HONEST DECOMP SCORECARD (target noted per axis) ==")
out.append(f"1. BUILD SELF-CONTAINMENT : {selfcontain_pct:6.2f}%  "
           f"({self_bytes}/{ROM_SIZE} bytes from source; "
           f"{dep_bytes} still .incbin baserom)  -> target 100%")
out.append(f"2. MATCHING-C FUNCTIONS   : {func_pct:6.2f}%  "
           f"({func_done}/{func_total} JP funcs done = {funcs} compiled from src/*.c "
           f"+ {func_lib} linked from libc/libgcc; {func_asm} still descriptive asm; "
           f"gbadisasm asm NOT counted)  -> target 100%")
out.append(f"3. EXTRACTED DATA (source-form): {source_form_data_pct:6.2f}%  "
           f"({source_form_data_done}/{data_total} bytes built from committed editable source "
           f"in ANY form (src/ C/PNG, banim compressing-linker .s+PNG, sound mid2agb, ...); "
           f"{source_form_data_residual} residual opaque/non-source bytes)  -> target 100%")
out.append(f"3b. strict C/PNG-under-src subset: {data_pct:6.2f}%  "
           f"({data_src + data_lib}/{data_total} bytes; a narrow decomp.dev-style counter -- "
           f"NOT the data gate. Source forms vary, so axis 3 (source-form) is the real metric)")
out.append("    source-form breakdown:")
out.append(f"      {data_src} bytes  src/ C/PNG/charmap/typed data (strict extracted-data numerator)")
if data_lib:
    out.append(f"      {data_lib} bytes  libc/libgcc archive data (linked from library source)")
for group, size in source_form_data_groups.most_common():
    out.append(f"      {size} bytes  {group}")
if _opaque:
    out.append(f"      -{_opaque} bytes  opaque raw-incbin/.bin frontier excluded from source-form credit")
if source_form_data_residual:
    out.append(f"      {source_form_data_residual} bytes  residual opaque/non-source bytes")
out.append(f"4. NAMED SYMBOLS          : {named_pct:6.2f}%  "
           f"({sym_named}/{sym_total} labels named; "
           f"{sym_placeholder} sub_/data_/nullsub_/sheet placeholders)  -> target 100%")

# === Axes 5-6: shiftability + asset editability (the "real decomp" axes) =====
# A byte-perfect ROM is necessary but NOT sufficient: a decomp must also be
# SHIFTABLE (no hardcoded absolute pointers -> the linker relocates everything)
# and EDITABLE (logic data as typed C, not opaque raw-incbin blobs). Both are
# owned by scripts/audit_pointers.py; here we surface the fast, ungameable
# headlines (full % via `audit_pointers.py --metrics`).
import subprocess as _sp
def _shiftability_headline():
    """Returns (literal_raw_count, completion_gate). The literal raw-0x08xxxxxx count
    is NOT the completion invariant (it is dominated by coincidental constants that can
    never be relocated -- D304); the GATE (fe8u-confirmed-real + unclassified real-
    pointer debt, via --true-debt) is the honest target-0 number."""
    literal = gate = None
    try:
        o = _sp.run([sys.executable, os.path.join(os.path.dirname(__file__),
                     "audit_pointers.py"), "--true-debt"],
                    capture_output=True, text=True, timeout=300).stdout
        import re as _re2
        for ln in o.splitlines():
            if "un-relocated ROM-pointer words remaining" in ln:
                m = _re2.search(r":\s*(\d+)", ln)
                if m: literal = int(m.group(1))
            elif "COMPLETION GATE" in ln:
                m = _re2.search(r":\s*(\d+)", ln)
                if m: gate = int(m.group(1))
    except Exception:
        pass
    return literal, gate
_unreloc, _gate = _shiftability_headline()
if _gate is not None:
    out.append(f"5. SHIFTABILITY (data ptrs): gate {('0' if _gate==0 else str(_gate)):>5} real/unclassified "
               f"data pointers un-relocated  -> target 0  "
               f"({_unreloc} raw 0x08xxxxxx words incl. coincidental constants; "
               f"details via audit_pointers.py --true-debt --gate)")
elif _unreloc is not None:
    out.append(f"5. SHIFTABILITY (data ptrs): {('0 hardcoded' if _unreloc==0 else str(_unreloc)+' raw'):>13}  "
               f"raw 0x08xxxxxx words (gate via audit_pointers.py --true-debt)")
out.append(f"6. ASSET EDITABILITY      : {_struct_opaque} bytes of structured data still opaque "
           f"raw-incbin (of {_opaque} total)  -> target 0 (typed C); graphics .bin exempt")
out.append("The #1 number is the only ungameable one: remove baserom.gba and see "
           "if `make` still builds.  See docs/decomp-completion-standard.md.")
out.append("")

# === frogress-template lines (scripts/progress-template.txt) ================
# Kept in the EXACT wording the TTP template parses, but with HONEST numbers so the
# FE Decomp Portal cannot show an inflated curve. Bug fixes vs the old script:
#   * data total is the REAL total (not data_bytes) -> data% is genuine (~0.12%).
#   * symbols never exceed total (placeholders are undocumented) -> no >100%.
# DECOMP ratio, not disasm ratio. Only code built from real compiled C (src/*.o)
# counts as "in src" (matched/decompiled). gbadisasm descriptive asm (code_asm) is
# DISASSEMBLY, not decompilation, so it joins the still-incbin remainder in the "asm"
# (not-yet-decompiled) bucket. This mirrors the data metric below (data_src alone is
# the numerator) and the fe8u/decomp.dev convention, where asm/ bytes are unmatched
# code -- the prior `code_src + code_asm` numerator reported the disasm ratio (~99.5%)
# and inflated decomp.dev's matched_code_percent far above the true matching-C level.
jp_code_total = CODE_REGION[1] - CODE_REGION[0]
# "in asm" = genuinely still-hand-asm code = the `asm/*.o` `.text` objects (the
# un-decompiled functions), summed DIRECTLY (code_asm) -- NOT a region residual.
# The code region [0x08000000, 0x080DC134) also contains ~3.7 KB of committed-SOURCE
# non-.text bytes: `src/data` `.rodata.gap_*` literal-pool objects + the crt0
# `.data.residue.080000C0` stub. A residual `total - code_src - code_lib` wrongly
# lumped those source bytes into "asm" and understated "from source" by ~0.4%;
# counting code_asm directly keeps the metric honest. (code_lib = libc.a/libgcc.a
# real-source library code, like fe8u -- reported separately as a sub-line.)
code_not_src = code_asm
code_from_source = jp_code_total - code_not_src
out.append(f"{jp_code_total} total bytes of code")
out.append(f"{code_from_source} bytes of code from source ({pct(code_from_source, jp_code_total):.4f}%)")
if code_lib:
    out.append(f"{code_lib} bytes of code in libc/libgcc archives ({pct(code_lib, jp_code_total):.4f}%, linked like fe8u)")
out.append(f"{code_not_src} bytes of code in asm ({pct(code_not_src, jp_code_total):.4f}%)")
out.append("")
out.append(f"{sym_total} total symbols")
out.append(f"{sym_named} symbols documented ({named_pct:.4f}%)")
out.append(f"0 symbols partially documented (0.0000%)")
out.append(f"{sym_placeholder} symbols undocumented ({pct(sym_placeholder, sym_total):.4f}%)")
out.append("")
out.append(f"{data_total} total bytes of data")
out.append(f"{source_form_data_done} bytes of data from source ({pct(source_form_data_done, data_total):.4f}%)")
if data_lib:
    out.append(f"{data_lib} bytes of data in libc/libgcc archives ({pct(data_lib, data_total):.4f}%, linked like fe8u)")
out.append(f"{data_asm} bytes of data in data ({pct(data_asm, data_total):.4f}%)")
out.append(f"0 bytes of data in banim (0.0000%)")
out.append(f"0 bytes of data in sound (0.0000%)")
out.append(f"{func_total} functions in total, {func_done} functions ({func_pct:.4f}%) have been decompiled.")
out.append(f"{func_asm} functions are marked as unmatched.")

# (c) C-decompiled (NON-matching): readable staging C in src/nonmatching/*.c (D26).
# Reported on its OWN line so it does NOT inflate any axis above -- these functions
# are DOCUMENTED, NOT byte-matched (their bytes still come from asm/<fn>.s).
nonmatch_c = len(glob.glob("src/nonmatching/*.c"))
out.append(f"{nonmatch_c} functions staged as non-matching C "
           f"({pct(nonmatch_c, func_total):.4f}% of {func_total}) -- documented, NOT byte-matched.")

sys.stdout.write("\n".join(out) + "\n")
