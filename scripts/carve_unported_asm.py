#!/usr/bin/env python3
"""Carve UNPORTED region-same `.s` (descriptive-asm) translation units.

The exact/masked carvers (carve_exact.py / carve_masked.py) only handle funcmap
functions whose US TU is a `.c` (they extract + compile C). A handful of FE8 TUs
are hand-written ARM/Thumb assembly in the US decomp (`src/<tu>.s`, e.g. the m4a
sound mixer `m4a_1`), so there is no C to port. Their funcmap rows are still
`exact`/`masked` tier -> uniquely located -> region-same with the JP ROM.

This carver carves such a TU as a DESCRIPTIVE-ASM object `asm/<tu>.s`: a single
`.text.<tu>` section that defines every funcmap function of the TU as a
`.global`/`.thumb_func` label and `.incbin`s the verbatim JP ROM bytes between
consecutive labels (covering the full contiguous funcmap span, padding bytes
included). Because the bytes come straight from baserom.gba this is byte-identical
by construction; `make compare` remains the only oracle (verify-or-revert).

This ADDS BYTE COVERAGE and names the functions, but does NOT count as a
"decompiled function" in calcprogress.py (which only counts src/ C). That's the
intended trade for a region-same asm TU on the road to byte-complete.

Parallel-UNSAFE relative to other carvers that share the build: it runs `make
layout`/`make compare`, so DO NOT run it while carve_exact/carve_masked are
active in the same worktree. New manifest rows go ONLY to per-task fragments
layout/<base>.d/unported_<tu>.tsv.

Usage:
  scripts/carve_unported_asm.py            # carve every eligible unported .s TU
  scripts/carve_unported_asm.py --list     # print the plan, carve nothing
  scripts/carve_unported_asm.py TU [TU..]  # restrict to these US TUs
"""
import os, re, sys, glob, subprocess

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)                                  # the worktree this script lives in
US = "/home/laqieer/fireemblem8u"
CODE_END = 0x080DC134                           # first data byte; code is jp < this


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
            ranges.append((0x08000000 + s, 0x08000000 + e))
    ranges.sort()
    return ranges


def fn_to_tu():
    fn_tu, tu, tu_end = {}, None, 0
    for ln in open(f"{US}/fireemblem8.map"):
        m = re.match(r"\s+\.text\s+0x([0-9a-f]+)\s+0x([0-9a-f]+)\s+src/([\w-]+)\.o", ln)
        if m:
            tu = m.group(3); tu_end = int(m.group(1), 16) + int(m.group(2), 16)
        m2 = re.match(r"\s+0x([0-9a-f]+)\s+(\w+)\s*$", ln)
        if m2 and int(m2.group(1), 16) < tu_end:
            fn_tu[m2.group(2)] = tu
    return fn_tu


def candidates():
    """Group uncovered funcmap funcs (exact|masked) whose US TU is a `.s` file
    into one carve per TU. Returns {tu: [(jp, size, us, name), ...] sorted}."""
    ranges = carved_rom_ranges()

    def covered(addr, size):
        for s, e in ranges:
            if addr < e and addr + size > s:
                return True
        return False

    fn_tu = fn_to_tu()
    by_tu = {}
    for ln in open("layout/us_jp_funcmap.tsv"):
        if ln.startswith("#"):
            continue
        c = ln.rstrip().split("\t")
        if len(c) < 5:
            continue
        jp, us, size, tier, name = int(c[0], 16), int(c[1], 16), int(c[2]), c[3], c[4]
        if tier not in ("exact", "masked") or jp >= CODE_END:
            continue
        if covered(jp, size):
            continue
        tu = fn_tu.get(name)
        # ONLY asm TUs: US has src/<tu>.s but NOT src/<tu>.c
        if not tu or os.path.exists(f"{US}/src/{tu}.c") or not os.path.exists(f"{US}/src/{tu}.s"):
            continue
        by_tu.setdefault(tu, []).append((jp, size, us, name))
    for tu in by_tu:
        by_tu[tu].sort()
    return by_tu


def emit_asm(tu, fns):
    """Write asm/<tu>.s as a descriptive-incbin .text section covering the full
    contiguous funcmap span; return (rom_lo, rom_hi, [names])."""
    lo = min(jp for jp, _, _, _ in fns)
    hi = max(jp + size for jp, size, _, _ in fns)
    us0 = fns[0][2]
    addr_name = {}
    for jp, size, us, name in fns:
        addr_name.setdefault(jp, name)           # first name wins per addr
    addrs = sorted(addr_name)
    L = [f'\t.section .text.{tu}, "ax", %progbits',
         f'@ {tu} region-same asm TU: JP 0x{lo:08X} (US 0x{us0:08X}, '
         f'shift +0x{lo-us0:X}); descriptive incbin baserom.gba',
         '\t.thumb',
         '\t.align 2, 0']
    prev = lo
    for a in addrs:
        if a > prev:
            L.append(f'\t.incbin "baserom.gba", 0x{prev-0x08000000:X}, 0x{a-prev:X}')
        L.append(f'\t.global {addr_name[a]}')
        L.append('\t.thumb_func')
        L.append(f'{addr_name[a]}:')
        prev = a
    if hi > prev:
        L.append(f'\t.incbin "baserom.gba", 0x{prev-0x08000000:X}, 0x{hi-prev:X}')
    open(f"asm/{tu}.s", "w").write("\n".join(L) + "\n")
    return lo - 0x08000000, hi - 0x08000000, [addr_name[a] for a in addrs]


def baseline_names():
    names = set()
    for p in ["layout/baseline_syms.tsv"] + sorted(glob.glob("layout/baseline_syms.d/*.tsv")):
        if not os.path.exists(p):
            continue
        for l in open(p):
            if l.strip() and not l.startswith("#"):
                names.add(l.split("\t")[0])
    return names


def carve_tu(tu, fns):
    frag = f"unported_{tu}"
    files = [f"asm/{tu}.s",
             f"layout/carved_rom.d/{frag}.tsv",
             f"layout/baseline_syms_drop.d/{frag}.tsv"]
    snap = {p: (open(p).read() if os.path.exists(p) else None) for p in files}

    romlo, romhi, names = emit_asm(tu, fns)
    os.makedirs("layout/carved_rom.d", exist_ok=True)
    open(f"layout/carved_rom.d/{frag}.tsv", "w").write(
        f"{romlo:06X}\t{romhi:06X}\tasm/{tu}.o(.text.{tu})\t"
        f"{tu} region-same asm ({len(names)} fns, descriptive incbin)\n")
    # Any of these names already aliased in baseline_syms (jp_syms) would
    # double-define against our .global -> drop those redundant aliases.
    bn = baseline_names()
    dup = sorted(n for n in names if n in bn)
    if dup:
        os.makedirs("layout/baseline_syms_drop.d", exist_ok=True)
        open(f"layout/baseline_syms_drop.d/{frag}.tsv", "w").write(
            "".join(n + "\n" for n in dup))

    sh("make layout")
    mc = sh("make compare")
    if "fireemblem8.gba: OK" in mc.stdout:
        print(f"  {tu}: OK ({len(names)} fns, {romhi-romlo:#x} bytes"
              f"{f', -{len(dup)} dup aliases' if dup else ''})", flush=True)
        return True, len(names), romhi - romlo
    # revert
    for p, c in snap.items():
        if c is None:
            if os.path.exists(p):
                os.remove(p)
        else:
            open(p, "w").write(c)
    sh(f"rm -f asm/{tu}.o")
    sh("make layout")
    print(f"  {tu}: FAILED make compare -> reverted", flush=True)
    return False, 0, 0


def main():
    args = sys.argv[1:]
    do_list = "--list" in args
    only = set(a for a in args if not a.startswith("--"))
    by_tu = candidates()
    if only:
        by_tu = {t: v for t, v in by_tu.items() if t in only}
    nfns = sum(len(v) for v in by_tu.values())
    print(f"carve_unported_asm: {len(by_tu)} unported asm TUs, {nfns} funcs", flush=True)
    if do_list:
        for tu, v in sorted(by_tu.items()):
            lo = min(jp for jp, _, _, _ in v); hi = max(jp + s for jp, s, _, _ in v)
            print(f"  {tu:20s} {lo:08X}..{hi:08X}  {len(v):3d} fns  {hi-lo:#x} bytes")
        return 0

    ok_tu = ok_fns = ok_bytes = 0
    for tu, v in sorted(by_tu.items()):
        if os.path.exists(f"asm/{tu}.s"):
            print(f"  {tu}: asm/{tu}.s already exists -> skipping", flush=True)
            continue
        good, nf, nb = carve_tu(tu, v)
        if good:
            ok_tu += 1; ok_fns += nf; ok_bytes += nb
            sh("git add -A")
            sh(f'git commit -q -m "carve(asm): {tu} region-same descriptive asm '
               f'({nf} fns, {nb} bytes)\n\n'
               f'Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>"')
            print(f"  committed {tu}", flush=True)
    mc = sh("make compare")
    green = "fireemblem8.gba: OK" in mc.stdout
    print(f"\ncarve_unported_asm: carved {ok_tu} TUs / {ok_fns} fns / {ok_bytes} "
          f"bytes; build {'GREEN' if green else 'RED'}", flush=True)
    return 0 if green else 1


if __name__ == "__main__":
    sys.exit(main())
