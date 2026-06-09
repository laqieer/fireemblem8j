#!/usr/bin/env python3
"""Carve STRANDED region-same code that lives in a *non-src* object (asm/<x>.o).

Background
----------
`carve_unported_asm.py` only handles region-same funcmap functions whose US TU is
`src/<tu>.s` AND the *entire* TU is still un-carved (it emits one full-span
`asm/<tu>.s` per TU and skips if `asm/<tu>.s` already exists). It also maps each
funcmap name to a TU by matching only ``src/<tu>.o`` ``.text`` sections in the US
``fireemblem8.map``.

That misses a whole class of region-same code that is *stranded*: hand-written
**ARM** code that the US decomp keeps in ``asm/arm.o`` (the ``ARMCodeToCopy``
block — ColorFadeTick / ClearOam / Checksum32 / TmFillRect / ... / MapFloodCore,
US/JP 0x08000228..0x08000a20). These functions are NOT in any ``src/<tu>.o``
section, so the old fn->TU mapper buckets them as "no map" and never carves them.
In the JP build their bytes are still in ``asm/baserom.s`` and their symbols are
provided only as sizeless ``.set`` aliases in ``asm/jp_syms.s`` (mirrored in
``layout/baseline_syms.tsv``).

This carver carves such a non-src code object as a single DESCRIPTIVE-ASM object
``asm/<obj>.s``: one ``.text.<obj>`` section that ``.incbin``s the verbatim JP ROM
bytes for the contiguous span and defines every funcmap symbol in the span as a
``.global`` label. Because the bytes come straight from ``baserom.gba`` this is
byte-identical by construction; ``make compare`` is the only oracle
(verify-or-revert). Symbols already aliased in ``baseline_syms`` (jp_syms) are
dropped into ``baseline_syms_drop.d`` so the real ``.global`` definition wins
without double-define.

ARM vs Thumb: the arm block is ARM-mode (4-byte instructions, no interwork bit),
so the section directive is ``.arm`` and labels are plain ``.global`` (no
``.thumb_func``). The carved-range hi is rounded up to 4 (a code section is
4-aligned) and the trailing pad is incbin'd verbatim from baserom so it stays
byte-exact.

This ADDS BYTE COVERAGE and names the functions but does NOT add a "decompiled
function" to calcprogress.py (which counts only src/ C) — the intended trade for
region-same asm on the road to byte-complete.

Parallel-UNSAFE relative to other carvers that share the build (runs ``make
layout`` / ``make compare``). New manifest rows go ONLY to per-task fragments
``layout/carved_rom.d/stranded_<obj>.tsv`` and
``layout/baseline_syms_drop.d/stranded_<obj>.tsv``.

Usage:
  scripts/carve_stranded_asm.py            # carve every known stranded asm object
  scripts/carve_stranded_asm.py --list     # print the plan, carve nothing
  scripts/carve_stranded_asm.py OBJ [OBJ..] # restrict to these US objects
"""
import os, re, sys, glob, subprocess

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)                                  # the worktree this script lives in
US = "/home/laqieer/fireemblem8u"
BASE = 0x08000000

# Non-src code objects in the US map that hold region-same code stranded out of
# any src/<tu>.o section. mode is "arm" or "thumb".
STRANDED_OBJS = {
    "arm": {"section": "asm/arm.o", "mode": "arm"},
}


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def carved_rom_ranges():
    ranges = []
    for path in ["layout/carved_rom.tsv"] + sorted(glob.glob("layout/carved_rom.d/*.tsv")):
        if not os.path.exists(path):
            continue
        for ln in open(path):
            ln = ln.rstrip("\n")
            if not ln or ln.lstrip().startswith("#"):
                continue
            c = ln.split("\t")
            if len(c) < 3:
                continue
            try:
                s, e = int(c[0], 16), int(c[1], 16)
            except ValueError:
                continue
            ranges.append((BASE + s, BASE + e))
    ranges.sort()
    return ranges


def covered(addr, size, ranges):
    for s, e in ranges:
        if addr < e and addr + size > s:
            return True
    return False


def map_section_span(section):
    """Return (lo, hi) US-addr span of a US-map ``.text`` ``<section>`` line and
    the list of (addr, name) labels inside it (including the trailing end marker
    at exactly hi)."""
    lo = hi = None
    labels = []
    in_sec = False
    sec_end = 0
    for ln in open(f"{US}/fireemblem8.map"):
        m = re.match(r"\s*\.text\s+0x([0-9a-f]+)\s+0x([0-9a-f]+)\s+(\S+)\.o", ln)
        if m:
            obj = m.group(3) + ".o"
            if obj == section:
                lo = int(m.group(1), 16)
                hi = lo + int(m.group(2), 16)
                sec_end = hi
                in_sec = True
            else:
                in_sec = False
            continue
        if in_sec:
            m2 = re.match(r"\s+0x([0-9a-f]+)\s+(\w+)\s*$", ln)
            if m2:
                a = int(m2.group(1), 16)
                if lo <= a <= sec_end:
                    labels.append((a, m2.group(2)))
    labels.sort()
    return lo, hi, labels


def funcmap_names_in_span(lo, hi):
    """funcmap exact|masked names whose jp addr falls in [lo,hi). Returns dict
    jp_addr -> (name, size). (JP == US for the arm block, shift +0.)"""
    out = {}
    for ln in open("layout/us_jp_funcmap.tsv"):
        if ln.startswith("#"):
            continue
        c = ln.rstrip().split("\t")
        if len(c) < 5:
            continue
        jp, us, size, tier, name = int(c[0], 16), int(c[1], 16), int(c[2]), c[3], c[4]
        if tier not in ("exact", "masked"):
            continue
        if lo <= jp < hi:
            out.setdefault(jp, (name, size))
    return out


def baseline_names():
    names = set()
    for p in ["layout/baseline_syms.tsv"] + sorted(glob.glob("layout/baseline_syms.d/*.tsv")):
        if not os.path.exists(p):
            continue
        for l in open(p):
            if l.strip() and not l.startswith("#"):
                names.add(l.split("\t")[0])
    return names


def plan(obj):
    """Return a carve plan for a stranded object, or None if not carvable.

    addresses are JP VRAM; labels are every named symbol in the span that the
    carved object should define (start marker + funcmap fns)."""
    spec = STRANDED_OBJS[obj]
    lo, hi, map_labels = map_section_span(spec["section"])
    if lo is None:
        return None
    # JP == US for these objects (shift +0). Confirm in funcmap.
    fm = funcmap_names_in_span(lo, hi)
    if not fm:
        return None
    # The label at exactly `hi` (e.g. ARMCodeToCopy_End) is the section END
    # marker, emitted after the final incbin, not as an interior label.
    interior = [(a, n) for a, n in map_labels if lo <= a < hi]
    end_marker = next(((a, n) for a, n in map_labels if a == hi), None)
    # 4-align hi (code section pad); the trailing pad is incbin'd from baserom.
    romlo = lo - BASE
    romhi = ((hi + 3) & ~3) - BASE
    return {
        "obj": obj, "mode": spec["mode"], "section": spec["section"],
        "lo": lo, "hi": hi, "romlo": romlo, "romhi": romhi,
        "labels": interior, "end_marker": end_marker, "fm": fm,
    }


def emit_asm(p):
    obj, mode = p["obj"], p["mode"]
    lo, hi = p["lo"], p["hi"]
    romhi_addr = BASE + p["romhi"]
    thumb = mode == "thumb"
    L = [f'\t.section .text.{obj}, "ax", %progbits',
         f'@ {obj} region-same {mode} code stranded out of src/ (US {p["section"]}):',
         f'@ JP 0x{lo:08X}..0x{hi:08X} (shift +0); descriptive incbin baserom.gba',
         ('\t.thumb' if thumb else '\t.arm'),
         '\t.align 2, 0']
    prev = lo
    seen = set()
    for a, name in p["labels"]:
        if name in seen:
            continue
        seen.add(name)
        if a > prev:
            L.append(f'\t.incbin "baserom.gba", 0x{prev-BASE:X}, 0x{a-prev:X}')
        L.append(f'\t.global {name}')
        if thumb:
            L.append('\t.thumb_func')
        L.append(f'{name}:')
        prev = a
    if romhi_addr > prev:                         # remaining bytes + 4-align pad
        L.append(f'\t.incbin "baserom.gba", 0x{prev-BASE:X}, 0x{romhi_addr-prev:X}')
    if p["end_marker"]:
        a, name = p["end_marker"]
        # end marker sits at hi (== object end). emit as a plain global label.
        L.append(f'\t.global {name}')
        L.append(f'{name}:')
    open(f"asm/{obj}.s", "w").write("\n".join(L) + "\n")
    return [n for _, n in p["labels"]] + ([p["end_marker"][1]] if p["end_marker"] else [])


def carve(p):
    obj = p["obj"]
    frag = f"stranded_{obj}"
    files = [f"asm/{obj}.s",
             f"layout/carved_rom.d/{frag}.tsv",
             f"layout/baseline_syms_drop.d/{frag}.tsv"]
    snap = {pp: (open(pp).read() if os.path.exists(pp) else None) for pp in files}

    names = emit_asm(p)
    os.makedirs("layout/carved_rom.d", exist_ok=True)
    nfn = len(p["fm"])
    open(f"layout/carved_rom.d/{frag}.tsv", "w").write(
        f"{p['romlo']:06X}\t{p['romhi']:06X}\tasm/{obj}.o(.text.{obj})\t"
        f"{obj} region-same {p['mode']} code ({nfn} fns, descriptive incbin)\n")
    # Drop any of our names already aliased in baseline_syms (jp_syms .set) so the
    # real .global definition wins without a double-define.
    bn = baseline_names()
    dup = sorted(n for n in names if n in bn)
    if dup:
        os.makedirs("layout/baseline_syms_drop.d", exist_ok=True)
        open(f"layout/baseline_syms_drop.d/{frag}.tsv", "w").write(
            "".join(n + "\n" for n in dup))

    sh("make layout")
    mc = sh("make compare")
    if "fireemblem8.gba: OK" in mc.stdout:
        nb = p["romhi"] - p["romlo"]
        print(f"  {obj}: OK ({nfn} fns, {nb:#x} bytes"
              f"{f', -{len(dup)} dup aliases' if dup else ''})", flush=True)
        return True, nfn, nb
    # revert
    for pp, c in snap.items():
        if c is None:
            if os.path.exists(pp):
                os.remove(pp)
        else:
            open(pp, "w").write(c)
    sh(f"rm -f asm/{obj}.o")
    sh("make layout")
    tail = "\n".join((mc.stdout + mc.stderr).splitlines()[-6:])
    print(f"  {obj}: FAILED make compare -> reverted\n{tail}", flush=True)
    return False, 0, 0


def main():
    args = sys.argv[1:]
    do_list = "--list" in args
    only = set(a for a in args if not a.startswith("--"))
    ranges = carved_rom_ranges()
    objs = [o for o in STRANDED_OBJS if not only or o in only]
    plans = []
    for o in objs:
        p = plan(o)
        if p is None:
            print(f"  {o}: no carvable span (not in US map / not in funcmap) -> skip", flush=True)
            continue
        if covered(p["lo"], p["hi"] - p["lo"], ranges):
            print(f"  {o}: span 0x{p['lo']:X}..0x{p['hi']:X} already carved -> skip", flush=True)
            continue
        plans.append(p)
    print(f"carve_stranded_asm: {len(plans)} stranded objects to carve", flush=True)
    if do_list:
        for p in plans:
            print(f"  {p['obj']:12s} {p['lo']:08X}..{p['hi']:08X}  "
                  f"{len(p['fm']):3d} fns  {p['romhi']-p['romlo']:#x} bytes  ({p['mode']})")
        return 0

    ok_obj = ok_fns = ok_bytes = 0
    for p in plans:
        if os.path.exists(f"asm/{p['obj']}.s"):
            print(f"  {p['obj']}: asm/{p['obj']}.s already exists -> skipping", flush=True)
            continue
        good, nf, nb = carve(p)
        if good:
            ok_obj += 1; ok_fns += nf; ok_bytes += nb
            sh("git add -A")
            sh(f'git commit -q -m "carve(asm): {p["obj"]} stranded region-same '
               f'{p["mode"]} code ({nf} fns, {nb} bytes)\n\n'
               f'Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>"')
            print(f"  committed {p['obj']}", flush=True)
    mc = sh("make compare")
    green = "fireemblem8.gba: OK" in mc.stdout
    print(f"\ncarve_stranded_asm: carved {ok_obj} objects / {ok_fns} fns / "
          f"{ok_bytes} bytes; build {'GREEN' if green else 'RED'}", flush=True)
    return 0 if green else 1


if __name__ == "__main__":
    sys.exit(main())
