#!/usr/bin/env python3
"""carve_bgchr.py <name> <hx> <tu.c> — carve a mapanim BGCHR_MANIM_160 funclib function.

Substitutes BGCHR_MANIM_160 -> 0x140 (JP tile base), places the function's local
CONST_DATA lut (.data, dotted `lut.N` symbol) by gap-splitting its owning frontier/
residue INCBIN. Verifies 0 non-reloc text diffs (full reloc filter) and lut byte-match
before wiring. Does NOT build/commit (caller make-compare-gates). Prints OK<TAB>info or
SKIP<TAB>reason.
"""
import os, re, sys, subprocess, glob

ROOT = "/home/laqieer/fireemblem8j"
US = "/home/laqieer/fireemblem8u"
os.chdir(ROOT)

def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True).stdout

def find_gap(addr):
    for f in glob.glob("layout/carved_rom.d/*.tsv") + ["layout/carved_rom.tsv"]:
        for l in open(f):
            p = l.split("\t")
            if len(p) >= 3 and not l.startswith("#"):
                try:
                    s = int(p[0], 16); e = int(p[1], 16)
                except ValueError:
                    continue
                if s <= addr < e:
                    return f, p[0], p[1], p[2]
    return None, None, None, None

def carve(name, hx, tu):
    base = int(hx, 16) | 0x08000000
    body = sh(f"python3 scripts/extract_func_only.py {US}/src/{tu} {name}")
    # JP tile base is 0x20 tiles lower than US for this mapanim cluster (low byte 0x60->0x40).
    # US names the const BGCHR_MANIM_160 / BM_BGCHR_BANIM_UNK160 (both 0x160); per-function
    # literal substitute (NOT a header change -- other carved fns genuinely use 0x160).
    if "BGCHR_MANIM_160" not in body and "BM_BGCHR_BANIM_UNK160" not in body:
        return "SKIP", "no BGCHR_MANIM_160 / BM_BGCHR_BANIM_UNK160"
    body = body.replace("BGCHR_MANIM_160", "0x140").replace("BM_BGCHR_BANIM_UNK160", "0x140")
    open(f"src/{name}.c", "w").write(body)
    sh(f"rm -f src/{name}.o")
    sh(f"make src/{name}.o")
    if not os.path.exists(f"src/{name}.o"):
        os.remove(f"src/{name}.c")
        return "SKIP", "compile fail"
    # full-filter non-reloc text diffs
    sh(f"arm-none-eabi-objcopy -O binary --only-section=.text src/{name}.o /tmp/cb.bin")
    tb = open("/tmp/cb.bin", "rb").read()
    rb = open("baserom.gba", "rb").read()[base & 0xFFFFFF:(base & 0xFFFFFF) + len(tb)]
    rel = set()
    dataoff = None
    lutsec = None
    for l in sh(f"arm-none-eabi-objdump -r --section=.text src/{name}.o").splitlines():
        m = re.match(r"^([0-9a-f]{8})\s+R_ARM_\S+\s+(\S+)", l)
        if m:
            o = int(m.group(1), 16)
            if m.group(2) in (".data", ".rodata"):
                dataoff = o
                lutsec = m.group(2)
            for k in range(4):
                rel.add(o + k)
    nz = [i for i in range(len(tb)) if tb[i] != rb[i] and i not in rel]
    if nz:
        sh(f"rm -f src/{name}.o"); os.remove(f"src/{name}.c")
        return "SKIP", f"text non-reloc diffs {[hex(x) for x in nz]}"
    if dataoff is None:
        sh(f"rm -f src/{name}.o"); os.remove(f"src/{name}.c")
        return "SKIP", "no .data/.rodata reloc (lut not found)"
    # lut address from asm literal
    romaddr = base + dataoff
    asmf = f"asm/sub_{hx}.s"
    txt = open(asmf).read() if os.path.exists(asmf) else ""
    lm = re.search(rf"_0?{romaddr:08X}:\s*\.4byte\s+(0x[0-9A-Fa-f]+)", txt)
    if not lm:
        sh(f"rm -f src/{name}.o"); os.remove(f"src/{name}.c")
        return "SKIP", "lut literal not in asm"
    lut = int(lm.group(1), 16)
    # lut bytes
    sh(f"arm-none-eabi-objcopy -O binary --only-section={lutsec} src/{name}.o /tmp/lut.bin")
    lb = open("/tmp/lut.bin", "rb").read()
    loff = lut & 0xFFFFFF
    lrom = open("baserom.gba", "rb").read()[loff:loff + len(lb)]
    if lb != lrom:
        sh(f"rm -f src/{name}.o"); os.remove(f"src/{name}.c")
        return "SKIP", "lut bytes mismatch"
    # owning gap (gaps stored as 6-hex ROM offsets, so mask off 0x08000000)
    gf, gs, ge, gdesc = find_gap(lut & 0xFFFFFF)
    if not gf:
        sh(f"rm -f src/{name}.o"); os.remove(f"src/{name}.c")
        return "SKIP", "no owning gap"
    # must be a frontier/residue INCBIN section we can split
    msec = re.search(r"src/data/(\S+?)/\1\.o\(\.(data|rodata)\.(\S+?)\)", gdesc) or \
           re.search(r"src/data/(\S+?)\.o\(\.(data|rodata)\.(\S+?)\)", gdesc)
    if not msec:
        sh(f"rm -f src/{name}.o"); os.remove(f"src/{name}.c")
        return "SKIP", f"gap not splittable: {gdesc.strip()[:60]}"
    gstart = int(gs, 16); gend = int(ge, 16)
    lroff = lut & 0xFFFFFF          # lut as ROM offset (gaps are ROM offsets)
    lrend = lroff + len(lb)
    lut = lroff                      # use ROM offset for all split math below
    lutend = lrend
    # find the owning .c INCBIN var (by section attr) and its bin path/offset
    sec = gdesc.split("(")[1].split(")")[0]  # e.g. .data.frontier_df4_banim_b.gap85
    # locate the .c
    cglob = glob.glob("src/data/**/*.c", recursive=True)
    owner_c = None; incline = None
    for c in cglob:
        t = open(c).read()
        if f'section("{sec}")' in t:
            owner_c = c
            for line in t.splitlines():
                if f'section("{sec}")' in line:
                    incline = line
                    break
            break
    if not owner_c or not incline:
        sh(f"rm -f src/{name}.o"); os.remove(f"src/{name}.c")
        return "SKIP", f"owner .c for {sec} not found"
    mbin = re.search(r'INCBIN_U8\("([^"]+)"(?:,\s*(\d+),\s*(\d+))?\)', incline)
    if not mbin:
        return "SKIP", "incbin parse fail"
    binpath = mbin.group(1)
    binoff = int(mbin.group(2)) if mbin.group(2) else 0
    # the bin region maps gstart..gend ; lut at lut..lutend
    pre_len = lut - gstart
    post_off = binoff + (lutend - gstart)
    post_len = gend - lutend
    varbase = incline.split("[]")[0].split()[-1]
    # rewrite owner .c: replace incline with pre (if >0) + post (if >0)
    t = open(owner_c).read()
    newlines = []
    if pre_len > 0:
        newlines.append(f'u8 {varbase}[] __attribute__((section("{sec}"))) = INCBIN_U8("{binpath}", {binoff}, {pre_len});')
    if post_len > 0:
        psec = sec + "b"
        newlines.append(f'u8 {varbase}_b[] __attribute__((section("{psec}"))) = INCBIN_U8("{binpath}", {post_off}, {post_len});')
    t = t.replace(incline, "\n".join(newlines))
    open(owner_c, "w").write(t)
    # rewrite carved_rom gap row
    rows = []
    if pre_len > 0:
        rows.append(f"{gs}\t{lut&0xFFFFFF:06X}\t{gdesc.strip()}\t{name} gap pre")
    rows.append(f"{lut&0xFFFFFF:06X}\t{lutend&0xFFFFFF:06X}\tsrc/{name}.o({lutsec})\t{name} lut (gap split)")
    if post_len > 0:
        pdesc = gdesc.replace(sec, sec + "b").strip()
        rows.append(f"{lutend&0xFFFFFF:06X}\t{ge}\t{pdesc}\t{name} gap post")
    tg = open(gf).read().splitlines()
    out = []
    for l in tg:
        if l.startswith(f"{gs}\t{ge}\t"):
            out.extend(rows)
        else:
            out.append(l)
    open(gf, "w").write("\n".join(out) + "\n")
    # .text carve row + alias drop + git rm asm
    s6 = f"{base & 0xFFFFFF:06X}"
    e6 = f"{(base + len(tb)) & 0xFFFFFF:06X}"
    open(f"layout/carved_rom.d/handdecomp_{name}.tsv", "w").write(
        f"{s6}\t{e6}\tsrc/{name}.o(.text)\t{name} (funclib carve; BGCHR_MANIM 0x140 + lut gap-split)\n")
    open(f"layout/baseline_syms_drop.d/handdecomp_{name}.tsv", "w").write(name + "\n")
    sh(f"git rm -q asm/sub_{hx}.s layout/carved_rom.d/gbadisasm_sub_{hx}.tsv")
    return "OK", f"lut@{lut:08X} gap={sec} pre={pre_len} post={post_len} text={len(tb)}"

if __name__ == "__main__":
    st, info = carve(sys.argv[1], sys.argv[2], sys.argv[3])
    print(f"{st}\t{sys.argv[1]}\t{info}")
