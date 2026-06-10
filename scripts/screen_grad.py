#!/usr/bin/env python3
"""Batch-screen still-asm gbadisasm functions that have a funcmap US name:
for each, extract_func_only from the US TU, compile, and byte-diff the .text vs
the JP ROM range (probe_func logic). Bucket each candidate:

  MATCH       - byte-exact already (graduate as straight US port)
  NEAR        - diffs ONLY in literal-pool words / bl operands (D38 unblock:
                bind the referenced symbol / name the callee, then it matches)
  FAR         - diffs land in the code body -> genuinely region-different codegen
  NOEXTRACT   - couldn't extract / compile the US function

The NEAR bucket is the actionable asm->C vein. Prints a sorted report; writes
nothing (read-only screening). Use --tier to restrict.
"""
import os, re, sys, glob, subprocess

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u"
import shutil
CPP = shutil.which("arm-none-eabi-cpp") or shutil.which("cpp") or "cpp"
AGBCC = "tools/agbcc/bin/agbcc"


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def load_funcmap():
    fm = {}
    for ln in open("layout/us_jp_funcmap.tsv"):
        if ln.startswith("#"):
            continue
        p = ln.rstrip().split("\t")
        if len(p) < 5:
            continue
        fm[int(p[0], 16)] = (int(p[2]), p[3], p[4])
    return fm


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


def gbadisasm_fns():
    out = {}
    for f in glob.glob("layout/carved_rom.d/gbadisasm_*.tsv"):
        line = open(f).readline().strip().split("\t")
        if len(line) < 3:
            continue
        name = os.path.basename(f)[len("gbadisasm_"):-4]
        out[name] = (int(line[0], 16), int(line[1], 16))
    return out


def compile_text(cpath):
    base = cpath[:-2]
    obj, asm, binf = base + ".scr.o", base + ".scr.s", base + ".scr.bin"
    p1 = sh(f"{CPP} -I tools/agbcc/include -iquote include -iquote . -nostdinc -undef {cpath}")
    if p1.returncode != 0:
        return None, "cpp"
    p2 = subprocess.run(["iconv", "-f", "UTF-8", "-t", "CP932"], input=p1.stdout.encode(), capture_output=True)
    p3 = subprocess.run([AGBCC, "-mthumb-interwork", "-Wimplicit", "-Wparentheses", "-Werror",
                         "-O2", "-fhex-asm", "-o", asm], input=p2.stdout, capture_output=True)
    if p3.returncode != 0:
        return None, "agbcc"
    open(asm, "a").write("\t.text\n\t.align 2, 0\n")
    p4 = sh(f"arm-none-eabi-as -mcpu=arm7tdmi -mthumb-interwork -I include -I . {asm} -o {obj}")
    if p4.returncode != 0:
        return None, "as"
    sh(f"arm-none-eabi-objcopy -O binary -j .text {obj} {binf}")
    data = open(binf, "rb").read() if os.path.exists(binf) else b""
    relocs = sh(f"arm-none-eabi-objdump -r {obj}").stdout
    for p in (obj, asm, binf):
        if os.path.exists(p):
            os.unlink(p)
    return (data, relocs), None


def screen_one(name, s, e, tu, fname, rom):
    tmp = f"src/_scr_{name}.c"
    ext = sh(f"python3 scripts/extract_func_only.py {US}/src/{tu}.c {fname}")
    if fname not in ext.stdout or "{" not in ext.stdout:
        return "NOEXTRACT", "extract"
    body = ext.stdout
    if name != fname:
        body = re.sub(r"\b" + re.escape(fname) + r"\b", name, body)
    open(tmp, "w").write(body)
    res, err = compile_text(tmp)
    if os.path.exists(tmp):
        os.unlink(tmp)
    if res is None:
        return "NOEXTRACT", err
    got, relocs = res
    target = rom[s:e]
    n = len(target)
    g = got[:n]
    if g == target and len(got) == n:
        return "MATCH", ""
    if len(got) != n:
        return "FAR", f"len {len(got)}!={n}"
    diffs = [i for i in range(n) if g[i] != target[i]]
    # NEAR: every diff byte must sit at a reloc offset (4-byte word for ABS32,
    # or the 4-byte thm-call window) or be a 00 (unresolved) in `got`.
    reloc_offs = set()
    for m in re.finditer(r"^\s*([0-9a-f]+)\s+R_ARM", relocs, re.M):
        o = int(m.group(1), 16)
        for k in range(4):
            reloc_offs.add(o + k)
    body_diffs = [d for d in diffs if d not in reloc_offs]
    if not body_diffs:
        return "NEAR", f"{len(diffs)}b @relocs"
    return "FAR", f"{len(body_diffs)} body-diff (of {len(diffs)})"


def main():
    tiers = None
    args = sys.argv[1:]
    if "--tier" in args:
        i = args.index("--tier"); tiers = set(args[i + 1].split(",")); del args[i:i + 2]
    only = [a for a in args if not a.startswith("--")]

    fm = load_funcmap()
    ftu = fn_to_tu()
    rom = open("baserom.gba", "rb").read()
    cands = []
    for name, (s, e) in gbadisasm_fns().items():
        jp = s | 0x08000000
        if jp not in fm:
            continue
        size, tier, fname = fm[jp]
        if tiers and tier not in tiers:
            continue
        tu = ftu.get(fname)
        if not tu or not os.path.exists(f"{US}/src/{tu}.c"):
            continue
        cands.append((name, s, e, tier, tu, fname))
    if only:
        cands = [c for c in cands if c[0] in only or c[5] in only]
    cands.sort(key=lambda c: (c[3], c[2] - c[1]))

    buckets = {"MATCH": [], "NEAR": [], "FAR": [], "NOEXTRACT": []}
    for name, s, e, tier, tu, fname in cands:
        b, detail = screen_one(name, s, e, tu, fname, rom)
        buckets[b].append((name, tier, tu, fname, e - s, detail))
        print(f"[{b:9s}] {name:34s} {tier:6s} {tu:16s} {fname:30s} {e-s:4d}b {detail}")

    print("\n=== SUMMARY ===")
    for b in ("MATCH", "NEAR", "FAR", "NOEXTRACT"):
        print(f"  {b:9s}: {len(buckets[b])}")
    for b in ("MATCH", "NEAR"):
        if buckets[b]:
            print(f"\n{b}:")
            for name, tier, tu, fname, sz, detail in sorted(buckets[b], key=lambda x: x[4]):
                print(f"  {name:34s} {tier:6s} {tu:16s} -> {fname:30s} {sz:4d}b {detail}")


if __name__ == "__main__":
    sys.exit(main())
