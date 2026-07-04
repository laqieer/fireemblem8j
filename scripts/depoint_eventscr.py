#!/usr/bin/env python3
"""De-pointer FE8J event-script (and similar) C data files for shiftability (#145).

Raw-hex ROM pointer operands like ``CALL(0x08A694D4)`` store an absolute address
as a bare integer.  The compiler emits NO relocation for a bare integer, so a
shifted (+0x40000) ROM cannot relocate it -- and it is invisible to
``make shiftcheck`` (the D345 "false floor").  This tool rewrites every raw-hex
ROM pointer operand into a *relocatable symbol reference* (``SYM`` or
``(u8 *)SYM + 0xOFF``) that resolves byte-exactly, so the built ``.o`` emits an
``R_ARM_ABS32`` at each site.  100%% byte-neutral: ``make compare`` stays OK.

Resolution (per raw address A, ELF symbol value V, size N, type T):
  * exact base match (V == A)                    -> ``SYM``           (addend 0)
  * inside a sized symbol (V <= A < V+N)          -> ``(u8 *)SYM+off`` (off = A-V)
  * inside a size-0 named label region            -> ``(u8 *)SYM+off``
  * otherwise                                     -> left raw (residual)

Thumb bit (ld ORs bit0 for STT_FUNC targets): with addend = A - V the linker
computes ``(V + addend) | T`` == ``A | T``.
  * A odd  (a Thumb ``func|1`` pointer): ``A|T == A`` for any T -> always exact,
    and we PREFER a FUNC container so the bit is (re-)set.
  * A even (a data pointer):            exact ONLY if T == 0, so we REFUSE a
    Thumb-FUNC container for even A (the Wave14 off-by-one) and pick a data /
    NOTYPE symbol instead.

Usage:
  scripts/depoint_eventscr.py --elf fireemblem8.elf --file <path.c> --dry-run
  scripts/depoint_eventscr.py --elf fireemblem8.elf --file <path.c> --write
"""
import argparse
import re
import subprocess
import sys

# ROM-space absolute pointer token: 0x08xxxxxx or 0x8xxxxxx (6 hex digits after the 8).
ADDR_RE = re.compile(r"0x0?8[0-9A-Fa-f]{6}\b")
# Identifier defined in THIS file:  <type> NAME[] ... = {   (captures the array symbols)
DEF_RE = re.compile(r"^[A-Za-z_].*\b([A-Za-z_][A-Za-z0-9_]*)\s*\[\]\s*(?:__attribute__|SECTION|=)", re.M)
# Same, but also captures the leading TYPE so forward decls stay type-correct
# (a file may mix ``EventListScr NAME[]`` with ``struct ProcCmd NAME[]`` etc.).
DEF_TYPED_RE = re.compile(
    r"^([A-Za-z_][A-Za-z0-9_ ]*?)\s+([A-Za-z_][A-Za-z0-9_]*)\s*\[\]\s*"
    r"(?:__attribute__|SECTION|=)", re.M)
# Start of an event-script table body -- the ONLY region whose raw-hex operands
# we rewrite.  We must NOT touch ``struct ProcCmd[]`` arrays, ``INCBIN_*`` lines,
# or comments elsewhere in the file (they are out of these line ranges).
EVT_TABLE_START_RE = re.compile(r"^EventListScr\s+[A-Za-z_][A-Za-z0-9_]*\s*\[\]")

MAPPING_NAMES = {"$a", "$t", "$d", ".gcc2_compiled."}


def load_symbols(elf, prefix="arm-none-eabi-"):
    """Return list of dicts {val,size,type,name} for defined, non-mapping symbols."""
    out = subprocess.check_output([prefix + "readelf", "-sW", elf], text=True)
    syms = []
    for line in out.splitlines():
        p = line.split()
        # Num: Value Size Type Bind Vis Ndx Name
        if len(p) < 8 or not p[0].endswith(":"):
            continue
        try:
            val = int(p[1], 16)
            size = int(p[2])
        except ValueError:
            continue
        typ, ndx, name = p[3], p[6], p[7]
        if ndx in ("UND", "ABS") or val == 0 or not name:
            continue
        if name in MAPPING_NAMES or name.startswith("$"):
            continue
        syms.append({"val": val, "size": size, "type": typ, "name": name})
    return syms


class Resolver:
    def __init__(self, syms):
        self.syms = syms
        # exact-value index: prefer typed+sized+named over bare NOTYPE
        self.by_val = {}
        for s in syms:
            key = s["val"]
            cur = self.by_val.get(key)
            if cur is None or self._rank(s) > self._rank(cur):
                self.by_val[key] = s
        # sized containers, sorted by val
        self.sized = sorted((s for s in syms if s["size"] > 0), key=lambda s: s["val"])
        self.sized_vals = [s["val"] for s in self.sized]
        # all named labels for range inference, sorted & deduped by val
        seen = {}
        for s in syms:
            v = s["val"]
            if v not in seen or self._rank(s) > self._rank(seen[v]):
                seen[v] = s
        self.labels = sorted(seen.values(), key=lambda s: s["val"])
        self.label_vals = [s["val"] for s in self.labels]

    @staticmethod
    def _rank(s):
        r = 0
        if s["type"] in ("FUNC", "OBJECT"):
            r += 4
        if s["size"] > 0:
            r += 2
        if not s["name"].startswith("data_") and not s["name"].startswith("gUnk"):
            r += 1
        return r

    def _sized_container(self, A, want_func):
        """Tightest sized symbol with val<=A<val+size honoring the FUNC constraint."""
        import bisect
        i = bisect.bisect_right(self.sized_vals, A)
        best = None
        # scan back a bounded window (symbols overlap; tightest = largest val)
        j = i - 1
        while j >= 0 and j >= i - 4000:
            s = self.sized[j]
            if s["val"] + s["size"] > A:
                is_func = s["type"] == "FUNC"
                ok = (is_func == want_func) if want_func else (not is_func)
                if ok and (best is None or s["val"] > best["val"]):
                    best = s
            # early stop: once val + max_seen_size can't reach A we could break,
            # but sizes vary, so bound the window instead.
            j -= 1
        return best

    def resolve(self, A):
        """Return (name, addend, kind) or None (residual)."""
        odd = A & 1
        # 1) exact base match
        s = self.by_val.get(A)
        if s is not None:
            # even A must not land on a Thumb FUNC (would gain bit0); but exact
            # even==FUNC.val is impossible (FUNC vals are odd), so this is safe.
            return (s["name"], 0, "exact")
        # 2) sized container
        if odd:
            s = self._sized_container(A, want_func=True) or self._sized_container(A, want_func=False)
        else:
            s = self._sized_container(A, want_func=False)
        if s is not None:
            return (s["name"], A - s["val"], "sized-" + s["type"].lower())
        # 3) size-0 label range inference
        import bisect
        i = bisect.bisect_right(self.label_vals, A) - 1
        if i >= 0:
            s = self.labels[i]
            # even A must not resolve onto a Thumb FUNC label
            if not (not odd and s["type"] == "FUNC"):
                return (s["name"], A - s["val"], "range-" + s["type"].lower())
        return None


def internal_defs(text):
    """Map ``name -> C type`` for every ``<type> NAME[] = {...}`` defined in the file.

    The type is preserved so a forward declaration for an intra-file reference
    matches the real definition (e.g. an ``EventListScr`` script that references a
    later ``EventListScr`` table, without clashing with a ``struct ProcCmd`` one).
    """
    types = {}
    for typ, name in DEF_TYPED_RE.findall(text):
        types[name] = typ.strip()
    # keep any name the looser regex finds even if the typed one missed it
    for name in DEF_RE.findall(text):
        types.setdefault(name, "EventListScr")
    return types


def _sub_code_only(line, repl):
    """Apply ADDR_RE.sub to the code portion of a line, never inside a comment."""
    c1 = line.find("//")
    c2 = line.find("/*")
    cands = [c for c in (c1, c2) if c != -1]
    if not cands:
        return ADDR_RE.sub(repl, line)
    idx = min(cands)
    return ADDR_RE.sub(repl, line[:idx]) + line[idx:]


def sub_event_tables(text, repl):
    """Rewrite ROM-addr operands ONLY inside ``EventListScr[]`` table bodies.

    Everything else (``struct ProcCmd[]`` arrays, ``INCBIN_*`` lines, comments,
    stray addresses) is left byte-for-byte unchanged.
    """
    out = []
    inside = False
    for line in text.split("\n"):
        if not inside:
            out.append(line)                       # decl line: no operand to rewrite
            if EVT_TABLE_START_RE.match(line):
                inside = True
        else:
            if line.startswith("};"):
                inside = False
                out.append(line)
            else:
                out.append(_sub_code_only(line, repl))
    return "\n".join(out)


def make_ref(name, addend, internal):
    """C expression giving the byte-exact address, emitting R_ARM_ABS32(name,addend).

    For a non-zero addend we always byte-cast (``(u8 *)name + off``): the target's
    declared element stride may be >1 (e.g. an ``EventListScr[]`` / ``UnitDef[]``
    header array), so plain ``name + off`` would scale the offset.  ``(u8 *)`` forces
    stride 1, making the byte offset exact regardless of the symbol's C type.
    """
    if addend == 0:
        return name
    return "(u8 *)%s + 0x%X" % (name, addend)


def tu_declared(names, file, preproc, cpp, cppflags, include_dirs):
    """Subset of ``names`` already visible in the *translation unit* of ``file``.

    The reliable signal is the real preprocessor: run ``preproc <file> | cpp
    <cppflags>`` (exactly the build's front-end) and collect the identifiers it
    emits.  A name is "already declared" iff it appears there -- i.e. one of the
    headers the file actually ``#include``s declares it.  We must NOT emit our own
    ``extern`` for those (it would clash under ``-Werror``); for everything else we
    do.  ``file`` MUST be the pre-de-pointered original (its raw-hex operands add
    no identifiers, so presence == a header declaration).

    Falls back to scanning ``include_dirs`` if the preprocessor cannot be run.
    """
    try:
        p1 = subprocess.run(preproc + [file], capture_output=True, text=True, check=True)
        p2 = subprocess.run(cpp + cppflags + ["-"], input=p1.stdout,
                            capture_output=True, text=True, check=True)
        # A symbol is "declared" only if it appears in real C code -- NOT if it
        # merely shows up inside an inline-asm string literal (e.g.
        # `"\t.4byte UnitDef_Foo\n"`) or a char literal.  Strip those first, else
        # asm-only / later-in-file symbols get a false "already declared".
        src = p2.stdout
        src = re.sub(r'"(?:\\.|[^"\\\n])*"', " ", src)
        src = re.sub(r"'(?:\\.|[^'\\\n])*'", " ", src)
        toks = set(re.findall(r"[A-Za-z_][A-Za-z0-9_]*", src))
        if toks:
            return {n for n in names if n in toks}
    except (OSError, subprocess.CalledProcessError):
        pass
    # fallback: scan headers textually (less precise -- may see non-included ones)
    import os
    blob = []
    for d in include_dirs:
        for root, _, files in os.walk(d):
            for f in files:
                if f.endswith((".h", ".hpp")):
                    try:
                        blob.append(open(os.path.join(root, f), errors="ignore").read())
                    except OSError:
                        pass
    blob = "\n".join(blob)
    return {n for n in names if re.search(r"\b" + re.escape(n) + r"\s*[\(\[]", blob)}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--elf", required=True)
    ap.add_argument("--file", required=True)
    ap.add_argument("--prefix", default="arm-none-eabi-")
    ap.add_argument("--include-dir", default="include",
                    help="header dir(s) (comma-separated) scanned as a FALLBACK "
                         "to avoid re-declaring symbols already prototyped there")
    ap.add_argument("--preproc", default="tools/preproc/preproc",
                    help="preproc binary used to resolve the real translation unit")
    ap.add_argument("--cpp", default="cc -E",
                    help="C preprocessor command (front-end after preproc)")
    ap.add_argument("--cppflags",
                    default="-I tools/agbcc/include -iquote include -iquote . -nostdinc -undef",
                    help="flags passed to the C preprocessor")
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--write", action="store_true")
    args = ap.parse_args()

    inc_dirs = [d for d in args.include_dir.split(",") if d]
    preproc_cmd = args.preproc.split()
    cpp_cmd = args.cpp.split()
    cppflags = args.cppflags.split()

    syms = load_symbols(args.elf, args.prefix)
    R = Resolver(syms)
    text = open(args.file).read()
    internal_types = internal_defs(text)         # name -> C type
    internal = set(internal_types)

    resolved = residual = 0
    kinds = {}
    referenced = {}     # name -> internal?
    residual_addrs = {}

    def repl(m):
        nonlocal resolved, residual
        A = int(m.group(0), 16) & 0xFFFFFFFF
        r = R.resolve(A)
        if r is None:
            residual += 1
            residual_addrs[A] = residual_addrs.get(A, 0) + 1
            return m.group(0)
        name, addend, kind = r
        resolved += 1
        kinds[kind] = kinds.get(kind, 0) + 1
        is_int = name in internal
        referenced[name] = is_int
        return make_ref(name, addend, is_int)

    new_text = sub_event_tables(text, repl)

    # Split references:
    #  * internal  -> forward-declared with their real in-file type
    #  * external + already declared in a header -> reference by name, NO decl
    #  * external + undeclared -> we emit `extern const u8 NAME[];`
    ext = sorted(n for n, isint in referenced.items() if not isint)
    fwd = sorted(n for n, isint in referenced.items() if isint)
    declared = tu_declared(ext, args.file, preproc_cmd, cpp_cmd, cppflags, inc_dirs)
    ext_decl = [n for n in ext if n not in declared]

    if args.dry_run:
        print(f"resolved={resolved} residual={residual} unique_ext={len(ext)} "
              f"(header-declared={len(declared)} self-decl={len(ext_decl)}) "
              f"internal_refs={len(fwd)}")
        print("kinds:", kinds)
        if residual_addrs:
            print("residual addrs:")
            for a, c in sorted(residual_addrs.items()):
                print(f"  0x{a:08X} x{c}")
        return

    if args.write:
        # Insert extern/forward declarations after the EVENT_WORD_SYM #define block.
        decl_lines = []
        if fwd:
            decl_lines.append("/* forward declarations for intra-file table cross-references (#145 shiftability) */")
            for n in fwd:
                decl_lines.append(f"extern {internal_types.get(n, 'EventListScr')} {n}[];")
        if ext_decl:
            decl_lines.append("/* external data targets referenced as relocatable symbols (#145 shiftability) */")
            for n in ext_decl:
                decl_lines.append(f"extern const u8 {n}[];")
        decl_block = "\n".join(decl_lines) + "\n"

        anchor = "#define EVENT_WORD_SYM(s)  (EventListScr)(s),\n"
        if anchor in new_text:
            new_text = new_text.replace(anchor, anchor + "\n" + decl_block, 1)
        else:
            # fall back: after the last #include
            idx = new_text.rfind("#include")
            eol = new_text.find("\n", idx) + 1
            new_text = new_text[:eol] + "\n" + decl_block + new_text[eol:]

        open(args.file, "w").write(new_text)
        print(f"wrote {args.file}: resolved={resolved} residual={residual} "
              f"ext_self_decls={len(ext_decl)} header_declared={len(declared)} "
              f"fwd_decls={len(fwd)}")
        print("kinds:", kinds)
        if residual_addrs:
            print("residual (kept raw):", {f"0x{a:08X}": c for a, c in sorted(residual_addrs.items())})


if __name__ == "__main__":
    sys.exit(main())
