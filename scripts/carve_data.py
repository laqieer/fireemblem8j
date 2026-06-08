#!/usr/bin/env python3
"""Carve region-same DATA regions as named source (the data-frontier harvester).

Data is ~94% of the ROM. A large fraction is byte-identical US<->JP at the same
offset (shared graphics/animation/asset data). For each US data object (from the US
map) whose address range is byte-identical in the JP ROM and not yet carved, this
emits an `asm/<name>.s` that DEFINES every US symbol in the range as a label and
incbins the bytes from baserom.gba between consecutive labels (matching the US data
organisation, e.g. data_banim). The region-different data (text, region-specific
tables) keeps differing bytes and is left in the incbin baseline.

`make compare` stays the only oracle: the caller rebuilds and reverts on any miss.

Usage: scripts/carve_data.py [substr ...]   # only US objects whose path contains a substr
       scripts/carve_data.py --all          # every region-same US data object
"""
import subprocess, sys, os, re

os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
US = "/home/laqieer/fireemblem8u"
US_ELF = f"{US}/fireemblem8.elf"
US_MAP = f"{US}/fireemblem8.map"
US_BIN = "/tmp/us.bin"
SKIP_SYM = {"__data_start", "__bss_start", "_edata", "_end"}


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def us_bin():
    if not os.path.exists(US_BIN):
        sh(f"arm-none-eabi-objcopy -O binary {US_ELF} {US_BIN}")
    return open(US_BIN, "rb").read()


def map_data_objs():
    """(lo, hi, section, obj) for every .data/.rodata section in the US map."""
    out = []
    for l in open(US_MAP):
        m = re.match(r"\s*(\.(?:data|rodata)[\w.]*)\s+0x0([0-9a-f]{7})\s+0x([0-9a-f]+)\s+(\S+\.o)", l)
        if m:
            lo = int(m.group(2), 16)
            sz = int(m.group(3), 16)
            if sz:
                out.append((lo, lo + sz, m.group(1), m.group(4)))
    return out


def carved_ranges():
    rng = []
    for l in open("layout/carved_rom.tsv"):
        if l.strip() and not l.startswith("#"):
            p = l.split("\t")
            rng.append((int(p[0], 16) + 0x08000000, int(p[1], 16) + 0x08000000))
    return rng


def syms_by_addr():
    d = {}
    for l in sh(f"arm-none-eabi-nm -n {US_ELF}").stdout.splitlines():
        p = l.split()
        if len(p) == 3 and p[1] not in "uU" and p[2] not in SKIP_SYM and not p[2].startswith(("__", ".")):
            d.setdefault(int(p[0], 16), []).append((p[1], p[2]))
    return d


def baseline_names():
    return {l.split("\t")[0] for l in open("layout/baseline_syms.tsv")
            if l.strip() and not l.startswith("#")}


def main():
    args = sys.argv[1:]
    take_all = "--all" in args
    subs = [a for a in args if not a.startswith("--")]
    us = us_bin()
    jp = open("baserom.gba", "rb").read()
    SYMS = syms_by_addr()
    carved = carved_ranges()

    # group US data sections by object, union their address span
    objs = {}
    for lo, hi, sec, o in map_data_objs():
        if subs and not any(s in o for s in subs):
            continue
        objs.setdefault(o, []).append((lo, hi))

    drop_syms = set()
    new_rows = []
    made = []
    for o, spans in sorted(objs.items()):
        lo = min(s[0] for s in spans)
        hi = max(s[1] for s in spans)
        off = lo - 0x08000000
        # region-same gate
        if us[off:hi-0x08000000] != jp[off:hi-0x08000000]:
            continue
        # uncarved gate (no overlap with an existing carve)
        if any(not (hi <= cl or lo >= ch) for cl, ch in carved):
            continue
        addrs = sorted(a for a in SYMS if lo <= a < hi)
        if not addrs or addrs[0] != lo:
            continue  # need a symbol exactly at the region start to anchor labels
        name = "data_" + re.sub(r"\W", "_", o.rsplit("/", 1)[-1].rsplit(".", 1)[0])
        body = [f'\t.section .{name}, "aw", %progbits', '\t.align 2',
                f'@ region-same US<->JP data ({hi-lo} bytes from {o}); incbin baserom.gba']
        nsym = 0
        for i, a in enumerate(addrs):
            nexta = addrs[i+1] if i+1 < len(addrs) else hi
            for _t, nm in SYMS[a]:
                body.append(f'\t.global {nm}')
                body.append(f'{nm}:')
                drop_syms.add(nm)
                nsym += 1
            seg = nexta - a
            if seg:
                body.append(f'\t.incbin "baserom.gba", 0x{a-0x08000000:X}, 0x{seg:X}')
        open(f"asm/{name}.s", "w").write("\n".join(body) + "\n")
        new_rows.append(f"{lo&0xFFFFFF:06X}\t{hi&0xFFFFFF:06X}\tasm/{name}.o(.{name})\t{name} region-same ({(hi-lo)//1024}KB)\n")
        made.append((name, lo, hi, nsym))
        carved.append((lo, hi))

    if not made:
        print("no new region-same data objects to carve")
        return
    # drop now-defined baseline syms
    kept = [l for l in open("layout/baseline_syms.tsv")
            if not (l.strip() and not l.startswith("#") and l.split("\t")[0] in drop_syms)]
    open("layout/baseline_syms.tsv", "w").writelines(kept)
    # append carved_rom rows, re-sort
    rows = list(open("layout/carved_rom.tsv")) + new_rows
    hdr = [l for l in rows if l.startswith("#")]
    body = sorted((l for l in rows if not l.startswith("#") and l.strip()),
                  key=lambda l: int(l.split("\t")[0], 16))
    open("layout/carved_rom.tsv", "w").writelines(hdr + body)
    tot = sum(hi-lo for _, lo, hi, _ in made)
    print(f"carved {len(made)} region-same data objects, {tot} bytes ({tot//1024}KB), "
          f"{sum(m[3] for m in made)} symbols:")
    for name, lo, hi, ns in made:
        print(f"  {name:32s} 0x{lo:08x}..0x{hi:08x} {ns} syms")


if __name__ == "__main__":
    main()
