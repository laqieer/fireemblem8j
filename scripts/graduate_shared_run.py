#!/usr/bin/env python3
"""Graduate the SKIP-SHARED-ASM verified runs of a partial TU (the D46 lever, scaled).

`harvest_verified_runs.py` carves a TU's verified runs that are covered ONLY by
per-function `gbadisasm_*` fragments (a clean asm->C graduation). It SKIPS any run
whose JP range also overlaps a NON-per-function carved row (`[skip-shared-asm]`):
a shared/stranded asm section or a `src/masked_*.o` masked-layer object, because it
can't blindly double-carve those bytes.

D46 proved (statscreen) that such a run STILL graduates when the overlapping row is
a single INDEPENDENT, FULLY-CONTAINED unit the run's own C re-provides:
  * `asm/stranded_<tu>.o(.text.s_XXXX)` -- one `.section` of a multi-section stranded
    asm file (gbadisasm parked a real-named function there); each section is
    independent, so dropping just that block + its `stranded_func_<tu>.tsv` row leaves
    the file's other sections assembling, and the run's C supersedes it. (D46)
  * `src/masked_<addr>.o(.text)` -- a funcmap `masked`-tier function `carve_masked.py`
    carved out of the MIDDLE of the run, stranding the gbadisasm functions around it.
    Dropping the masked carve (its carved_rom.d/masked_layer row + `src/masked_<addr>.c`)
    lets the run's func_only C re-provide that exact function. (this script, wave-C)

In BOTH cases the byte-safety argument is identical: the overlapping unit is wholly
inside the verified run's [start,end), and the run's compiled C provides those exact
functions, so a func_only carve of the whole run covers the EXACT same bytes -- no
double-carve, no baserom gap. The `make compare` oracle + a full snapshot/revert make
it ZERO-risk: a run that doesn't byte-match after the drop is fully restored.

A run is graduated ONLY if EVERY overlapping non-per-function row is FULLY CONTAINED in
[start,end) (a row that STICKS OUT past the run end would leave its tail uncarved -> a
baserom gap; such runs are reported and skipped, never carved).

Usage:
  scripts/graduate_shared_run.py <TU> [<TU> ...]            # graduate eligible runs
  scripts/graduate_shared_run.py --list <TU> ...            # classify, carve nothing
  scripts/graduate_shared_run.py [--no-func-only] <TU> ...  # use extract_run (default: func_only)
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
    """Every carved row as (vstart, vend, obj, path, is_gbadisasm_frag)."""
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


def cover(rows, s, e):
    return [r for r in rows if r[0] < e and r[1] > s]


def find_runs(tu):
    out = sh(f"python3 scripts/find_runs.py {tu}").stdout
    runs = []
    for l in out.splitlines():
        p = l.split()
        if len(p) >= 3 and p[0].startswith("08") and p[1].startswith("08"):
            runs.append((p[0], p[1], p[2].split(",")))
    return runs


def asm_sym_file(obj):
    """For `asm/<file>.o(.text.<sec>)`, the (asm/<file>.s, .text.<sec>) pair."""
    m = re.match(r"asm/(\S+?)\.o\((\.text\.\S+?)\)", obj)
    return (f"asm/{m.group(1)}.s", m.group(2)) if m else (None, None)


def masked_src(obj):
    """For `src/masked_<addr>.o(.text)`, the src/masked_<addr>.c path (a masked carve)."""
    m = re.match(r"src/(masked_[0-9a-fA-F]+)\.o\(", obj)
    return f"src/{m.group(1)}.c" if m else None


def drop_stranded_section(asm_path, section, snap):
    """Remove the `.section ... <section> ... ` block (up to the next `.section`/EOF)
    from a stranded asm file. Snapshots the file first. Returns True if a block was
    removed. The section is an INDEPENDENT `.section <section>` with its own
    `.global`/`.incbin`; dropping it leaves the file's other sections intact."""
    if asm_path not in snap:
        snap[asm_path] = open(asm_path).read() if os.path.exists(asm_path) else None
    text = open(asm_path).read()
    lines = text.splitlines(keepends=True)
    start = None
    for i, l in enumerate(lines):
        if re.match(r"\s*\.section\s+" + re.escape(section) + r"\b", l):
            start = i
            break
    if start is None:
        return False
    end = len(lines)
    for j in range(start + 1, len(lines)):
        if re.match(r"\s*\.section\b", lines[j]):
            end = j
            break
    del lines[start:end]
    open(asm_path, "w").write("".join(lines))
    return True


def drop_tsv_row(path, obj, snap):
    """Remove the carved_rom row whose object field == `obj`. Snapshots the file."""
    if path not in snap:
        snap[path] = open(path).read() if os.path.exists(path) else None
    kept = []
    for ln in open(path):
        c = ln.split("\t")
        if len(c) >= 3 and c[2] == obj:
            continue
        kept.append(ln)
    open(path, "w").write("".join(kept))


def main():
    args = sys.argv[1:]
    do_list = "--list" in args
    func_only = "--no-func-only" not in args
    tus = [a for a in args if not a.startswith("--")]
    if not tus:
        print("usage: graduate_shared_run.py [--list] [--no-func-only] <TU> ...")
        return 1

    grand_runs = grand_fns = 0
    carved_names = []
    for tu in tus:
        rows = carved_rows()
        runs = find_runs(tu)
        runs = sorted(runs, key=lambda r: -len(r[2]))  # largest-first
        n_eligible = 0
        for start, end, fns in runs:
            s, e = int(start, 16), int(end, 16)
            name = f"{tu}_{start}"
            if os.path.exists(f"src/{name}.c"):
                continue
            cov = cover(rows, s, e)
            real_src = [r for r in cov if "src/" in r[2] and "/masked_" not in r[2]]
            if real_src:
                continue  # already real matching C -> leave it
            gbad = [r for r in cov if r[4]]
            masked = [r for r in cov if "/masked_" in r[2]]
            stranded = [r for r in cov
                        if not r[4] and "src/" not in r[2]
                        and asm_sym_file(r[2])[1]
                        and re.match(r"asm/stranded_", r[2])]
            other = [r for r in cov
                     if not r[4] and r not in masked and r not in stranded]
            shared = masked + stranded
            if not shared:
                continue  # pure gbadisasm/fresh -> harvest_verified_runs handles it
            if other:
                if do_list:
                    print(f"  [skip:other-cover] {name} ({len(fns)} fns) "
                          f"-- non-graduatable rows: {[r[2] for r in other]}")
                continue
            stickout = [r for r in shared if r[0] < s or r[1] > e]
            if stickout:
                if do_list:
                    print(f"  [skip:stickout] {name} ({len(fns)} fns) -- shared row "
                          f"extends past run: "
                          f"{[(f'{r[0]:08X}-{r[1]:08X}', r[2]) for r in stickout]}")
                continue
            n_eligible += 1
            if do_list:
                kinds = []
                if masked:
                    kinds.append(f"{len(masked)} masked")
                if stranded:
                    kinds.append(f"{len(stranded)} stranded-sec")
                print(f"  [graduate] {name}  {len(fns):2d} fns "
                      f"({len(gbad)} gbad, {', '.join(kinds)}): "
                      f"{', '.join(fns[:4])}{'...' if len(fns) > 4 else ''}")
                continue

            # --- carve: snapshot, drop overlapping units, port the run ---
            snap = {}
            # 1) gbadisasm per-function fragments + their asm files (same as harvester)
            for (_rs, _re, obj, path, _g) in gbad:
                snap.setdefault(path, open(path).read())
                af, _sec = asm_sym_file(obj)
                if af and os.path.exists(af):
                    snap.setdefault(af, open(af).read())
            for (_rs, _re, obj, path, _g) in gbad:
                if os.path.exists(path):
                    os.remove(path)
                af, _sec = asm_sym_file(obj)
                if af and os.path.exists(af):
                    os.remove(af)

            # 2) masked-layer objects: drop the masked_layer carved_rom row + src/<obj>.c
            for (_rs, _re, obj, path, _g) in masked:
                drop_tsv_row(path, obj, snap)
                mc = masked_src(obj)
                if mc and os.path.exists(mc):
                    snap.setdefault(mc, open(mc).read())
                    os.remove(mc)
                    mo = mc[:-2] + ".o"
                    if os.path.exists(mo):
                        os.remove(mo)

            # 3) stranded asm sections: drop the `.text.s_XXXX` block + its
            #    stranded_func_<tu>.tsv carved_rom row (D46).
            for (_rs, _re, obj, path, _g) in stranded:
                af, sec = asm_sym_file(obj)
                if af and sec:
                    drop_stranded_section(af, sec, snap)
                    drop_tsv_row(path, obj, snap)

            ok = port_run.port(name, runs=[(start, end, fns)], src_tu=tu,
                               frag=f"harvest_sharedasm_{tu}",
                               func_only=func_only, dedup_globals=not func_only)
            if ok:
                grand_runs += 1
                grand_fns += len(fns)
                carved_names.append(name)
                rows = carved_rows()
                kinds = []
                if masked:
                    kinds.append(f"{len(masked)} masked")
                if stranded:
                    kinds.append(f"{len(stranded)} stranded-sec")
                print(f"  [CARVE] {name}  {len(fns)} fns "
                      f"(graduated {len(gbad)} gbad + {', '.join(kinds)})")
            else:
                # restore every snapshotted file (port_run already restored ITS own
                # manifests; we restore the shared-unit files it doesn't own).
                for p, content in snap.items():
                    if content is None:
                        if os.path.exists(p):
                            os.remove(p)
                    else:
                        open(p, "w").write(content)
                print(f"  [skip]  {name}  ({len(fns)} fns) -- reverted")
        if do_list:
            print(f"{tu}: {n_eligible} eligible skip-shared-asm run(s)")

    sh("make layout")
    mc = sh("make compare")
    green = "fireemblem8.gba: OK" in mc.stdout
    print(f"\ngraduate: carved {grand_runs} runs / {grand_fns} fns; "
          f"build {'GREEN' if green else 'RED'}")
    if carved_names:
        print("OBJECTS: " + " ".join(carved_names))
    return 0 if green else 1


if __name__ == "__main__":
    sys.exit(main())
