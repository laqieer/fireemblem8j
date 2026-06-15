#!/usr/bin/env python3
"""Efficient batch graduation of jp-aliased gbadisasm functions to matching C.

Insight (D-log): the leaf-only harvest was too strict. A NON-leaf jp-aliased
region-different function whose called funcs + referenced data are all placed at
JP addresses byte-matches anyway, because its bl/literal relocations resolve
correctly when LINKED at the JP layout. So include non-leaf.

Efficiency: instead of one `make compare` per candidate (O(N) links), wire ALL
compiled candidates, build the ROM ONCE, then byte-check each function's range
(linked ROM vs baserom). A function that matches in the all-wired build stays
matched after reverting independent siblings (their addresses are identical
whether asm or src), so: build-once -> keep matches, revert mismatches -> rebuild
-> `make compare`. Link errors (a candidate referencing a JP-undefined symbol)
are resolved by reverting the referencing candidates and retrying the build.

Usage:
  scripts/graduate_jp_batch.py [--limit N] [--max-bytes B] [--list]
"""
import os, re, sys, glob, subprocess

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u"
FRAG = "layout/carved_rom.d/graduate_jp_batch.tsv"


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def jp_alias():
    a = {}
    for ln in open("asm/jp_syms.s"):
        m = re.search(r"\.set\s+(\w+),\s*0x([0-9A-Fa-f]+)\s*\+\s*1", ln)
        if m:
            a[int(m.group(2), 16)] = m.group(1)
    return a


def us_file(name):
    r = sh(f'grep -rlE "^[a-zA-Z].*\\b{name}\\b\\s*\\(" {US}/src/*.c')
    return r.stdout.split("\n")[0] if r.stdout.strip() else None


def is_inline(name):
    return bool(sh(f'grep -rnE "inline\\s+[^;]*\\b{name}\\b\\s*\\(" {US}/src include').stdout.strip())


def candidates(maxb):
    alias = jp_alias()
    out = []
    for frag in sorted(glob.glob("layout/carved_rom.d/gbadisasm_*.tsv")):
        L = open(frag).read().splitlines()
        if len(L) != 1:
            continue
        p = L[0].split("\t")
        if len(p) < 3:
            continue
        try:
            a, b = int(p[0], 16), int(p[1], 16)
        except ValueError:
            continue
        addr = 0x08000000 + a
        if 0x080D6000 <= addr <= 0x080DBFFF or (b - a) > maxb:
            continue
        name = alias.get(addr)
        om = re.search(r"(asm/\w+)\.o", p[2])
        if not name or not om:
            continue
        out.append((p[0], p[1], name, frag, om.group(1) + ".s"))
    out.sort(key=lambda r: int(r[1], 16) - int(r[0], 16))
    return out


def port(name):
    uf = us_file(name)
    if not uf or is_inline(name):
        return False
    r = sh(f'python3 scripts/extract_func_only.py "{uf}" "{name}"')
    if r.returncode != 0 or name not in r.stdout:
        return False
    open(f"src/{name}.c", "w").write(r.stdout)
    if os.path.exists(f"src/{name}.o"):
        os.remove(f"src/{name}.o")
    sh(f"make src/{name}.o")
    if not os.path.exists(f"src/{name}.o"):
        os.remove(f"src/{name}.c")
        return False
    # PURE .text only: a static local / string literal emits .data/.rodata/.bss
    # placed OUTSIDE the carved .text range, so the all-wired byte-check (which
    # only inspects [a0,a1)) would miss that diff. Reject such candidates here.
    for ln in sh(f"arm-none-eabi-objdump -h src/{name}.o").stdout.splitlines():
        m = re.search(r"\s(\.(?:data|rodata|bss)\S*)\s+([0-9a-f]+)", ln)
        if m and int(m.group(2), 16) > 0:
            os.remove(f"src/{name}.o")
            os.remove(f"src/{name}.c")
            return False
    return True


def wire(a0, a1, name, frag, asmfile):
    with open(FRAG, "a") as f:
        f.write(f"{a0}\t{a1}\tsrc/{name}.o(.text)\tgraduate_jp_batch(run): {name}\n")
    open(f"layout/baseline_syms_drop.d/graduate_jp_batch_{name}.tsv", "w").write(name + "\n")
    sh(f'git rm -q "{frag}" "{asmfile}"')


def unwire(name, frag, asmfile):
    lines = [l for l in open(FRAG) if f"(run): {name}\n" != l[-(len(name) + 8):]]
    open(FRAG, "w").writelines(lines)
    for pth in (f"src/{name}.c", f"src/{name}.o",
                f"layout/baseline_syms_drop.d/graduate_jp_batch_{name}.tsv"):
        if os.path.exists(pth):
            os.remove(pth)
    sh(f'git checkout HEAD -- "{frag}" "{asmfile}"')


def main():
    args = sys.argv[1:]
    limit = next((int(args[i + 1]) for i, a in enumerate(args) if a == "--limit"), None)
    maxb = next((int(args[i + 1]) for i, a in enumerate(args) if a == "--max-bytes"), 120)
    cands = candidates(maxb)
    if limit:
        cands = cands[:limit]
    print(f"candidates (<= {maxb}B): {len(cands)}")
    if "--list" in args:
        for a0, _a1, name, _f, _s in cands:
            print(f"  {a0}  {name}")
        return
    if not os.path.exists(FRAG):
        open(FRAG, "w").close()
    # phase 1: port + compile-check
    wired = {}
    for c in cands:
        if port(c[2]):
            wired[c[2]] = c
    print(f"compiled: {len(wired)}")
    if not wired:
        return
    for c in wired.values():
        wire(*c)
    undef_seen = {}
    # phase 2: build once; resolve link errors by reverting offending candidates
    for _ in range(60):
        r = sh("make fireemblem8.gba 2>&1")
        out = r.stdout + r.stderr
        if "fireemblem8.gba" in out and "Error" not in out.split("fireemblem8.gba")[-1]:
            built = os.path.exists("fireemblem8.gba")
        undef = set(re.findall(r"undefined reference to `(\w+)'", out))
        for u in undef:
            undef_seen[u] = undef_seen.get(u, 0) + 1
        # also: a multiple-definition means our name collides -> drop it
        multi = set(re.findall(r"multiple definition of `(\w+)'", out))
        bad = set()
        if undef:
            for name in list(wired):
                txt = open(f"src/{name}.c").read()
                if any(re.search(rf"\b{u}\b", txt) for u in undef):
                    bad.add(name)
        bad |= (multi & set(wired))
        if not bad:
            break
        for name in bad:
            c = wired.pop(name)
            unwire(name, c[3], c[4])
        print(f"  link-fix: reverted {len(bad)} (undef/multi); retry build")
    if undef_seen:
        top = sorted(undef_seen.items(), key=lambda kv: -kv[1])[:20]
        print("  top undefined-symbol blockers:", ", ".join(f"{k}({v})" for k, v in top))
    # phase 3: byte-check each vs baserom in the all-wired ROM
    if not os.path.exists("fireemblem8.gba"):
        print("build still failing; reverting all");
        for name, c in list(wired.items()):
            unwire(name, c[3], c[4])
        return
    rom = open("fireemblem8.gba", "rb").read()
    base = open("baserom.gba", "rb").read()
    kept, reverted = 0, 0
    for name, c in list(wired.items()):
        o, e = int(c[0], 16), int(c[1], 16)
        if rom[o:e] == base[o:e]:
            kept += 1
        else:
            unwire(name, c[3], c[4])
            wired.pop(name)
            reverted += 1
    print(f"byte-check: kept {kept}, reverted {reverted}")
    # phase 4: rebuild + confirm
    if make_ok():
        print(f"DONE: graduated {kept} (make compare OK). COLD-verify + commit.")
    else:
        print("UNEXPECTED: make compare failed after revert; reverting all")
        for name, c in list(wired.items()):
            unwire(name, c[3], c[4])


def make_ok():
    r = sh("make compare")
    return "fireemblem8.gba: OK" in (r.stdout + r.stderr)


if __name__ == "__main__":
    main()
