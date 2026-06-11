#!/usr/bin/env python3
"""Per-frag direct carve of region-same functions (D58 pattern, scriptified).

For a partial TU whose ungraduated region-same functions sit in INDIVIDUAL
gbadisasm `asm/sub_*.o` fragments (find_runs collapses them / classifies the
spanning verified run as src_cov, so harvest_verified_runs / subrun_decompose
skip them), this driver carves each locate_funcs-proposed run directly:

  for each run (start, end, [fns]):
    * skip if every fn is already defined in src/<tu>*.c (already C)
    * snapshot + remove the gbadisasm asm/sub_*.o rows (+ .s) the run covers
    * port_run.port(name=<tu>_<start>, runs=[(start,end,fns)], src_tu=<tu>,
                    frag=perfrag_<tu>, dedup_globals=True), func_only fallback
    * port verify-or-reverts vs `make compare`; on failure restore the asm files

`make compare` is the sole oracle (port_run does it internally). NO `git add`.

Usage:
  scripts/perfrag_carve.py [--list] [--only fn1,fn2] <TU>
"""
import glob
import os
import re
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
import port_run  # noqa: E402

US = "/home/laqieer/fireemblem8u/src"


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def carved_rows():
    rows = []
    for path in (["layout/carved_rom.tsv"]
                 + sorted(glob.glob("layout/carved_rom.d/*.tsv"))):
        if not os.path.exists(path):
            continue
        base = os.path.basename(path)
        is_gbad = base.startswith("gbadisasm_") or "sub_" in base
        for ln in open(path):
            ln = ln.rstrip("\n")
            if not ln or ln.lstrip().startswith("#"):
                continue
            c = ln.split("\t")
            if len(c) < 3:
                continue
            try:
                s, e = int(c[0], 16), int(c[1], 16)
            except ValueError:
                continue
            # treat any per-function `asm/sub_*.o(.text.sub_*)` row as a removable
            # gbadisasm fragment regardless of which manifest file holds it.
            g = is_gbad or bool(re.match(r"asm/sub_[0-9A-Fa-f]+\.o\(", c[2]))
            rows.append((0x08000000 + s, 0x08000000 + e, c[2], path, g))
    rows.sort()
    return rows


def cover(rows, s, e):
    return [r for r in rows if r[0] < e and r[1] > s]


def asm_sym_file(obj):
    m = re.match(r"asm/(\S+?)\.o\(", obj)
    return f"asm/{m.group(1)}.s" if m else None


def worklist_funcs(tu):
    """[(jp_start_hex, jp_end_hex, fn)] for each region-same worklist row of TU.

    Columns: JP_addr  US_addr  size  match_type  func_name  TU
    """
    out = []
    for ln in open("layout/nofuncmap_region_same.tsv"):
        if not ln.strip() or ln.lstrip().startswith("#"):
            continue
        c = ln.rstrip("\n").split("\t")
        if len(c) < 6 or c[5] != tu:
            continue
        jp = int(c[0], 16)
        size = int(c[2])
        out.append((f"{jp:08X}", f"{jp + size:08X}", c[4]))
    out.sort()
    return out


def defined_in_src(tu, fn):
    """True if fn has a body in any src/<tu>*.c."""
    pat = re.compile(r"^\s*[A-Za-z_].*\b" + re.escape(fn) + r"\s*\(", re.M)
    for f in glob.glob(f"src/{tu}*.c"):
        txt = open(f).read()
        # a definition (body) not a bare extern/proto: look for the fn followed by
        # ... ) { somewhere after.
        for m in pat.finditer(txt):
            tail = txt[m.start():m.start() + 4000]
            # crude: a `{` before the next `;` at statement level
            br = tail.find("{")
            sc = tail.find(";")
            if br != -1 and (sc == -1 or br < sc):
                return True
    return False


def main():
    args = sys.argv[1:]
    do_list = "--list" in args
    only = None
    if "--only" in args:
        i = args.index("--only")
        only = set(args[i + 1].split(","))
        del args[i:i + 2]
    args = [a for a in args if not a.startswith("--")]
    if not args:
        print("usage: perfrag_carve.py [--list] [--only fn,..] <TU>")
        return 1
    tu = args[0]

    items = worklist_funcs(tu)
    if only is not None:
        items = [it for it in items if it[2] in only]
    print(f"{tu}: {len(items)} region-same worklist function(s)")
    carved = 0
    for start, end, fn in items:
        fns = [fn]
        s, e = int(start, 16), int(end, 16)
        if defined_in_src(tu, fn):
            if do_list:
                print(f"  [skip-srccov] {start}..{end} {fn} already-in-src")
            continue
        rows = carved_rows()
        cov = cover(rows, s, e)
        src_cov = [r for r in cov if "src/" in r[2]]
        nongbad = [r for r in cov if "src/" not in r[2] and not r[4]]
        gbad = [r for r in cov if r[4]]
        if src_cov:
            if do_list:
                print(f"  [skip-srccov-row] {start}..{end} ({len(fns)} fns): "
                      f"{[r[2] for r in src_cov]}")
            continue
        if nongbad:
            if do_list:
                print(f"  [skip-shared-asm] {start}..{end} ({len(fns)} fns): "
                      f"{[r[2] for r in nongbad]}")
            continue
        if do_list:
            print(f"  [plan] {start}..{end}  {len(fns):2d} fns "
                  f"({len(gbad)} asm frags): {', '.join(fns)}")
            continue

        # snapshot + remove covered gbadisasm asm fragments
        removed = {}
        for (_rs, _re, obj, path, _g) in gbad:
            if path not in removed:
                removed[path] = open(path).read()
            af = asm_sym_file(obj)
            if af and os.path.exists(af):
                removed[af] = open(af).read()
        # remove only the matching rows from per-frag manifests; if a manifest
        # holds rows for OTHER ranges too, rewrite it without the covered rows.
        manifest_paths = set(r[3] for r in gbad)
        asm_files = set()
        for (_rs, _re, obj, path, _g) in gbad:
            af = asm_sym_file(obj)
            if af:
                asm_files.add(af)
        # rewrite manifests dropping covered rows
        man_snap = {p: open(p).read() for p in manifest_paths}
        for p in manifest_paths:
            keep = []
            for ln in man_snap[p].splitlines(keepends=True):
                c = ln.rstrip("\n").split("\t")
                drop = False
                if len(c) >= 3:
                    try:
                        rs0 = 0x08000000 + int(c[0], 16)
                        re0 = 0x08000000 + int(c[1], 16)
                        if rs0 < e and re0 > s and re.match(r"asm/sub_", c[2]):
                            drop = True
                    except ValueError:
                        pass
                if not drop:
                    keep.append(ln)
            open(p, "w").write("".join(keep))
        for af in asm_files:
            if os.path.exists(af):
                os.remove(af)

        name = f"{tu}_{start}"
        ok = port_run.port(name, runs=[(start, end, fns)], src_tu=tu,
                           frag=f"perfrag_{tu}", dedup_globals=True)
        if not ok:
            ok = port_run.port(name, runs=[(start, end, fns)], src_tu=tu,
                               frag=f"perfrag_{tu}", func_only=True)
        if ok:
            carved += len(fns)
            print(f"  CARVED {name} (+{len(fns)}): {', '.join(fns)}")
        else:
            # restore manifests + asm files
            for p, txt in man_snap.items():
                open(p, "w").write(txt)
            for pth, txt in removed.items():
                open(pth, "w").write(txt)
            if os.path.exists(f"src/{name}.c"):
                os.remove(f"src/{name}.c")
            if os.path.exists(f"src/{name}.o"):
                os.remove(f"src/{name}.o")
            print(f"  reverted {name} ({len(fns)} fns) -> region-diff/blocked")
    print(f"{tu}: per-frag carved +{carved} fns")
    return 0


if __name__ == "__main__":
    sys.exit(main())
