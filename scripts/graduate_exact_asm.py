#!/usr/bin/env python3
"""Phase 2 fast path: graduate funcmap `exact`-tier gbadisasm asm functions into
byte-MATCHING C by porting the US source, ONE function at a time.

An `exact`-tier function's JP bytes already UNIQUELY match the US compile of that
function (no masking, no false-positive window). When such a function sits as
gbadisasm descriptive asm (asm/<fn>.s + layout/carved_rom.d/gbadisasm_<fn>.tsv),
it is there only because the whole-TU port never reached it -- the US C for it
compiles to IDENTICAL bytes. We swap asm -> matching C and `make compare` stays OK.

Why per-function (not carve_exact's run port): these stranded exact functions live
in PARTIAL TUs whose data globals are ALREADY emitted by sibling carves. Porting
the US run re-DEFINES those globals -> multiple-definition link error. The fix is
extract_func_only.py: emit ONLY the function body + the US #includes, NO file-scope
data. The data references resolve to the already-placed globals via header externs;
only the function's .text is added (no .data/.bss, no collision).

Per function (verify-or-revert; `make compare` is the sole oracle):
  1. extract_func_only US <tu>.c <fn>  -> src/<fn>.c (function + includes only)
  2. add carved_rom.d/exact_layer.tsv row: <s> <e> src/<fn>.o(.text) ...
  3. delete asm/<fn>.s + layout/carved_rom.d/gbadisasm_<fn>.tsv
  4. make layout && make compare. OK -> graduated. FAIL -> revert ALL of this
     function's changes (restore asm + fragment, drop the src + row) and skip.

Never calls `git add -A`; never commits. The caller stages/commits explicitly.

Usage:
  scripts/graduate_exact_asm.py <fn> [<fn> ...]
  scripts/graduate_exact_asm.py --tu <US_TU>
  scripts/graduate_exact_asm.py --all            # every eligible exact-tier fn
  scripts/graduate_exact_asm.py --list
"""
import os, re, sys, subprocess, glob, time

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u"

# PARALLEL-SAFE FRAGMENT (D14 conflict-free carving). The Makefile/gen_layout glob
# `layout/carved_rom.d/*.tsv`, so every fragment in that dir is linked. Historically
# all runs appended to one SHARED `exact_layer.tsv`, which collides when concurrent
# asm->C agents graduate at once (lost-update on a single appended file, merge
# conflicts). Instead each *run* writes its own UNIQUE fragment
# `layout/carved_rom.d/graduated_<scope>.tsv` (scope = --tu name, or a pid+time tag
# for --all/ad-hoc). Existing exact_layer.tsv rows keep linking unchanged (still
# globbed). FRAG is resolved once per run in main() via frag_path_for().
EXACT_LAYER = "layout/carved_rom.d/exact_layer.tsv"  # legacy shared file (read-only now)
FRAG = EXACT_LAYER  # default; overridden per-run by frag_path_for() in main()


def _sanitize(tag):
    return re.sub(r"[^\w.-]", "_", tag)


def frag_path_for(scope):
    """Unique per-run fragment path so concurrent runs never collide. `scope` is a
    short stable tag (a TU name, or 'all'/'adhoc'); we append pid+epoch so two runs
    with the same scope still get distinct files. Rows are appended only by THIS
    run, so there is no lost-update across processes."""
    tag = _sanitize(scope)
    return f"layout/carved_rom.d/graduated_{tag}_{os.getpid()}_{int(time.time())}.tsv"


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def load_funcmap():
    fm = {}
    for ln in open("layout/us_jp_funcmap.tsv"):
        if ln.startswith("#"):
            continue
        p = ln.rstrip("\n").split("\t")
        if len(p) < 5:
            continue
        fm[int(p[0], 16)] = (int(p[2]), p[3], p[4])  # size, tier, name
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
    """name -> (jp_start, jp_end, frag_path)."""
    out = {}
    for f in glob.glob("layout/carved_rom.d/gbadisasm_*.tsv"):
        line = open(f).readline().strip().split("\t")
        if len(line) < 3:
            continue
        name = os.path.basename(f)[len("gbadisasm_"):-4]
        out[name] = (int(line[0], 16), int(line[1], 16), f)
    return out


def exact_backlog(tiers=("exact",)):
    """[(name, jp_start, jp_end, us_tu, us_fname)] for gbadisasm funcs of the given
    funcmap tier(s) with US source. The asm-label name may differ from the US
    funcmap name. `exact` is the safe fast path (unique unmasked byte pin); `masked`
    mostly-matches with relocatable pointer/literal deltas the linker fixes -- still
    fully gated by make compare (verify-or-revert), so masked false-positives just
    revert to asm at zero risk."""
    fm = load_funcmap()
    ftu = fn_to_tu()
    rows = []
    for name, (start, end, frag) in gbadisasm_fns().items():
        jp = start | 0x08000000
        if jp in fm and fm[jp][1] in tiers:
            fname = fm[jp][2]
            tu = ftu.get(fname)
            if tu and os.path.exists(f"{US}/src/{tu}.c"):
                rows.append((name, start, end, tu, fname))
    rows.sort(key=lambda r: r[1])
    return rows


def grad_one(name, s, e, tu, fname):
    """Graduate one function. Returns 'ok' | 'skip:<reason>'. verify-or-revert."""
    asm = f"asm/{name}.s"
    gfrag = f"layout/carved_rom.d/gbadisasm_{name}.tsv"
    src = f"src/{name}.c"
    if os.path.exists(src):
        return "skip:src exists"

    # snapshot for revert
    snap = {p: (open(p).read() if os.path.exists(p) else None)
            for p in (asm, gfrag, FRAG, src)}

    # 1. function-only extract (US name -> we keep the asm-label name in C so the
    #    carved_rom row's symbol and the .text label agree).
    ext = sh(f"python3 scripts/extract_func_only.py {US}/src/{tu}.c {fname}")
    body = ext.stdout
    if fname not in body or "{" not in body:
        return f"skip:extract failed for {fname}"
    # if the asm label differs from the US name, rename the definition so the
    # emitted symbol is the JP label (keeps callers/baseline_syms consistent).
    if name != fname:
        body = re.sub(r"\b" + re.escape(fname) + r"\b", name, body)
    open(src, "w").write(body)

    # 1b. resolve agbcc -Wimplicit -Werror on same-TU helpers not in headers:
    #     prepend a K&R `extern int X();` for each implicitly-declared callee
    #     (its call-site codegen doesn't depend on the prototype; verify-or-revert
    #     guards anything wrong). Retry a few times to clear cascading impl-decls.
    for _ in range(4):
        sh(f"rm -f src/{name}.o src/{name}.s")
        r = sh(f"make src/{name}.o")
        if os.path.exists(f"src/{name}.o"):
            break
        impl = set(re.findall(
            r"implicit declaration of function [`'\"]?(\w+)", r.stderr + r.stdout))
        if not impl:
            break
        externs = "".join(f"extern int {h}();\n" for h in sorted(impl))
        body = open(src).read()
        # insert after the last #include
        lines = body.splitlines(keepends=True)
        li = max((i for i, l in enumerate(lines) if l.lstrip().startswith("#include")),
                 default=-1)
        body = "".join(lines[:li + 1]) + "\n" + externs + "".join(lines[li + 1:])
        open(src, "w").write(body)
    sh(f"rm -f src/{name}.o src/{name}.s")

    # 2. carved_rom row in the exact_layer fragment
    with open(FRAG, "a") as f:
        f.write(f"{s:06X}\t{e:06X}\tsrc/{name}.o(.text)\t"
                f"{name} (exact-tier graduated from gbadisasm asm)\n")

    # 3. drop the asm byte source + gbadisasm fragment
    for p in (asm, gfrag):
        if os.path.exists(p):
            os.remove(p)

    # 4. build + verify
    sh("make layout")
    # ensure the new object rebuilds
    sh(f"rm -f src/{name}.o")
    mc = sh("make compare")
    if "fireemblem8.gba: OK" in mc.stdout:
        sh(f"rm -f src/{name}.o src/{name}.s")
        return "ok"

    # revert everything
    for p, content in snap.items():
        if content is None:
            if os.path.exists(p):
                os.remove(p)
        else:
            open(p, "w").write(content)
    sh(f"rm -f src/{name}.o src/{name}.s")
    sh("make layout")
    # capture a short reason
    reason = "make compare RED"
    m = re.search(r"multiple definition of `(\w+)'", mc.stdout)
    if m:
        reason = f"multiple def of {m.group(1)}"
    m = re.search(r"undefined reference to `(\w+)'", mc.stdout)
    if m:
        reason = f"undef ref {m.group(1)}"
    if "implicit declaration" in mc.stdout:
        reason = "implicit decl (-Werror)"
    return f"skip:{reason}"


def main():
    global FRAG
    args = sys.argv[1:]
    tiers = ("exact",)
    if "--tier" in args:
        i = args.index("--tier"); tiers = tuple(args[i + 1].split(",")); del args[i:i + 2]
    bl = exact_backlog(tiers)
    by_name = {r[0]: r for r in bl}

    if "--list" in args:
        from collections import defaultdict
        bytu = defaultdict(list)
        for name, s, e, tu, fn in bl:
            bytu[tu].append(name)
        print(f"# {len(bl)} exact-tier gbadisasm functions across {len(bytu)} US TUs")
        for tu in sorted(bytu):
            print(f"  {tu:24s} {len(bytu[tu]):2d}: {', '.join(bytu[tu])}")
        return 0

    # --frag <path> lets the caller pin an exact fragment file (parallel orchestrators
    # that pre-assign disjoint files); otherwise we pick a unique per-run path.
    frag_override = None
    if "--frag" in args:
        i = args.index("--frag"); frag_override = args[i + 1]; del args[i:i + 2]

    scope = "adhoc"
    if "--all" in args:
        scope = "all-" + "_".join(tiers)
        names = [r[0] for r in bl]
    elif "--tu" in args:
        i = args.index("--tu"); tu = args[i + 1]; del args[i:i + 2]
        scope = tu
        names = [r[0] for r in bl if r[3] == tu]
        names += [a for a in args if not a.startswith("--")]
    else:
        names = [a for a in args if not a.startswith("--")]

    # PARALLEL-SAFE: this run writes its own unique fragment (never the shared
    # exact_layer.tsv), so concurrent graduate runs cannot clobber each other.
    FRAG = frag_override or frag_path_for(scope)

    # optional: skip a TU (e.g. --skip-tu m4a)
    skip_tus = set()
    while "--skip-tu" in args:
        i = args.index("--skip-tu"); skip_tus.add(args[i + 1]); del args[i:i + 2]
    names = [n for n in names if n in by_name and by_name[n][3] not in skip_tus]
    if not names:
        print("no eligible exact-tier gbadisasm functions in the request")
        return 1

    grad, skip = [], []
    for n in names:
        _, s, e, tu, fn = by_name[n]
        r = grad_one(n, s, e, tu, fn)
        if r == "ok":
            grad.append(n)
            print(f"[GRAD] {n:36s} <- {tu}/{fn}")
        else:
            skip.append((n, r[5:]))
            print(f"[skip] {n:36s} {r[5:]}")

    print(f"\n=== graduated {len(grad)} / {len(names)} to matching C ===")
    if grad:
        print("GRADUATED: " + ", ".join(grad))
        print(f"FRAGMENT: {FRAG} ({len(grad)} rows)")
    elif os.path.exists(FRAG):
        # no graduation succeeded -> drop the empty per-run fragment we created
        if os.path.getsize(FRAG) == 0:
            os.remove(FRAG)
    if skip:
        print("SKIPPED: " + "; ".join(f"{n}({r})" for n, r in skip))
    return 0


if __name__ == "__main__":
    sys.exit(main())
