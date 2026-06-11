#!/usr/bin/env python3
"""Port the largest matching run of a US translation unit (decision D1).

Pipeline: locate_funcs -> pick the largest run -> extract_run into src/<name>.c
(subset of just that run's functions) -> compile -> resolve every external ref at
the run's known JP base (data literals + decoded BL targets + EWRAM_DATA
placement) -> apply manifest rows (deduped) -> make layout -> make compare.
Reverts surgically if the build isn't byte-perfect. Region-different functions
and other runs stay in the incbin baseline.

Usage: scripts/port_run.py <name> [<name> ...]
"""
import subprocess, sys, os, re
import glob as glob_mod

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u/src"


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def have_syms():
    return {l.split("\t")[0] for l in open("layout/baseline_syms.tsv")
            if l.strip() and not l.startswith("#")}


def carved_objs():
    return {m.group(1) for m in (re.search(r"(src/\S+\.o)\(", l) for l in open("layout/carved_rom.tsv")) if m}


def _us_extern_decl(us_src, sym):
    """An `extern` declaration for a TU-private file-scope symbol `sym`, parsed
    from its US definition (for the func_only data-binding path). Returns the decl
    string (no initializer, no storage class), or None if `sym` has no plain
    file-scope object definition (e.g. it's an enum constant -> emit the enum).

    Handles `static struct Text sTalkText[3];`, `struct TalkState* CONST_DATA
    sTalkState = &..;`, `static int sTalkChoiceResult;` etc. -> `extern struct Text
    sTalkText[];` / `extern struct TalkState* sTalkState;` / `extern int
    sTalkChoiceResult;`. An enum constant (PAGENAME_SCALE_TIME) is resolved by
    re-emitting its whole `enum { ... };` block verbatim (no extern possible)."""
    # 1) file-scope object definition. Scan top-level statements (depth-0 chunks
    #    split on ';' and '{', skipping function bodies) for one declaring SYM as the
    #    declarator just before its array suffix / '=' / ';'. Linear, no backtracking.
    word = re.compile(r"\b" + re.escape(sym) + r"\b")
    i, n, depth, seg_start = 0, len(us_src), 0, 0
    while i < n:
        c = us_src[i]
        # Skip string/char literals and comments so a `{`/`}`/`;` INSIDE one does not
        # corrupt the depth counter (which otherwise drifts and makes a deep file-
        # scope def like bmio's `EWRAM_OVERLAY(0) union ... sGradientEffect = {};`
        # never test at depth 0 -> _us_extern_decl wrongly returns None).
        if c in "\"'":
            q = c
            i += 1
            while i < n:
                if us_src[i] == "\\":
                    i += 2
                    continue
                if us_src[i] == q:
                    i += 1
                    break
                i += 1
            continue
        if c == "/" and i + 1 < n and us_src[i + 1] == "/":
            j = us_src.find("\n", i)
            i = n if j == -1 else j + 1
            continue
        if c == "/" and i + 1 < n and us_src[i + 1] == "*":
            j = us_src.find("*/", i)
            i = n if j == -1 else j + 2
            continue
        if c == "{":
            if depth == 0:
                # a '{' at depth 0 ends a declarator head (init-list or func body);
                # the statement head is seg_start..i — test it before descending.
                head = us_src[seg_start:i]
                d = _try_decl(head, sym, word)
                if d:
                    return d
            depth += 1
        elif c == "}":
            depth -= 1
            if depth == 0:
                seg_start = i + 1
        elif c == ";" and depth == 0:
            head = us_src[seg_start:i]
            d = _try_decl(head, sym, word)
            if d:
                return d
            seg_start = i + 1
        i += 1
    # 2) enum constant: re-emit the enclosing `enum { ... };` so the value resolves.
    em = re.search(r"enum\s*\{[^{}]*\b" + re.escape(sym) + r"\b[^{}]*\}\s*;", us_src)
    if em:
        return em.group(0)
    return None


def _us_aggregate_def(us_src, kind, tag):
    """The FULL `struct/union/enum <tag> { ... };` definition for a file-local
    aggregate TYPE, parsed from the US source. Used to resolve agbcc's
    `invalid use of undefined type 'union X'` -- a func_only run that references a
    TU-PRIVATE static (e.g. bmio's `EWRAM_OVERLAY(0) union GradientEffectData
    sGradientEffect`) gets an `extern union GradientEffectData sGradientEffect;`
    from _us_extern_decl, but the union itself is defined ONLY in the .c file (no
    header), so the body's `sGradientEffect.lines` access fails on the INCOMPLETE
    type. Emitting the whole `union GradientEffectData { ... };` completes it.
    Returns the definition text (incl. trailing `;`) or None. Brace-matched so a
    nested aggregate is captured whole; verify-or-revert guards a wrong emit."""
    m = re.search(r"\b" + re.escape(kind) + r"\s+" + re.escape(tag) + r"\s*\{", us_src)
    if not m:
        return None
    i = us_src.index("{", m.start())
    depth, n = 0, len(us_src)
    while i < n:
        if us_src[i] == "{":
            depth += 1
        elif us_src[i] == "}":
            depth -= 1
            if depth == 0:
                j = us_src.find(";", i)
                return us_src[m.start():(j + 1 if j != -1 else i + 1)]
        i += 1
    return None


def _try_decl(head, sym, word):
    """If top-level statement `head` declares `sym` as a file-scope OBJECT (not a
    function/call/macro), return its bare `extern <type> sym[];` declaration, else
    None. `head` is the text up to the statement's `=` init / `{` init-list / `;`."""
    # Strip line/block comments first: a `// clang-format off` (or a `/* ... */`
    # banner) immediately before the declaration would otherwise leak into the
    # type spec -> `extern // clang-format off SpellAnimFunc foo[];` (invalid C).
    # Same comment-leak class as the D46 helper-prototype-scan fix, here in the
    # file-scope declaration scanner (D49).
    head = re.sub(r"/\*.*?\*/", " ", head, flags=re.S)
    head = re.sub(r"//[^\n]*", " ", head)
    # DROP leading preprocessor-directive lines (`#include`, `#define`, ...). The
    # _us_extern_decl scanner only resets the segment start on a depth-0 `;`/`}`, so
    # a file-scope declaration NOT preceded by any such terminator (e.g. the first
    # data def after the include block: `struct FaceVramEntry EWRAM_DATA sFaceConfig
    # [4] = {0};`) arrives here with the whole `#include` header glued in front of
    # it. A blanket `head.startswith("#") -> None` then wrongly rejected the real
    # declaration. Strip the `#` lines so the actual declarator remains.
    head = "\n".join(ln for ln in head.splitlines()
                     if not ln.lstrip().startswith("#"))
    head = head.strip()
    if not head:
        return None
    # The declarator is everything up to the initializer.
    decl = head.split("=", 1)[0]
    # sym must be the LAST identifier token of the declaratOR — i.e. the thing
    # being declared, which is the identifier just before any array suffix `[...]`
    # (NOT a dimension macro inside it: `static struct MuConfig sMuConfig[MU_MAX_COUNT]`
    # has `MU_MAX_COUNT` as the literal last token, but the DECLARED name is sMuConfig).
    # Strip `[...]` suffixes before the last-token test so an identifier dimension
    # (a `#define`d array size) doesn't masquerade as the declared symbol.
    decl_noarr = re.sub(r"\[[^\]]*\]", "", decl)
    toks = re.findall(r"[A-Za-z_]\w*", decl_noarr)
    if not toks or toks[-1] != sym:
        return None
    m = word.search(decl)
    spec = decl[:m.start()]
    # Strip storage-class / placement macros (incl. their `(N)` arg, e.g.
    # `EWRAM_OVERLAY(0)`) BEFORE the function-decl `(` test below -- otherwise a
    # macro's own parentheses make a plain object def (bmio's `EWRAM_OVERLAY(0)
    # union GradientEffectData sGradientEffect = {};`) look like a function decl and
    # get wrongly rejected.
    for kw in ("static", "CONST_DATA", "EWRAM_DATA", "EWRAM_BSS", "EWRAM_OVERLAY",
               "IWRAM_DATA", "ALIGNED"):
        spec = re.sub(r"\b" + kw + r"\b(?:\(\d+\))?", "", spec)
    # a '(' still in spec => function decl / call / macro => not an object
    if "(" in spec:
        return None
    spec = " ".join(spec.split())
    if not spec or spec == "const":
        return None
    arrays = re.sub(r"\[[^\]]*\]", "[]", "".join(re.findall(r"\[[^\]]*\]",
                    decl[m.end():])))
    return f"extern {spec} {sym}{arrays};"


def already_defined_globals(src_tu):
    """File-scope globals the partially-carved `src/<src_tu>.o` ALREADY defines.

    A harvest run extracted from a partially-ported TU re-pulls the whole file
    header (includes + every file-scope EWRAM_DATA/.data/.bss/.rodata global), so a
    global the existing `src/<src_tu>.o` already defines is doubly-defined at link
    time (`multiple definition of gFoo`). The run's code body byte-matches; the only
    blocker is the duplicate definition. Return the set of those global NAMES so the
    caller can demote each to an `extern` (storage stays in the existing object)."""
    obj = f"src/{src_tu}.o"
    if not os.path.exists(obj):
        r = sh(f"make {obj}")
        if not os.path.exists(obj):
            return set()
    defs = set()
    for l in sh(f"arm-none-eabi-objdump -t {obj}").stdout.splitlines():
        p = l.split()
        # global (`g` in field 2) symbol in a DATA section (not .text), not a section
        # symbol — i.e. a file-scope variable the object physically provides.
        if len(p) >= 5 and p[1] == "g" and p[-3] in (
                "ewram_data", ".data", ".bss", "bss", "sbss", ".rodata") \
                and not p[-1].startswith("."):
            defs.add(p[-1])
    return defs


def baseline_bound_globals():
    """Data globals ALREADY bound as baseline_syms (monolith + every fragment) at a
    fixed JP address. A harvest run that re-emits the file header would DEFINE such a
    global in its own .data/.rodata — colliding with the ABS baseline binding (or
    double-carving bytes a frontier blob already provides at that address). Demoting
    it to `extern` lets the literal resolve to the existing binding and the existing
    carve/incbin supply the bytes (D34 class-3). Verify-or-revert guards a misjudge."""
    names = set()
    for p in (["layout/baseline_syms.tsv"]
              + sorted(glob_mod.glob("layout/baseline_syms.d/*.tsv"))):
        if not os.path.exists(p):
            continue
        for l in open(p):
            if l.strip() and not l.startswith("#"):
                c = l.split("\t")
                if len(c) >= 3 and c[2].strip() == "data":
                    names.add(c[0].strip())
    return names


def demote_defs_to_extern(src, names):
    """Rewrite each file-scope DEFINITION of a name in `names` to an `extern` decl
    (drop the initializer, prepend `extern`). Byte-neutral for the run's .text — the
    variable's storage lives in the already-carved object; this only stops the
    subset from re-emitting it. Conservative: only touches a top-level `... name ... ;`
    (optionally `= init`) at column 0, never a use inside a function body."""
    for nm in names:
        # match a top-level declaration line/group defining `nm` (col-0 start, ends
        # at the `;` that closes it). Handles `T (* EWRAM_DATA nm)(...) = X;`,
        # `T nm[N] = {...};`, `T nm = X;`, and bare `T nm;`.
        pat = re.compile(
            r"(?m)^([A-Za-z_][\w\s\*\(\)]*?\b" + re.escape(nm) + r"\b[^;{}]*?)"
            r"(\s*=\s*[^;]*)?;",
        )
        def repl(m):
            decl = m.group(1).rstrip()
            ds = decl.lstrip()
            if ds.startswith("extern"):
                return m.group(0)            # already extern
            if "static" in re.split(r"[\s\*]", ds):
                # `extern static` is illegal; a TU-private static can't be an extern
                # alias of an already-carved global. Leave it (port_run's data-trim or
                # the verify-or-revert net handles a genuinely-unreferenced static).
                return m.group(0)
            return "extern " + decl + ";"
        src2 = pat.sub(repl, src, count=1)
        if src2 != src:
            src = src2
    return src


def port(name, exclude=(), runs=None, src_tu=None, frag=None, func_only=False,
         dedup_globals=False):
    # src_tu: US source TU to extract from (defaults to `name`). Lets carve_exact
    # carve functions STRANDED inside an already-carved TU into a SEPARATELY-named
    # object (e.g. name="exact_0800XXXX", src_tu="bmlib") so the carved_objs() skip
    # below — which is keyed on the OUTPUT object — doesn't reject it.
    # frag: when set, NEW manifest rows go to per-task fragment files
    #   layout/<base>.d/<frag>.tsv (parallel-safe) instead of the shared monolith.
    # func_only: extract ONLY the run's function bodies (extract_func_only.py),
    #   DROPPING all file-scope data definitions. The run's data references then
    #   resolve to externs declared in the project headers, which the auto-resolver
    #   below BINDS as ABS baseline_syms at their JP literal-pool addresses (the
    #   D34/D41 per-TU data-binding pass). This is the right mode for a partially-
    #   ported TU whose verified runs are blocked ONLY by unplaced TU-private
    #   statics / shared rodata (statscreen gMid_*/sPage*TextInfo/sStatScreenInfo,
    #   etc.): extract_run re-emits those definitions and grows the ROM / mismatches
    #   their region-different content, whereas binding them resolves the run cleanly.
    # dedup_globals: when set, demote any file-scope global the existing
    #   `src/<src_tu>.o` already defines (OR one already bound as a fixed-address
    #   baseline_syms data symbol) to an `extern` in the extracted subset, so a
    #   partially-carved TU's NEXT verified run doesn't multiple-define / double-carve
    #   a shared global (the D41/D43 data-placement-blocked frontier: the run byte-
    #   matches, only the dup definition / already-provided data blocks the full build).
    #   This is the lighter-touch alternative to func_only for runs that DO need their
    #   other (region-same, not-yet-carved) file-scope data emitted from the subset.
    src_tu = src_tu or name
    if f"src/{name}.o" in carved_objs():
        print(f"{name}: already has a carved run — skipping"); return False
    # Verified runs only (D2): each block byte-matches the JP ROM at its base.
    # `runs` may be pre-computed (e.g. by a parallel discovery pass — see
    # scripts/harvest_parallel.py) to skip the expensive find_runs here; otherwise
    # compute it once and reuse it across the largest-first fallback recursion.
    if runs is None:
        out = sh(f"python3 scripts/find_runs.py {name}").stdout
        runs = [(l.split()[0], l.split()[1], l.split()[2].split(","))
                for l in out.splitlines() if l.strip()]
    # Try runs largest-first; if a run masked-matches but can't be made byte-perfect
    # in the full build (e.g. it touches region-different EWRAM/data layout), fall
    # back to the next-largest verified run instead of abandoning the whole TU.
    # `exclude` carries the runs already tried-and-reverted this call chain.
    cand = [r for r in runs if tuple(r[2]) not in exclude]
    if not cand:
        if not exclude: print(f"{name}: no verified runs")
        return False
    start, end, funcs = max(cand, key=lambda r: len(r[2]))
    base = int(start, 16) - 0x08000000  # ROM-file offset (for indexing baserom)

    MANI = ["layout/carved_rom.tsv", "layout/carved_ram.tsv", "layout/baseline_syms.tsv", "layout/patches.tsv"]
    if frag is not None:
        # also snapshot this task's fragment files so a revert restores them exactly
        # (deleting on revert if they didn't exist before this call).
        MANI += [f"layout/{b}.d/{frag}.tsv"
                 for b in ("carved_rom", "carved_ram", "baseline_syms",
                           "baseline_syms_drop", "patches")]
    snap = {p: (open(p).read() if os.path.exists(p) else None) for p in MANI}

    extractor = "extract_func_only" if func_only else "extract_run"
    sub = sh(f"python3 scripts/{extractor}.py {US}/{src_tu}.c {' '.join(funcs)}").stdout
    # Drop `#include "src/data/*.h"` for files missing in the JP project: those are
    # auto-generated region-specific data tables (e.g. chapter_settings.h DEFINES
    # gChapterDataTable) not yet ported. cpp silently fails on the missing file and
    # emits an EMPTY .text. The accessor funcs only REFERENCE those tables via externs
    # already declared in the normal headers, so dropping the include lets the
    # function compile; port_run resolves the table's JP address from the literal and
    # the data itself stays in the incbin baseline.
    sub = "".join(l for l in sub.splitlines(keepends=True)
                  if not (l.lstrip().startswith('#include "src/data/')
                          and '"' in l and not os.path.exists(l.split('"')[1])))
    if dedup_globals:
        # Demote globals the existing partial src/<src_tu>.o already defines, OR that
        # are already bound as a fixed-address baseline_syms data symbol (a frontier
        # blob / dat_*_ref already provides the bytes), to `extern` -- so this NEXT run
        # doesn't multiple-define them or double-carve their .data/.rodata (D41 unblock).
        dups = already_defined_globals(src_tu) | baseline_bound_globals()
        if dups:
            sub = demote_defs_to_extern(sub, dups)
    open(f"src/{name}.c", "w").write(sub)
    obj = f"src/{name}.o"
    r = sh(f"make src/{name}.o")
    if not os.path.exists(obj):
        # Cross-TU callees with no prototype (defined in another TU, not in a
        # header) trip agbcc's -Wimplicit -Werror. Add a K&R extern for each
        # "implicit declaration of function X" and retry: the call's codegen
        # doesn't depend on the prototype (args are pushed per the call site), so
        # the .text bytes are unchanged; verify-or-revert guards anything wrong.
        impl = set(re.findall(r"implicit declaration of function [`'\"]?(\w+)", r.stderr + r.stdout))
        if impl:
            # Two kinds of implicit-decl: (1) a callee defined in ANOTHER TU -> a K&R
            # `extern int X()` at the top is enough (codegen is call-site only). (2) a
            # function defined LATER in THIS subset (forward reference, e.g. GmDataInit
            # calls GmPathsInit defined below) -> `extern int X()` would clash with the
            # real non-int return type, so emit the REAL prototype from the US source,
            # placed AFTER the #includes (it may reference header struct types).
            us_src = open(f"{US}/{src_tu}.c").read()
            runset = set(funcs)
            externs, protos = [], []
            for f in sorted(impl):
                m = re.search(r"\n([A-Za-z_][\w \t\*\n]*?\b" + re.escape(f) + r"\s*\([^;{]*\))\s*\{", us_src)
                if f in runset and m:
                    protos.append(re.sub(r"\s+", " ", m.group(1).strip()) + ";")
                else:
                    externs.append(f"extern int {f}();")
            new = "".join(e + "\n" for e in externs) + sub
            if protos:
                ls = new.splitlines(keepends=True)
                li = max((i for i, l in enumerate(ls) if l.lstrip().startswith("#include")), default=len(externs) - 1)
                new = "".join(ls[:li+1]) + "\n" + "\n".join(protos) + "\n" + "".join(ls[li+1:])
            open(f"src/{name}.c", "w").write(new)
            r = sh(f"make src/{name}.o")
        if not os.path.exists(obj) and func_only:
            # func_only DROPS all file-scope data, so a run that references a
            # TU-PRIVATE static (one NOT declared `extern` in any header, e.g.
            # scene's sTalkState/sTalkText, statscreen's PAGENAME_* enum) fails with
            # agbcc "`X' undeclared". RESOLVE each by emitting X's US file-scope
            # DECLARATION as an `extern` (drop the initializer + `static`/`CONST_DATA`
            # /`EWRAM_*` storage attrs so it's a pure extern; arrays keep `[]`). The
            # auto-resolver below then BINDS X at its JP literal-pool address. File-
            # local ENUM constants (PAGENAME_SCALE_TIME) have no extractable extern
            # decl -> emit the whole enum block verbatim so the constant resolves.
            # Iterate to a fixpoint (one extern can expose the next). verify-or-revert
            # guards any wrong decl.
            us_src = open(f"{US}/{src_tu}.c").read()
            cur = open(f"src/{name}.c").read()
            prepend, aggs, seen, seen_agg = [], [], set(), set()
            for _ in range(40):
                und = set(re.findall(r"[`'\"](\w+)' undeclared", r.stderr + r.stdout))
                und -= seen
                # File-local aggregate TYPE left INCOMPLETE: the run references a
                # TU-private static (extern'd above) whose struct/union/enum is
                # defined ONLY in the .c file. agbcc: `invalid use of undefined type
                # 'union X'`. Emit the full US definition so the type is complete.
                badtypes = set(re.findall(
                    r"invalid use of undefined type [`'\"](struct|union|enum) (\w+)'",
                    r.stderr + r.stdout))
                badtypes -= seen_agg
                if not und and not badtypes:
                    break
                added = False
                # Resolve each incomplete file-local aggregate, RECURSIVELY pulling
                # the file-local aggregate types ITS fields reference (e.g. bmio's
                # `union WeatherEffectData` has a `struct WeatherParticle particles
                # [0x40]` field -> emit WeatherParticle too, in dependency order
                # before the union that uses it). agbcc otherwise errors `field
                # 'particles' has incomplete type`. Header-provided types are left
                # alone (their _us_aggregate_def is None).
                worklist = list(sorted(badtypes))
                new_defs = []  # (kind, tag, text) in discovery order
                while worklist:
                    kind, tag = worklist.pop(0)
                    if (kind, tag) in seen_agg:
                        continue
                    seen_agg.add((kind, tag))
                    adef = _us_aggregate_def(us_src, kind, tag)
                    if not adef:
                        continue
                    new_defs.append((kind, tag, adef))
                    for dk, dt in re.findall(r"\b(struct|union|enum)\s+(\w+)", adef):
                        if (dk, dt) != (kind, tag) and (dk, dt) not in seen_agg:
                            worklist.append((dk, dt))
                # A type must appear AFTER its dependencies. Discovery order is
                # referrer-then-dep (BFS), so reversing yields dep-before-referrer,
                # which is the correct C definition order; append in that order.
                for kind, tag, adef in reversed(new_defs):
                    if adef not in aggs:
                        aggs.append(adef)
                    added = True
                for sym in sorted(und):
                    seen.add(sym)
                    decl = _us_extern_decl(us_src, sym)
                    # An enum constant resolves to its WHOLE `enum {...};` block;
                    # several undeclared constants from the SAME enum return the
                    # identical block -> dedup or agbcc errors `redefinition of X`.
                    if decl and decl not in prepend:
                        prepend.append(decl)
                        added = True
                    elif decl:
                        # the decl (e.g. a shared enum block) is already prepended;
                        # this symbol is now declared -> count as progress.
                        added = True
                if not added:
                    break
                # Aggregate type defs FIRST (the externs/bodies use them), then the
                # externs. Insert the block AFTER the last #include — a synthesized decl can
                # use a typedef defined in a header (e.g. `extern MuStateFunc
                # sMuStateFuncs[];` needs mu.h's typedef), so it must follow the
                # includes, not precede them (mirrors the proto-insert at the
                # same-file-helper path above).
                block = ""
                if aggs:
                    block += ("/* TU-private aggregate type defs (file-local) */\n"
                              + "\n".join(aggs) + "\n")
                if prepend:
                    block += ("/* TU-private data externs bound at their JP addresses */\n"
                              + "\n".join(prepend) + "\n")
                ls = cur.splitlines(keepends=True)
                li = max((i for i, l in enumerate(ls)
                          if l.lstrip().startswith("#include")), default=-1)
                new = "".join(ls[:li+1]) + block + "".join(ls[li+1:])
                open(f"src/{name}.c", "w").write(new)
                r = sh(f"make src/{name}.o")
                if os.path.exists(obj):
                    break
        if not os.path.exists(obj):
            print(f"{name}: subset compile failed"); os.remove(f"src/{name}.c"); return False

    # Drop file-scope data the run doesn't reference (the whole header is pulled
    # in, but unreferenced globals/arrays — e.g. proc scripts — would need
    # placement we can't resolve). A data symbol with no .text relocation is unused.
    # Loadable data sections whose UNREFERENCED file-scope globals must be trimmed
    # from the subset, else they're appended to the ROM and grow it (sha1 fails even
    # when .text is byte-perfect). EWRAM_OVERLAY sections (`ewram_overlay_N`) count:
    # extracting a few funcs still pulls in the file's overlay tables (e.g.
    # prep_unitselect's 0xB0 gPrepUnitTexts), and the run rarely references them.
    def is_trim_sec(s):
        return s in (".data", ".rodata", "ewram_data", ".bss", "bss", "sbss") or s.startswith("ewram_overlay")

    def data_syms_and_refs():
        ds = {}
        for l in sh(f"arm-none-eabi-objdump -t {obj}").stdout.splitlines():
            p = l.split()
            if len(p) >= 5 and p[0][0] in "0123456789abcdef" and is_trim_sec(p[-3]) and not p[-1].startswith(".") and p[-1] != p[-3]:
                ds[p[-1]] = p[-3]
        refd, refd_secs = set(), set()
        sec = None
        for l in sh(f"arm-none-eabi-objdump -r {obj}").stdout.splitlines():
            if "RELOCATION RECORDS FOR [" in l: sec = l.split("[")[1].split("]")[0]
            elif sec == ".text":
                p = l.split()
                if len(p) >= 3:
                    (refd_secs if p[2].startswith(".") else refd).add(p[2])
        return ds, refd, refd_secs

    def remove_def(text, sym):
        i = text.find(sym)
        while i != -1:
            after = text[i+len(sym):i+len(sym)+40].lstrip()
            if after[:1] in ("[", "=", ";"):
                cands = [text.rfind(";", 0, i), text.rfind("}", 0, i), text.rfind("\n\n", 0, i)]
                cut = max(cands)
                start = cut + (2 if text[cut:cut+2] == "\n\n" else 1) if cut >= 0 else 0
                j, depth = i + len(sym), 0
                while j < len(text):
                    if text[j] == "{": depth += 1
                    elif text[j] == "}": depth -= 1
                    elif text[j] == ";" and depth == 0:
                        return text[:start] + text[j+1:]
                    j += 1
            i = text.find(sym, i + 1)
        return text

    ds, refd, refd_secs = data_syms_and_refs()
    # Drop a file-scope data symbol when its ENTIRE section is unreferenced by the
    # run's .text -- i.e. not named in a .text reloc AND no .text reloc targets its
    # section symbol. The section test (not the old name-occurrence heuristic) is
    # correct: a static accessed via its SECTION symbol (EWRAM_DATA `Table[i]` ->
    # ewram_data+off) keeps its section in refd_secs and is preserved, while a
    # dead self-referential table the run never touches (e.g. worldmap_status_ui's
    # 252-byte gHelpInfo help-box table, named 26x but with no .text ref) is
    # removed -- so its unresolved function pointers can't break the link. A
    # symbol in a referenced (carved) section is always kept, so carved data is
    # never altered; the verify-or-revert net guards anything this misjudges.
    src = open(f"src/{name}.c").read()
    cand = [s for s in ds if s not in refd and ds[s] not in refd_secs]
    # Remove a candidate only if cutting its definition eliminates EVERY reference
    # to its name -- i.e. all references were inside the definition (a dead
    # self-referential table like gHelpInfo). If the name still appears, it's used
    # by kept code/data, so keep it; this never breaks compilation. Iterate to a
    # fixpoint so removing one dead table can expose another it was the sole user of.
    removed, changed = [], True
    while changed:
        changed = False
        for s in cand:
            if s in removed:
                continue
            trimmed = remove_def(src, s)
            if not re.search(r"\b" + re.escape(s) + r"\b", trimmed):
                src, changed = trimmed, True
                removed.append(s)
    if removed:
        base_src = open(f"src/{name}.c").read()  # pre-trim source, known to compile
        open(f"src/{name}.c", "w").write(src)
        sh(f"rm -f {obj}"); sh(f"make src/{name}.o")
        if not os.path.exists(obj):
            # The batch trim corrupted the source — remove_def is a heuristic textual
            # cut that can mishandle a complex declaration (nested braces / multi-dim
            # arrays), e.g. bmbattle's sWeaponTriangleRules. Fall back to incremental
            # trimming: remove one candidate at a time and KEEP a removal only if it
            # still compiles, so a bad cut is rejected instead of killing the carve.
            src = base_src
            for s in removed:
                trimmed = remove_def(src, s)
                if re.search(r"\b" + re.escape(s) + r"\b", trimmed):
                    continue  # still referenced after the cut -> keep the symbol
                open(f"src/{name}.c", "w").write(trimmed)
                sh(f"rm -f {obj}"); sh(f"make src/{name}.o")
                if os.path.exists(obj):
                    src = trimmed            # cut was clean -> accept
                else:
                    open(f"src/{name}.c", "w").write(src)  # cut corrupted -> reject
            sh(f"rm -f {obj}"); sh(f"make src/{name}.o")
            if not os.path.exists(obj):
                print(f"{name}: subset compile failed"); os.remove(f"src/{name}.c"); return False

    jp = open("baserom.gba", "rb").read()
    fmap = {}
    for l in open("layout/us_jp_funcmap.tsv"):
        if not l.startswith("#"):
            c = l.split("\t"); fmap[c[4].strip()] = int(c[0], 16)

    def bl(o):
        h1 = jp[base+o] | (jp[base+o+1] << 8); h2 = jp[base+o+2] | (jp[base+o+3] << 8)
        v = ((h1 & 0x7ff) << 12) | ((h2 & 0x7ff) << 1)
        return 0x08000000 + base + o + 4 + (v - 0x800000 if v & 0x400000 else v)

    # symbol -> section (for EWRAM_DATA/.bss placement)
    sym_sec = {}
    for l in sh(f"arm-none-eabi-objdump -t {obj}").stdout.splitlines():
        p = l.split()
        if len(p) >= 5 and p[0][0] in "0123456789abcdef":
            sym_sec[p[-1]] = (p[-3], int(p[0], 16))
    undef = set(sh(f"arm-none-eabi-nm -u {obj}").stdout.split()) - {"U"}

    secsize = {}
    for l in sh(f"arm-none-eabi-size -A {obj}").stdout.splitlines():
        p = l.split()
        if len(p) == 3 and p[1].isdigit():
            secsize[p[0]] = int(p[1])
    otext = subprocess.run(["arm-none-eabi-objcopy", "-O", "binary", "-j", ".text", obj, "/dev/stdout"],
                           capture_output=True).stdout  # subset .text (addends live here pre-link)

    def enc(v):  # exact JP pointer value -> (addr, type) for gen_layout
        return (v & ~1, "thumb") if v & 1 else (v, "data")

    new_syms, ram, romdata = {}, {}, {}
    sec = None
    for l in sh(f"arm-none-eabi-objdump -r {obj}").stdout.splitlines():
        if "RELOCATION RECORDS FOR [" in l:
            sec = l.split("[")[1].split("]")[0]; continue
        p = l.split()
        if sec != ".text" or len(p) < 3 or not all(ch in "0123456789abcdef" for ch in p[0]):
            continue
        off, typ, sym = int(p[0], 16), p[1], p[2]
        # RAM section referenced via its SECTION symbol (.bss/ewram_data + addend):
        # place the whole section at JP RAM addr (NOLOAD), like the named case.
        if typ == "R_ARM_ABS32" and sym in (".bss", "ewram_data", "sbss", "bss"):
            addend = int.from_bytes(otext[off:off+4], "little")
            ram.setdefault(sym, int.from_bytes(jp[base+off:base+off+4], "little") - addend)
            continue
        # ROM data referenced via the section symbol (.rodata/.data + addend) —
        # the addend (offset into the section) is the pre-link value in our .text.
        if typ == "R_ARM_ABS32" and sym in (".rodata", ".data"):
            addend = int.from_bytes(otext[off:off+4], "little")
            romdata.setdefault(sym, int.from_bytes(jp[base+off:base+off+4], "little") - addend)
            continue
        if sym.startswith("."):
            continue
        ss = sym_sec.get(sym)
        if typ == "R_ARM_ABS32" and ss and ss[0] == "*COM*":
            # COMMON globals are independent (no shared section base — ss[1] is the
            # alignment, not an offset), so block placement is wrong AND collides:
            # different TUs' IWRAM globals are INTERLEAVED in 0x0300xxxx, so a whole
            # .bss/COMMON block over-claims and overlaps another carved object's
            # block. Instead place each referenced COMMON global at its exact JP
            # address as an absolute symbol; the linker's weak common yields to the
            # absolute definition, so no NOLOAD block is allocated and nothing overlaps.
            addend = int.from_bytes(otext[off:off+4], "little")
            new_syms[sym] = enc(int.from_bytes(jp[base+off:base+off+4], "little") - addend)
        elif ss and ss[0] in ("ewram_data", ".bss", "bss", "sbss"):
            ram.setdefault(ss[0], int.from_bytes(jp[base+off:base+off+4], "little") - ss[1])
        elif typ == "R_ARM_ABS32" and ss and ss[0] in (".data", ".rodata"):
            # a ROM data section the run references via a named symbol
            romdata.setdefault(ss[0], int.from_bytes(jp[base+off:base+off+4], "little") - ss[1])
        elif typ == "R_ARM_ABS32" and sym in undef:
            # Subtract the in-section addend (pre-link word in our .text): a `.word
            # sym` references the symbol as `sym + addend` (e.g. `&gOam[0x100]` ->
            # addend 0x400). The JP literal is sym_base + addend, so the SYMBOL's
            # value is jp_literal - addend; the linker re-adds the addend at link
            # time. Without this, an extern indexed at a non-zero offset (region-
            # different RAM globals like gOam) lands `addend` bytes off. Multiple
            # refs to the same sym all yield the same base, so last-write is safe.
            addend = int.from_bytes(otext[off:off+4], "little")
            new_syms[sym] = enc(int.from_bytes(jp[base+off:base+off+4], "little") - addend)
        elif typ == "R_ARM_THM_CALL" and sym in undef:
            new_syms[sym] = (fmap.get(sym) or (bl(off) & ~1), "thumb")

    # Resolve internal relocations of each carved ROM data section. WORKLIST, because
    # a carved section can REFERENCE another ROM-data section (e.g. a .data ProcScr
    # table holds a pointer into .rodata, like banim-efxmagic-dancerings): that
    # referenced section must itself be placed at its JP address and carved, or it's
    # appended (ROM growth) AND the pointer is left unresolved (content diff).
    data_carves = []
    work = dict(romdata)            # ROM-data sections still to place: sec -> JP base
    placed = set()
    while work:
        dsec, dbase = work.popitem()
        if dsec in placed:
            continue
        placed.add(dsec)
        size = secsize.get(dsec, 0)
        if not size:
            continue
        data_carves.append((dbase - 0x08000000, size, dsec))
        dbytes = subprocess.run(["arm-none-eabi-objcopy", "-O", "binary", "-j", dsec, obj, "/dev/stdout"],
                                capture_output=True).stdout  # pre-link section bytes (addends)
        cur = None
        for l in sh(f"arm-none-eabi-objdump -r {obj}").stdout.splitlines():
            if "RELOCATION RECORDS FOR [" in l:
                cur = l.split("[")[1].split("]")[0]; continue
            p = l.split()
            if cur != dsec or len(p) < 3 or not all(ch in "0123456789abcdef" for ch in p[0]):
                continue
            off, typ, sym = int(p[0], 16), p[1], p[2]
            if typ != "R_ARM_ABS32":
                continue
            djp = dbase - 0x08000000 + off
            jpval = int.from_bytes(jp[djp:djp+4], "little")
            addend = int.from_bytes(dbytes[off:off+4], "little")
            if sym in (".bss", "ewram_data", "sbss", "bss"):
                ram.setdefault(sym, jpval - addend)   # RAM pointer baked into ROM data
            elif sym in (".rodata", ".data") and sym not in romdata:
                romdata[sym] = jpval - addend          # nested ROM-data section -> place+carve it
                work[sym] = jpval - addend
            elif sym in undef:
                new_syms.setdefault(sym, enc(jpval))

    if os.environ.get("PORTRUN_DEBUG"):
        print(f"  [dbg {name} run {start}..{end}] new_syms=" +
              ", ".join(f"{s}={a:08X}/{t}" for s, (a, t) in sorted(new_syms.items())))
        print(f"  [dbg] ram={ {s: f'{b:08X}' for s, b in ram.items()} } "
              f"romdata={ {s: f'{b:08X}' for s, b in romdata.items()} } undef={sorted(undef)}")
    have = have_syms()
    # Carved-section end = the ACTUAL compiled .text size (base + len(otext)), not the
    # run's nominal end. A function whose size isn't 4-aligned gets a trailing 0x0000
    # alignment pad (matching the JP inter-function padding), so the .o's .text is a
    # couple bytes longer than the run range; using the run end would leave the pad
    # overflowing the incbin gap -> catastrophic layout shift (e.g. spinning_arrow's
    # 0xc04 diff). For find_runs runs (already 4-aligned) len(otext) == run size, so
    # this is unchanged; verify-or-revert guards any pad that doesn't match JP.
    text_end = base + len(otext)
    # Split carved ROM-data sections: a section whose compiled bytes match JP at every
    # NON-reloc position is carved as real data; a REGION-DIFFERENT section (content
    # differs beyond relocs — e.g. banim animation .rodata frame arrays) is instead
    # placed NOLOAD at its JP base. Its JP bytes stay in the incbin baseline (the build
    # is byte-perfect either way) and the section symbol still resolves, so the .text/
    # .data references resolve to incbin+addend — carving the TU's CODE while leaving
    # the region-different data in the baseline. Also force each section's alignment
    # down to its JP base so the linker places it exactly there (2-aligned bases etc.).
    sec_relocs, sec_reloc_tgts, cur = {}, {}, None
    for l in sh(f"arm-none-eabi-objdump -r {obj}").stdout.splitlines():
        if "RELOCATION RECORDS FOR [" in l:
            cur = l.split("[")[1].split("]")[0]; continue
        p = l.split()
        if cur and len(p) >= 3 and all(c in "0123456789abcdef" for c in p[0]):
            sec_relocs.setdefault(cur, set()).add(int(p[0], 16))
            if p[1] == "R_ARM_ABS32":
                sec_reloc_tgts.setdefault(cur, []).append((int(p[0], 16), p[2]))
    # Existing carved ROM ranges (monolith + every fragment) so a run's region-SAME
    # section whose JP bytes are ALREADY provided by another carved object/incbin
    # (e.g. a frontier blob that swallowed the same region-same constants) is placed
    # NOLOAD instead of carving a fresh loadable row -> no overlap. Safe ONLY when the
    # section has NO relocations of its own (else its relocated bytes would never be
    # emitted); the existing provider supplies byte-identical data and make compare is
    # the oracle. (D42; Copilot-validated.)
    existing = []
    for pth in (["layout/carved_rom.tsv"]
                + sorted(glob_mod.glob("layout/carved_rom.d/*.tsv"))):
        if not os.path.exists(pth):
            continue
        for ln in open(pth):
            c = ln.rstrip("\n").split("\t")
            if len(c) >= 3 and c[0] and c[0][0] in "0123456789abcdefABCDEF":
                try:
                    existing.append((int(c[0], 16), int(c[1], 16)))
                except ValueError:
                    pass

    def overlaps_existing(off0, size):
        return any(es < off0 + size and ee > off0 for es, ee in existing)

    kept, noload_rom, aligns = [], [], []
    for off0, size, dsec in data_carves:
        need = (0x08000000 + off0) & -(0x08000000 + off0)
        if need < 4:
            aligns.append((dsec, need))   # durable: re-applied by apply_patches on rebuild
        cb = subprocess.run(["arm-none-eabi-objcopy", "-O", "binary", "-j", dsec, obj, "/dev/stdout"],
                            capture_output=True).stdout
        rel = sec_relocs.get(dsec, set())
        # A section whose JP base + size overruns the ROM end can't be real ROM data
        # there (a misresolved/region-different placement) — comparing would index
        # past `jp`. Treat it as a non-match -> NOLOAD; the JP bytes stay in the
        # incbin baseline and verify-or-revert guards the carve regardless.
        if off0 + size > len(jp):
            noload_rom.append((off0, size, dsec))
            continue
        match = all(cb[i] == jp[off0+i] or any(i-k in rel for k in range(4))
                    for i in range(min(size, len(cb))))
        # A KEPT (loaded) section is byte-perfect only if every symbol it references
        # resolves to a SINGLE address satisfying all its uses — i.e. (jp_word - addend)
        # is identical across all relocs to that symbol. A symbol referenced twice that
        # would need two different addresses means the section's pointer layout is
        # region-different (e.g. thunder's ProcScr_efxThunder .data references
        # Tsa_EfxThuderBg1/2 at JP offsets that don't line up with the US build), so no
        # single link can match it. Place it NOLOAD (incbin gives the JP bytes) and let
        # the bake-in below rewrite the .text/.data refs into it. The byte heuristic
        # alone misses this because each pointer sits at a reloc site (excused).
        if match:
            need_addr = {}
            for off, sym in sec_reloc_tgts.get(dsec, []):
                if off + 4 > len(cb):
                    continue
                addend = int.from_bytes(cb[off:off+4], "little")
                jpw = int.from_bytes(jp[off0+off:off0+off+4], "little")
                want_addr = (jpw - addend) & 0xFFFFFFFF
                if need_addr.setdefault(sym, want_addr) != want_addr:
                    match = False
                    break
        # Region-SAME section whose JP range is ALREADY provided by another carved row
        # (a frontier incbin blob that swallowed the same region-same constants): place
        # it NOLOAD so we don't double-carve / overlap. ONLY when this section has no
        # relocations of its own (a relocation-free constant blob) -- a relocated
        # section would need its relocated bytes emitted (NOLOAD never emits), and the
        # OVERLAP means a provider already supplies byte-identical bytes there. The
        # section symbol still resolves to the JP base; .text refs into it are baked by
        # the `want` pass. make compare is the oracle. (D42; Copilot-validated.)
        if match and not rel and overlaps_existing(off0, size):
            match = False
            if os.environ.get("PORTRUN_DEBUG"):
                print(f"  [carve-decide {dsec}@{0x08000000+off0:#x} sz={size:#x}] "
                      f"NOLOAD (region-same, reloc-free, overlaps existing provider)")
        (kept if match else noload_rom).append((off0, size, dsec))
        if os.environ.get("PORTRUN_DEBUG"):
            mism = [i for i in range(min(size, len(cb))) if cb[i] != jp[off0+i]
                    and not any(i-k in rel for k in range(4))]
            print(f"  [carve-decide {dsec}@{0x08000000+off0:#x} sz={size:#x}] "
                  f"{'KEPT' if match else 'NOLOAD'} rel={sorted(hex(x) for x in rel)} "
                  f"unexcused-mismatch={[hex(x) for x in mism[:8]]}")
    # Bake JP literals into refs to NOLOAD (region-different) ROM-data sections. Such a
    # section can be region-different INTERNALLY — its symbols sit at different JP offsets
    # than US — so `base + US_addend` resolves wrong for some refs. For each reloc
    # TARGETING a NOLOAD section, rewrite the ref's in-section addend to `jp[ref] - base`
    # so the linker (which still applies the reloc) computes exactly `jp[ref]`. The patch
    # is PERSISTED to layout/patches.tsv and re-applied by scripts/apply_patches.py after
    # every compile (via the Makefile) — patching the .o here would be lost on rebuild.
    want = []
    if noload_rom:
        nl_base = {dsec: 0x08000000 + off0 for off0, _, dsec in noload_rom}
        sec_base = {".text": 0x08000000 + base}
        for off0, _, dsec in kept + noload_rom:
            sec_base[dsec] = 0x08000000 + off0
        cur = None
        for l in sh(f"arm-none-eabi-objdump -r {obj}").stdout.splitlines():
            if "RELOCATION RECORDS FOR [" in l:
                cur = l.split("[")[1].split("]")[0]; continue
            p = l.split()
            if cur in sec_base and len(p) >= 3 and all(c in "0123456789abcdef" for c in p[0]) and p[2] in nl_base:
                roff = int(p[0], 16)
                loc = sec_base[cur] - 0x08000000 + roff
                jpval = int.from_bytes(jp[loc:loc+4], "little")
                want.append((cur, roff, (jpval - nl_base[p[2]]) & 0xFFFFFFFF))
    # Parallel-safe manifest target: with `frag` set, append NEW rows to this task's
    # own fragment under layout/<base>.d/<frag>.tsv (gen_layout/apply_patches read
    # monolith + every fragment), so concurrent carves never touch a shared file.
    def mani_path(base):
        if frag is None:
            return f"layout/{base}.tsv"
        d = f"layout/{base}.d"
        os.makedirs(d, exist_ok=True)
        return f"{d}/{frag}.tsv"

    if aligns or want:
        objbase = os.path.basename(obj)
        pth = mani_path("patches")
        keep = [r for r in open(pth) if r.split("\t")[0] != objbase] \
            if os.path.exists(pth) else []
        keep += [f"{objbase}\t{dsec}\tALIGN\t{need}\n" for dsec, need in aligns]
        keep += [f"{objbase}\t{sec}\t{roff:X}\t{val:08X}\n" for sec, roff, val in want]
        open(pth, "w").write("".join(keep))
        sh(f"rm -f {obj}")  # force rebuild so apply_patches re-applies align+patches durably
    with open(mani_path("carved_rom"), "a") as f:
        f.write(f"{base&0xFFFFFF:06X}\t{text_end&0xFFFFFF:06X}\tsrc/{name}.o(.text)\t{name}(run): {', '.join(funcs[:3])}{'...' if len(funcs)>3 else ''}\n")
        for dbase, size, dsec in kept:
            f.write(f"{dbase:06X}\t{dbase+size:06X}\tsrc/{name}.o({dsec})\t{name} {dsec}\n")
    if ram or noload_rom:
        with open(mani_path("carved_ram"), "a") as f:
            for s, b in ram.items():  # each RAM section at its own JP base
                region = "iwram" if (b >> 24) == 3 else "ewram"
                f.write(f"{b:08X}\t{region}\tsrc/{name}.o({s})\t{name} {s}\n")
            for off0, size, dsec in noload_rom:  # region-different ROM data -> NOLOAD, stays incbin
                f.write(f"{0x08000000+off0:08X}\trom\tsrc/{name}.o({dsec})\t{name} {dsec} region-diff (incbin)\n")
    adds = [f"{s}\t{a:08X}\t{t}\t{name}" for s, (a, t) in new_syms.items() if s not in have]
    if adds:
        with open(mani_path("baseline_syms"), "a") as f:
            f.write("\n".join(adds) + "\n")

    # Incremental build (no `make clean`): only the new src/<name>.o, the shrunk
    # incbin (asm/baserom.o), and the relink rebuild — ~0.3s vs ~13s for a full
    # `make clean` recompile of every carved object. Verified byte-identical; the
    # make-compare verify-or-revert below is the safety net regardless.
    sh("make layout")
    mc = sh("make compare")
    if "fireemblem8.gba: OK" in mc.stdout:
        print(f"{name}: OK — run {start}..{end} ({len(funcs)} fns, {len(adds)} new syms{', +ram' if ram else ''})")
        return True

    # Multiple-definition retry: a symbol this run's object DEFINES (its own
    # functions/proc-scripts) or one it references that an ALREADY-carved object
    # defines is also emitted in jp_syms.s from baseline_syms.tsv -> jp_syms.o and
    # the object doubly-define it (link error). The carved object is the real
    # provider, so drop those redundant baseline rows and rebuild. jp_syms is only
    # an absolute alias; a wrong address from the object's own definition is still
    # caught by the verify-or-revert net below. Loop: ld lists all dups per pass,
    # but removing some can surface the next (bounded, stops when no progress).
    # Names that ARE baseline syms (monolith + every fragment) — only these can be
    # dropped to fix a multiple-definition; a dup where both defs are real objects
    # can't be fixed here.
    def baseline_names():
        names = set()
        for p in ["layout/baseline_syms.tsv"] + sorted(glob_mod.glob("layout/baseline_syms.d/*.tsv")):
            if not os.path.exists(p):
                continue
            for l in open(p):
                if l.strip() and not l.startswith("#"):
                    names.add(l.split("\t")[0])
        return names

    dropped = 0
    for _ in range(8):
        dup = set(re.findall(r"multiple definition of [`']([\w]+)'", mc.stdout + mc.stderr))
        dup &= baseline_names()
        if not dup:
            break
        if frag is not None:
            # Parallel-safe: record the now-redundant alias names in this task's
            # additive drop-fragment; gen_layout excludes them. Never edit the
            # shared baseline_syms monolith (would conflict with concurrent carves).
            os.makedirs("layout/baseline_syms_drop.d", exist_ok=True)
            with open(f"layout/baseline_syms_drop.d/{frag}.tsv", "a") as f:
                f.write("".join(s + "\n" for s in sorted(dup)))
        else:
            rows = list(open("layout/baseline_syms.tsv"))
            kept = [l for l in rows if l.startswith("#") or l.split("\t")[0] not in dup]
            if len(kept) == len(rows):
                break  # the dup isn't in the monolith (in a fragment we don't own) -> bail
            open("layout/baseline_syms.tsv", "w").writelines(kept)
        dropped += len(dup)
        sh("make layout")
        mc = sh("make compare")
        if "fireemblem8.gba: OK" in mc.stdout:
            print(f"{name}: OK — run {start}..{end} ({len(funcs)} fns, -{dropped} dup baseline syms)")
            return True
    if os.environ.get("PORTRUN_DEBUG"):
        if os.path.exists("fireemblem8.gba"):
            b = open("fireemblem8.gba", "rb").read()  # TRUE carve diff, before the remap fallback
            d = [i for i in range(min(len(b), len(jp))) if b[i] != jp[i]]
            print(f"  [pre-remap {name}] size built={len(b)} jp={len(jp)} (+{len(b)-len(jp)}); "
                  f"content-diff={len(d)} bytes" + (f", first @ {d[0]:#x}" if d else ""))
        errs = [l.strip() for l in (mc.stdout + mc.stderr).splitlines()
                if re.search(r"undefined reference|in function|multiple definition|overlap|"
                             r"relocation truncated|cannot find|No such|not in any|will not fit", l, re.I)
                and "arm-none-eabi-ld " not in l]
        if errs:
            print(f"  [make-err {name}] " + " | ".join(errs[:8])[:900])

    # Fallback: raw-hex message-id tables (US `{0x534,0x510,...}` not yet MSG_*)
    # are region-different data. Remap in-source ids to JP per layout/msg_map.tsv
    # and retry; the verify-or-revert net keeps any bad remap from landing.
    import re as _re
    mm = {}
    for l in open("layout/msg_map.tsv"):
        if not l.startswith("#"):
            u, j = (int(x, 16) for x in l.split("\t")[:2])
            if u != j: mm[u] = j
    # Also remap raw-hex ADDRESS literals (hardcoded US pointers in the source —
    # graphics/window/data tables) to their JP address via addr_map. Only entries
    # that actually moved; msg_map wins ties. Verify-or-revert keeps bad remaps out.
    for l in open("layout/addr_map.tsv"):
        if not l.startswith("#"):
            u, j = (int(x, 16) for x in l.split("\t")[:2])
            if u != j: mm.setdefault(u, j)
    src = open(f"src/{name}.c").read()
    new = _re.sub(r"0x[0-9A-Fa-f]+",
                  lambda m: f"0x{mm[int(m.group(0),16)]:X}" if int(m.group(0), 16) in mm else m.group(0),
                  src)
    if new != src:
        open(f"src/{name}.c", "w").write(new)
        sh("make clean")
        if "fireemblem8.gba: OK" in sh("make compare").stdout:
            print(f"{name}: OK (msg-id remapped) — run {start}..{end} ({len(funcs)} fns)")
            return True

    print(f"{name}: FAILED make compare — reverting")
    if os.environ.get("PORTRUN_DEBUG"):
        sh("make fireemblem8.gba")
    if os.environ.get("PORTRUN_DEBUG") and os.path.exists("fireemblem8.gba"):
        b = open("fireemblem8.gba", "rb").read()
        d = [i for i in range(min(len(b), len(jp))) if b[i] != jp[i]]
        if d:
            print(f"  diff: {len(d)} bytes, first @ {d[0]:#x} (run .text {0x08000000+base:#x}..{end}; "
                  f"romdata {[(hex(0x08000000+x),hex(s)) for x,s,_ in data_carves]})")
    for p, c in snap.items():
        if c is None:               # file did not exist before this call -> remove it
            if os.path.exists(p): os.remove(p)
        else:
            open(p, "w").write(c)
    os.remove(f"src/{name}.c"); sh(f"rm -f src/{name}.o src/{name}.s"); sh("make layout")
    # next-largest run (reuse discovery); keep src_tu/frag/func_only/dedup_globals so
    # the recursion still extracts from the right US TU, in the right mode, and writes
    # to the same parallel-safe fragment.
    return port(name, exclude + (tuple(funcs),), runs, src_tu=src_tu, frag=frag,
                func_only=func_only, dedup_globals=dedup_globals)


if __name__ == "__main__":
    ok = sum(port(n) for n in sys.argv[1:])
    sh("make clean")
    print(f"\nported {ok}/{len(sys.argv)-1} runs; build "
          + ("GREEN" if "OK" in sh("make compare").stdout else "RED"))
