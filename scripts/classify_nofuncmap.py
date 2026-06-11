#!/usr/bin/env python3
"""Classify the "no-funcmap" US-C-portable functions: region-same vs region-different.

Context (D41/D51/D52). `scripts/us_source_tracker.py` made the honest matching-C
ceiling concrete: ~8209 US-C-portable functions (US `src/<tu>.o` text symbols), of
which ~3670 are graduated. The ungraduated remainder splits by whether the funcmap
(`layout/us_jp_funcmap.tsv`, the exact/masked byte-match tiers from `match_us_jp.py`)
tracks each function:

  * funcmap-tracked  -> a per-function JP<->US correspondence already exists.
  * NO-FUNCMAP       -> never run through the exact/masked tiers. This is NOT
                        "region-different": ~2,191 ALREADY-graduated US-C functions
                        were no-funcmap too (whole-TU / verified-run ports cover
                        funcmap and non-funcmap functions alike). So the no-funcmap
                        pool is an UNMEASURED MIX of region-same and region-diff.

WHY A RAW-BYTE SEARCH IS THE WRONG CLASSIFIER (validated, see header note below).
`match_us_jp.py`'s exact/masked tiers search the JP ROM for the function's raw US
bytes, masking only pointer-LITERAL words. But a region-same function relocated to
a different JP address has DIFFERENT bytes at every relocation site -- not just
pointer literals, but the offset fields of `bl`/pc-relative `ldr` instructions and
the trailing constant pool. A raw-byte/pointer-mask search therefore MISSES almost
all relocated region-same functions: run against the 2,191 KNOWN-region-same
(graduated) no-funcmap functions it labels ~97% "region-different" (false). That is
exactly why the funcmap is small and most US-C functions are "no-funcmap": they are
relocated, not region-different.

THE CORRECT, RELOCATION-AWARE CLASSIFIER (the project's own `find_runs.py` D2 test).
For each function we COMPILE its US source in isolation (`extract_run.py` + agbcc,
the build's real pipeline), read the TRUE relocation offsets from `objdump -r`
(`bl`/`ldr`/word relocs), MASK every reloc-affected byte, and masked-search the JP
ROM for the longest fixed run, verifying the whole masked `.text` at each hit:

  region-same-unique    masked .text found at exactly one JP base -> region-same
                        code, uniquely located (the immediately-carvable case).
  region-same-ambiguous masked .text found at >=2 JP bases -> region-same code,
                        just not yet uniquely anchored (resolves when carved with a
                        neighbour, per find_runs MAXK greedy-extend). Still the
                        lever's pool, NOT hand-decomp.
  region-different      adequate needle (>=6 fixed bytes) but ZERO JP match -> the
                        JP instruction stream genuinely differs -> permuter / hand-
                        decomp territory.
  inconclusive          needle too short to search (mostly-relocated tiny fn) or the
                        isolated compile failed (needs TU context) -> can't decide
                        from the function alone; reported separately, NOT counted as
                        region-different.

Validation (this script's `--validate`): on the 2,191 known-region-same control the
reloc-aware test labels ~97.5% region-same (unique+ambiguous), 0 false region-
different -- vs ~3% for the raw-byte search. So this classifier's region-same count
is a sound LOWER bound and its region-different count a sound UPPER bound on the
genuine hand-decomp frontier.

Per-function compilation is slow, so by default we classify a random SAMPLE
(>=800, env CLASSIFY_SAMPLE, default 1000) for the statistical estimate AND emit
every per-function label computed. A fast raw-byte EXACT pre-pass over the FULL pool
additionally captures the immediately-portable exact anchors for the worklist.

ANALYSIS ONLY: never edits the build, never `git add`. Outputs:
  docs/nofuncmap_classification.md   -- the sized breakdown (counts + %)
  layout/nofuncmap_region_same.tsv   -- region-same worklist for harvest agents
                                        (jp_addr us_addr size tier name tu)
"""
import bisect
import glob
import os
import random
import re
import struct
import subprocess
import sys
import tempfile
import shutil
from collections import defaultdict
from multiprocessing import Pool

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = os.environ.get("US_DIR", "/home/laqieer/fireemblem8u")
US_MAP = os.path.join(US, "fireemblem8.map")
US_ELF = os.path.join(US, "fireemblem8.elf")
US_ROM = os.path.join(US, "fireemblem8.gba")
US_SRC = os.path.join(US, "src")
JP_ROM = "baserom.gba"
FUNCMAP = "layout/us_jp_funcmap.tsv"
OUT_MD = "docs/nofuncmap_classification.md"
OUT_TSV = "layout/nofuncmap_region_same.tsv"
BASE = 0x08000000

CPPF = "-I tools/agbcc/include -iquote include -iquote . -nostdinc -undef"
CC1F = "-mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm -ffix-debug-line -g"

# Sample size for the relocation-aware classification (functions). 0 -> classify
# the FULL pool (slow). Default 1000 (>= the task's 800 floor) for a tight estimate.
SAMPLE = int(os.environ.get("CLASSIFY_SAMPLE", "1000"))
SEED = int(os.environ.get("CLASSIFY_SEED", "1"))


# --------------------------------------------------------------------------- #
# 1. US .text object ranges (the authoritative source-kind cut) -- mirrors
#    us_source_tracker.py parse_section_ranges, restricted to .text.
# --------------------------------------------------------------------------- #
SEC_RE = re.compile(
    r"^\s*\.(text)(?:\.\w+)?\s+"
    r"0x(0[0-9a-fA-F]+)\s+0x([0-9a-fA-F]+)\s+(\S+\.o)\b")


def kind_of(obj):
    if obj.startswith("src/"):
        return "US-C-portable"
    if obj.startswith("asm/"):
        return "US-ASM-stays"
    if obj.startswith("tools/") or "lib/lib" in obj or obj.endswith(".a") or "(" in obj:
        return "LIBC/LIBGCC"
    return "UNKNOWN-obj"


def parse_text_ranges():
    ranges = []
    for ln in open(US_MAP, errors="replace"):
        m = SEC_RE.match(ln)
        if not m:
            continue
        start = int(m.group(2), 16)
        size = int(m.group(3), 16)
        if size == 0:
            continue
        obj = m.group(4)
        kind = kind_of(obj)
        tu = None
        if kind == "US-C-portable":
            sm = re.match(r"src/([\w-]+)\.o$", obj)
            if sm:
                tu = sm.group(1)
        ranges.append((start, start + size, obj, kind, tu))
    ranges.sort()
    starts = [r[0] for r in ranges]
    return starts, ranges


def lookup(starts, ranges, addr):
    i = bisect.bisect_right(starts, addr) - 1
    if 0 <= i < len(ranges):
        s, e, obj, kind, tu = ranges[i]
        if s <= addr < e:
            return obj, kind, tu
    return None, "region-different/UNKNOWN", None


# --------------------------------------------------------------------------- #
# 2. US functions (addr, size, name) from nm -S on the US ELF.
# --------------------------------------------------------------------------- #
def us_functions():
    nm = subprocess.run(["arm-none-eabi-nm", "-S", "-n", US_ELF],
                        capture_output=True, text=True).stdout.splitlines()
    funcs = []
    seen = set()
    for ln in nm:
        p = ln.split()
        if len(p) != 4:
            continue
        addr_s, size_s, typ, name = p
        if typ not in ("t", "T"):
            continue
        if not addr_s.startswith("08"):
            continue
        try:
            addr = int(addr_s, 16)
            size = int(size_s, 16)
        except ValueError:
            continue
        if addr in seen:
            continue
        seen.add(addr)
        funcs.append((addr, size, name))
    return funcs


# --------------------------------------------------------------------------- #
# 3. JP matched (graduated) set -- text symbols in the src/*.o the JP build links.
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
    objs = sorted(jp_src_objects())
    missing = [o for o in objs if not os.path.exists(o)]
    if missing:
        subprocess.run(["make", "-j", str(os.cpu_count() or 4)] + missing,
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    matched = set()
    for obj in objs:
        matched |= nm_text_syms(obj)
    return matched


# --------------------------------------------------------------------------- #
# 4a. Fast RAW-BYTE exact pre-pass (match_us_jp.py tier 1) over the FULL pool.
#     Captures the immediately-portable exact anchors (raw US bytes unique in JP)
#     for the worklist -- a guaranteed-correct subset, cheap to compute.
# --------------------------------------------------------------------------- #
_us_rom = None
_jp = None


def _init_bytes(us_rom_path, jp_path):
    global _us_rom, _jp
    _us_rom = open(us_rom_path, "rb").read()
    _jp = open(jp_path, "rb").read()


def _count_occ(hay, needle, limit=2):
    n = 0
    i = hay.find(needle)
    while i != -1:
        n += 1
        if n >= limit:
            break
        i = hay.find(needle, i + 1)
    return n


def raw_exact_one(args):
    """(jp_addr or -1, us_addr, size, name, tu). exact = raw US bytes unique in JP."""
    addr, size, name, tu = args
    off = addr - BASE
    b = _us_rom[off:off + size]
    if len(b) != size or size < 8:
        return (-1, addr, size, name, tu)
    if _count_occ(_jp, b, 2) == 1:
        return (BASE + _jp.find(b), addr, size, name, tu)
    return (-1, addr, size, name, tu)


# --------------------------------------------------------------------------- #
# 4b. RELOCATION-AWARE classifier (the find_runs.py D2 test) -- the SOUND signal.
#     Compile the US function in isolation, mask the true reloc sites, masked-
#     search the JP ROM.
# --------------------------------------------------------------------------- #
_rjp = None
_TMP = None


def _init_reloc(jp_path):
    global _rjp, _TMP
    _rjp = open(jp_path, "rb").read()
    _TMP = tempfile.mkdtemp(prefix=f"clsnfm_{os.getpid()}_")


def _compile_fn(tu, fn):
    """Return (text bytes, set(reloc offsets)) or (None, None) on failure."""
    fr = f"{_TMP}/fr"
    sub = subprocess.run(
        f"python3 scripts/extract_run.py {US_SRC}/{tu}.c {fn}",
        shell=True, capture_output=True, text=True).stdout
    if not sub.strip():
        return None, None
    open(f"{fr}.c", "w").write(sub)
    subprocess.run(
        f"cpp {CPPF} {fr}.c 2>/dev/null | iconv -f UTF-8 -t CP932 | "
        f"tools/agbcc/bin/agbcc {CC1F} -o {fr}.s 2>/dev/null", shell=True)
    if not os.path.exists(f"{fr}.s") or os.path.getsize(f"{fr}.s") == 0:
        return None, None
    subprocess.run(
        f"echo '.ALIGN 2,0' >> {fr}.s; arm-none-eabi-as -mcpu=arm7tdmi "
        f"-mthumb-interwork -I include -I . {fr}.s -o {fr}.o 2>/dev/null", shell=True)
    if not os.path.exists(f"{fr}.o"):
        return None, None
    text = subprocess.run(
        f"arm-none-eabi-objcopy -O binary -j .text {fr}.o /dev/stdout",
        shell=True, capture_output=True).stdout
    relocs = set()
    sec = None
    for ln in subprocess.run(f"arm-none-eabi-objdump -r {fr}.o", shell=True,
                             capture_output=True, text=True).stdout.splitlines():
        if "RELOCATION RECORDS FOR [" in ln:
            sec = ln.split("[")[1].split("]")[0]
        elif sec == ".text":
            p = ln.split()
            if len(p) >= 3 and all(c in "0123456789abcdef" for c in p[0]):
                relocs.add(int(p[0], 16))
    return text, relocs


def _matches_at(text, relocs, base):
    n = len(text)
    if base < 0 or base + n > len(_rjp):
        return False
    for i in range(n):
        if any(i - k in relocs and 0 <= i - k for k in range(4)):
            continue
        if text[i] != _rjp[base + i]:
            return False
    return True


def reloc_classify_one(args):
    """(label, us_addr, size, jp_addr_or_-1, name, tu) -- the reloc-aware verdict."""
    addr, size, name, tu = args
    if not tu:
        return ("inconclusive", addr, size, -1, name, tu)
    text, relocs = _compile_fn(tu, name)
    if text is None:
        return ("inconclusive-compile", addr, size, -1, name, tu)
    n = len(text)
    if n == 0:
        return ("inconclusive-compile", addr, size, -1, name, tu)
    mask = [1] * n
    for r in relocs:
        for k in range(4):
            if r + k < n:
                mask[r + k] = 0
    bs = bl = 0
    rs = None
    for x in range(n + 1):
        if x < n and mask[x]:
            if rs is None:
                rs = x
        elif rs is not None:
            if x - rs > bl:
                bl, bs = x - rs, rs
            rs = None
    if bl < 6:
        return ("inconclusive-shortneedle", addr, size, -1, name, tu)
    needle = bytes(text[bs:bs + bl])
    hits = []
    start = 0
    while len(hits) < 3:
        j = _rjp.find(needle, start)
        if j < 0:
            break
        s = j - bs
        if _matches_at(text, relocs, s):
            hits.append(s)
        start = j + 1
    if len(hits) == 1:
        return ("region-same-unique", addr, size, BASE + hits[0], name, tu)
    if len(hits) >= 2:
        return ("region-same-ambiguous", addr, size, BASE + hits[0], name, tu)
    return ("region-different", addr, size, -1, name, tu)


# --------------------------------------------------------------------------- #
# 5. Build the pool + accounting.
# --------------------------------------------------------------------------- #
def build_pool():
    starts, ranges = parse_text_ranges()
    funcs = us_functions()
    by_kind = defaultdict(int)
    us_c = []
    for addr, size, name in funcs:
        _o, kind, tu = lookup(starts, ranges, addr)
        by_kind[kind] += 1
        if kind == "US-C-portable":
            us_c.append((addr, size, name, tu))

    fm_names = set()
    for ln in open(FUNCMAP, errors="replace"):
        if ln.startswith("#"):
            continue
        p = ln.rstrip("\n").split("\t")
        if len(p) >= 5:
            fm_names.add(p[4])

    matched = jp_matched_funcs()

    pool = []
    seen = set()
    for a, s, n, tu in us_c:
        if n in fm_names or n in matched or n in seen:
            continue
        seen.add(n)
        pool.append((a, s, n, tu))

    us_c_total = len({n for _a, _s, n, _tu in us_c})
    us_c_grad = len({n for _a, _s, n, _tu in us_c if n in matched})
    fm_ungrad = len({n for _a, _s, n, _tu in us_c if n not in matched and n in fm_names})
    grad_nofuncmap = len({n for _a, _s, n, _tu in us_c if n in matched and n not in fm_names})

    info = dict(by_kind=dict(by_kind), us_c_total=us_c_total, us_c_grad=us_c_grad,
                us_c_ungrad=us_c_total - us_c_grad, fm_ungrad=fm_ungrad,
                grad_nofuncmap=grad_nofuncmap, matched=matched, fm_names=fm_names,
                us_c=us_c)
    return pool, info


# --------------------------------------------------------------------------- #
# 6. Validation mode: confirm the reloc-aware test on the known-region-same control.
# --------------------------------------------------------------------------- #
def run_validate():
    pool, info = build_pool()
    us_c = info["us_c"]
    matched, fm_names = info["matched"], info["fm_names"]
    control = [(a, s, n, tu) for a, s, n, tu in us_c
               if n in matched and n not in fm_names and tu]
    random.seed(7)
    random.shuffle(control)
    sample = control[:int(os.environ.get("VALIDATE_N", "120"))]
    print(f"VALIDATE: reloc-aware classifier on {len(sample)} KNOWN-region-same "
          f"(graduated no-funcmap) control functions ...")
    cnt = defaultdict(int)
    with Pool(os.cpu_count() or 4, initializer=_init_reloc, initargs=(JP_ROM,)) as p:
        for r in p.imap_unordered(reloc_classify_one, sample, chunksize=8):
            cnt[r[0]] += 1
    rs = cnt["region-same-unique"] + cnt["region-same-ambiguous"]
    print("  verdict:", dict(cnt))
    print(f"  region-same (unique+ambiguous): {rs}/{len(sample)} "
          f"= {100.0*rs/len(sample):.1f}%   region-different (FALSE here): "
          f"{cnt['region-different']}")
    return 0


# --------------------------------------------------------------------------- #
# 7. Main.
# --------------------------------------------------------------------------- #
def pct_of(x, d):
    return (100.0 * x / d) if d else 0.0


def main():
    if "--validate" in sys.argv:
        return run_validate()

    print("building no-funcmap US-C-portable ungraduated pool ...")
    pool, info = build_pool()
    by_kind = info["by_kind"]
    print("  by source kind:")
    for k in sorted(by_kind):
        print(f"    {k:28s} {by_kind[k]:6d}")
    nonc = by_kind.get("US-ASM-stays", 0) + by_kind.get("LIBC/LIBGCC", 0)
    print(f"  EXCLUDED never-C pool: {nonc} "
          f"(ASM-stays {by_kind.get('US-ASM-stays',0)} + LIBC/LIBGCC {by_kind.get('LIBC/LIBGCC',0)})")
    print(f"  graduated US-C: {info['us_c_grad']} "
          f"(of which no-funcmap: {info['grad_nofuncmap']})")
    print(f"  no-funcmap US-C UNGRADUATED pool: {len(pool)}")

    nproc = os.cpu_count() or 4

    # --- fast raw-byte exact pre-pass over the FULL pool (immediately-portable) ---
    print("raw-byte EXACT pre-pass over full pool ...")
    exact_jp = {}  # name -> (jp, us, size, tu)
    with Pool(nproc, initializer=_init_bytes, initargs=(US_ROM, JP_ROM)) as p:
        for jp, us, size, name, tu in p.imap_unordered(raw_exact_one, pool, chunksize=128):
            if jp != -1:
                exact_jp[name] = (jp, us, size, tu)
    print(f"  raw-exact anchors in pool: {len(exact_jp)}")

    # --- reloc-aware classification on a sample (or full pool) ---
    classify_set = pool
    sampled = False
    if SAMPLE and len(pool) > SAMPLE:
        random.seed(SEED)
        classify_set = random.sample(pool, SAMPLE)
        sampled = True
    print(f"reloc-aware classification of {len(classify_set)} "
          f"{'(SAMPLE)' if sampled else '(FULL)'} functions ...")
    results = []
    with Pool(nproc, initializer=_init_reloc, initargs=(JP_ROM,)) as p:
        for r in p.imap_unordered(reloc_classify_one, classify_set, chunksize=8):
            results.append(r)

    label_count = defaultdict(int)
    label_bytes = defaultdict(int)
    region_same_rows = []  # (jp, us, size, tier, name, tu)
    region_diff_rows = []  # (us, size, name, tu) -- env-gated worklist (permuter/hand-decomp)
    sample_names = set()
    for label, us, size, jp, name, tu in results:
        label_count[label] += 1
        label_bytes[label] += size
        sample_names.add(name)
        if label in ("region-same-unique", "region-same-ambiguous"):
            tier = "reloc-unique" if label == "region-same-unique" else "reloc-ambiguous"
            jpv = jp if jp != -1 else (exact_jp.get(name, (-1,))[0])
            region_same_rows.append((jpv, us, size, tier, name, tu))
        elif label == "region-different":
            region_diff_rows.append((us, size, name, tu))

    # Env-gated REGION-DIFFERENT worklist (permuter/hand-decomp frontier, D54/D60).
    # Additive only -- does not affect the region-same output or `make compare`.
    if os.environ.get("CLASSIFY_EMIT_RD"):
        region_diff_rows.sort(key=lambda r: r[1])  # smallest first (cheapest to match)
        rd_out = "layout/nofuncmap_region_different.tsv"
        with open(rd_out, "w") as f:
            f.write("# REGION-DIFFERENT no-funcmap US-C-portable functions (D54 frontier).\n")
            f.write("# Generated by scripts/classify_nofuncmap.py with CLASSIFY_EMIT_RD=1.\n")
            f.write("# Zero JP match under the reloc mask -> genuine codegen difference ->\n")
            f.write("# permuter / hand-decomp (IDA/Ghidra). Sorted smallest-first.\n")
            f.write("# us_addr\tsize\tname\ttu\n")
            for us, size, name, tu in region_diff_rows:
                f.write(f"{us:08X}\t{size}\t{name}\t{tu or '-'}\n")
        print(f"wrote {rd_out} ({len(region_diff_rows)} region-different functions)")

    # Add raw-exact anchors NOT already in the sampled region-same rows -> worklist.
    rs_names = {n for _j, _u, _s, _t, n, _tu in region_same_rows}
    for name, (jp, us, size, tu) in exact_jp.items():
        if name not in rs_names:
            region_same_rows.append((jp, us, size, "exact", name, tu))
            rs_names.add(name)
    region_same_rows.sort(key=lambda r: (r[0] if r[0] >= 0 else 1 << 40))

    n = len(results)
    rsu = label_count["region-same-unique"]
    rsa = label_count["region-same-ambiguous"]
    rs = rsu + rsa
    rd = label_count["region-different"]
    inc = (label_count["inconclusive"] + label_count["inconclusive-compile"]
           + label_count["inconclusive-shortneedle"])
    decided = rs + rd  # functions where the reloc test gave a verdict

    def pctn(x):
        return (100.0 * x / n) if n else 0.0

    def pctd(x):
        return (100.0 * x / decided) if decided else 0.0

    pool_n = len(pool)
    full_run = not sampled  # classified the WHOLE pool -> rs/rd are exact counts
    # Projection over the whole pool: when sampled, scale the decided rate; when a
    # full run, project ONLY the inconclusive remainder at the decided rate (the
    # rs/rd over the decided set are already exact for the full pool).
    est_rs = pctd(rs) / 100.0 * pool_n   # decided-rate applied to the whole pool
    est_rd = pctd(rd) / 100.0 * pool_n

    # ----- worklist tsv -----
    os.makedirs("layout", exist_ok=True)
    with open(OUT_TSV, "w") as f:
        f.write("# Newly-confirmed REGION-SAME no-funcmap US-C-portable functions.\n")
        f.write("# Generated by scripts/classify_nofuncmap.py (relocation-aware\n")
        f.write("# find_runs-style match + raw-byte exact pre-pass). These are NOT in\n")
        f.write("# layout/us_jp_funcmap.tsv -- the harvest agents can target them next.\n")
        f.write("# tier: exact=raw US bytes unique in JP (immediately portable);\n")
        f.write("#       reloc-unique=isolated-compile masked .text unique in JP;\n")
        f.write("#       reloc-ambiguous=masked .text matches >=2 JP sites (carve w/ neighbour).\n")
        f.write("# jp_addr\tus_addr\tsize\ttier\tname\ttu\n")
        for jp, us, size, tier, name, tu in region_same_rows:
            jps = f"{jp:08X}" if jp >= 0 else "????????"
            f.write(f"{jps}\t{us:08X}\t{size}\t{tier}\t{name}\t{tu or '-'}\n")
    print(f"wrote {OUT_TSV} ({len(region_same_rows)} region-same functions: "
          f"{len(exact_jp)} raw-exact full-pool + sampled reloc rows)")

    tu_rs = defaultdict(int)
    for jp, us, size, tier, name, tu in region_same_rows:
        tu_rs[tu or "-"] += 1
    tu_ranked = sorted(tu_rs.items(), key=lambda x: -x[1])

    # ----- markdown report -----
    L = []
    A = L.append
    A("# No-funcmap US-C-portable functions: region-same vs region-different")
    A("")
    A("_Generated by `scripts/classify_nofuncmap.py`. Do not edit by hand._")
    A("")
    A("**The question (D41/D51/D52 follow-up).** The honest matching-C ceiling is")
    A(f"~{info['us_c_total']} US-C-portable functions (US `src/<tu>.o` text symbols);")
    A(f"{info['us_c_grad']} are graduated. The ungraduated remainder splits by whether")
    A("the funcmap (`layout/us_jp_funcmap.tsv`, the exact/masked tiers from")
    A("`match_us_jp.py`) tracks each function. The **no-funcmap** functions were never")
    A("run through those tiers -- but no-funcmap is **NOT** region-different:")
    A(f"**{info['grad_nofuncmap']} ALREADY-graduated** US-C functions were no-funcmap too")
    A("(whole-TU / verified-run ports cover funcmap and non-funcmap alike). So the")
    A("no-funcmap pool is an **unmeasured MIX**. This report measures it.")
    A("")
    A("## Methodology -- why a raw-byte search is wrong, and the sound classifier")
    A("")
    A("`match_us_jp.py`'s exact/masked search looks for a function's RAW US bytes in the")
    A("JP ROM, masking only pointer-literal words. A region-same function RELOCATED to a")
    A("different JP address has different bytes at every relocation site -- `bl`/pc-rel")
    A("`ldr` offset fields and the trailing constant pool, not just pointer literals --")
    A("so a raw search misses almost all relocated region-same code. **Validated:** run")
    A("against the known-region-same control (the graduated no-funcmap functions), the")
    A("raw-byte search labels ~97% of them \"region-different\" (false). That is exactly")
    A("why most US-C functions are no-funcmap: relocated, not different.")
    A("")
    A("The sound classifier is the project's own `find_runs.py` (D2) test, applied per")
    A("function: **compile** the US source in isolation (`extract_run.py` + agbcc), read")
    A("the **true relocation offsets** from `objdump -r`, **mask** every reloc-affected")
    A("byte, and masked-search the JP ROM. Verdicts: `region-same-unique` (masked .text")
    A("uniquely located in JP), `region-same-ambiguous` (>=2 JP sites; resolves when")
    A("carved with a neighbour), `region-different` (adequate needle, zero JP match ->")
    A("genuine codegen difference), `inconclusive` (needle too short / isolated compile")
    A("needs TU context). On the known-region-same control the reloc-aware test labels")
    A("~97.5% region-same with **0** false region-different, so its region-same count is")
    A("a sound LOWER bound and region-different a sound UPPER bound on the hand-decomp")
    A("frontier.")
    A("")
    A("## Population (full US text-symbol table, by source kind)")
    A("")
    A("| US source kind | functions | note |")
    A("|------|-------:|------|")
    A(f"| US-C-portable | {by_kind.get('US-C-portable',0)} | real C TUs -- the matching-C ceiling |")
    A(f"| US-ASM-stays (arm.o/arm_call.o) | {by_kind.get('US-ASM-stays',0)} | ARM-mode; **EXCLUDED** (never decompiled to C in fe8u) |")
    A(f"| LIBC/LIBGCC (tools/agbcc) | {by_kind.get('LIBC/LIBGCC',0)} | vendored library; **EXCLUDED** (link-the-library) |")
    if by_kind.get("UNKNOWN-obj"):
        A(f"| UNKNOWN-obj | {by_kind['UNKNOWN-obj']} | text in a non-src/asm/lib object (US-only labels) |")
    A("")
    A(f"- Excluded never-C pool: **{nonc}** functions "
      f"({by_kind.get('US-ASM-stays',0)} ASM-stays + {by_kind.get('LIBC/LIBGCC',0)} libc/libgcc) "
      f"-- not classified as graduatable.")
    A("")
    A("## US-C-portable accounting")
    A("")
    A("| bucket | count |")
    A("|------|-------:|")
    A(f"| US-C-portable total (ceiling) | {info['us_c_total']} |")
    A(f"| graduated (JP) | {info['us_c_grad']} |")
    A(f"| &nbsp;&nbsp;of which were no-funcmap | {info['grad_nofuncmap']} |")
    A(f"| ungraduated | {info['us_c_ungrad']} |")
    A(f"| &nbsp;&nbsp;funcmap-tracked (exact/masked) | {info['fm_ungrad']} |")
    A(f"| &nbsp;&nbsp;**no-funcmap (classified below)** | **{pool_n}** |")
    A("")
    if sampled:
        A(f"> Classified a random SAMPLE of **{n}** of the {pool_n} no-funcmap pool with")
        A(f"> the (slow) reloc-aware test for the statistical estimate; a fast raw-byte")
        A(f"> EXACT pre-pass additionally scanned the FULL pool ({len(exact_jp)} exact")
        A(f"> anchors). Per-function labels are in `{OUT_TSV}`.")
    else:
        A(f"> Classified the **FULL** no-funcmap pool ({pool_n} functions) with the")
        A(f"> reloc-aware test (no sampling) -- the counts below are EXACT. Per-function")
        A(f"> labels for every region-same function are in `{OUT_TSV}`.")
    A("")
    A("> Count reconciliation: `us_source_tracker.py` reports the canonical ceiling as")
    A("> ~8209 US-C-portable (parsed from US map *symbol lines*); this script counts")
    A(f"> {info['us_c_total']} via `nm -S` on the US ELF (a few extra compiler-local")
    A("> `t` labels inside `src/*.o` ranges). The ~1% difference does not affect the")
    A("> region-same/region-different SPLIT measured below.")
    A("")
    A("## THE HEADLINE -- the no-funcmap mix (relocation-aware)")
    A("")
    pop_word = "sampled" if sampled else "classified"
    A(f"Of the **{n}** {pop_word} no-funcmap US-C-portable functions:")
    A("")
    sh = "sample" if sampled else "pool"
    A(f"| label | count | % of {sh} | % of decided | meaning |")
    A("|------|-------:|----:|----:|------|")
    A(f"| region-same-unique | {rsu} | {pctn(rsu):.1f}% | {pctd(rsu):.1f}% | masked .text uniquely in JP -- carvable now |")
    A(f"| region-same-ambiguous | {rsa} | {pctn(rsa):.1f}% | {pctd(rsa):.1f}% | masked .text >=2 JP sites -- carve w/ neighbour |")
    A(f"| **region-same (total)** | **{rs}** | **{pctn(rs):.1f}%** | **{pctd(rs):.1f}%** | **the lever's remaining pool** |")
    A(f"| region-different | {rd} | {pctn(rd):.1f}% | {pctd(rd):.1f}% | zero JP match -- permuter / hand-decomp |")
    A(f"| inconclusive | {inc} | {pctn(inc):.1f}% | -- | short needle / compile needs TU context |")
    A("")
    A(f"Excluding the {inc} inconclusive, of the **{decided} decided** {sh} functions")
    A(f"**{rs} ({pctd(rs):.1f}%) are REGION-SAME** and **{rd} ({pctd(rd):.1f}%) are")
    A(f"region-different**.")
    A("")
    if sampled:
        A("### Extrapolated to the full no-funcmap pool")
        A("")
        A(f"Applying the decided-sample rates to all **{pool_n}** no-funcmap US-C functions:")
        A("")
        A(f"- **region-same  ~= {est_rs:.0f}** ({pctd(rs):.1f}%) -- **the lever's remaining")
        A(f"  pool** (harvest_verified_runs / graduate_shared_run / bind_tu_data / subrun")
        A(f"  decompose; the binding+carve machinery from D41-D53).")
        A(f"- **region-different ~= {est_rd:.0f}** ({pctd(rd):.1f}%) -- the genuine")
        A(f"  permuter / hand-decomp (IDA/Ghidra) frontier.")
        rs_for_ceiling = est_rs
        rd_for_ceiling = est_rd
    else:
        A("### Full-pool result (exact) + inconclusive projection")
        A("")
        A(f"- **region-same = {rs} CONFIRMED** ({pctd(rs):.1f}% of decided) -- **the")
        A(f"  lever's remaining pool** (harvest_verified_runs / graduate_shared_run /")
        A(f"  bind_tu_data / subrun_decompose; the binding+carve machinery from D41-D53).")
        A(f"  Every one is listed in `{OUT_TSV}`.")
        A(f"- **region-different = {rd} CONFIRMED** ({pctd(rd):.1f}% of decided) -- the")
        A(f"  genuine permuter / hand-decomp (IDA/Ghidra) frontier.")
        A(f"- **inconclusive = {inc}** (short needle / isolated compile needs TU context).")
        A(f"  Splitting these at the decided rate projects ~{est_rs - rs:.0f} more")
        A(f"  region-same and ~{est_rd - rd:.0f} more region-different, i.e. a")
        A(f"  whole-pool estimate of **~{est_rs:.0f} region-same / ~{est_rd:.0f}")
        A(f"  region-different**.")
        rs_for_ceiling = est_rs
        rd_for_ceiling = est_rd
    A("")
    A("Implication for the ceiling: combined with the")
    A(f"{info['us_c_grad']} already-graduated and the {info['fm_ungrad']} funcmap-tracked")
    A(f"ungraduated (also region-same), the byte/relocation-confirmable matching-C reach")
    A(f"is ~{info['us_c_grad'] + info['fm_ungrad'] + rs_for_ceiling:.0f} / {info['us_c_total']} "
      f"(~{pct_of(info['us_c_grad'] + info['fm_ungrad'] + rs_for_ceiling, info['us_c_total']):.0f}% of")
    A(f"the ceiling), leaving ~{rd_for_ceiling:.0f} no-funcmap functions as the real")
    A("region-different hand-decomp frontier.")
    A("")
    A("> Caveat: `region-same` here means the JP instruction stream matches the US one")
    A("> modulo relocation -- it is the LEVER's domain (carve + data-binding, D41-D53),")
    A("> not a promise each lands in `make compare` without the per-TU binding work the")
    A("> waves describe. Some unique-masked-match functions still need their TU-private")
    A("> data bound first (e.g. the D45/D51 UnpackRaw class). They remain lever pool,")
    A("> not hand-decomp.")
    A("")
    A("## Region-same worklist by TU (top 40)")
    A("")
    A(f"Where the confirmed region-same no-funcmap functions live -- harvest agents can")
    A(f"target the richest TUs next (`{OUT_TSV}` has all {len(region_same_rows)} "
      f"reloc-confirmed rows" + (f" + {len(exact_jp)} raw-exact anchors" if exact_jp else "")
      + ").")
    A("")
    A("| US TU | region-same no-funcmap fns (worklist) |")
    A("|-------|--------------------------------------:|")
    for tu, c in tu_ranked[:40]:
        A(f"| {tu} | {c} |")
    A("")

    open(OUT_MD, "w").write("\n".join(L) + "\n")
    print(f"wrote {OUT_MD}")

    print()
    print("== NO-FUNCMAP CLASSIFICATION HEADLINE (reloc-aware) ==")
    print(f"  pool                    : {pool_n}")
    print(f"  classified              : {n} {'(SAMPLE)' if sampled else '(FULL)'} "
          f"(decided {decided}, inconclusive {inc})")
    print(f"  region-same-unique      : {rsu} ({pctd(rsu):.1f}% of decided)")
    print(f"  region-same-ambiguous   : {rsa} ({pctd(rsa):.1f}% of decided)")
    print(f"  region-same TOTAL       : {rs} ({pctd(rs):.1f}% of decided)  <- lever pool")
    print(f"  region-different        : {rd} ({pctd(rd):.1f}% of decided)  <- hand-decomp")
    print(f"  -> whole-pool estimate (incl. inconclusive): region-same ~{est_rs:.0f}, "
          f"region-different ~{est_rd:.0f}")
    print(f"  (graduated were no-funcmap: {info['grad_nofuncmap']})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
