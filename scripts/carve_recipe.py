#!/usr/bin/env python3
"""carve_recipe.py <FunctionName> — consolidate the per-function hand-decomp investigation.

Prints, for a still-asm region-different function:
  - JP sub address + carve range (from gbadisasm_sub_<addr>.tsv at HEAD)
  - the US definition body (from ../fireemblem8u/src, via the def-line heuristic)
  - the JP `.set NAME, ADDR` callees (already gbadisasm-resolved) and whether each is named
  - the JP `=0x08xxxxxx` literal-pool data addresses NOT covered by a .set (candidate ProcScr/data
    symbols that likely need an alias), each flagged DEAD-END if a `lsls;asrs` param sign-ext is present
This is read-only: it makes no edits. Use its output to author src/<F>.c + the layout fragments.
"""
import sys, os, re, subprocess, glob

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
US = os.path.join(ROOT, '..', 'fireemblem8u', 'src')


def sh(cmd):
    return subprocess.run(cmd, cwd=ROOT, shell=True, capture_output=True, text=True).stdout


def name_to_addr(name):
    # 1) baseline_syms.tsv (NAME<TAB>ADDR<TAB>type)
    for ln in open(os.path.join(ROOT, 'layout/baseline_syms.tsv')):
        p = ln.rstrip('\n').split('\t')
        if len(p) >= 2 and p[0] == name:
            return p[1]
    # 2) jp_syms.s aliases (`.set NAME, 0xADDR + 1`) — many gbadisasm functions are
    #    named only here (the graduate_jp_batch candidate pool), not in baseline_syms.
    jp = os.path.join(ROOT, 'asm/jp_syms.s')
    if os.path.exists(jp):
        for ln in open(jp):
            m = re.search(rf'\.set\s+{re.escape(name)},\s*0x([0-9A-Fa-f]+)', ln)
            if m:
                return m.group(1).upper().zfill(8)
    return None


def addr_named(addr):
    """Return the symbol name bound to 0x0ADDR (8-hex upper), checking baseline_syms.tsv AND
    the baseline_syms.d/*.tsv fragments AND already-carved src/*.c (the gen_layout merges all
    of these, so a symbol present in any of them does NOT need a fresh alias)."""
    a = addr.upper().lstrip('0').zfill(7)
    files = [os.path.join(ROOT, 'layout/baseline_syms.tsv')]
    files += glob.glob(os.path.join(ROOT, 'layout/baseline_syms.d/*.tsv'))
    for fp in files:
        for ln in open(fp):
            p = ln.rstrip('\n').split('\t')
            if len(p) >= 2 and re.match(r'^[0-9A-Fa-f]{6,8}$', p[1]) and p[1].upper().lstrip('0').zfill(7) == a:
                return p[0]
    return None


def find_us_def(name):
    """Return (file, body-lines) for the C definition of `name`, or (None, [])."""
    hit = sh(f"grep -rlnE '^[A-Za-z][^;]*\\b{name}\\s*\\(' {US}/*.c").strip().split('\n')
    for f in hit:
        if not f:
            continue
        lines = open(f).read().split('\n')
        for i, ln in enumerate(lines):
            if re.match(rf'^[A-Za-z][^;]*\b{name}\s*\(', ln) and ';' not in ln:
                body = []
                depth = 0
                started = False
                for l in lines[i:]:
                    body.append(l)
                    depth += l.count('{') - l.count('}')
                    if '{' in l:
                        started = True
                    if started and depth <= 0:
                        return f, body
        return f, []
    return None, []


def main():
    if len(sys.argv) < 2:
        print("usage: carve_recipe.py <FunctionName>"); return 1
    name = sys.argv[1]
    addr = name_to_addr(name)
    if not addr:
        print(f"!! {name} not in baseline_syms.tsv (already carved? wrong name?)"); return 1
    sub = 'sub_' + addr.lstrip('0')
    asm_path = f'asm/{sub}.s'
    if not os.path.exists(os.path.join(ROOT, asm_path)):
        # try 8-hex form
        alt = 'asm/sub_' + addr + '.s'
        asm_path = alt if os.path.exists(os.path.join(ROOT, alt)) else asm_path
    rng = sh(f"git show HEAD:layout/carved_rom.d/gbadisasm_{sub}.tsv 2>/dev/null").strip().split('\t')
    print(f"== {name}  @ 0x{addr}  ({sub}) ==")
    print(f"carve range: {rng[0] if rng and rng[0] else '??'}\t{rng[1] if len(rng)>1 else '??'}")

    f, body = find_us_def(name)
    print(f"US file: {os.path.relpath(f, ROOT) if f else '?? (not found)'}")
    if f:
        incs = sh(f"grep '#include' {f}").strip()
        print("US includes:", ' '.join(re.findall(r'#include "[^"]+"', incs)))
    print("---- US body ----")
    print('\n'.join(body) if body else "(def body not extracted — inspect manually)")

    asm = sh(f"git show HEAD:{asm_path} 2>/dev/null")
    print("---- JP .set callees (gbadisasm-resolved) ----")
    for m in re.finditer(r'^\t\.set\s+([A-Za-z_]\w*),\s*0x([0-9A-Fa-f]+)', asm, re.M):
        nm, a = m.group(1), m.group(2)
        named = addr_named(a)
        print(f"  {nm} @ 0x{a}   {'(named '+named+')' if named else '(NOT in baseline)'}")
    print("---- JP literal data addresses (=0x08xxxxxx) ----")
    seen = set()
    for m in re.finditer(r'=0x(08[0-9A-Fa-f]{6}|0[12][0-9A-Fa-f]{6})', asm):
        a = m.group(1)
        if a in seen:
            continue
        seen.add(a)
        named = addr_named(a)
        print(f"  0x{a}   {'(named '+named+')' if named else '-> NEEDS ALIAS (or already in src/data)'}")
    de = 'YES' if re.search(r'lsls r[0-9], r[0-7], #0x1[08]\n\tasrs', asm) else 'no'
    print(f"---- DEAD-END pre-screen (s8/s16 param sign-ext): {de} ----")
    return 0


if __name__ == '__main__':
    sys.exit(main())
