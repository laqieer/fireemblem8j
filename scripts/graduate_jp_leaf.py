#!/usr/bin/env python3
"""Graduate LEAF jp-aliased region-different gbadisasm functions to matching C.

A still-asm gbadisasm function whose JP address carries a real name via jp_syms
(`.set Name, 0xADDR + 1`) has a known identity + a US source body. If its asm
body has NO `bl`/`blx` (a LEAF), porting the US body recompiles to byte-identical
code: there is no inter-TU call whose encoded offset would differ between US and
JP (the failure mode that sinks shifted-TU carves). Data/global refs resolve to
the already-placed JP globals via the project header `extern`s.

Per candidate: extract_func_only.py (US body + the US file's #includes, file-scope
data dropped) -> src/<Name>.c, compile-check, and on success wire the layout
(replace the gbadisasm asm placement with src/<Name>.o) + drop the jp_syms alias
(baseline_syms_drop.d) so the real C label wins. Then COLD `make compare` gates
the whole batch; failures are reverted (bisected). SKIPS extern-inline functions
(orphan out-of-line copies -> the inline-graduation pipeline owns those).

Usage:
  scripts/graduate_jp_leaf.py --list
  scripts/graduate_jp_leaf.py [--limit N] [--max-bytes B]
"""
import os, re, sys, glob, subprocess

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u"
FRAG = "layout/carved_rom.d/graduate_jp_leaf.tsv"


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def jp_alias():
    a = {}
    for ln in open("asm/jp_syms.s"):
        m = re.search(r"\.set\s+(\w+),\s*0x([0-9A-Fa-f]+)\s*\+\s*1", ln)
        if m:
            a[int(m.group(2), 16)] = m.group(1)
    return a


def asm_body(asmfile, label):
    if not os.path.exists(asmfile):
        return None
    out, st = [], False
    for ln in open(asmfile):
        s = ln.strip()
        if re.match(rf"{re.escape(label)}:", s):
            st = True
            continue
        if not st or not s or s.startswith("@") or s.startswith("."):
            continue
        out.append(s)
    return out


def us_file(name):
    r = sh(f'grep -rlE "^[a-zA-Z].*\\b{name}\\b\\s*\\(" {US}/src/*.c')
    return r.stdout.split("\n")[0] if r.stdout.strip() else None


def is_inline(name):
    r = sh(f'grep -rnE "inline\\s+[^;]*\\b{name}\\b\\s*\\(" {US}/src include')
    return bool(r.stdout.strip())


def candidates(max_bytes):
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
        if 0x080D6000 <= addr <= 0x080DBFFF or (b - a) > max_bytes:
            continue
        name = alias.get(addr)
        if not name:
            continue
        om = re.search(r"(asm/\w+)\.o", p[2])
        lbl = re.search(r"\.text\.(\w+)", p[2])
        if not om or not lbl:
            continue
        bd = asm_body(om.group(1) + ".s", lbl.group(1))
        if bd is None or any("bl " in i or "blx" in i for i in bd):
            continue
        out.append((p[0], p[1], name, frag, om.group(1) + ".s"))
    out.sort()
    return out


def make_compare():
    r = sh("make compare")
    return "fireemblem8.gba: OK" in (r.stdout + r.stderr)


def try_port(name):
    """Extract US body -> src/<name>.c, compile-check. Return cfile or None."""
    uf = us_file(name)
    if not uf or is_inline(name):
        return None
    cfile = f"src/{name}.c"
    r = sh(f'python3 scripts/extract_func_only.py "{uf}" "{name}"')
    if r.returncode != 0 or f"{name}" not in r.stdout:
        return None
    open(cfile, "w").write(r.stdout)
    if os.path.exists(f"src/{name}.o"):
        os.remove(f"src/{name}.o")
    c = sh(f"make src/{name}.o")
    if not os.path.exists(f"src/{name}.o"):
        os.remove(cfile)
        return None
    return cfile


def wire(addr0, addr1, name, frag, asmfile):
    with open(FRAG, "a") as f:
        f.write(f"{addr0}\t{addr1}\tsrc/{name}.o(.text)\tgraduate_jp_leaf(run): {name}\n")
    open(f"layout/baseline_syms_drop.d/graduate_jp_leaf_{name}.tsv", "w").write(name + "\n")
    sh(f'git rm -q "{frag}" "{asmfile}"')


def unwire(name, frag, asmfile, snap):
    open(FRAG, "w").write(snap)
    for pth in (f"src/{name}.c", f"src/{name}.o",
                f"layout/baseline_syms_drop.d/graduate_jp_leaf_{name}.tsv"):
        if os.path.exists(pth):
            os.remove(pth)
    sh(f'git checkout HEAD -- "{frag}" "{asmfile}"')


def main():
    args = sys.argv[1:]
    limit = next((int(args[i + 1]) for i, a in enumerate(args) if a == "--limit"), None)
    maxb = next((int(args[i + 1]) for i, a in enumerate(args) if a == "--max-bytes"), 200)
    cands = candidates(maxb)
    if limit:
        cands = cands[:limit]
    print(f"leaf jp-aliased candidates (<= {maxb}B): {len(cands)}")
    if "--list" in args:
        for a0, a1, name, _f, _s in cands:
            print(f"  {a0}  {name}")
        return
    if not os.path.exists(FRAG):
        open(FRAG, "w").close()
    # phase 1: port + compile-check each (no layout yet)
    ported = []
    for a0, a1, name, frag, asmfile in cands:
        if try_port(name):
            ported.append((a0, a1, name, frag, asmfile))
            print(f"  port+compile OK: {name}")
        else:
            print(f"  skip (no-us / inline / compile-fail): {name}")
    if not ported:
        print("nothing ported.")
        return
    # phase 2: wire all, COLD-less make compare; bisect on failure
    snap = open(FRAG).read()
    for c in ported:
        wire(*c)
    if make_compare():
        print(f"DONE: graduated {len(ported)} (batch make compare OK) -- COLD-verify + commit next")
        return
    print("batch make compare FAILED; bisecting...")
    # revert all, re-add one at a time
    for c in reversed(ported):
        unwire(c[2], c[3], c[4], snap)
    # rebuild src/*.o were removed; re-port survivors individually
    good = 0
    for a0, a1, name, frag, asmfile in ported:
        if not try_port(name):
            continue
        s1 = open(FRAG).read()
        wire(a0, a1, name, frag, asmfile)
        if make_compare():
            good += 1
            print(f"  [{good}] OK: {name}")
        else:
            unwire(name, frag, asmfile, s1)
            print(f"  revert (byte-mismatch): {name}")
    print(f"DONE: graduated {good} -- COLD-verify + commit next")


if __name__ == "__main__":
    main()
