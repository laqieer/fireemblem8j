#!/usr/bin/env python3
"""Carve REGION-DIFFERENT data whose JP boundary is pinned by region-same neighbours.

After the region-same harvesters run, a region-different asset (JP-specific graphic,
etc.) often sits between two region-same(-shifted) objects. Its own content isn't found
in JP (it genuinely differs), but the data IMMEDIATELY before and after it IS region-same
and locatable in JP. If the 64 bytes just before the object and the 64 bytes just after
it both map to JP at the SAME constant shift S, then the object occupies exactly
[us_lo-S, us_hi-S) in JP (same size, same-shift layout) — a VERIFIED boundary. We then
carve the JP bytes there under the US object's symbols: the JP version of that identified
asset, at its verified boundary (docs/decisions.md D10 — legitimate, not a guessed range).

Conservative gates: both surrounding chunks must be UNIQUE in a window and agree on S;
the JP target must be uncarved; emit NO `.align`; write asm atomically at the end.
`make compare` is the oracle.

Usage: scripts/carve_data_gapfill.py [--min BYTES] [substr ...]
Then: make layout && make compare  (revert asm/*.s + layout/*.tsv on any miss).
"""
import subprocess, sys, os, re

os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
US = "/home/laqieer/fireemblem8u"
US_ELF = f"{US}/fireemblem8.elf"
US_BIN = "/tmp/us.bin"
W = 0x400000


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def main():
    args = sys.argv[1:]
    min_b = 1024
    if "--min" in args:
        i = args.index("--min"); min_b = int(args[i+1]); del args[i:i+2]
    subs = args
    if not os.path.exists(US_BIN):
        sh(f"arm-none-eabi-objcopy -O binary {US_ELF} {US_BIN}")
    us = open(US_BIN, "rb").read()
    jp = open("baserom.gba", "rb").read()

    objs = {}
    for l in open(f"{US}/fireemblem8.map"):
        m = re.match(r"\s*\.(?:data|rodata)[\w.]*\s+0x0([0-9a-f]{7})\s+0x([0-9a-f]+)\s+(\S+\.o)", l)
        if m:
            lo = int(m.group(1), 16); sz = int(m.group(2), 16)
            if sz:
                objs.setdefault(m.group(3), []).append((lo, lo + sz))

    carved = []
    for l in open("layout/carved_rom.tsv"):
        if l.strip() and not l.startswith("#"):
            p = l.split("\t")
            carved.append((int(p[0], 16) + 0x08000000, int(p[1], 16) + 0x08000000))

    SYMS = {}
    for l in sh(f"arm-none-eabi-nm -n {US_ELF}").stdout.splitlines():
        p = l.split()
        if len(p) == 3 and p[1] not in "uU" and not p[2].startswith(("__", ".")):
            SYMS.setdefault(int(p[0], 16), []).append(p[2])

    def find_shift(uo):
        """shift S such that us[uo:uo+64] is uniquely jp at uo-S in a window, else None."""
        if uo < 0 or uo + 64 > len(us):
            return None
        chunk = us[uo:uo+64]
        lo_s = max(0, uo - W); hi_s = min(len(jp), uo + W)
        pos = jp.find(chunk, lo_s, hi_s)
        if pos < 0 or jp.find(chunk, pos+1, hi_s) >= 0:
            return None
        return uo - pos

    pend = list(carved)
    new_rows, drop, made, asm_pending = [], set(), [], []
    for o, spans in sorted(objs.items()):
        if subs and not any(s in o for s in subs):
            continue
        us_lo = min(s[0] for s in spans); us_hi = max(s[1] for s in spans)
        sz = us_hi - us_lo
        if sz < min_b or us_hi - 0x08000000 > len(jp):
            continue
        uo_lo = us_lo - 0x08000000
        # already region-same? (then the per-symbol carvers own it) -> skip if its own
        # content is locatable; we only want the genuinely-different ones.
        if find_shift((us_lo + us_hi)//2 - 0x08000000) is not None:
            continue
        s_before = find_shift(uo_lo - 64)
        s_after = find_shift(us_hi - 0x08000000)
        if s_before is None or s_after is None or s_before != s_after:
            continue
        S = s_before
        jl, jh = us_lo - S, us_hi - S
        if jl - 0x08000000 < 0 or jh - 0x08000000 > len(jp):
            continue
        if any(not (jh <= cl or jl >= ch) for cl, ch in pend):
            continue
        addrs = sorted(a for a in SYMS if us_lo <= a < us_hi)
        if not addrs or addrs[0] != us_lo:
            continue
        bound = addrs + [us_hi]
        base = "dat_" + re.sub(r"\W", "_", o.rsplit("/", 1)[-1].rsplit(".", 1)[0]) + "_gf"
        body = [f'\t.section .rodata.{base}, "a", %progbits',
                f'@ {o}: REGION-DIFFERENT asset, JP 0x{jl:08x}..0x{jh:08x} (US 0x{us_lo:08x}, shift -0x{S & 0xFFFFFFFF:X}); boundary pinned by region-same neighbours; incbin baserom.gba']
        for k, a in enumerate(addrs):
            for nm in SYMS[a]:
                body.append(f'\t.global {nm}'); body.append(f'{nm}:'); drop.add(nm)
            seg = bound[k+1] - a
            if seg:
                body.append(f'\t.incbin "baserom.gba", 0x{(a-S)-0x08000000:X}, 0x{seg:X}')
        asm_pending.append((base, "\n".join(body) + "\n"))
        new_rows.append(f"{jl&0xFFFFFF:06X}\t{jh&0xFFFFFF:06X}\tasm/{base}.o(.rodata.{base})\t{base} region-diff asset, boundary-pinned ({sz//1024}KB)\n")
        pend.append((jl, jh))
        made.append((base, sz, S, o))

    if not made:
        print("no boundary-pinned region-different data found")
        return
    for base, txt in asm_pending:
        open(f"asm/{base}.s", "w").write(txt)
    kept = [l for l in open("layout/baseline_syms.tsv")
            if not (l.strip() and not l.startswith("#") and l.split("\t")[0] in drop)]
    open("layout/baseline_syms.tsv", "w").writelines(kept)
    rows = list(open("layout/carved_rom.tsv")) + new_rows
    hdr = [l for l in rows if l.startswith("#")]
    body = sorted((l for l in rows if not l.startswith("#") and l.strip()), key=lambda l: int(l.split("\t")[0], 16))
    open("layout/carved_rom.tsv", "w").writelines(hdr + body)
    tot = sum(m[1] for m in made)
    print(f"carved {len(made)} boundary-pinned region-different objects, {tot//1024}KB:")
    for base, sz, S, o in sorted(made, key=lambda m: -m[1]):
        print(f"  {base:34s} {sz//1024:5d}KB shift -0x{S & 0xFFFFFFFF:<6X} {o}")


if __name__ == "__main__":
    main()
