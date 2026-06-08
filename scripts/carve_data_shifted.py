#!/usr/bin/env python3
"""Carve region-same-but-RELOCATED data (the shifted-asset harvester).

Much of the JP data is byte-identical to the US data but moved to a different address
(localized content earlier in the ROM changed size, shifting everything after). Such a
block, when byte-identical at a constant shift, is necessarily POINTER-FREE (any pointer
would resolve to a different address and break the match) — i.e. exactly the opaque
authored assets (graphics, sound samples, sprite sheets) that the US decomp represents
as `.incbin` of named binaries. For each uncarved US data object this finds the JP shift
(chunk search), verifies the WHOLE object is byte-identical at that shift, checks the JP
target is uncarved and unique, and carves it there with the US symbols (relocated) as
labels + the JP bytes incbinned from baserom.gba.

Legitimacy (docs/decisions.md D10): each object is an identified US-named asset at a
verified JP boundary (the full-block match at a unique shift IS the verification);
structured tables can't match at a shift so they're never touched. `make compare` is the
oracle (byte-matches by construction; correctness rests on the verified boundary).

Usage: scripts/carve_data_shifted.py [--min BYTES] [substr ...]
Then: make layout && make compare   (revert the asm/*.s + layout/*.tsv on any miss).
"""
import subprocess, sys, os, re

os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
US = "/home/laqieer/fireemblem8u"
US_ELF = f"{US}/fireemblem8.elf"
US_BIN = "/tmp/us.bin"


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def main():
    args = sys.argv[1:]
    min_bytes = 4096
    if "--min" in args:
        i = args.index("--min"); min_bytes = int(args[i+1]); del args[i:i+2]
    subs = args
    if not os.path.exists(US_BIN):
        sh(f"arm-none-eabi-objcopy -O binary {US_ELF} {US_BIN}")
    us = open(US_BIN, "rb").read()
    jp = open("baserom.gba", "rb").read()

    # US data objects -> union [lo,hi)
    objs = {}
    for l in open(f"{US}/fireemblem8.map"):
        m = re.match(r"\s*\.(?:data|rodata)[\w.]*\s+0x0([0-9a-f]{7})\s+0x([0-9a-f]+)\s+(\S+\.o)", l)
        if m:
            lo = int(m.group(1), 16); sz = int(m.group(2), 16)
            if sz:
                objs.setdefault(m.group(3), []).append((lo, lo + sz))

    # existing carves (JP addresses)
    carved = []
    for l in open("layout/carved_rom.tsv"):
        if l.strip() and not l.startswith("#"):
            p = l.split("\t")
            carved.append((int(p[0], 16) + 0x08000000, int(p[1], 16) + 0x08000000))

    # all defined US symbols by addr (for labels)
    SYMS = {}
    for l in sh(f"arm-none-eabi-nm -n {US_ELF}").stdout.splitlines():
        p = l.split()
        if len(p) == 3 and p[1] not in "uU" and not p[2].startswith(("__", ".")):
            SYMS.setdefault(int(p[0], 16), []).append(p[2])

    def overlaps(lo, hi):
        return any(not (hi <= cl or lo >= ch) for cl, ch in carved)

    def find_shift(us_lo, sz):
        # try 3 chunks; require they agree on a single shift, then full-verify
        cand = None
        for frac in (0.05, 0.5, 0.95):
            c = us_lo - 0x08000000 + int(sz * frac)
            chunk = us[c:c+64]
            if len(chunk) < 64:
                return None
            pos = jp.find(chunk)
            if pos < 0 or jp.find(chunk, pos+1) >= 0:   # not found or ambiguous
                return None
            sh_i = c - pos
            if cand is None:
                cand = sh_i
            elif cand != sh_i:
                return None
        return cand

    made, new_rows, drop = [], [], set()
    pend = list(carved)  # accumulate JP ranges to prevent intra-run overlap
    for o, spans in sorted(objs.items()):
        if subs and not any(s in o for s in subs):
            continue
        us_lo = min(s[0] for s in spans); us_hi = max(s[1] for s in spans)
        sz = us_hi - us_lo
        if sz < min_bytes:
            continue
        uoff = us_lo - 0x08000000
        if overlaps(us_lo, us_hi):
            continue
        shift = find_shift(us_lo, sz)
        if shift is None:
            continue
        jp_lo, jp_hi = us_lo - shift, us_hi - shift
        joff = jp_lo - 0x08000000
        if joff < 0 or jp_hi - 0x08000000 > len(jp):
            continue
        if us[uoff:uoff+sz] != jp[joff:joff+sz]:   # full-block verify (also rejects pointer tables)
            continue
        if any(not (jp_hi <= cl or jp_lo >= ch) for cl, ch in pend):  # uncarved + no intra-run overlap
            continue
        addrs = sorted(a for a in SYMS if us_lo <= a < us_hi)
        if not addrs or addrs[0] != us_lo:
            continue
        name = "snd_" + re.sub(r"\W", "_", o.rsplit("/", 1)[-1].rsplit(".", 1)[0]) if "sound" in o \
            else "dat_" + re.sub(r"\W", "_", o.rsplit("/", 1)[-1].rsplit(".", 1)[0])
        body = [f'\t.section .rodata.{name}, "a", %progbits', '\t.align 2',
                f'@ {o}: region-same content at JP 0x{jp_lo:08x} (US 0x{us_lo:08x}, shift -0x{shift:X}); incbin baserom.gba']
        for i, a in enumerate(addrs):
            nexta = addrs[i+1] if i+1 < len(addrs) else us_hi
            for nm in SYMS[a]:
                body.append(f'\t.global {nm}'); body.append(f'{nm}:'); drop.add(nm)
            seg = nexta - a
            if seg:
                body.append(f'\t.incbin "baserom.gba", 0x{(a-shift)-0x08000000:X}, 0x{seg:X}')
        open(f"asm/{name}.s", "w").write("\n".join(body) + "\n")
        new_rows.append(f"{jp_lo&0xFFFFFF:06X}\t{jp_hi&0xFFFFFF:06X}\tasm/{name}.o(.rodata.{name})\t{name} region-same shifted ({sz//1024}KB)\n")
        pend.append((jp_lo, jp_hi))
        made.append((name, jp_lo, jp_hi, sz, shift, o))

    if not made:
        print("no shifted region-same data objects found")
        return
    kept = [l for l in open("layout/baseline_syms.tsv")
            if not (l.strip() and not l.startswith("#") and l.split("\t")[0] in drop)]
    open("layout/baseline_syms.tsv", "w").writelines(kept)
    rows = list(open("layout/carved_rom.tsv")) + new_rows
    hdr = [l for l in rows if l.startswith("#")]
    body = sorted((l for l in rows if not l.startswith("#") and l.strip()), key=lambda l: int(l.split("\t")[0], 16))
    open("layout/carved_rom.tsv", "w").writelines(hdr + body)
    tot = sum(m[3] for m in made)
    print(f"carved {len(made)} shifted region-same data objects, {tot//1024}KB:")
    for name, lo, hi, sz, shift, o in made:
        print(f"  {name:34s} JP 0x{lo:08x} shift -0x{shift:<6X} {sz//1024:5d}KB {o}")


if __name__ == "__main__":
    main()
