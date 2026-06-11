#!/usr/bin/env python3
"""Decompose a partial TU's `src_cov` verified runs into asm-only SUB-RUNS (D50).

For partial TUs whose verified runs are all `src_cov` (intermixed: a verified
superrun spans existing src/exact_/masked_/<tu>_ carves AND still-asm gbadisasm
fragments), `harvest_verified_runs.py`/`graduate_shared_run.py` skip the whole run
(never double-carve a src/*.o). But the ungraduated functions sit in the
contiguous asm-only GAPS of those runs. This tool finds each maximal run of
consecutive gbadisasm-only carved rows inside a verified run, maps it (by zipping
the run's function names against the addr-sorted carved rows -- each gbadisasm row
consumes 1 fn, each src row consumes its objdump global-count) to a contiguous
sub-run (jp_start, jp_end, [fns]), and carves each as a separately-named object
via port_run.port() -- dedup_globals first, func_only fallback. Each sub-run is
independently verify-or-reverted (make compare the sole oracle), so a false
byte-match or a region-different function can't poison the batch.

Usage:
  scripts/subrun_decompose.py [--list] [--runs <cachefile>] <TU>
  --runs <file>  : read find_runs output from a file (one "<s> <e> fn,fn,..." per
                   line) instead of invoking find_runs (slow).
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


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def carved_rows():
    rows = []
    for path in (["layout/carved_rom.tsv"]
                 + sorted(glob.glob("layout/carved_rom.d/*.tsv"))):
        if not os.path.exists(path):
            continue
        is_g = os.path.basename(path).startswith("gbadisasm_")
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
            rows.append((0x08000000 + s, 0x08000000 + e, c[2], path, is_g))
    rows.sort()
    return rows


def obj_text_count(obj):
    """How many functions a carved object consumes: 1 for a gbadisasm/asm row or a
    single-text-symbol src object; the objdump global F .text count otherwise."""
    m = re.match(r"(src/\S+?)\.o\(", obj)
    if not m:
        return 1  # asm row = 1 fn
    o = m.group(1) + ".o"
    if not os.path.exists(o):
        return 1
    out = sh(f"arm-none-eabi-objdump -t {o}").stdout
    n = len([l for l in out.splitlines() if " F .text" in l])
    return max(1, n)


def asm_sym_file(obj):
    m = re.match(r"asm/(\S+?)\.o\((\.text\S*?)\)", obj)
    return (f"asm/{m.group(1)}.s", m.group(2)) if m else (None, None)


def decompose_run(rows, s, e, fns):
    """Zip the run's fns against the addr-sorted carved rows covering [s,e). Return
    a list of asm-only sub-runs: (jp_start_hex, jp_end_hex, [fns], [gbad_rows])."""
    cov = sorted([r for r in rows if r[0] < e and r[1] > s])
    # The run must be exactly partitioned by carved rows (no holes). Verify:
    fi = 0  # index into fns
    subs = []
    cur = None  # (start_addr, [fns], [gbad rows])
    for (rs, re_, obj, path, isg) in cov:
        n = obj_text_count(obj)
        consumed = fns[fi:fi + n]
        fi += n
        if isg:
            if cur is None:
                cur = [rs, re_, list(consumed), [(rs, re_, obj, path, isg)]]
            else:
                cur[1] = re_
                cur[2] += consumed
                cur[3].append((rs, re_, obj, path, isg))
        else:
            if cur is not None:
                subs.append(cur)
                cur = None
    if cur is not None:
        subs.append(cur)
    # Each sub: (start, end, fns, gbad_rows)
    return [(f"{a:08X}", f"{b:08X}", f, g) for (a, b, f, g) in subs], fi


def leading_asm_block(rows, s, e, fns):
    """A run's LEADING contiguous gbadisasm-only block, if it begins at the run
    start. The fn-name assignment is ALWAYS reliable here (1:1 from the run start,
    one fn per gbad row, before any src row can drift the count) -- so this recovers
    the leading asm gap even when the full zip mismatches downstream (e.g. a trailing
    already-carved exact/src row that sticks out past the run end over-consumes fns).
    Returns (start_hex, end_hex, [fns], [gbad_rows]) or None."""
    cov = sorted([r for r in rows if r[0] < e and r[1] > s])
    if not cov or cov[0][0] != s or not cov[0][4]:
        return None  # run doesn't start with a gbad row
    block, k = [], 0
    for r in cov:
        if r[4] and r[0] == s + sum(x[1] - x[0] for x in block):
            block.append(r)
            k += 1
        else:
            break
    if not block:
        return None
    a, b = block[0][0], block[-1][1]
    if k > len(fns):
        return None
    return (f"{a:08X}", f"{b:08X}", fns[:k], block)


def main():
    args = sys.argv[1:]
    do_list = "--list" in args
    runs_file = None
    if "--runs" in args:
        i = args.index("--runs")
        runs_file = args[i + 1]
        del args[i:i + 2]
    tus = [a for a in args if not a.startswith("--")]
    if not tus:
        print("usage: subrun_decompose.py [--list] [--runs <file>] <TU>")
        return 1

    grand = 0
    carved_names = []
    for tu in tus:
        rows = carved_rows()
        if runs_file:
            lines = open(runs_file).read().splitlines()
        else:
            lines = sh(f"python3 scripts/find_runs.py {tu}").stdout.splitlines()
        runs = []
        for l in lines:
            p = l.split()
            if len(p) >= 3 and p[0].startswith("08") and p[1].startswith("08"):
                runs.append((int(p[0], 16), int(p[1], 16), p[2].split(",")))
        # collect all asm-only sub-runs across all src_cov runs
        all_subs = []
        for (s, e, fns) in runs:
            cov = [r for r in rows if r[0] < e and r[1] > s]
            if not any("src/" in r[2] for r in cov):
                continue  # pure gbad/fresh -> harvest_verified_runs handles it
            subs, fi = decompose_run(rows, s, e, fns)
            if fi != len(fns):
                # zip mismatch: the full row-fn count disagrees with the run fn list
                # (usually a trailing already-carved src/exact row that STICKS OUT
                # past the run end, over-consuming fns). The full decomposition is
                # unreliable, but a LEADING asm-only block (from the run start) maps
                # 1:1 reliably -> recover just that block; verify-or-revert guards it.
                lead = leading_asm_block(rows, s, e, fns)
                if lead:
                    all_subs.append(lead)
                    if do_list:
                        print(f"  [zip-mismatch->lead] {tu}_{s:08X} "
                              f"(consumed {fi}/{len(fns)}) -- leading block "
                              f"{lead[0]} {len(lead[2])} fns: {', '.join(lead[2][:4])}")
                elif do_list:
                    print(f"  [zip-mismatch] {tu}_{s:08X} "
                          f"(consumed {fi}/{len(fns)} fns) -- no leading block, skipped")
                continue
            for (a, b, f, g) in subs:
                all_subs.append((a, b, f, g))
        # dedup sub-runs by start addr; sort largest-first
        seen = set()
        uniq = []
        for sub in sorted(all_subs, key=lambda x: -len(x[2])):
            if sub[0] in seen:
                continue
            seen.add(sub[0])
            uniq.append(sub)
        for (a, b, f, g) in uniq:
            name = f"{tu}_{a}"
            if os.path.exists(f"src/{name}.c"):
                continue
            if do_list:
                print(f"  [subrun] {name}  {len(f):2d} fns: "
                      f"{', '.join(f[:5])}{'...' if len(f) > 5 else ''}")
                continue
            # snapshot + remove the gbadisasm fragments this sub-run covers
            snap = {}
            for (_rs, _re, obj, path, _g) in g:
                snap.setdefault(path, open(path).read())
                af, _sec = asm_sym_file(obj)
                if af and os.path.exists(af):
                    snap.setdefault(af, open(af).read())
            for (_rs, _re, obj, path, _g) in g:
                if os.path.exists(path):
                    os.remove(path)
                af, _sec = asm_sym_file(obj)
                if af and os.path.exists(af):
                    os.remove(af)
            ok = port_run.port(name, runs=[(a, b, f)], src_tu=tu,
                               frag=f"harvest_subrun_{tu}", dedup_globals=True)
            if not ok:
                # restore gbad, retry func_only
                for p, content in snap.items():
                    open(p, "w").write(content)
                for (_rs, _re, obj, path, _g) in g:
                    if os.path.exists(path):
                        os.remove(path)
                    af, _sec = asm_sym_file(obj)
                    if af and os.path.exists(af):
                        os.remove(af)
                ok = port_run.port(name, runs=[(a, b, f)], src_tu=tu,
                                   frag=f"harvest_subrun_{tu}", func_only=True)
            if ok:
                grand += len(f)
                carved_names.append(name)
                rows = carved_rows()
                print(f"  [CARVE] {name}  {len(f)} fns")
            else:
                for p, content in snap.items():
                    open(p, "w").write(content)
                print(f"  [skip]  {name}  ({len(f)} fns) -- reverted")

    sh("make layout")
    mc = sh("make compare")
    green = "fireemblem8.gba: OK" in mc.stdout
    print(f"\nsubrun: carved {grand} fns; build {'GREEN' if green else 'RED'}")
    if carved_names:
        print("OBJECTS: " + " ".join(carved_names))
    return 0 if green else 1


if __name__ == "__main__":
    sys.exit(main())
