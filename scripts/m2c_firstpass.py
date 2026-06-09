#!/usr/bin/env python3
"""m2c first-pass: gbadisasm-carved region-different asm -> readable C seed.

This is survey action P0.4: make m2c (arch_arm, -t gba) the DEFAULT first pass
that turns a carved region-different function's descriptive asm (asm/<fn>.s,
the oracle byte source) into a readable C first-draft landing in the D26 staging
tier src/nonmatching/<fn>.c (NON-oracle, prove-builds-only via `make
nonmatching`), named/typed from the funclib US correspondence (D25).

Pipeline per function `<fn>` (the asm/<fn>.s basename):
  1. Look up <fn>'s JP address (from the `@ JP 0x...` banner the gbadisasm
     carver writes) -> reference/maps/funclib_us_jp.tsv -> us_name_current.
     Prefer `new-hint` rows (the region-different carve queue); also accept
     `funcmap-agree`.
  2. Clean the carved asm for m2c: drop the de-symbolization `.set SYM, 0xADDR`
     lines and the `_08xxxxxx: .4byte ...` literal-pool definitions. m2c's
     MagicFuncPattern rejects absolute `bl` targets, and per D24 m2c cannot
     resolve PC-relative literal pools anyway -- they become `extern` seeds.
  3. Run m2c (--target gba, arch arm) with the project ctx (gen_ctx.py) ->
     readable seed C.
  4. Light auto-fixups so the seed COMPILES under `make nonmatching` (it does
     NOT need to byte-match -- matching is the later permuter step):
       * rename the m2c function (the asm label, e.g. sub_8000CD8) to the
         funclib us_name_current (e.g. GetGameClock);
       * replace m2c's `?` unknown-return-type with `int`;
       * if a REAL header prototype already declares the funclib name, coerce
         the definition's return type to the header's (avoids the agbcc
         `-Werror` "conflicting types" failure);
       * stub any `subroutine_arg0`-style m2c placeholder the body references.
  5. Prepend `#include "global.h"` (project convention) + a NON_MATCHING banner.
  6. Verify the result COMPILES via the build recipe (cpp|iconv|agbcc|as). If it
     won't compile after the auto-fixups, SKIP it (never commit a staging .c
     that breaks `make nonmatching`) and log it.

The byte source stays asm/<fn>.s (untouched); this C is documentation/staging
only and is structurally outside the oracle (not in ALL_OBJECTS / ldscript).
`make compare` is never affected.

CLI:
  scripts/m2c_firstpass.py --list                 # show the candidate backlog
  scripts/m2c_firstpass.py --batch N              # process the next N candidates
  scripts/m2c_firstpass.py <fn> [<fn> ...]        # process explicit fn names
  scripts/m2c_firstpass.py --batch N --dry-run    # don't write, just report yield
"""
import argparse
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)

FUNCLIB = "reference/maps/funclib_us_jp.tsv"
CTX = "tools/m2c/fe8j_ctx.c"
M2C = "scripts/tools/m2c/m2c.sh"
GEN_CTX = "scripts/tools/m2c/gen_ctx.py"
NONMATCH_DIR = "src/nonmatching"

JP_BANNER_RE = re.compile(r"@ JP (0x[0-9A-Fa-f]+)")


# ---------------------------------------------------------------------------
# funclib + candidate discovery
# ---------------------------------------------------------------------------
def load_funclib():
    """jp_addr (lowercased 0x..) -> (us_name_current, confidence)."""
    m = {}
    with open(FUNCLIB) as f:
        for line in f:
            if line.startswith("#") or line.startswith("jp_addr"):
                continue
            p = line.rstrip("\n").split("\t")
            if len(p) < 6:
                continue
            m[p[0].lower()] = (p[2], p[4])
    return m


def asm_jp_addr(path):
    """The JP address from the gbadisasm `@ JP 0x...` banner, or None."""
    try:
        with open(path) as f:
            head = f.read(4000)
    except OSError:
        return None
    m = JP_BANNER_RE.search(head)
    return m.group(1).lower() if m else None


def committed_asm():
    out = subprocess.check_output(["git", "ls-files", "asm/*.s"]).decode().split()
    return [a for a in out if "baserom" not in a]


def candidates():
    """List of (fn, jp_addr, us_name, confidence) for carved asm whose JP addr
    has a funclib us_name. new-hint first (the region-different queue), then
    funcmap-agree. Skips funcmap-disagree (the quarantined ~0.6%)."""
    fl = load_funclib()
    rows = []
    for af in committed_asm():
        fn = os.path.basename(af)[:-2]
        addr = asm_jp_addr(af)
        if not addr or addr not in fl:
            continue
        us_name, conf = fl[addr]
        if conf == "funcmap-disagree" or not us_name:
            continue
        rows.append((fn, addr, us_name, conf))
    # new-hint (region-different) ahead of funcmap-agree; stable by name within
    order = {"new-hint": 0, "funcmap-agree": 1}
    rows.sort(key=lambda r: (order.get(r[3], 2), r[0]))
    return rows


# ---------------------------------------------------------------------------
# header prototype lookup (to reconcile return type with agbcc -Werror)
# ---------------------------------------------------------------------------
_HDR_TEXT = None


def header_text():
    global _HDR_TEXT
    if _HDR_TEXT is None:
        buf = []
        for root, _, files in os.walk("include"):
            for fn in files:
                if fn.endswith(".h"):
                    try:
                        buf.append(open(os.path.join(root, fn), errors="ignore").read())
                    except OSError:
                        pass
        _HDR_TEXT = "\n".join(buf)
    return _HDR_TEXT


def header_return_type(name):
    """Return the return-type token(s) of a REAL (non-commented) header
    prototype for `name`, or None. Best-effort, single-line prototypes."""
    pat = re.compile(r"^([A-Za-z_][\w\s\*]*?)\b" + re.escape(name) + r"\s*\(", re.M)
    for line in header_text().splitlines():
        ls = line.strip()
        if ls.startswith("//") or ls.startswith("/*") or ls.startswith("*"):
            continue
        if re.search(r"//.*\b" + re.escape(name) + r"\s*\(", line):
            continue
        m = pat.match(line)
        if m:
            rt = m.group(1).strip()
            if rt and rt not in ("return", "case", "else"):
                return rt
    return None


# ---------------------------------------------------------------------------
# asm cleanup + m2c
# ---------------------------------------------------------------------------
LITERAL_LABEL_RE = re.compile(r"^_[0-9A-Fa-f]+:\s*\.4byte")


def clean_asm(src):
    """Carved asm -> m2c-friendly asm: drop `.set` de-symbolization and
    `_08xxxxxx: .4byte` literal-pool defs (D24: m2c can't resolve PC-rel
    literals; they degrade to `extern` seeds, which is fine)."""
    out = []
    for line in src.splitlines():
        s = line.strip()
        if s.startswith(".set "):
            continue
        if LITERAL_LABEL_RE.match(s):
            continue
        out.append(line)
    return "\n".join(out) + "\n"


def run_m2c(asm_text, fn):
    import tempfile
    with tempfile.NamedTemporaryFile("w", suffix=".s", delete=False) as tf:
        tf.write(asm_text)
        tmp = tf.name
    try:
        # --valid-syntax: emit compilable C, using M2C_UNK / M2C_FIELD macros for
        # unknown types and untyped field access (instead of `?` and `p->unkN`
        # which agbcc -Werror rejects on void*). --allman matches .clang-format.
        res = subprocess.run(
            [M2C, "--valid-syntax", "--allman", "--context", CTX, "-f", fn, tmp],
            capture_output=True, text=True,
        )
    finally:
        os.unlink(tmp)
    return res.stdout, res.stderr, res.returncode


# ---------------------------------------------------------------------------
# light auto-fixups on the m2c seed
# ---------------------------------------------------------------------------
def auto_fixups(seed, asm_fn, us_name):
    """Turn an m2c seed into a compilable, funclib-named staging body.

    Returns (body, notes) or (None, reason) if m2c clearly failed (a
    decompilation-failure / internal-error comment instead of code)."""
    notes = []
    if "Decompilation failure" in seed or "Internal error" in seed or seed.strip() == "":
        return None, "m2c produced no code (decompile failure / internal error)"

    body = seed

    # 1. With --valid-syntax, unknown types/fields come out as M2C_UNK / M2C_FIELD
    #    macros (defined in the prelude we prepend), so there is no `?` to fix.
    #    Defensive guard: if any bare `?` token slipped through, it is not valid C.
    if re.search(r"(^|\s)\?(\s|\*)", body):
        return None, "m2c emitted bare `?` type (valid-syntax did not fully resolve)"

    # 2. Rename the function: asm label -> funclib name (definition + any
    #    self-reference). Use word boundaries so we don't touch substrings.
    if us_name and us_name != asm_fn:
        body = re.sub(r"\b" + re.escape(asm_fn) + r"\b", us_name, body)
        notes.append(f"renamed {asm_fn} -> {us_name} (funclib)")

    # 3. If a REAL header prototype declares the funclib name, coerce the
    #    DEFINITION's return type to the header's (agbcc -Werror rejects a
    #    conflicting return type vs the prototype).
    hdr_rt = header_return_type(us_name)
    if hdr_rt:
        # the definition line is the one ending in `) {`
        def_re = re.compile(
            r"^([A-Za-z_][\w\s\*]*?\b)(" + re.escape(us_name) + r")(\s*\([^;]*\)\s*\{)",
            re.M,
        )

        def repl(m):
            return hdr_rt + " " + m.group(2) + m.group(3)

        new_body, n = def_re.subn(repl, body)
        if n:
            body = new_body
            notes.append(f"return type -> '{hdr_rt}' (match header prototype)")

    # 4. Stub m2c argument placeholders the body references but never declares
    #    (`subroutine_argN`, `var_off`, etc. emitted for unanalyzed call args).
    stubs = []
    for ph in sorted(set(re.findall(r"\bsubroutine_arg\d+\b", body))):
        stubs.append(f"extern int {ph};")
    if stubs:
        body = "\n".join(stubs) + "\n\n" + body
        notes.append(f"stubbed {len(stubs)} m2c arg placeholder(s)")

    return body, notes


BANNER = """\
/* NON_MATCHING (m2c first-pass seed): byte source is asm/{asm}.s @ JP {addr}
 * (region-different, gbadisasm descriptive asm; the carved_rom row places those
 * bytes). This C DOCUMENTS / stages the function and is NOT in the make-compare
 * oracle -- it is compiled only by `make nonmatching` (prove-builds), never
 * linked, never sha1'd.
 *
 * Generated by scripts/m2c_firstpass.py (m2c --target gba, arch arm) and named
 * from the funclib US correspondence ({us} @ {conf}). It is a SEED: m2c cannot
 * resolve PC-relative literal pools (D24), so `_08xxxxxx` symbols appear as
 * `extern` placeholders -- readable, compilable, but NOT yet byte-matching.
 * Graduate via the permuter -> matching C; `make compare` is the sole oracle.
 * No #ifdef, no asm in this file. */
#include "global.h"

/* m2c --valid-syntax prelude: macros m2c emits for unknown types / untyped
 * field access (from tools/m2c/m2c_macros.h). They keep the SEED compilable
 * before hand-cleaning; graduating to matching C replaces them with real types.
 */
#ifndef M2C_FIELD
typedef s32 M2C_UNK;
typedef s8  M2C_UNK8;
typedef s16 M2C_UNK16;
typedef s32 M2C_UNK32;
#define M2C_FIELD(expr, type_ptr, offset) (*(type_ptr)((s8 *)(expr) + (offset)))
#define M2C_BITWISE(type, expr) ((type)(expr))
#define M2C_ERROR(desc) (0)
#define M2C_CARRY 0
#define M2C_OVERFLOW(a) (0)
#define CLZ(x) (0)
#define ROTATE_RIGHT(x, shift) (0)
#define ARM_RRX(x, carry) (0)
#define M2C_MEMCPY_ALIGNED memcpy
#define M2C_MEMCPY_UNALIGNED memcpy
#define M2C_STRUCT_COPY memcpy
#endif

"""


# ---------------------------------------------------------------------------
# compile check (the build recipe, to .o; never links)
# ---------------------------------------------------------------------------
def compile_check(c_path):
    """True if the staging C compiles via the same recipe `make nonmatching`
    uses (cpp | iconv | agbcc | as -> .o). Compile-only; never links."""
    obj = c_path[:-2] + ".o"
    asm_out = c_path[:-2] + ".s"
    env = os.environ
    cpp = _which("arm-none-eabi-cpp", "cpp")
    agbcc = "tools/agbcc/bin/agbcc"
    as_ = _which("arm-none-eabi-as")
    try:
        p1 = subprocess.run(
            [cpp, "-I", "tools/agbcc/include", "-iquote", "include",
             "-iquote", ".", "-nostdinc", "-undef", c_path],
            capture_output=True,
        )
        if p1.returncode != 0:
            return False, p1.stderr.decode(errors="ignore")[:600]
        p2 = subprocess.run(["iconv", "-f", "UTF-8", "-t", "CP932"],
                            input=p1.stdout, capture_output=True)
        p3 = subprocess.run(
            [agbcc, "-mthumb-interwork", "-Wimplicit", "-Wparentheses",
             "-Werror", "-O2", "-fhex-asm", "-ffix-debug-line", "-g",
             "-o", asm_out],
            input=p2.stdout, capture_output=True,
        )
        if p3.returncode != 0:
            return False, (p3.stdout + p3.stderr).decode(errors="ignore")[:600]
        with open(asm_out, "a") as f:
            f.write("\t.text\n\t.align 2, 0\n")
        p4 = subprocess.run(
            [as_, "-mcpu=arm7tdmi", "-mthumb-interwork", "-I", "include",
             "-I", ".", asm_out, "-o", obj],
            capture_output=True,
        )
        if p4.returncode != 0:
            return False, p4.stderr.decode(errors="ignore")[:600]
        return True, ""
    finally:
        for f in (obj, asm_out):
            if os.path.exists(f):
                os.unlink(f)


def _which(*cands):
    import shutil
    for c in cands:
        p = shutil.which(c)
        if p:
            return p
    return cands[-1]


# ---------------------------------------------------------------------------
# driver
# ---------------------------------------------------------------------------
def ensure_ctx():
    if not os.path.exists(CTX):
        print(f"[ctx] generating {CTX} ...")
        subprocess.run([sys.executable, GEN_CTX], check=True)


def process_one(fn, addr, us_name, conf, dry_run):
    """Returns ('ok'|'skip', detail)."""
    asm_path = os.path.join("asm", fn + ".s")
    if not os.path.exists(asm_path):
        return "skip", f"no asm/{fn}.s"
    cleaned = clean_asm(open(asm_path).read())
    out, err, rc = run_m2c(cleaned, fn)
    body, notes = auto_fixups(out, fn, us_name)
    if body is None:
        return "skip", notes  # notes is the reason string
    # filename matches the asm basename (check_nonmatching requires asm/<fn>.s)
    c_path = os.path.join(NONMATCH_DIR, fn + ".c")
    content = BANNER.format(asm=fn, addr=addr, us=us_name, conf=conf) + body.rstrip() + "\n"
    # write to a temp path for the compile check (avoid clobbering on skip)
    tmp_c = c_path + ".tmp"
    with open(tmp_c, "w") as f:
        f.write(content)
    ok, msg = compile_check(tmp_c)
    if not ok:
        os.unlink(tmp_c)
        return "skip", "does not compile: " + msg.replace("\n", " ")[:300]
    if dry_run:
        os.unlink(tmp_c)
        return "ok", "(dry-run, not written) " + "; ".join(notes)
    os.replace(tmp_c, c_path)
    return "ok", "; ".join(notes)


def main():
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("fns", nargs="*", help="explicit asm function basenames")
    ap.add_argument("--list", action="store_true", help="show the candidate backlog and exit")
    ap.add_argument("--batch", type=int, default=0, help="process the next N candidates")
    ap.add_argument("--dry-run", action="store_true", help="don't write files; just report yield")
    ap.add_argument("--include-done", action="store_true",
                    help="don't skip functions already in src/nonmatching/")
    args = ap.parse_args()

    cands = candidates()

    if args.list:
        print(f"# {len(cands)} candidate(s): carved asm/<fn>.s + funclib name "
              f"(new-hint first, then funcmap-agree)")
        print(f"# {'fn':32s} {'jp_addr':12s} {'us_name':28s} confidence")
        for fn, addr, us, conf in cands:
            done = " [staged]" if os.path.exists(os.path.join(NONMATCH_DIR, fn + ".c")) else ""
            print(f"  {fn:32s} {addr:12s} {us:28s} {conf}{done}")
        return 0

    ensure_ctx()
    os.makedirs(NONMATCH_DIR, exist_ok=True)

    by_name = {c[0]: c for c in cands}
    if args.fns:
        targets = []
        for fn in args.fns:
            if fn in by_name:
                targets.append(by_name[fn])
            else:
                # allow explicit fn even if not in the candidate set (uses asm banner)
                asm_path = os.path.join("asm", fn + ".s")
                addr = asm_jp_addr(asm_path) if os.path.exists(asm_path) else None
                fl = load_funclib()
                us, conf = fl.get(addr, ("", "unknown")) if addr else ("", "unknown")
                targets.append((fn, addr or "0x?", us or fn, conf))
    else:
        pool = cands
        if not args.include_done:
            pool = [c for c in cands
                    if not os.path.exists(os.path.join(NONMATCH_DIR, c[0] + ".c"))]
        n = args.batch if args.batch else 10
        targets = pool[:n]

    ok_set, skip_set = [], []
    for fn, addr, us, conf in targets:
        status, detail = process_one(fn, addr, us, conf, args.dry_run)
        if status == "ok":
            ok_set.append((fn, us))
            print(f"[OK]   {fn:30s} -> {us:26s} {detail}")
        else:
            skip_set.append((fn, detail))
            print(f"[SKIP] {fn:30s} {detail}")

    total = len(targets)
    print()
    print(f"=== YIELD: {len(ok_set)}/{total} compiled "
          f"({100*len(ok_set)//total if total else 0}%) ===")
    if ok_set:
        print("COMPILED: " + ", ".join(f"{fn}->{us}" for fn, us in ok_set))
    if skip_set:
        print("SKIPPED:  " + ", ".join(fn for fn, _ in skip_set))
    return 0


if __name__ == "__main__":
    sys.exit(main())
