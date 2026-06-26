#!/usr/bin/env python3
"""
repoint_table.py -- de-pointer a residual data blob into a shiftable C table.

Turns a raw `INCBIN_U8("data/residual/<name>.bin")` wrapper (which bakes in
absolute 0x08xxxxxx pointers -> NOT shiftable) into a `const u32 <name>[]`
array of *symbol references*:

    pointer word  ->  (u32)&SymbolAtThatAddress           (+ 0xOFF if interior)
    data word     ->  0xNNNNNNNN literal

agbcc lowers `(u32)&sym` to `.word sym` (a relocation), so the result is
BYTE-IDENTICAL to the original ROM (the symbol's address == the original bytes)
yet fully relocated by the linker when sections shift. `make compare` is the
oracle: if it stays OK, the transform was byte-exact.

Only the .c *content* changes -- the ldscript entry, object path, section, and
symbol name are untouched, so no build wiring moves.

Usage:
    repoint_table.py <name> [<name> ...]      # rewrite each src/data/<name>_ref/dat_<name>_ref.c
    repoint_table.py --check <name>           # dry-run: print what it would emit
    repoint_table.py --safe-only <name>...    # skip any word whose target is a Thumb function
                                              # (avoids the thumb-bit relocation hazard)
"""
import os, sys, struct, bisect, subprocess, re, glob

ROM_LO, ROM_HI = 0x08000000, 0x09000000
IDENT = re.compile(r"^[A-Za-z_][A-Za-z0-9_]*$")  # valid C identifier (skip .gcc2_compiled., $t, ...)
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ELF = os.path.join(ROOT, "fireemblem8.elf")
RESID = os.path.join(ROOT, "data", "residual")

_STT_FUNC = None
def stt_func_names():
    """Names of GENUINE STT_FUNC symbols (readelf type FUNC). nm's 'T' conflates
    these with text-section DATA -- but only a real STT_FUNC makes `ld` OR in the
    Thumb bit on a `.4byte sym` relocation. Knowing which lets us emit the correct
    thumb-adjusted form for function pointers."""
    global _STT_FUNC
    if _STT_FUNC is None:
        out = subprocess.run(["arm-none-eabi-readelf", "--syms", ELF],
                             capture_output=True, text=True, errors="replace").stdout
        s = set()
        for line in out.splitlines():
            p = line.split()
            if len(p) >= 8 and p[3] == "FUNC":
                s.add(p[7])
        _STT_FUNC = s
    return _STT_FUNC

_THUMB_MAP = None
def is_thumb_addr(addr):
    """Is code at `addr` Thumb? From the ARM/Thumb mapping symbols ($t/$a): the
    nearest mapping symbol at-or-below addr decides. ld ORs the Thumb bit into a
    .4byte reloc only for a THUMB STT_FUNC, so we need this to emit the right form."""
    global _THUMB_MAP
    if _THUMB_MAP is None:
        out = subprocess.run(["arm-none-eabi-readelf", "--syms", "--wide", ELF],
                             capture_output=True, text=True, errors="replace").stdout
        m = []
        for line in out.splitlines():
            p = line.split()
            if len(p) >= 8 and p[7] in ("$t", "$a"):
                try: m.append((int(p[1], 16), p[7] == "$t"))
                except ValueError: pass
        m.sort()
        _THUMB_MAP = (m, [a for a, _ in m])
    mp, keys = _THUMB_MAP
    i = bisect.bisect_right(keys, addr) - 1
    return mp[i][1] if i >= 0 else True   # default Thumb (most FE8 code is Thumb)

def load_syms():
    """addr-sorted symbols from the linked ELF, with size and 'is-function'."""
    out = subprocess.check_output(
        ["arm-none-eabi-nm", "-S", "--defined-only", ELF],
        text=True, errors="replace")
    func_names = stt_func_names()
    by_addr = {}   # addr -> (name, size, is_func)
    for line in out.splitlines():
        p = line.split()
        if len(p) == 4:
            a_s, sz_s, typ, name = p
            try: size = int(sz_s, 16)
            except ValueError: size = 0
        elif len(p) == 3:
            a_s, typ, name = p; size = 0
        else:
            continue
        try: addr = int(a_s, 16)
        except ValueError: continue
        if not (ROM_LO <= addr < ROM_HI): continue
        if (not typ.isupper()) or typ in ("U", "A", "N"): continue  # globals only (linkable extern)
        if not IDENT.match(name): continue   # skip .gcc2_compiled., $t, $d mapping syms
        is_func = name in func_names   # genuine STT_FUNC (ld ORs the Thumb bit), not nm 'T'
        cur = by_addr.get(addr)
        if cur is None or _rank(name) < _rank(cur[0]):
            by_addr[addr] = (name, max(size, cur[1] if cur else 0), is_func or (cur[2] if cur else False))
        elif cur:
            by_addr[addr] = (cur[0], max(cur[1], size), cur[2] or is_func)
    addrs = sorted(by_addr)
    return addrs, by_addr

def _rank(n):
    return 2 if n.startswith(("data_", "gap_", "sub_", "byte_", "off_", "unk_", "j_", "nullsub")) else 0

_NAME2ADDR = None
def _elf_name2addr():
    """name -> JP address (linked ELF), for any symbol incl de-pointered block labels."""
    global _NAME2ADDR
    if _NAME2ADDR is None:
        out = subprocess.run(["arm-none-eabi-nm", ELF], capture_output=True,
                             text=True, errors="replace").stdout
        _NAME2ADDR = {}
        for line in out.splitlines():
            p = line.split()
            if len(p) == 3:
                try: _NAME2ADDR.setdefault(p[2], int(p[0], 16))
                except ValueError: pass
    return _NAME2ADDR

def resolve(ptr, addrs, by_addr):
    """Return (symname, offset, is_func) for the symbol covering ptr, or None."""
    i = bisect.bisect_right(addrs, ptr) - 1
    if i < 0: return None
    base = addrs[i]
    name, size, is_func = by_addr[base]
    off = ptr - base
    if off == 0:
        return (name, 0, is_func)
    if size and off < size:
        return (name, off, is_func)
    if i + 1 < len(addrs) and ptr < addrs[i + 1]:
        return (name, off, is_func)
    return None  # dangling

_HDR_ARRAYS = None
def header_array_symbols():
    """Identifiers declared as arrays (`name[`) anywhere in include/*.h. Emitting
    our own `extern const u8 name[];` for one of these conflicts with the header's
    typed array decl (e.g. `struct Glyph *TextGlyphs_System[]`). Since global.h
    already pulls those headers in, we simply skip our extern and let the header's
    declaration satisfy `(u32)&name` (valid for any array element type)."""
    global _HDR_ARRAYS
    if _HDR_ARRAYS is not None:
        return _HDR_ARRAYS
    syms = set()
    # only an `extern ... NAME[` global array declaration conflicts -- NOT struct
    # fields, local arrays, or `arr[i]` usage. Require `extern` on the line.
    rx = re.compile(r"\b([A-Za-z_][A-Za-z0-9_]*)\s*\[")
    for dp, _, fs in os.walk(os.path.join(ROOT, "include")):
        for f in fs:
            if not f.endswith(".h"):
                continue
            try:
                with open(os.path.join(dp, f), "r", errors="replace") as fh:
                    for line in fh:
                        if "extern" not in line:
                            continue
                        # last identifier before a '[' on the extern line = the array name
                        for m in rx.finditer(line):
                            syms.add(m.group(1))
            except OSError:
                pass
    _HDR_ARRAYS = syms
    return syms

def find_wrapper(name):
    """Locate the residual .c wrapper + .bin + section for <name>."""
    cdir = os.path.join(ROOT, "src", "data", name + "_ref")
    cpath = os.path.join(cdir, "dat_%s_ref.c" % name)
    binp = os.path.join(RESID, name + ".bin")
    section = ".rodata.dat_%s_ref" % name
    if not os.path.exists(cpath):
        # fall back: search for any .c that INCBINs this bin
        cpath = None
    return cpath, binp, section

_ASM_INCBIN_MAP = None
def asm_file_for(name):
    """The asm/*.s that incbins data/residual/<name>.bin (multi-symbol files)."""
    global _ASM_INCBIN_MAP
    if _ASM_INCBIN_MAP is None:
        _ASM_INCBIN_MAP = {}
        out = subprocess.run(
            ["grep", "-rlE", r'\.incbin "data/residual/', os.path.join(ROOT, "asm")],
            capture_output=True, text=True, errors="replace").stdout
        for path in out.split():
            with open(path, "r", errors="replace") as f:
                for line in f:
                    m = re.search(r'\.incbin "data/residual/([A-Za-z0-9_.]+)\.bin"', line)
                    if m:
                        _ASM_INCBIN_MAP.setdefault(m.group(1), path)
    return _ASM_INCBIN_MAP.get(name)

def rewrite_asm_inplace(asm_path, name, binp, addrs, by_addr, safe_only, allowed,
                        check=False, skip_zero=False):
    """Replace the single `.incbin "data/residual/<name>.bin"` line in a
    (possibly multi-symbol) asm file with the de-pointered `.4byte` directives.
    Surgical: only that one line changes; sibling symbols are untouched."""
    words, stats = emit_words(name, binp, addrs, by_addr, safe_only, allowed)
    if words is None:
        return None, stats
    if skip_zero and stats.startswith("ptr=0 "):
        return "SKIP0", stats   # nothing to relocate -> leave the incbin as-is
    needle = '.incbin "data/residual/%s.bin"' % name
    with open(asm_path, "r", errors="replace") as f:
        src = f.readlines()
    new = []
    hit = False
    for line in src:
        if needle in line and not hit:
            indent = line[:len(line) - len(line.lstrip())] or "\t"
            new.append("%s@ de-pointered (scripts/repoint_table.py): %s\n" % (indent, stats))
            new.extend("%s%s\n" % (indent, w) for w in words)
            hit = True
        else:
            new.append(line)
    if not hit:
        return None, "incbin line not found in %s" % asm_path
    if not check:
        with open(asm_path, "w") as f:
            f.writelines(new)
    return stats, stats

def emit_words(name, binp, addrs, by_addr, safe_only=False, allowed=None):
    """Read the whole .bin and turn each 4-byte word into an asm directive."""
    with open(binp, "rb") as f:
        b = f.read()
    return emit_words_bytes(b, addrs, by_addr, safe_only, allowed)

def emit_words_bytes(b, addrs, by_addr, safe_only=False, allowed=None):
    """Core: turn each 4-byte word of `b` into an asm directive string --
    `.4byte sym (+off)` for a confirmed pointer, `.4byte 0xNN` for data/raw.
    Returns (directives, stats) or (None, err). Shared by the whole-.bin path and
    the sliced src/data INCBIN_U8(bin, off, len) sub-symbol path."""
    out = []
    nptr = ndata = nskip = 0
    tail = b[len(b) - (len(b) % 4):] if len(b) % 4 else b""  # non-4-aligned trailing bytes
    for i in range(len(b) // 4):
        O = i * 4
        v = struct.unpack_from("<I", b, i * 4)[0]
        if ROM_LO <= v < ROM_HI:
            r = resolve(v, addrs, by_addr)
            if r is None:
                out.append(".4byte 0x%08X" % v); ndata += 1; continue
            sym, off, is_func = r
            if allowed is not None:
                # fe8u-gated: the relocation oracle is AUTHORITATIVE. Convert iff
                # this byte-offset is a confirmed pointer slot OR resolves EXACT
                # (off==0, always safe). Trust it over the is_func heuristic below
                # -- many FE8 data symbols are typed 'T' (text-classified section),
                # so is_func is unreliable; fe8u already proved the slot is a ptr.
                if not (allowed(O) or off == 0):
                    out.append(".4byte 0x%08X" % v); nskip += 1; continue
            else:
                # density/non-fe8u mode: heuristic guards. INTERIOR into a function's
                # code (off>1) is never a pointer -- a coincidental constant. Leave
                # raw (also avoids a thumb-bit +1 diff). NB only trust is_func here
                # for a GENUINE function name (not a data_ placeholder mistyped T).
                if is_func and off > 1 and not sym.startswith(("data_", "gap_", "byte_", "off_", "unk_")):
                    out.append(".4byte 0x%08X" % v); nskip += 1; continue
                if safe_only and is_func:
                    out.append(".4byte 0x%08X" % v); nskip += 1; continue
            # THUMB-BIT GUARD (universal): a function target stored EVEN (v&1==0)
            # would become odd via `.4byte func` (ld sets the Thumb bit) -> +1 byte
            # mismatch. Leave it raw -- can't reproduce the even value as a function
            # reloc.) THUMB/ARM GUARD: a `.4byte func` against a genuine STT_FUNC
            # gets the Thumb bit ORed in by ld for a THUMB function but NOT for an
            # ARM one -- and the two can't be cheaply told apart -- so a fn reloc
            # can't be reliably made byte-exact. Leave genuine functions raw. (Data
            # symbols mistyped 'T' by nm are correctly NON-func via STT, so they DO
            # convert here -- the win: even-valued data pointers no longer over-skip.)
            # ld quirk: `.4byte func` (addend 0) ORs the Thumb bit (-> func|1) but
            # `.4byte func + off` (off!=0) does NOT (-> func+off). So a function ptr
            # reproduces exactly for any off>=1; only off==0 (ptr to a Thumb fn's even
            # start) is unreproducible -> leave raw.
            if is_func and off == 0:
                out.append(".4byte 0x%08X" % v); nskip += 1; continue
            out.append(".4byte %s + 0x%X" % (sym, off) if off else ".4byte %s" % sym)
            nptr += 1
        else:
            out.append(".4byte 0x%08X" % v); ndata += 1
    for byte in tail:   # non-4-aligned trailing bytes -> .byte (preserve exact layout)
        out.append(".byte 0x%02X" % byte); ndata += 1
    return out, "ptr=%d data=%d skip=%d" % (nptr, ndata, nskip)

def emit_c(name, binp, section, addrs, by_addr, safe_only=False, allowed=None):
    """Wrap emit_words in a top-level __asm__ block (for the _ref .c wrappers)."""
    words, stats = emit_words(name, binp, addrs, by_addr, safe_only, allowed)
    if words is None:
        return None, stats
    c = []
    c.append("#include \"global.h\"")
    c.append("")
    c.append("/* De-pointered from data/residual/%s.bin by scripts/repoint_table.py." % name)
    c.append(" * Pointer words are relocatable symbol references (.4byte sym) so the ROM is")
    c.append(" * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a")
    c.append(" * pure asm block so no typed header decl of the referenced symbols can conflict. */")
    c.append("")
    c.append("__asm__(")
    c.append('"\\t.section %s, \\"a\\", %%progbits\\n"' % section)
    c.append('"\\t.global %s\\n"' % name)
    c.append('"%s:\\n"' % name)
    c.extend('"\\t%s\\n"' % w for w in words)
    c.append(");")
    c.append("")
    return "\n".join(c), stats

_SLICE_RE = re.compile(
    r'(?P<indent>[ \t]*)(?:const\s+)?u8\s+(?P<sym>\w+)\s*\[\s*\]\s*'
    r'__attribute__\(\(section\("(?P<sec>[^"]+)"\)\)\)\s*=\s*'
    r'INCBIN_U8\("data/residual/(?P<bin>[A-Za-z0-9_.]+\.bin)"'
    r'(?:\s*,\s*(?P<off>\d+)\s*,\s*(?P<len>\d+))?\)\s*;')

# alternate wiring: SECTION(".rodata.X") [const] u8 NAME[] = INCBIN_U8("...bin"[,off,len]);
_SECTION_RE = re.compile(
    r'(?P<indent>[ \t]*)SECTION\("(?P<sec>[^"]+)"\)\s*(?:const\s+)?u8\s+(?P<sym>\w+)\s*\[\s*\]\s*=\s*'
    r'INCBIN_U8\("data/residual/(?P<bin>[A-Za-z0-9_.]+\.bin)"'
    r'(?:\s*,\s*(?P<off>\d+)\s*,\s*(?P<len>\d+))?\)\s*;')

def fe8u_allowed_slice(sym, sec, slice_bytes):
    """Gate for a sliced sub-symbol: fe8u offsets by NAME, else by the JP address
    embedded in its `.data.residue.<ADDR>` section (region-shift address map), with
    STRICT full-alignment self-validation (every ROM-range word at a fe8u offset)."""
    try:
        import fe8u_ptr_offsets as _F
        fe = _F.ptr_offsets(sym)
    except Exception:
        fe = None
    if fe:
        feset = set(fe); S, subs = derive_stride(fe); last = fe[-1]
        if S:
            return lambda O: (O in feset) or (O > last and (O % S) in subs)
        return lambda O: O in feset
    m = re.search(r'\.(?:data|rodata)\.residue\.([0-9A-Fa-f]{6,8})', sec)
    if not m:
        return None
    jp = int(m.group(1), 16)
    rom = [i * 4 for i in range(len(slice_bytes) // 4)
           if ROM_LO <= struct.unpack_from("<I", slice_bytes, i * 4)[0] < ROM_HI]
    if not rom:
        return None
    # PER-WORD oracle: does fe8u relocate the word at (jp + O)? More precise than the
    # per-slice offset set (a slice can span a fe8u symbol boundary -> missed ptrs).
    import fe8u_ptr_offsets as _F
    ptr_offs = set(O for O in rom if _F.fe8u_ptr_at_jp(jp + O) is True)
    ok = set(O for O in rom if _F.fe8u_ptr_at_jp_strict(jp + O) is True)
    if len(ptr_offs) >= 3 or (ptr_offs and len(ptr_offs) == len(rom)):
        ok |= ptr_offs
    if ok:
        return lambda O: O in ok
    return None

def rewrite_src_slices(cf, addrs, by_addr, check=False):
    """De-point a LINKED src/data/<x>/<x>.c: replace each `u8 SUB[] __attribute__
    ((section(S))) = INCBIN_U8(bin, off, len);` whose slice fe8u confirms has
    pointers with a __asm__ block of `.4byte sym` relocations. Sub-symbols with no
    fe8u-confirmed pointers are left as INCBIN. Returns (#converted, #ptrs)."""
    with open(cf, "r", errors="replace") as f:
        text = f.read()
    nconv = nptr_total = 0
    def repl(m):
        nonlocal nconv, nptr_total
        sym, sec, binn = m.group("sym"), m.group("sec"), m.group("bin")
        binp = os.path.join(RESID, binn)
        if not os.path.exists(binp):
            return m.group(0)
        b = open(binp, "rb").read()
        off = int(m.group("off")) if m.group("off") else 0
        ln = int(m.group("len")) if m.group("len") else len(b) - off
        sl = b[off:off + ln]
        # emit_words_bytes handles non-4-aligned tails (.byte); no skip needed.
        allowed = fe8u_allowed_slice(sym, sec, sl)
        if allowed is None:
            allowed = (lambda O: False)   # no fe8u corroboration -> still convert
                                          # EXACT words (emit_words: off==0 always safe)
        words, stats = emit_words_bytes(sl, addrs, by_addr, False, allowed)
        if words is None or stats.startswith("ptr=0 "):
            return m.group(0)
        flags = 'aw' if ".data" in sec else 'a'
        nconv += 1
        nptr_total += int(re.search(r"ptr=(\d+)", stats).group(1))
        lines = ['__asm__(',
                 '"\\t.section %s, \\"%s\\", %%progbits\\n"' % (sec, flags),
                 '"\\t.global %s\\n"' % sym,
                 '"%s:\\n"' % sym]
        lines += ['"\\t%s\\n"' % w for w in words]
        lines.append(');  /* de-pointered slice %s: %s */' % (sym, stats))
        return "\n".join(lines)
    new = _SLICE_RE.sub(repl, text)
    new = _SECTION_RE.sub(repl, new)   # also the SECTION("...") u8 NAME[] = INCBIN form
    if nconv and not check:
        with open(cf, "w") as f:
            f.write(new)
    return nconv, nptr_total

def table_is_safe(binp, addrs, by_addr):
    """A residual table is SAFE to auto-repoint iff every in-ROM-range word
    resolves EXACT (to a symbol boundary, offset 0). EXACT-resolving words are
    high-confidence pointers (a non-pointer constant essentially never equals a
    symbol's exact start address); non-ROM words stay literal data. Any INTERIOR
    word (mid-object) is ambiguous -> route to fe8u-structured porting, not auto.
    Returns (safe, nptr) ; safe=False if 0 pointers or any interior/dangling."""
    try:
        with open(binp, "rb") as f:
            b = f.read()
    except OSError:
        return (False, 0)
    if len(b) == 0 or len(b) % 4:
        return (False, 0)
    nptr = 0
    for i in range(len(b) // 4):
        v = struct.unpack_from("<I", b, i * 4)[0]
        if v == 0:
            continue
        if ROM_LO <= v < ROM_HI:
            r = resolve(v, addrs, by_addr)
            if r is None or r[1] != 0:   # dangling or interior -> unsafe
                return (False, 0)
            nptr += 1
        # else: ordinary data word, fine
    return (nptr > 0, nptr)

def reprocess_asm_block(cf, addrs, by_addr, check=False):
    """Re-process raw `.4byte 0xNNN` literals STUCK in already-de-pointered __asm__
    blocks: earlier passes left ROM-range words raw (skip=N) before the converter
    learned to handle them (Thumb/ARM function pointers, fe8u-confirmed slots). For
    each block (`.section <sec>` / `NAME:` / `.4byte ...`), word i sits at NAME+i*4
    so its JP address = NAME's ELF addr + i*4. Convert a raw literal iff it resolves
    EXACT (off==0) or fe8u confirms a pointer there; emit via emit_words' relocation
    forms. Byte-exact (gated by make compare)."""
    import fe8u_ptr_offsets as _F
    name2addr = _elf_name2addr()
    with open(cf, "r", errors="replace") as f:
        lines = f.readlines()
    out = []
    i = 0
    nconv = 0
    label_re = re.compile(r'^"(\w+):\\n"')
    raw_re = re.compile(r'^(\s*)"\\t\.4byte (0x[0-9A-Fa-f]{8})\\n"(.*)$')
    base = None; widx = 0
    for line in lines:
        ml = label_re.match(line.strip())
        if ml:
            base = name2addr.get(ml.group(1)); widx = 0
            out.append(line); continue
        mr = raw_re.match(line.rstrip("\n"))
        if mr and base is not None:
            v = int(mr.group(2), 16)
            O = widx * 4; widx += 1   # this .4byte IS one word
            if ROM_LO <= v < ROM_HI:
                r = resolve(v, addrs, by_addr)
                exact = r and r[1] == 0
                try:
                    conf = _F.fe8u_ptr_at_jp(base + O) is True
                except Exception:
                    conf = False
                if r and (exact or conf):
                    sym, off, is_func = r
                    # ld quirk: `.4byte func` (addend 0) ORs the Thumb bit (-> func|1);
                    # `.4byte func + A` with A!=0 does NOT (-> func+A). So for a function
                    # `.4byte func + off` reproduces v exactly for any off>=1, but off==0
                    # (a pointer to a Thumb fn's even start) is unreproducible -> skip it.
                    if is_func and off == 0:
                        out.append(line); continue
                    rel = ".4byte %s + 0x%X" % (sym, off) if off else ".4byte %s" % sym
                    out.append('%s"\\t%s\\n"\n' % (mr.group(1), rel)); nconv += 1; continue
            out.append(line); continue
        # a non-raw `.4byte sym` directive is also one word -> advance the index
        if base is not None and re.match(r'^\s*"\\t\.4byte ', line):
            widx += 1
        out.append(line)
    if nconv and not check:
        with open(cf, "w") as f:
            f.writelines(out)
    return nconv

def select_auto_safe(addrs, by_addr):
    names = []
    for binp in sorted(glob.glob(os.path.join(RESID, "*.bin"))):
        name = os.path.basename(binp)[:-4]
        cpath, _, _ = find_wrapper(name)
        if not (cpath and os.path.exists(cpath)):
            continue
        with open(cpath, "r", errors="replace") as f:
            if "INCBIN" not in f.read():
                continue  # already de-pointered
        safe, nptr = table_is_safe(binp, addrs, by_addr)
        if safe:
            names.append((nptr, name))
    names.sort(reverse=True)
    return names

def derive_stride(offs):
    """Given fe8u's pointer byte-offsets, derive (stride S, sub-offsets set) for a
    fixed-stride struct array: O is a pointer slot iff (O % S) in subs. Lets us
    extrapolate past US's last record to JP-divergent extra records (more units/
    glyphs). Returns (None, set()) if no clean fixed stride (variable-length data)."""
    offs = sorted(set(offs))
    n = len(offs)
    if n < 2:
        return None, set()
    span = offs[-1]
    cand = sorted({offs[i] - offs[j] for i in range(n) for j in range(i) if offs[i] - offs[j] > 0})
    for S in cand:
        subs = set(o % S for o in offs)
        if len(subs) * (span // S + 2) > n * 4:
            continue  # too many sub-offsets -> not a clean record stride
        pred = set()
        k = 0
        while k * S <= span:
            for s in subs:
                v = k * S + s
                if v <= span:
                    pred.add(v)
            k += 1
        if pred == set(offs):   # the (S, subs) pattern reconstructs fe8u's offsets EXACTLY
            return S, subs
    return None, set()

def fe8u_allowed(name):
    """Build the `allowed(offset)->bool` gate from fe8u's relocation oracle.
    A JP word at byte-offset O is a confirmed pointer slot iff O is a fe8u pointer
    offset, OR (within a JP-divergent extra record) O matches the struct's pointer
    sub-offset pattern. Returns None if fe8u has no data (caller -> EXACT-only)."""
    try:
        import fe8u_ptr_offsets as _F
        fe = _F.ptr_offsets(name)
    except Exception:
        fe = None
    if not fe:
        # un-named generic blob: try the address mapping (data_<JPaddr>), gated by
        # a STRICT self-validation -- every JP ROM-range word must sit at a fe8u
        # offset (a wrong region shift or JP divergence fails this -> skip).
        m = re.match(r"^(?:data|gUnkData|gap)_([0-9A-Fa-f]{6,8})$", name)
        if not m:
            return None
        jp = int(m.group(1), 16)
        binp = os.path.join(RESID, name + ".bin")
        if not os.path.exists(binp):
            return None
        b = open(binp, "rb").read()
        rom = [i * 4 for i in range(len(b) // 4)
               if ROM_LO <= struct.unpack_from("<I", b, i * 4)[0] < ROM_HI]
        if not rom:
            return None
        # PER-WORD fe8u oracle (precise, spans symbol boundaries), shift-confirmed
        # by >=3 corroborating relocations.
        ptr_offs = set(O for O in rom if _F.fe8u_ptr_at_jp(jp + O) is True)
        if len(ptr_offs) >= 3 or (ptr_offs and len(ptr_offs) == len(rom)):
            return lambda O: O in ptr_offs
        return None
    feset = set(fe)
    S, subs = derive_stride(fe)
    last = fe[-1]
    if S:
        return lambda O: (O in feset) or (O > last and (O % S) in subs)
    return lambda O: O in feset

def table_density(binp, addrs, by_addr):
    """Return (nptr, nwords, all_resolve). A pointer-DENSE table (high
    nptr/nwords) is definitionally a pointer table -- a non-pointer constant
    coincidentally in ROM-range is implausible when the majority of words
    already resolve as pointers. Used by --auto-dense (a safe bulk lever for
    the INTERIOR backlog beyond the EXACT-only --auto-safe)."""
    try:
        with open(binp, "rb") as f:
            b = f.read()
    except OSError:
        return (0, 0, False)
    if len(b) == 0 or len(b) % 4:
        return (0, 0, False)
    nwords = len(b) // 4
    nptr = 0
    all_resolve = True
    for i in range(nwords):
        v = struct.unpack_from("<I", b, i * 4)[0]
        if v == 0:
            continue
        if ROM_LO <= v < ROM_HI:
            if resolve(v, addrs, by_addr) is None:
                all_resolve = False
            nptr += 1
    return (nptr, nwords, all_resolve)

def select_auto_dense(addrs, by_addr, frac=0.5):
    names = []
    for binp in sorted(glob.glob(os.path.join(RESID, "*.bin"))):
        name = os.path.basename(binp)[:-4]
        cpath, _, _ = find_wrapper(name)
        if not (cpath and os.path.exists(cpath)):
            continue
        with open(cpath, "r", errors="replace") as f:
            if "INCBIN" not in f.read():
                continue
        nptr, nwords, ok = table_density(binp, addrs, by_addr)
        if ok and nptr and nwords and (nptr / nwords) >= frac:
            names.append((nptr, name))
    names.sort(reverse=True)
    return names

def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    check = "--check" in sys.argv
    safe_only = "--safe-only" in sys.argv
    fe8u_safe = "--fe8u-safe" in sys.argv
    addrs, by_addr = load_syms()
    if "--reprocess" in sys.argv:
        # re-process raw .4byte literals stuck in already-de-pointered __asm__ blocks
        files = (sorted(glob.glob(os.path.join(ROOT, "src", "data", "*", "*.c"))) +
                 sorted(glob.glob(os.path.join(ROOT, "src", "data", "*_ref", "*.c"))))
        tot = 0
        for cf in files:
            try:
                tot += reprocess_asm_block(cf, addrs, by_addr, check)
            except Exception as e:
                print("  ERR %s: %s" % (cf, e))
        print("reprocess: %d stuck literals converted" % tot)
        return
    if "--src-slices" in sys.argv:
        # de-point the LINKED sliced src/data/<x>/<x>.c INCBIN_U8 sub-symbols
        files = sorted(glob.glob(os.path.join(ROOT, "src", "data", "*", "*.c")))
        tot_t = tot_p = 0
        for cf in files:
            nc, npx = rewrite_src_slices(cf, addrs, by_addr, check)
            if nc:
                tot_t += nc; tot_p += npx
                if check:
                    print("  %-60s +%d subsyms, %d ptrs" % (os.path.relpath(cf, ROOT), nc, npx))
        print("src-slices: %d sub-symbols de-pointered, %d pointers" % (tot_t, tot_p))
        return
    asm_only = "--asm" in sys.argv  # restrict fe8u-safe to asm-incbin tables
    if fe8u_safe and not args:
        # all live raw residual tables: still-INCBIN _ref .c OR incbin'd in asm
        for binp in sorted(glob.glob(os.path.join(RESID, "*.bin"))):
            name = os.path.basename(binp)[:-4]
            cpath, _, _ = find_wrapper(name)
            if cpath and os.path.exists(cpath):
                if asm_only:
                    continue
                with open(cpath, "r", errors="replace") as f:
                    if "INCBIN" in f.read():
                        args.append(name)
            elif asm_file_for(name):
                args.append(name)
        print("fe8u-safe: %d candidate tables" % len(args))
    if "--auto-safe" in sys.argv:
        sel = select_auto_safe(addrs, by_addr)
        print("auto-safe: %d tables, %d pointers" % (len(sel), sum(n for n, _ in sel)))
        args = [name for _, name in sel]
        if check:
            for n, name in sel:
                print("  %5d  %s" % (n, name))
            return
    if "--auto-dense" in sys.argv:
        frac = 0.5
        for a in sys.argv:
            if a.startswith("--frac="):
                frac = float(a.split("=", 1)[1])
        sel = select_auto_dense(addrs, by_addr, frac)
        print("auto-dense(frac>=%.2f): %d tables, %d pointers" % (frac, len(sel), sum(n for n, _ in sel)))
        args = [name for _, name in sel]
        if check:
            for n, name in sel:
                print("  %5d  %s" % (n, name))
            return
    if not args:
        sys.exit(__doc__)
    nconv = 0
    for name in args:
        cpath, binp, section = find_wrapper(name)
        if not os.path.exists(binp):
            print("SKIP %s: no .bin (%s)" % (name, binp)); continue
        allowed = None
        if fe8u_safe:
            allowed = fe8u_allowed(name)
            if allowed is None:
                allowed = (lambda O: False)   # no fe8u data -> EXACT-only (off==0) fallback
        if cpath is None:
            # D299: every asm/dat_*.s that incbins residual data is an EXCLUDED
            # placeholder (DATA_INCBIN_ASM_EXCLUDE) -- the symbol is LINKED from
            # src/data/<name>/<name>.c. Editing the asm file is a DEAD no-op that
            # still passes make compare but de-points NOTHING. Skip it. The correct
            # mechanism is the sliced src/data INCBIN_U8 rewriter (TODO), gated by
            # effectiveness verification against the linker object list.
            print("SKIP %s: asm-placeholder is excluded (de-point src/data instead -- D299)" % name)
            continue
        c, stats = emit_c(name, binp, section, addrs, by_addr, safe_only, allowed)
        if c is None:
            print("SKIP %s: %s" % (name, stats)); continue
        if check:
            print("=== %s (%s) ===" % (name, stats))
            print(c[:1500])
        else:
            if fe8u_safe and ("ptr=0 " in stats):
                continue
            with open(cpath, "w") as f:
                f.write(c)
            nconv += 1
            if not fe8u_safe:
                print("WROTE %s (%s) -> %s" % (name, stats, cpath))
    if fe8u_safe:
        print("fe8u-safe: wrote %d tables" % nconv)

if __name__ == "__main__":
    main()
