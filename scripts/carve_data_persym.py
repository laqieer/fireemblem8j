#!/usr/bin/env python3
"""Per-SYMBOL shifted-data carver (granular relocation).

`carve_data_shifted.py` finds ONE shift per object. But some objects (e.g. the banim OBJ
sprite data) hold sub-assets relocated in INDEPENDENT groups at different JP shifts, so a
single object shift only catches the dominant group. This carver finds each US data
symbol's OWN JP location (unique 64-byte chunk + full-content verify), groups consecutive
same-shift matching symbols into runs, and carves each run at its JP address with the US
symbols as labels + JP bytes incbinned from baserom.gba. Symbols not uniquely found, or
whose content differs (region-different), stay in the incbin baseline.

Safety = the same as the object harvester: a symbol byte-identical at a shift is pointer-
free (a pointer would resolve elsewhere and break the match), so this never touches a
pointer table; each run's JP target is checked uncarved + unique; `make compare` is the
oracle. Emit NO `.align` (assets sit at exact, often non-4-aligned JP addresses).

Usage: scripts/carve_data_persym.py [--min BYTES] [substr ...]
Then: make layout && make compare  (revert asm/*.s + layout/*.tsv on any miss).
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
    min_run = 256
    if "--min" in args:
        i = args.index("--min"); min_run = int(args[i+1]); del args[i:i+2]
    subs = args
    if not os.path.exists(US_BIN):
        sh(f"arm-none-eabi-objcopy -O binary {US_ELF} {US_BIN}")
    us = open(US_BIN, "rb").read()
    jp = open("baserom.gba", "rb").read()

    # US data objects (union span) from the map
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

    pend = list(carved)

    new_rows, drop, made = [], set(), []
    for o, spans in sorted(objs.items()):
        if subs and not any(s in o for s in subs):
            continue
        us_lo = min(s[0] for s in spans); us_hi = max(s[1] for s in spans)
        if us_hi - us_lo < min_run:   # JP-overlap is handled per-run via pend (US!=JP addr)
            continue
        if us_hi - 0x08000000 > len(jp):
            continue
        addrs = sorted(a for a in SYMS if us_lo <= a < us_hi)
        if not addrs:
            continue
        bound = addrs + [us_hi]
        # per-symbol shift (None if not uniquely found / content differs)
        symshift = []
        for i, a in enumerate(addrs):
            sz = bound[i+1] - a
            uo = a - 0x08000000
            if sz < 16:
                symshift.append(None); continue
            chunk = us[uo:uo+min(64, sz)]
            pos = jp.find(chunk)
            if pos < 0 or jp.find(chunk, pos+1) >= 0:
                symshift.append(None); continue
            shift = uo - pos
            jo = uo - shift
            symshift.append(shift if us[uo:uo+sz] == jp[jo:jo+sz] else None)
        # group consecutive symbols sharing a shift into runs
        runs = []
        i = 0
        while i < len(addrs):
            s = symshift[i]
            if s is None:
                i += 1; continue
            j = i
            while j < len(addrs) and symshift[j] == s:
                j += 1
            runs.append((addrs[i], bound[j], s))
            i = j
        base = ("snd_" if "sound" in o else "dat_") + re.sub(r"\W", "_", o.rsplit("/", 1)[-1].rsplit(".", 1)[0])
        emitted = 0
        for ri, (run_lo, run_hi, shift) in enumerate(runs):
            if run_hi - run_lo < min_run:
                continue
            jl, jh = run_lo - shift, run_hi - shift
            if jl - 0x08000000 < 0 or jh - 0x08000000 > len(jp):
                continue
            if any(not (jh <= cl or jl >= ch) for cl, ch in pend):
                continue
            nm_sec = f"{base}_p{ri}"
            body = [f'\t.section .rodata.{nm_sec}, "a", %progbits',
                    f'@ {o}: region-same content at JP 0x{jl:08x} (US 0x{run_lo:08x}, shift -0x{shift & 0xFFFFFFFF:X}); incbin baserom.gba']
            for k, a in enumerate(addrs):
                if not (run_lo <= a < run_hi):
                    continue
                for nm in SYMS[a]:
                    body.append(f'\t.global {nm}'); body.append(f'{nm}:'); drop.add(nm)
                seg = bound[k+1] - a
                if seg:
                    body.append(f'\t.incbin "baserom.gba", 0x{(a-shift)-0x08000000:X}, 0x{seg:X}')
            open(f"asm/{nm_sec}.s", "w").write("\n".join(body) + "\n")
            new_rows.append(f"{jl&0xFFFFFF:06X}\t{jh&0xFFFFFF:06X}\tasm/{nm_sec}.o(.rodata.{nm_sec})\t{nm_sec} region-same per-sym shifted ({(run_hi-run_lo)//1024}KB)\n")
            pend.append((jl, jh))
            emitted += run_hi - run_lo
        if emitted:
            made.append((base, emitted, len(runs), o))

    if not made:
        print("no per-symbol shifted data found")
        return
    kept = [l for l in open("layout/baseline_syms.tsv")
            if not (l.strip() and not l.startswith("#") and l.split("\t")[0] in drop)]
    open("layout/baseline_syms.tsv", "w").writelines(kept)
    rows = list(open("layout/carved_rom.tsv")) + new_rows
    hdr = [l for l in rows if l.startswith("#")]
    body = sorted((l for l in rows if not l.startswith("#") and l.strip()), key=lambda l: int(l.split("\t")[0], 16))
    open("layout/carved_rom.tsv", "w").writelines(hdr + body)
    tot = sum(m[1] for m in made)
    print(f"carved {len(made)} objects (per-symbol), {tot//1024}KB in matching runs:")
    for base, emitted, nruns, o in sorted(made, key=lambda m: -m[1]):
        print(f"  {base:32s} {emitted//1024:5d}KB ({nruns} runs) {o}")


if __name__ == "__main__":
    main()
