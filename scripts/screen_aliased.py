#!/usr/bin/env python3
"""NEAR screen for aliased still-asm functions (D132 vein).

For each (sub_<hex>, US-name) where asm/sub_<hex>.s exists AND a thumb
baseline alias names it: extract the US body, standalone-compile with JP
headers, and check whether EVERY byte-diff vs the ROM falls at a relocation
offset (BL/ABS32). If so the function is region-same-modulo-relocation =>
carveable (bind the relocs, place the .text).

Outputs CARVEABLE / NEAR<=8 / FAR / NODEF / COMPILEERR per function.
"""
import os, re, subprocess, sys, glob

ROOT = "/home/laqieer/fireemblem8j"
US = "/home/laqieer/fireemblem8u"
ROM = os.path.join(ROOT, "baserom.gba")

def sh(cmd, **kw):
    return subprocess.run(cmd, shell=True, cwd=ROOT, capture_output=True, text=True, **kw)

# US function definition -> TU (cache a grep index)
def find_tu(name):
    # look for a real definition line:  <type> name(  at column 0, in a .c
    r = sh(f"grep -rlE '^[A-Za-z].*\\b{re.escape(name)}\\s*\\(' {US}/src/*.c")
    files = [f for f in r.stdout.split() if f.endswith(".c")]
    # prefer the file where extract_func_only succeeds
    for f in files:
        e = sh(f"python3 scripts/extract_func_only.py {f} {name}")
        if e.returncode == 0 and e.stdout.strip() and "void" in e.stdout or (e.stdout.strip() and "(" in e.stdout):
            if len(e.stdout.strip().splitlines()) > 1:
                return f, e.stdout
    return None, None

def reloc_offsets(obj):
    """byte offsets (set) covered by .text relocs; BL=4 bytes, ABS32=4 bytes."""
    r = sh(f"arm-none-eabi-objdump -r --section=.text {obj}")
    offs = set()
    for line in r.stdout.splitlines():
        m = re.match(r'^([0-9a-f]{8})\s+(R_ARM_\S+)', line)
        if m:
            o = int(m.group(1), 16)
            for k in range(4):
                offs.add(o + k)
    return offs

def rom_bytes(addr, n):
    with open(ROM, "rb") as f:
        f.seek(addr - 0x08000000)
        return f.read(n)

def text_bytes(obj):
    r = subprocess.run(f"arm-none-eabi-objcopy -O binary --only-section=.text {obj} /tmp/sa.bin",
                       shell=True, cwd=ROOT)
    return open("/tmp/sa.bin", "rb").read()

def screen(hx, name):
    f, body = find_tu(name)
    if not f:
        return "NODEF", 0, ""
    open("/tmp/sa.c", "w").write(body)
    # MUST match the real make pipeline (esp. -g -ffix-debug-line -> .align 2,0 zero-fill,
    # not GAS default nop-fill 46c0 which is a tail-padding false-positive)
    c = sh("cc -E -I tools/agbcc/include -iquote include -iquote . -nostdinc -undef /tmp/sa.c "
           "| iconv -f UTF-8 -t CP932 | tools/agbcc/bin/agbcc -mthumb-interwork -Wparentheses -O2 "
           "-fhex-asm -ffix-debug-line -g -o /tmp/sa.s 2>/tmp/sa.err && "
           "printf '\\t.text\\n\\t.align 2, 0\\n' >> /tmp/sa.s && "
           "arm-none-eabi-as -mcpu=arm7tdmi -mthumb-interwork -I include -I . /tmp/sa.s -o /tmp/sa.o")
    if not os.path.exists("/tmp/sa.o") or c.returncode != 0:
        return "COMPILEERR", 0, os.path.basename(f)
    sh("true")  # ensure
    tb = text_bytes("/tmp/sa.o")
    addr = int(hx, 16) | 0x08000000
    rb = rom_bytes(addr, len(tb))
    if len(tb) != len(rb):
        return f"SIZEDIFF({len(tb)}vs{len(rb)})", 0, os.path.basename(f)
    relocs = reloc_offsets("/tmp/sa.o")
    diffs = [i for i in range(len(tb)) if tb[i] != rb[i]]
    nonreloc = [i for i in diffs if i not in relocs]
    if not diffs:
        return "EXACT", 0, os.path.basename(f)
    if not nonreloc:
        return "CARVEABLE", len(diffs), os.path.basename(f)
    if len(nonreloc) <= 8:
        return f"NEAR{len(nonreloc)}@{','.join(hex(x) for x in nonreloc[:8])}", len(nonreloc), os.path.basename(f)
    return f"FAR({len(nonreloc)})", len(nonreloc), os.path.basename(f)

def main():
    pairs = []
    for line in open("/tmp/aliased_asm.txt"):
        parts = line.strip().split("\t")
        if len(parts) == 2:
            pairs.append((parts[0], parts[1].lstrip("_")))
    carve, near = [], []
    for i, (hx, name) in enumerate(pairs):
        try:
            verdict, nd, tu = screen(hx, name)
        except Exception as e:
            verdict, nd, tu = f"ERR:{e}", 0, ""
        tag = verdict.split("(")[0].split("@")[0]
        if tag == "CARVEABLE":
            carve.append((hx, name, tu))
            print(f"[{i+1}/{len(pairs)}] CARVEABLE  {name}  sub_{hx}  ({tu})", flush=True)
        elif tag.startswith("NEAR"):
            near.append((hx, name, verdict, tu))
            print(f"[{i+1}/{len(pairs)}] {verdict}  {name}  sub_{hx}  ({tu})", flush=True)
    print("\n==== CARVEABLE ====")
    for hx, name, tu in carve:
        print(f"{name}\tsub_{hx}\t{tu}")
    print(f"\nTOTAL CARVEABLE: {len(carve)}   NEAR<=8: {len(near)}")

if __name__ == "__main__":
    main()
