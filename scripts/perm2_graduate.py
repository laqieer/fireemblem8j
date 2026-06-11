#!/usr/bin/env python3
"""Graduate no-funcmap REGION-DIFFERENT functions (D54 frontier) to matching C.

The reloc-aware classifier (D54) labeled these "region-different" because a
masked needle search of the whole JP ROM missed them -- but many are actually
region-SAME: compiled in isolation + masked at the TRUE reloc offsets they are
body-identical to the JP bytes (the rd_screen.py NEAR bucket). They only differ
at relocation sites (callee BL operands, pc-rel literal pointers), which the
linker resolves once the function is carved into the JP layout at its real
address with its callees/globals already bound as layout symbols.

Per function (verify-or-revert; `make compare` is the sole oracle):
  1. JP range from funclib_us_jp.tsv (jp_addr -> next known boundary).
  2. extract_func_only US <tu>.c <fn> -> src/<fn>.c (function + includes only;
     no file-scope data -> no multiple-definition with sibling carves).
  3. probe_func: standalone .text must differ ONLY at reloc offsets (NEAR). If a
     body byte differs, SKIP (FAR -> permuter, not this fast path).
  4. If the range is currently a gbadisasm `sub_<jpaddr>` asm carve, stash its
     asm/<sub>.s + layout fragment (swap asm -> C).
  5. add carved_rom.d/perm2_<fn>.tsv row.

This stages many functions, then the CALLER runs ONE `make compare`; a single
whole-ROM verify catches any bad row (D7). On a red compare the caller reverts.
Use --verify to build+compare and auto-revert failures here instead.

Never calls `git add -A`. Usage:
  scripts/perm2_graduate.py --list [--min N --max N]
  scripts/perm2_graduate.py <fn> [<fn> ...]
  scripts/perm2_graduate.py --batch K [--min N --max N] [--verify]
"""
import os, re, sys, subprocess, glob, bisect, shutil

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u"
CPP = shutil.which("arm-none-eabi-cpp") or "cpp"
AGBCC = "tools/agbcc/bin/agbcc"
RD_TSV = "layout/nofuncmap_region_different.tsv"


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def load_funclib():
    """us_name -> jp_addr (int)."""
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


def compile_probe(cpath):
    base = cpath[:-2]
    obj, asm, binf = base + ".p2.o", base + ".p2.s", base + ".p2.bin"
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


def find_tu(name):
    for ln in open(RD_TSV):
        if ln.startswith("#"):
            continue
        p = ln.rstrip("\n").split("\t")
        if len(p) >= 4 and p[2] == name:
            return p[3], int(p[1])
    return None, None


def load_baseline_binds():
    """Return set of symbol names bound as baseline syms (monolith + fragments).
    A function carved to C that is also bound here -> multiple-definition; we add
    a baseline_syms_drop.d fragment for it."""
    binds = set()
    files = ["layout/baseline_syms.tsv"] + glob.glob("layout/baseline_syms.d/*.tsv")
    for fp in files:
        if not os.path.exists(fp):
            continue
        for ln in open(fp):
            if ln.startswith("#") or not ln.strip():
                continue
            binds.add(ln.split("\t")[0].strip())
    # subtract anything already dropped
    for fp in glob.glob("layout/baseline_syms_drop.d/*.tsv"):
        for ln in open(fp):
            binds.discard(ln.strip())
    return binds


def jp_range(name, funclib, bounds):
    jp = funclib.get(name)
    if jp is None:
        return None, None
    i = bisect.bisect_right(bounds, jp)
    jp_end = bounds[i] if i < len(bounds) else jp + 4
    return jp & 0xFFFFFF, jp_end & 0xFFFFFF


def existing_asm_carve(s):
    """Return (asm_path, frag_path, drop_frag) if [s,..] is a gbadisasm sub_ carve."""
    vma = s | 0x08000000
    sub = f"sub_{vma:X}".lower()
    # gbadisasm fragments are named gbadisasm_<label>.tsv; the label may be sub_<addr>
    for f in glob.glob("layout/carved_rom.d/gbadisasm_*.tsv"):
        line = open(f).readline().strip().split("\t")
        if len(line) < 3:
            continue
        if int(line[0], 16) == s:
            label = os.path.basename(f)[len("gbadisasm_"):-4]
            asm = f"asm/{label}.s"
            drop = f"layout/baseline_syms_drop.d/gbadisasm_{label}.tsv"
            return (asm if os.path.exists(asm) else None, f,
                    drop if os.path.exists(drop) else None, label)
    return (None, None, None, None)


def stage_one(name, funclib, bounds, rom, stash):
    tu, usize = find_tu(name)
    if not tu:
        return "NOTU", None
    if not os.path.exists(f"{US}/src/{tu}.c"):
        return "NOTUFILE", None
    s, e = jp_range(name, funclib, bounds)
    if s is None:
        return "NOADDR", None
    cpath = f"src/{name}.c"
    ext = sh(f"python3 scripts/extract_func_only.py {US}/src/{tu}.c {name}")
    if name not in ext.stdout or "{" not in ext.stdout:
        return "NOEXTRACT", None
    open(cpath, "w").write(ext.stdout)
    got, err, relocs = compile_probe(cpath)
    if got is None:
        os.unlink(cpath)
        return f"CF:{err}", None
    target = rom[s:e]
    n = len(target)
    if len(got) != n:
        os.unlink(cpath)
        return f"LEN {len(got)}!={n}", None
    g = got[:n]
    diffs = [i for i in range(n) if g[i] != target[i]]
    reloc_offs = set()
    for m in re.finditer(r"^\s*([0-9a-f]+)\s+R_ARM", relocs, re.M):
        o = int(m.group(1), 16)
        for k in range(4):
            reloc_offs.add(o + k)
    body = [d for d in diffs if d not in reloc_offs]
    if body:
        os.unlink(cpath)
        return f"FAR {len(body)}body", None
    # NEAR (or MATCH) -> stage. Swap any gbadisasm asm carve at this range.
    asm, frag, drop, label = existing_asm_carve(s)
    if frag:
        bak = f"/tmp/perm2_stash/{os.path.basename(frag)}"
        os.makedirs("/tmp/perm2_stash", exist_ok=True)
        shutil.move(frag, bak)
        stash.append(("frag", frag, bak))
        if asm:
            abak = f"/tmp/perm2_stash/{os.path.basename(asm)}"
            shutil.move(asm, abak)
            stash.append(("asm", asm, abak))
        if drop:
            dbak = f"/tmp/perm2_stash/gbadisasm_{label}_drop.tsv"
            shutil.move(drop, dbak)
            stash.append(("drop", drop, dbak))
    row = (f"{s:06X}\t{e:06X}\tsrc/{name}.o(.text)\t"
           f"{name} (perm2: no-funcmap region-diff -> matching C; reloc-resolved)\n")
    fragpath = f"layout/carved_rom.d/perm2_{name}.tsv"
    open(fragpath, "w").write(row)
    stash.append(("newfrag", fragpath, None))
    stash.append(("newsrc", cpath, None))
    return ("NEAR" if diffs else "MATCH"), (s, e, len(diffs))


def main():
    args = sys.argv[1:]
    mn, mx, batch, verify = 0, 1 << 30, 0, False
    if "--min" in args:
        i = args.index("--min"); mn = int(args[i + 1]); del args[i:i + 2]
    if "--max" in args:
        i = args.index("--max"); mx = int(args[i + 1]); del args[i:i + 2]
    if "--batch" in args:
        i = args.index("--batch"); batch = int(args[i + 1]); del args[i:i + 2]
    if "--verify" in args:
        verify = True; args.remove("--verify")
    listing = "--list" in args
    if listing:
        args.remove("--list")
    explicit = [a for a in args if not a.startswith("--")]

    funclib = load_funclib()
    bounds = load_boundaries()
    rom = open("baserom.gba", "rb").read()

    if explicit:
        names = explicit
    else:
        names = []
        for ln in open(RD_TSV):
            if ln.startswith("#"):
                continue
            p = ln.rstrip("\n").split("\t")
            if len(p) < 4:
                continue
            sz = int(p[1])
            if mn <= sz <= mx:
                names.append(p[2])

    if listing:
        for n in names[:batch or len(names)]:
            print(n)
        return

    stash = []
    staged = []
    for name in names:
        if os.path.exists(f"src/{name}.c"):
            continue  # already carved
        res, info = stage_one(name, funclib, bounds, rom, stash)
        if res in ("NEAR", "MATCH"):
            staged.append(name)
            print(f"[STAGE {res:5s}] {name}  jp={info[0]:06X}..{info[1]:06X} ({info[2]} reloc diffs)")
        else:
            print(f"[skip {res:12s}] {name}")
        if batch and len(staged) >= batch:
            break

    print(f"\nstaged {len(staged)} functions")
    if not staged:
        return

    # ---- auto-drop baseline ABS binds that collide with the new C symbols ----
    binds = load_baseline_binds()
    drop_names = [n for n in staged if n in binds]
    if drop_names:
        os.makedirs("layout/baseline_syms_drop.d", exist_ok=True)
        with open("layout/baseline_syms_drop.d/perm2_auto.tsv", "a") as f:
            for n in drop_names:
                f.write(n + "\n")
        print(f"auto-dropped {len(drop_names)} colliding baseline binds: {drop_names}")

    if not verify:
        print("staged; run `make layout && make compare`. To self-correct, re-run with --verify")
        return

    def revert(name):
        # read the carve range BEFORE removing the fragment
        fp = f"layout/carved_rom.d/perm2_{name}.tsv"
        vma = None
        if os.path.exists(fp):
            vma = (int(open(fp).readline().split("\t")[0], 16)) | 0x08000000
        for p in (f"src/{name}.c", fp):
            if os.path.exists(p):
                os.unlink(p)
        # restore the stashed gbadisasm carve for this range (sub_<VMA>)
        if vma is not None:
            sub = f"sub_{vma:X}"
            for orig, bak in (
                (f"layout/carved_rom.d/gbadisasm_{sub}.tsv",
                 f"/tmp/perm2_stash/gbadisasm_{sub}.tsv"),
                (f"asm/{sub}.s", f"/tmp/perm2_stash/{sub}.s"),
                (f"layout/baseline_syms_drop.d/gbadisasm_{sub}.tsv",
                 f"/tmp/perm2_stash/gbadisasm_{sub}_drop.tsv"),
            ):
                if os.path.exists(bak) and not os.path.exists(orig):
                    shutil.move(bak, orig)
        # remove from auto-drop list
        dl = "layout/baseline_syms_drop.d/perm2_auto.tsv"
        if os.path.exists(dl):
            lines = [l for l in open(dl) if l.strip() != name]
            open(dl, "w").writelines(lines)

    # Self-correcting verify loop: build, parse errors, revert offenders, retry.
    kept = list(staged)
    for attempt in range(6):
        sh("rm -f src/*.s; rm -f fireemblem8.elf fireemblem8.gba")
        lay = sh("make layout 2>&1")
        laylog = lay.stdout + lay.stderr
        if "overlap/order error" in laylog or "Error 1" in laylog:
            # parse the colliding address and revert the perm2 carve there
            m = re.search(r"overlap/order error at 0x([0-9a-f]+)", laylog)
            if m:
                addr = int(m.group(1), 16)
                victim = None
                for n in kept:
                    fp = f"layout/carved_rom.d/perm2_{n}.tsv"
                    if not os.path.exists(fp):
                        continue
                    pp = open(fp).readline().split("\t")
                    if int(pp[0], 16) <= addr < int(pp[1], 16) or int(pp[0], 16) == addr:
                        victim = n
                        break
                if victim:
                    print(f"attempt {attempt}: layout overlap at {addr:06X} -> revert {victim}")
                    revert(victim)
                    kept.remove(victim)
                    continue
            print("LAYOUT ERROR (unhandled):", laylog[-400:])
            return
        sh("rm -f src/*.s")
        c = sh("make compare 2>&1")
        log = c.stdout + c.stderr
        if "fireemblem8.gba: OK" in log:
            print(f"OK: {len(kept)} graduated (attempt {attempt})")
            return
        # undefined reference -> revert owning function
        bad = set()
        for m in re.finditer(r"src/(\w+)\.c:\d+.*undefined reference", log):
            bad.add(m.group(1))
        # header/data multiple-definition NOT a baseline-sym (e.g. graphics blob)
        for m in re.finditer(r"src/(\w+)\.o:.*multiple definition of `(\w+)'", log):
            owner, sym = m.group(1), m.group(2)
            if owner != sym:  # a pulled-in data symbol, not the function itself
                bad.add(owner)
        if not bad:
            # likely byte-mismatch: diff each kept range vs built ROM
            if os.path.exists("fireemblem8.gba"):
                built = open("fireemblem8.gba", "rb").read()
                for n in kept:
                    fp = f"layout/carved_rom.d/perm2_{n}.tsv"
                    if not os.path.exists(fp):
                        continue
                    pp = open(fp).readline().split("\t")
                    s2, e2 = int(pp[0], 16), int(pp[1], 16)
                    if rom[s2:e2] != built[s2:e2]:
                        bad.add(n)
        if not bad:
            print("RED but no offender identified:", log[-600:])
            return
        print(f"attempt {attempt}: reverting {len(bad)} offenders: {sorted(bad)}")
        for n in bad:
            revert(n)
            if n in kept:
                kept.remove(n)
        if not kept:
            print("all reverted; nothing graduated")
            return
    print("exhausted retries")


if __name__ == "__main__":
    main()
