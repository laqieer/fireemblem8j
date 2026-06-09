#!/usr/bin/env python3
"""Carve STRANDED region-same funcmap functions as DESCRIPTIVE-INCBIN (Thumb).

Why this exists (vs carve_exact.py)
-----------------------------------
``carve_exact.py`` carves an exact-tier funcmap function by extracting the US C
source, recompiling it with agbcc, and placing it at the JP address. That works
only when the recompiled bytes reproduce the JP ROM bytes. For a function that
lives in a TU whose JP image is SHIFTED relative to US (``jp_addr != us_addr`` in
the funcmap), the raw bytes are still byte-identical (the whole TU moved as a
block, so intra-TU relative branches are preserved), but a *recompile* re-resolves
every ``bl``/``b`` against the JP global symbol table — and inter-TU calls land on
JP addresses whose encoded offset differs from the raw ROM. Result: the recompile
links fine but the ROM sha1 fails (verified: all 102 shifted-TU exact candidates
fail carve_exact's make-compare, e.g. proc Proc_End jp=0x2CBC/us=0x2D6C).

The funcmap ``exact`` tier guarantees the JP ROM bytes at ``jp_addr`` are
byte-identical to the US function image (verified by hand for Proc_End: JP@0x2CBC
== US@0x2D6C, all 24 bytes). So the byte-perfect carve is a DESCRIPTIVE INCBIN of
those raw JP bytes — exactly the technique carve_unported_asm / carve_stranded_asm
use for region-same asm. This ADDS BYTE COVERAGE (code bytes in src) but does NOT
add a calcprogress "decompiled function" (that counts only compiled C). It is the
correct trade for a shifted-TU region-same function that cannot be re-derived from
C without first solving the whole TU's relocation layout.

Each carved function becomes its own ``.text.s_<addr>`` section in a per-run
descriptive-asm file ``asm/stranded/<tu>.s`` (grouped by US TU for tidiness),
``.incbin``-ing ``baserom.gba`` over ``[jp_addr, jp_addr+size)`` and defining the
funcmap symbol as a ``.global``/``.thumb_func`` label. make compare is the only
oracle (verify-or-revert per run). Symbols already aliased in baseline_syms
(jp_syms) are dropped into baseline_syms_drop.d so the real label wins.

Candidate set: exact-tier funcmap rows, jp_addr < CODE_END, NOT already covered by
any carved .text range, and NOT already C-carved by carve_exact (no
src/exact_<addr>.c). We restrict to ``exact`` (no false-positive window) — masked
rows are out of scope. (ARM funcs, if any, are emitted with .arm.)

Parallel-UNSAFE relative to other carvers sharing the build (runs make layout /
make compare). New rows go ONLY to per-task fragments
``layout/carved_rom.d/stranded_func_<tu>.tsv`` +
``layout/baseline_syms_drop.d/stranded_func_<tu>.tsv``.

Usage:
  scripts/carve_stranded_func.py            # carve every eligible stranded func
  scripts/carve_stranded_func.py --list     # print plan, carve nothing
  scripts/carve_stranded_func.py --limit N  # carve at most N runs (smoke test)
  scripts/carve_stranded_func.py TU [TU..]  # restrict to these US TUs
"""
import os, re, sys, glob, subprocess

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u"
BASE = 0x08000000
CODE_END = 0x080DC134           # first data byte; code region is jp_addr < this


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


def fn_to_tu():
    """Map each US funcmap symbol to its US TU (src/<tu>.o .text section)."""
    fn_tu, tu, tu_end = {}, None, 0
    for ln in open(f"{US}/fireemblem8.map"):
        m = re.match(r"\s+\.text\s+0x([0-9a-f]+)\s+0x([0-9a-f]+)\s+src/([\w-]+)\.o", ln)
        if m:
            tu = m.group(3); tu_end = int(m.group(1), 16) + int(m.group(2), 16)
        m2 = re.match(r"\s+0x([0-9a-f]+)\s+(\w+)\s*$", ln)
        if m2 and int(m2.group(1), 16) < tu_end:
            fn_tu[m2.group(2)] = tu
    return fn_tu


def baseline_names():
    names = set()
    for p in ["layout/baseline_syms.tsv"] + sorted(glob.glob("layout/baseline_syms.d/*.tsv")):
        if not os.path.exists(p):
            continue
        for l in open(p):
            if l.strip() and not l.startswith("#"):
                names.add(l.split("\t")[0])
    return names


def candidates(only_tus):
    """Return {tu: [(jp_addr, size, name), ...] sorted}. Only exact-tier funcmap
    rows that are uncovered AND not already C-carved (src/exact_<addr>.c)."""
    ranges = carved_rom_ranges()
    fn_tu = fn_to_tu()
    by_tu = {}
    for ln in open("layout/us_jp_funcmap.tsv"):
        if ln.startswith("#"):
            continue
        c = ln.rstrip().split("\t")
        if len(c) < 5:
            continue
        jp, us, size, tier, name = int(c[0], 16), int(c[1], 16), int(c[2]), c[3], c[4]
        if tier != "exact" or jp >= CODE_END:
            continue
        if covered(jp, size, ranges):
            continue
        if os.path.exists(f"src/exact_{jp:08x}.c"):   # already C-carved
            continue
        tu = fn_tu.get(name) or "_unmapped"
        if only_tus and tu not in only_tus:
            continue
        by_tu.setdefault(tu, []).append((jp, size, name))
    for tu in by_tu:
        by_tu[tu].sort()
    return by_tu


def emit_run(tu, fn):
    """fn = (jp, size, name). Write/append a per-function .text.s_<addr> section
    into asm/stranded_<tu>.s (FLAT under asm/ — the Makefile's ASM_S_FILES globs
    only asm/*.s, NOT subdirs, so a subdir .s would never assemble and ld would
    silently link a hole -> sha1 fail); return (romlo, romhi, name)."""
    jp, size, name = fn
    lo, hi = jp, jp + size
    romlo, romhi = lo - BASE, hi - BASE
    path = f"asm/stranded_{tu}.s"
    sec = f"s_{lo:08X}"
    body = [f'\t.section .text.{sec}, "ax", %progbits',
            f'@ {name} region-same Thumb (US shifted); descriptive incbin baserom.gba',
            f'@ JP 0x{lo:08X}..0x{hi:08X}',
            '\t.thumb',
            '\t.align 2, 0',
            f'\t.global {name}',
            '\t.thumb_func',
            f'{name}:',
            f'\t.incbin "baserom.gba", 0x{romlo:X}, 0x{size:X}',
            '']
    with open(path, "a") as f:
        f.write("\n".join(body) + "\n")
    return romlo, romhi, sec, name


def carve_run(tu, fn):
    jp, size, name = fn
    frag = f"stranded_func_{tu}"
    asm_path = f"asm/stranded_{tu}.s"
    files = [asm_path,
             f"layout/carved_rom.d/{frag}.tsv",
             f"layout/baseline_syms_drop.d/{frag}.tsv"]
    snap = {p: (open(p).read() if os.path.exists(p) else None) for p in files}

    romlo, romhi, sec, nm = emit_run(tu, fn)
    os.makedirs("layout/carved_rom.d", exist_ok=True)
    with open(f"layout/carved_rom.d/{frag}.tsv", "a") as f:
        f.write(f"{romlo:06X}\t{romhi:06X}\tasm/stranded_{tu}.o(.text.{sec})\t"
                f"{tu}:{name} region-same Thumb (descriptive incbin)\n")
    bn = baseline_names()
    if name in bn:
        os.makedirs("layout/baseline_syms_drop.d", exist_ok=True)
        with open(f"layout/baseline_syms_drop.d/{frag}.tsv", "a") as f:
            f.write(name + "\n")

    sh("make layout")
    mc = sh("make compare")
    if "fireemblem8.gba: OK" in mc.stdout:
        return True, size
    # revert
    for p, c in snap.items():
        if c is None:
            if os.path.exists(p):
                os.remove(p)
        else:
            open(p, "w").write(c)
    sh(f"rm -f asm/stranded_{tu}.o")
    sh("make layout")
    return False, 0


def main():
    args = sys.argv[1:]
    do_list = "--list" in args
    limit = None
    if "--limit" in args:
        i = args.index("--limit"); limit = int(args[i + 1]); del args[i:i + 2]
    only = set(a for a in args if not a.startswith("--"))
    by_tu = candidates(only)
    nfns = sum(len(v) for v in by_tu.values())
    print(f"carve_stranded_func: {len(by_tu)} TUs, {nfns} stranded exact funcs", flush=True)
    if do_list:
        for tu, v in sorted(by_tu.items()):
            tot = sum(s for _, s, _ in v)
            print(f"  {tu:28s} {len(v):3d} fns  {tot:5d} bytes  "
                  f"[{', '.join(n for _, _, n in v[:3])}{'...' if len(v) > 3 else ''}]")
        return 0

    ok_fns = ok_bytes = 0
    done = 0
    for tu, v in sorted(by_tu.items()):
        for fn in v:
            if limit is not None and done >= limit:
                break
            good, nb = carve_run(tu, fn)
            done += 1
            if good:
                ok_fns += 1; ok_bytes += nb
                sh("git add -A")
                sh(f'git commit -q -m "carve(asm): {fn[2]} stranded region-same '
                   f'Thumb from {tu} ({nb} bytes, descriptive incbin)\n\n'
                   f'Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>"')
                print(f"  {tu}:{fn[2]}: OK ({nb} bytes) committed", flush=True)
            else:
                print(f"  {tu}:{fn[2]}: FAILED make compare -> reverted", flush=True)
        if limit is not None and done >= limit:
            break
    mc = sh("make compare")
    green = "fireemblem8.gba: OK" in mc.stdout
    print(f"\ncarve_stranded_func: carved {ok_fns} fns / {ok_bytes} bytes; "
          f"build {'GREEN' if green else 'RED'}", flush=True)
    return 0 if green else 1


if __name__ == "__main__":
    sys.exit(main())
