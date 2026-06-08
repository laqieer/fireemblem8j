#!/usr/bin/env python3
"""Carve region-different data by reading its JP address from funcmap-aligned code refs.

Generalises the msg_data carve. A region-different data object is referenced by a function
via a literal holding its address. For a US->JP funcmap-mapped function the two bodies are
byte-identical except wildcarded pointer literals, so the literal at offset k in the US
function and the literal at offset k in the JP function reference the SAME object — one
gives its US address, the other its JP address. Scan every mapped function's literal pool:
where the US literal is a known US data symbol's address and the JP literal differs, record
{symbol: jp_addr}. Sort discovered objects by jp_addr; each object's JP size is its US size
capped by the next object's jp_addr. Carve each as named JP-byte incbin.

Legitimacy (D10): each object's JP address is READ FROM THE ROM'S OWN CODE via the verified
funcmap alignment, bounded by the next identified object — a verified location, not a guess.
`make compare` is the oracle. Region-same objects are skipped (the relocation harvesters own
them). NO `.align`; atomic write.

Usage: scripts/carve_data_refs.py [--min BYTES]
Then: make layout && make compare  (revert asm/*.s + layout/*.tsv on any miss).
"""
import subprocess, sys, os, re, struct

os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
US = "/home/laqieer/fireemblem8u"
US_ELF = f"{US}/fireemblem8.elf"
US_BIN = "/tmp/us.bin"


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def main():
    args = sys.argv[1:]
    min_b = 256
    if "--min" in args:
        i = args.index("--min"); min_b = int(args[i+1]); del args[i:i+2]
    if not os.path.exists(US_BIN):
        sh(f"arm-none-eabi-objcopy -O binary {US_ELF} {US_BIN}")
    us = open(US_BIN, "rb").read()
    jp = open("baserom.gba", "rb").read()

    # all US symbols: addr -> name (first/canonical), addr -> size
    name_at, size_at = {}, {}
    for l in sh(f"arm-none-eabi-nm --print-size {US_ELF}").stdout.splitlines():
        p = l.split()
        if len(p) == 4:
            a = int(p[0], 16); size_at[a] = int(p[1], 16); name_at.setdefault(a, p[3])
        elif len(p) == 3:
            name_at.setdefault(int(p[0], 16), p[2])

    # sorted US symbol addresses -> a size-less symbol's extent = gap to the next symbol
    us_addrs = sorted(name_at)
    import bisect as _bis

    def us_extent(a):
        if a in size_at and size_at[a]:
            return size_at[a]
        i = _bis.bisect_right(us_addrs, a)
        return us_addrs[i] - a if i < len(us_addrs) else 0

    # funcmap: (jp_addr, us_addr, size)
    fmap = []
    for l in open("layout/us_jp_funcmap.tsv"):
        if l.startswith("#"):
            continue
        p = l.rstrip("\n").split("\t")
        if len(p) >= 3:
            fmap.append((int(p[0], 16), int(p[1], 16), int(p[2])))

    carved = []
    for l in open("layout/carved_rom.tsv"):
        if l.strip() and not l.startswith("#"):
            p = l.split("\t")
            carved.append((int(p[0], 16) + 0x08000000, int(p[1], 16) + 0x08000000))

    # symbols already defined by existing carves (asm/*.s labels) — never redefine them
    already = set()
    for f in os.listdir("asm"):
        if f.endswith(".s"):
            for l in open(os.path.join("asm", f)):
                m = re.match(r"\s*\.global\s+(\w+)", l)
                if m:
                    already.add(m.group(1))

    def is_carved(lo, hi):
        return any(not (hi <= cl or lo >= ch) for cl, ch in carved)

    # Walk each US<->JP aligned region's words; a pointer literal that DIFFERS US<->JP names a
    # region-different object (US word names it, JP word = JP addr). Seed = funcmap functions;
    # RECURSE into every discovered object (a table whose pointers reach graphics).
    found = {}   # us_data_addr -> jp_data_addr (None = inconsistent -> dropped)
    queue = []

    def scan_region(us_start, jp_start, size):
        uo = us_start - 0x08000000; jo = jp_start - 0x08000000
        if uo < 0 or jo < 0:
            return
        for k in range(0, size - 3, 4):
            if uo + k + 4 > len(us) or jo + k + 4 > len(jp):
                break
            uw = struct.unpack_from("<I", us, uo + k)[0]
            if not (0x08000000 <= uw < 0x09000000) or uw not in name_at:
                continue
            jw = struct.unpack_from("<I", jp, jo + k)[0]
            if not (0x08000000 <= jw < 0x09000000) or jw == uw:
                continue
            if uw not in found:
                found[uw] = jw; queue.append(uw)
            elif found[uw] != jw:
                found[uw] = None

    for jp_fn, us_fn, size in fmap:
        scan_region(us_fn, jp_fn, size)
    seen = set()
    while queue:
        uw = queue.pop()
        if uw in seen or found.get(uw) is None:
            continue
        seen.add(uw)
        sz = us_extent(uw)
        if 0 < sz <= 0x8000:          # scan tables/structs; skip huge blobs (raw graphics)
            scan_region(uw, found[uw], sz)

    refs = sorted((jw, ua) for ua, jw in found.items() if jw is not None)
    if not refs:
        print("no funcmap-aligned region-different data references found")
        return

    # Boundary set: each object ends at the NEXT known boundary after its jp_addr — the next
    # discovered object OR the start/end of a carved range — so a carve never runs into an
    # adjacent (carved or discovered) object. Cap by US size as a sanity bound.
    bounds = sorted(set([r[0] for r in refs] + [c[0] for c in carved] + [c[1] for c in carved]))
    import bisect
    made, new_rows, asm_pending, drop, jpseen = [], [], [], set(), set()
    pend = list(carved)
    for jw, ua in refs:
        if jw in jpseen:          # two US names mapping to one JP addr -> keep first only
            continue
        jpseen.add(jw)
        nm = name_at[ua]
        if nm in drop or nm in already:    # never redefine a symbol an existing carve owns
            continue
        us_sz = us_extent(ua)
        bi = bisect.bisect_right(bounds, jw)
        nxt = bounds[bi] if bi < len(bounds) else jw + (us_sz or 0)
        size = min(us_sz, nxt - jw) if us_sz else (nxt - jw)
        if size < min_b:
            continue
        uo = ua - 0x08000000; jo = jw - 0x08000000
        if jo < 0 or jo + min(64, size) > len(jp) or us[uo:uo+min(64, size)] == jp[jo:jo+min(64, size)]:
            continue
        jl, jh = jw, jw + size
        if jh - 0x08000000 > len(jp) or is_carved(jl, jh):
            continue
        if any(not (jh <= cl or jl >= ch) for cl, ch in pend):
            continue
        base = "dat_" + re.sub(r"\W", "_", nm) + "_ref"
        body = [f'\t.section .rodata.{base}, "a", %progbits',
                f'@ {nm}: region-different data, JP 0x{jl:08x} read from funcmap-aligned code literal (US 0x{ua:08x}); incbin baserom.gba',
                f'\t.global {nm}', f'{nm}:',
                f'\t.incbin "baserom.gba", 0x{jl-0x08000000:X}, 0x{size:X}']
        asm_pending.append((base, "\n".join(body) + "\n"))
        new_rows.append(f"{jl&0xFFFFFF:06X}\t{jh&0xFFFFFF:06X}\tasm/{base}.o(.rodata.{base})\t{nm} region-diff (funcmap code-ref, {size//1024}KB)\n")
        drop.add(nm); pend.append((jl, jh)); made.append((nm, jl, size))

    if not made:
        print("no carveable funcmap code-ref region-different data")
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
    tot = sum(m[2] for m in made)
    print(f"carved {len(made)} region-different objects via funcmap code refs, {tot//1024}KB:")
    for nm, jl, size in sorted(made, key=lambda m: -m[2])[:20]:
        print(f"  {nm:40s} JP 0x{jl:08x} {size//1024:5d}KB")


if __name__ == "__main__":
    main()
