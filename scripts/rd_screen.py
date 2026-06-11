#!/usr/bin/env python3
"""Screen REGION-DIFFERENT no-funcmap functions for permuter readiness (D60).

For each candidate from layout/nofuncmap_region_different.tsv (US name + tu, no
JP addr): resolve the JP address from sym_jp.txt, compute the JP byte range
(next sym), extract the US function (extract_func_only), compile it standalone,
and byte-diff vs the JP ROM range -- the probe_func.py logic with reloc-aware
NEAR/FAR bucketing (screen_grad.py logic).

Buckets:
  MATCH   - already byte-exact (straight port; should be rare here by definition)
  NEAR    - diffs ONLY at reloc offsets (bind the dep, then matches)
  FAR     - body-diffs -> permuter / hand-decomp
  NOEXTRACT / NOADDR / NOSIZE / COMPILEFAIL - skipped

Usage:
  scripts/rd_screen.py [--min N] [--max N] [--limit K] [--tu name,...]
"""
import os, re, sys, subprocess, shutil

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u"
CPP = shutil.which("arm-none-eabi-cpp") or "cpp"
AGBCC = "tools/agbcc/bin/agbcc"


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def load_sym_jp():
    """name -> jp_vma (int) from funclib_us_jp.tsv (us_name_current -> jp_addr).
    The no-funcmap RD names are US source names, present in funclib col3 keyed to
    a JP address; sym_jp.txt uses sub_<addr>/different names for these."""
    d = {}
    for ln in open("reference/maps/funclib_us_jp.tsv"):
        if ln.startswith("#") or ln.startswith("jp_addr"):
            continue
        p = ln.rstrip("\n").split("\t")
        if len(p) < 3 or not p[2]:
            continue
        try:
            d[p[2]] = int(p[0], 16)
        except ValueError:
            pass
    return d


def load_addrs():
    """All known function boundaries (sym_jp + funclib jp_addr) for next-sym sizing."""
    addrs = set()
    for ln in open("sym_jp.txt"):
        m = re.match(r"\s*\w+\s*=\s*0x([0-9A-Fa-f]+)\s*;", ln)
        if m:
            addrs.add(int(m.group(1), 16))
    for ln in open("reference/maps/funclib_us_jp.tsv"):
        if ln.startswith("#") or ln.startswith("jp_addr"):
            continue
        p = ln.split("\t")
        try:
            addrs.add(int(p[0], 16))
        except (ValueError, IndexError):
            pass
    return sorted(addrs)


def compile_text(cpath):
    base = cpath[:-2]
    obj, asm, binf = base + ".rds.o", base + ".rds.s", base + ".rds.bin"
    p1 = sh(f"{CPP} -I tools/agbcc/include -iquote include -iquote . -nostdinc -undef {cpath}")
    if p1.returncode != 0:
        return None, "cpp", ""
    p2 = subprocess.run(["iconv", "-f", "UTF-8", "-t", "CP932"],
                        input=p1.stdout.encode(), capture_output=True)
    p3 = subprocess.run([AGBCC, "-mthumb-interwork", "-Wimplicit", "-Wparentheses",
                         "-Werror", "-O2", "-fhex-asm", "-o", asm],
                        input=p2.stdout, capture_output=True)
    if p3.returncode != 0:
        return None, "agbcc", ""
    open(asm, "a").write("\t.text\n\t.align 2, 0\n")
    p4 = sh(f"arm-none-eabi-as -mcpu=arm7tdmi -mthumb-interwork -I include -I . {asm} -o {obj}")
    if p4.returncode != 0:
        return None, "as", ""
    sh(f"arm-none-eabi-objcopy -O binary -j .text {obj} {binf}")
    data = open(binf, "rb").read() if os.path.exists(binf) else b""
    relocs = sh(f"arm-none-eabi-objdump -r {obj}").stdout
    for p in (obj, asm, binf):
        if os.path.exists(p):
            os.unlink(p)
    return data, "", relocs


def main():
    args = sys.argv[1:]
    mn, mx, lim, tus = 0, 1 << 30, 9999, None
    if "--min" in args:
        i = args.index("--min"); mn = int(args[i + 1]); del args[i:i + 2]
    if "--max" in args:
        i = args.index("--max"); mx = int(args[i + 1]); del args[i:i + 2]
    if "--limit" in args:
        i = args.index("--limit"); lim = int(args[i + 1]); del args[i:i + 2]
    if "--tu" in args:
        i = args.index("--tu"); tus = set(args[i + 1].split(",")); del args[i:i + 2]

    symjp = load_sym_jp()
    addrs = load_addrs()
    rom = open("baserom.gba", "rb").read()

    cands = []
    for ln in open("layout/nofuncmap_region_different.tsv"):
        if ln.startswith("#"):
            continue
        p = ln.rstrip("\n").split("\t")
        if len(p) < 4:
            continue
        usaddr, size, name, tu = p[0], int(p[1]), p[2], p[3]
        if size < mn or size > mx:
            continue
        if tus and tu not in tus:
            continue
        cands.append((name, size, tu))
    cands.sort(key=lambda c: c[1])

    buckets = {"MATCH": [], "NEAR": [], "FAR": [], "SKIP": []}
    done = 0
    for name, usize, tu in cands:
        if done >= lim:
            break
        jp = symjp.get(name)
        if jp is None:
            continue
        import bisect
        i = bisect.bisect_right(addrs, jp)
        jp_end = addrs[i] if i < len(addrs) else jp + usize
        s, e = jp & 0xFFFFFF, jp_end & 0xFFFFFF
        if not os.path.exists(f"{US}/src/{tu}.c"):
            continue
        done += 1
        tmp = f"src/_rds_{name}.c"
        ext = sh(f"python3 scripts/extract_func_only.py {US}/src/{tu}.c {name}")
        if name not in ext.stdout or "{" not in ext.stdout:
            buckets["SKIP"].append((name, tu, usize, "NOEXTRACT"))
            print(f"[SKIP-NOEX ] {name:34s} {tu:20s} {usize:4d}b")
            continue
        open(tmp, "w").write(ext.stdout)
        got, err, relocs = compile_text(tmp)
        if os.path.exists(tmp):
            os.unlink(tmp)
        if got is None:
            buckets["SKIP"].append((name, tu, usize, "CF:" + err))
            print(f"[SKIP-{err:5s}] {name:34s} {tu:20s} {usize:4d}b")
            continue
        target = rom[s:e]
        n = len(target)
        g = got[:n]
        if g == target and len(got) == n:
            buckets["MATCH"].append((name, tu, usize, n))
            print(f"[MATCH     ] {name:34s} {tu:20s} {usize:4d}b jp={s:06X}..{e:06X}")
            continue
        if len(got) != n:
            buckets["FAR"].append((name, tu, usize, n, f"len {len(got)}!={n}"))
            print(f"[FAR-len   ] {name:34s} {tu:20s} {usize:4d}b got={len(got)} jp={n}")
            continue
        diffs = [i for i in range(n) if g[i] != target[i]]
        reloc_offs = set()
        for m in re.finditer(r"^\s*([0-9a-f]+)\s+R_ARM", relocs, re.M):
            o = int(m.group(1), 16)
            for k in range(4):
                reloc_offs.add(o + k)
        body = [d for d in diffs if d not in reloc_offs]
        if not body:
            buckets["NEAR"].append((name, tu, usize, n, f"{len(diffs)}b@reloc"))
            print(f"[NEAR      ] {name:34s} {tu:20s} {usize:4d}b {len(diffs)}b@reloc jp={s:06X}..{e:06X}")
        else:
            buckets["FAR"].append((name, tu, usize, n, f"{len(body)}/{len(diffs)} body"))
            print(f"[FAR       ] {name:34s} {tu:20s} {usize:4d}b {len(body)}/{len(diffs)} body jp={s:06X}..{e:06X}")

    print("\n=== SUMMARY ===")
    for b in ("MATCH", "NEAR", "FAR", "SKIP"):
        print(f"  {b}: {len(buckets[b])}")
    for b in ("MATCH", "NEAR"):
        if buckets[b]:
            print(f"\n{b}:")
            for row in buckets[b]:
                print("  " + " ".join(str(x) for x in row))
    if buckets["FAR"]:
        print("\nFAR (permuter targets, smallest first):")
        for row in sorted(buckets["FAR"], key=lambda r: r[2]):
            print("  " + " ".join(str(x) for x in row))


if __name__ == "__main__":
    main()
