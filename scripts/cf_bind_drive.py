#!/usr/bin/env python3
"""CF:agbcc data-binding lever (D45/D51/D53/D62/D63 class -> new D-number).

The perm2_graduate.py reloc-resolve fast path SKIPS a function as "CF:agbcc" when
extract_func_only's standalone compile fails: the function references a TU-PRIVATE
file-scope data table (a static `ProcCmd[]` / lookup table, e.g. StartGmMu ->
ProcScr_GMapMu) that is not declared in any header and not bound in sym_jp, so
agbcc errors `X undeclared`. The function body is region-SAME modulo relocation --
it would graduate NEAR -- it's blocked ONLY by the unbound pointee.

This driver carves each such function via port_run.port(func_only=True), which:
  1. extract_func_only (drops file-scope data),
  2. on `X undeclared`: emits X's US extern decl into the carved .c (fixpoint),
  3. resolves X's JP literal-pool address from the function's relocs and BINDS it
     as an ABS baseline_syms data symbol,
  4. verify-or-revert vs `make compare` (the sole oracle).

JP range computed perm2-style: funclib_us_jp.tsv jp_addr -> next known boundary
(sym_jp + funclib). Single-function run. Parallel-safe per-task fragment
(frag=cfbind_<tu>). NEVER `git add`. Caller commits explicitly.

Usage:
  scripts/cf_bind_drive.py --list                 # plan only (counts per TU)
  scripts/cf_bind_drive.py <fn> [<fn> ...]         # carve these functions
  scripts/cf_bind_drive.py --tu <TU> [<TU> ...]    # carve all CF:agbcc fns in TU(s)
  scripts/cf_bind_drive.py --names-file <path>     # carve fns listed in file
"""
import os, re, sys, bisect, glob, subprocess

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
sys.path.insert(0, os.path.join(ROOT, "scripts"))
import port_run  # noqa: E402

US = "/home/laqieer/fireemblem8u"
RD_TSV = "layout/nofuncmap_region_different.tsv"


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def load_funclib():
    d = {}
    for ln in open("reference/maps/funclib_us_jp.tsv"):
        if ln.startswith("#") or ln.startswith("jp_addr"):
            continue
        p = ln.rstrip("\n").split("\t")
        if len(p) >= 3 and p[2]:
            try:
                d[p[2]] = int(p[0], 16)
            except ValueError:
                pass
    return d


def load_boundaries():
    addrs = set()
    for ln in open("sym_jp.txt"):
        m = re.match(r"\s*\w+\s*=\s*0x([0-9A-Fa-f]+)\s*;", ln)
        if m:
            addrs.add(int(m.group(1), 16))
    for ln in open("reference/maps/funclib_us_jp.tsv"):
        if ln.startswith("#") or ln.startswith("jp_addr"):
            continue
        try:
            addrs.add(int(ln.split("\t")[0], 16))
        except (ValueError, IndexError):
            pass
    return sorted(addrs)


def jp_range(name, funclib, bounds):
    jp = funclib.get(name)
    if jp is None:
        return None, None
    i = bisect.bisect_right(bounds, jp)
    jp_end = bounds[i] if i < len(bounds) else jp + 4
    return jp & 0xFFFFFF, jp_end & 0xFFFFFF


def find_tu(name):
    for ln in open(RD_TSV):
        if ln.startswith("#"):
            continue
        p = ln.rstrip("\n").split("\t")
        if len(p) >= 4 and p[2] == name:
            return p[3]
    return None


def us_size(name):
    for ln in open(RD_TSV):
        if ln.startswith("#"):
            continue
        p = ln.rstrip("\n").split("\t")
        if len(p) >= 4 and p[2] == name:
            try:
                return int(p[1])
            except ValueError:
                return 0
    return 0


def cover_extent(name, s, e, funclib, bounds):
    """The JP byte extent port_run will actually carve. The boundary table can put a
    SPURIOUS symbol inside a function (truncating jp_range), but port_run carves to
    the COMPILED size -- so coverage/overlap reasoning must span the REAL function.
    Use max(boundary-range, US size) clamped to the next REAL boundary >= s+us_size."""
    sz = us_size(name)
    end = max(e, s + sz)
    return s, end


def all_cf_rows(funclib, bounds):
    """Every region-different worklist row that maps to a JP addr (perm2-placeable)."""
    rows = []
    for ln in open(RD_TSV):
        if ln.startswith("#"):
            continue
        p = ln.rstrip("\n").split("\t")
        if len(p) < 4:
            continue
        name, tu = p[2], p[3]
        s, e = jp_range(name, funclib, bounds)
        if s is None:
            continue
        rows.append((name, tu, int(p[1])))
    return rows


def real_carve_overlap(s, e):
    """True if [s,e) overlaps a NON-gbadisasm carved_rom row (a sibling src/* object
    or exact_/masked_/stranded_ carve). Such a region is already owned -- carving the
    function there would collide (a spurious funclib JP address or a region-different
    LEN). Skip rather than destructively overlap."""
    for path in ["layout/carved_rom.tsv"] + glob.glob("layout/carved_rom.d/*.tsv"):
        if not os.path.exists(path):
            continue
        if os.path.basename(path).startswith("gbadisasm_"):
            continue
        # this task's own cfbind fragment is fine to coexist with (different ranges)
        for ln in open(path):
            if ln.startswith("#") or not ln.strip():
                continue
            p = ln.split("\t")
            try:
                rs, re_ = int(p[0], 16), int(p[1], 16)
            except ValueError:
                continue
            if rs < e and re_ > s:
                return p[2] if len(p) > 2 else "?"
    return None


def gbadisasm_cover(s, e):
    """Return [(frag_path, content, asm_path, asm_content)] for every gbadisasm
    carved_rom fragment overlapping the JP range [s,e). These must be removed
    (asm->C swap) before carving the function to C; restored on revert."""
    cov = []
    for path in glob.glob("layout/carved_rom.d/gbadisasm_*.tsv"):
        rows = open(path).read().splitlines()
        overlap = False
        for ln in rows:
            if ln.startswith("#") or not ln.strip():
                continue
            p = ln.split("\t")
            try:
                rs, re_ = int(p[0], 16), int(p[1], 16)
            except ValueError:
                continue
            if rs < e and re_ > s:
                overlap = True
                break
        if not overlap:
            continue
        content = open(path).read()
        m = re.search(r"asm/(\S+?)\.o\(", content)
        asm_path = f"asm/{m.group(1)}.s" if m else None
        asm_content = open(asm_path).read() if asm_path and os.path.exists(asm_path) else None
        cov.append((path, content, asm_path, asm_content))
    return cov


def carve_one(name, funclib, bounds):
    tu = find_tu(name)
    if not tu:
        return "NOTU"
    if not os.path.exists(f"{US}/src/{tu}.c"):
        if not os.path.exists(f"/home/laqieer/fireemblem8u/src/{tu}.c"):
            return "NOTUFILE"
    s, e = jp_range(name, funclib, bounds)
    if s is None:
        return "NOADDR"
    if os.path.exists(f"src/{name}.c"):
        return "ALREADY"
    start = f"{0x08000000 + s:08X}"
    end = f"{0x08000000 + e:08X}"
    frag = f"cfbind_{tu}"

    cs, ce = cover_extent(name, s, e, funclib, bounds)
    occ = real_carve_overlap(cs, ce)
    if occ:
        return "OCCUPIED"
    # asm->C swap: stash gbadisasm fragments overlapping the REAL function extent
    # (port_run carves to the compiled size, which can exceed a spurious boundary),
    # remove them so port_run can place the C object; restore exactly on revert.
    cov = gbadisasm_cover(cs, ce)
    for path, _c, asm_path, _ac in cov:
        os.remove(path)
        if asm_path and os.path.exists(asm_path):
            os.remove(asm_path)

    ok = port_run.port(name, runs=[(start, end, [name])],
                       src_tu=tu, frag=frag, func_only=True)
    if not ok:
        # restore stashed gbadisasm carves
        for path, content, asm_path, asm_content in cov:
            if not os.path.exists(path):
                open(path, "w").write(content)
            if asm_path and asm_content is not None and not os.path.exists(asm_path):
                open(asm_path, "w").write(asm_content)
    return "CARVE" if ok else "REVERT"


def main():
    args = sys.argv[1:]
    do_list = "--list" in args
    if do_list:
        args.remove("--list")
    tu_mode = "--tu" in args
    if tu_mode:
        args.remove("--tu")
    if "--names-file" in args:
        i = args.index("--names-file")
        path = args[i + 1]
        del args[i:i + 2]
        args += [l.strip() for l in open(path) if l.strip()]

    funclib = load_funclib()
    bounds = load_boundaries()

    if do_list:
        rows = all_cf_rows(funclib, bounds)
        from collections import Counter
        c = Counter(r[1] for r in rows)
        print(f"{len(rows)} placeable region-diff rows across {len(c)} TUs")
        for tu, n in c.most_common(40):
            print(f"  {tu:32s} {n}")
        return

    batch = "--batch" in args
    if batch:
        args.remove("--batch")

    if tu_mode:
        rows = all_cf_rows(funclib, bounds)
        wanted = set(args)
        names = [r[0] for r in rows if r[1] in wanted]
    else:
        names = args

    if batch:
        return run_batch(names, funclib, bounds)

    carved, reverted, skipped = [], [], []
    for name in names:
        res = carve_one(name, funclib, bounds)
        if res == "CARVE":
            carved.append(name)
            print(f"[CARVE ] {name}")
        elif res == "REVERT":
            reverted.append(name)
            print(f"[revert] {name}")
        else:
            skipped.append((name, res))
            print(f"[skip {res:9s}] {name}")

    sh("make layout")
    mc = sh("make compare")
    green = "fireemblem8.gba: OK" in mc.stdout
    print(f"\ncf_bind: +{len(carved)} carved, {len(reverted)} reverted, "
          f"{len(skipped)} skipped; build {'GREEN' if green else 'RED'}")
    if carved:
        print("OBJECTS: " + " ".join(carved))
    return 0 if green else 1


def run_batch(names, funclib, bounds):
    """Stage MANY carves with the per-function `make compare` FAKED OK, then run ONE
    real `make compare`; on RED, range-diff each staged carve vs JP and revert
    offenders, rebuild, converge. ~1 build for N carves vs N builds."""
    rom = open("baserom.gba", "rb").read()
    real_sh = port_run.sh

    def fake_sh(c):
        # During staging, short-circuit the expensive whole-ROM verify so port_run
        # WRITES its fragments + returns True without building/reverting. Everything
        # else (make src/X.o, make layout, objdump, iconv...) runs for real.
        if c.strip() in ("make compare", "make clean") or c.strip().startswith("make compare"):
            class R:  # mimic CompletedProcess
                returncode = 0
                stdout = "fireemblem8.gba: OK\n"
                stderr = ""
            return R()
        return real_sh(c)

    staged = []           # (name, s, e, cov)
    skipped = []
    port_run.sh = fake_sh
    try:
        for name in names:
            if os.path.exists(f"src/{name}.c"):
                continue
            tu = find_tu(name)
            if not tu:
                skipped.append((name, "NOTU")); continue
            if not os.path.exists(f"/home/laqieer/fireemblem8u/src/{tu}.c"):
                skipped.append((name, "NOTUFILE")); continue
            s, e = jp_range(name, funclib, bounds)
            if s is None:
                skipped.append((name, "NOADDR")); continue
            start, end = f"{0x08000000+s:08X}", f"{0x08000000+e:08X}"
            cs, ce = cover_extent(name, s, e, funclib, bounds)
            if real_carve_overlap(cs, ce):
                skipped.append((name, "OCCUPIED")); continue
            cov = gbadisasm_cover(cs, ce)
            for path, _c, asm_path, _ac in cov:
                os.remove(path)
                if asm_path and os.path.exists(asm_path):
                    os.remove(asm_path)
            ok = port_run.port(name, runs=[(start, end, [name])], src_tu=tu,
                               frag=f"cfbind_{tu}", func_only=True)
            if ok and os.path.exists(f"src/{name}.c"):
                # record the REAL carved extent for overlap reasoning / range-diff
                staged.append((name, s, max(e, ce), cov))
                print(f"[stage ] {name}  {start}..{end}")
            else:
                for path, content, asm_path, asm_content in cov:
                    if not os.path.exists(path):
                        open(path, "w").write(content)
                    if asm_path and asm_content is not None and not os.path.exists(asm_path):
                        open(asm_path, "w").write(asm_content)
                skipped.append((name, "CF/compile"))
                print(f"[skip  ] {name}")
    finally:
        port_run.sh = real_sh

    print(f"\nstaged {len(staged)}; running real make compare ...")
    if not staged:
        return 0

    def revert_staged(name, s, e, cov):
        for p in (f"src/{name}.c", f"src/{name}.o", f"src/{name}.s"):
            if os.path.exists(p):
                os.remove(p)
        _drop_carve_rows(name, s, e)
        for path, content, asm_path, asm_content in cov:
            if not os.path.exists(path):
                open(path, "w").write(content)
            if asm_path and asm_content is not None and not os.path.exists(asm_path):
                open(asm_path, "w").write(asm_content)

    kept = list(staged)
    for attempt in range(6):
        real_sh("rm -f src/*.s fireemblem8.elf fireemblem8.gba")
        lay = real_sh("make layout 2>&1")
        log = lay.stdout + lay.stderr
        if "overlap/order error" in log:
            m = re.search(r"overlap/order error at 0x([0-9a-f]+)"
                          r"(?:\s*\(prev end 0x([0-9a-f]+)\))?", log)
            if m:
                addr = int(m.group(1), 16)
                prev = int(m.group(2), 16) if m.group(2) else addr
                lo, hi = min(addr, prev), max(addr, prev)
                # any kept carve whose [s,e) touches the overlap window is the offender
                victims = [t for t in kept if t[1] < hi and t[2] > lo]
                # also a carve that starts/ends exactly at the boundary
                victims += [t for t in kept if t not in victims
                            and (t[1] == addr or t[2] == addr
                                 or t[1] == prev or t[2] == prev)]
                if victims:
                    v = victims[0]
                    print(f"  layout overlap @{addr:06X} (prev {prev:06X}) -> revert {v[0]}")
                    revert_staged(*v); kept.remove(v); continue
            print("LAYOUT ERROR (recovering):", log[-300:])
            for t in kept:
                revert_staged(*t)
            real_sh("make layout")
            return 1
        real_sh("rm -f src/*.s")
        mc = real_sh("make compare 2>&1")
        clog = mc.stdout + mc.stderr
        if "fireemblem8.gba: OK" in clog:
            print(f"OK: +{len(kept)} graduated (attempt {attempt})")
            print("OBJECTS: " + " ".join(t[0] for t in kept))
            return 0
        # multiple-definition of a BOUND symbol an existing object provides: drop
        # the redundant baseline alias (port_run's own dedup), retry — don't revert
        # the carve. Only if the dup name isn't itself a staged carve.
        dup_binds = set()
        for m in re.finditer(r"multiple definition of [`'](\w+)'", clog):
            sym = m.group(1)
            if not any(t[0] == sym for t in kept) and sym in _all_baseline_binds():
                dup_binds.add(sym)
        if dup_binds:
            os.makedirs("layout/baseline_syms_drop.d", exist_ok=True)
            with open("layout/baseline_syms_drop.d/cfbind_dedup.tsv", "a") as f:
                f.write("".join(s + "\n" for s in sorted(dup_binds)))
            print(f"  attempt {attempt}: drop {len(dup_binds)} dup baseline binds: {sorted(dup_binds)}")
            continue
        bad = set()
        for m in re.finditer(r"src/(\w+)\.c:\d+.*undefined reference", clog):
            bad.add(m.group(1))
        for m in re.finditer(r"multiple definition of [`'](\w+)'", clog):
            sym = m.group(1)
            for t in kept:
                if t[0] == sym:
                    bad.add(sym)
        if not bad and os.path.exists("fireemblem8.gba"):
            built = open("fireemblem8.gba", "rb").read()
            for (n2, s2, e2, _c) in kept:
                if rom[s2:e2] != built[s2:e2]:
                    bad.add(n2)
        if not bad:
            print("RED, no offender:", clog[-400:]); return 1
        print(f"  attempt {attempt}: revert {len(bad)} offenders: {sorted(bad)}")
        for n2 in bad:
            t = next((x for x in kept if x[0] == n2), None)
            if t:
                revert_staged(*t); kept.remove(t)
        if not kept:
            print("all reverted"); return 0
    print("exhausted retries"); return 1


def _all_baseline_binds():
    names = set()
    for p in (["layout/baseline_syms.tsv"]
              + glob.glob("layout/baseline_syms.d/*.tsv")):
        if not os.path.exists(p):
            continue
        for l in open(p):
            if l.strip() and not l.startswith("#"):
                names.add(l.split("\t")[0])
    return names


def _drop_carve_rows(name, s, e):
    """Remove this carve's carved_rom row (the one that PLACES src/<name>.o(.text) and
    would cause the overlap/mismatch). Keyed on the src/<name>.o object so sibling
    carves in the same fragment survive. Leaves the baseline_syms ABS binds in place:
    an orphan bind is a harmless absolute alias to an unused symbol (it places no
    bytes), and a SHARED pointee bind (several funcs -> same ProcScr table) must NOT
    be dropped while a sibling still needs it."""
    tu = find_tu(name)
    cr = f"layout/carved_rom.d/cfbind_{tu}.tsv"
    if os.path.exists(cr):
        kept = [l for l in open(cr) if f"src/{name}.o(" not in l]
        open(cr, "w").writelines(kept)


if __name__ == "__main__":
    sys.exit(main())
