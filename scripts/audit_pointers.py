#!/usr/bin/env python3
"""
audit_pointers.py -- the SHIFTABILITY auditor (decomp axis #5).

A real decomp must contain NO hardcoded absolute ROM pointers in its source
data: every word that the engine dereferences as a pointer must be expressed
as a *symbol reference* so the linker relocates it when sections shift. Raw
.bin / .byte dumps bake in absolute addresses (0x08xxxxxx) -> the moment the
target shifts on rebuild, the pointer dangles and the game jumps to garbage.

This script scans every residual data blob that is INCBIN'd / .byte-dumped into
the ROM and counts the aligned 4-byte little-endian words that fall inside the
ROM address window (0x08000000..0x08FFFFFF, FE8 = 16 MiB). Each such word is a
candidate un-relocated pointer. Using the fully-linked ELF symbol table it
classifies each:

  EXACT    -- word == a defined symbol's address  (de-pointer to `.4byte SYM`)
  INTERIOR -- word inside [sym, sym+size)          (de-pointer to `SYM + off`)
  DANGLING -- no covering symbol in a ROM section  (needs a label created first)

Headline metric = un-relocated pointer words remaining. Target: 0.
This is ungameable: it reads the bytes that actually land in the ROM.
"""
import os, sys, struct, glob, subprocess, bisect, re, json, hashlib

IDENT = re.compile(r"^[A-Za-z_][A-Za-z0-9_]*$")  # valid C identifier

ROM_LO, ROM_HI = 0x08000000, 0x09000000
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ELF = os.path.join(ROOT, "fireemblem8.elf")
RELOCS_ELF = os.path.join(ROOT, "fireemblem8_relocs.elf")
SELFREF_EVIDENCE = os.path.join(
    ROOT, "scripts", "shiftcheck", "opaque_selfref_evidence.json")
RESID_GLOBS = [
    os.path.join(ROOT, "data", "residual", "*.bin"),
]

def load_elf_symbols(elf):
    """Return (sorted_addrs, addr->name, addr->size) for ROM-section symbols."""
    out = subprocess.check_output(
        ["arm-none-eabi-nm", "-S", "--defined-only", elf],
        text=True, errors="replace")
    addr2name, addr2size = {}, {}
    for line in out.splitlines():
        parts = line.split()
        # "addr size type name"  or  "addr type name"
        if len(parts) == 4:
            addr_s, size_s, typ, name = parts
            try:
                size = int(size_s, 16)
            except ValueError:
                size = 0
        elif len(parts) == 3:
            addr_s, typ, name = parts
            size = 0
        else:
            continue
        try:
            addr = int(addr_s, 16)
        except ValueError:
            continue
        if not (ROM_LO <= addr < ROM_HI):
            continue
        # Only GLOBAL definitions are linkable as a C `extern` reference target.
        # nm: uppercase = global/external; exclude U (undef) / A (abs) / N (debug).
        if (not typ.isupper()) or typ in ("U", "A", "N"):
            continue
        if not IDENT.match(name):  # skip .gcc2_compiled., $t/$d mapping symbols
            continue
        # prefer a "nicer" name over a generic data_/gap_/sub_ placeholder,
        # but keep an entry for every address either way
        if addr in addr2name:
            old = addr2name[addr]
            if _name_rank(name) < _name_rank(old):
                addr2name[addr] = name
            addr2size[addr] = max(addr2size.get(addr, 0), size)
        else:
            addr2name[addr] = name
            addr2size[addr] = size
    addrs = sorted(addr2name)
    return addrs, addr2name, addr2size

def _name_rank(n):
    # lower = preferred. real names beat placeholders.
    if n.startswith(("data_", "gap_", "sub_", "byte_", "off_", "unk_", "j_", "nullsub")):
        return 2
    return 0

def classify(ptr, addrs, addr2name, addr2size):
    i = bisect.bisect_right(addrs, ptr) - 1
    if i < 0:
        return ("DANGLING", None, 0)
    base = addrs[i]
    name = addr2name[base]
    if ptr == base:
        return ("EXACT", name, 0)
    size = addr2size.get(base, 0)
    off = ptr - base
    # if we know the size and ptr is within it, it's a clean interior pointer.
    if size and off < size:
        return ("INTERIOR", name, off)
    # unknown size: still inside *some* object (next symbol is further on);
    # treat as interior but flagged (may want a real label).
    if i + 1 < len(addrs):
        if ptr < addrs[i + 1]:
            return ("INTERIOR", name, off)
    return ("DANGLING", name, off)


_SRCDATA_INCBIN_BINS = None
def _srcdata_incbin_bins():
    """Residual .bin basenames still INCBIN'd by a linked src/data provider.

    The obsolete excluded asm mirrors were removed, so a .bin is raw debt iff
    its bytes enter the link verbatim from a live src/data source.
    """
    global _SRCDATA_INCBIN_BINS
    if _SRCDATA_INCBIN_BINS is None:
        out = subprocess.run(
            ["grep", "-rhoE", r'(INCBIN_U[0-9]+|\.incbin)\s*\(?\s*"data/residual/[A-Za-z0-9_.]+\.bin',
             os.path.join(ROOT, "src", "data")],
            capture_output=True, text=True, errors="replace").stdout
        bins = set()
        for line in out.splitlines():
            m = re.search(r'data/residual/([A-Za-z0-9_.]+\.bin)', line)
            if m:
                bins.add(m.group(1))
        _SRCDATA_INCBIN_BINS = bins
    return _SRCDATA_INCBIN_BINS

def is_live_raw(binpath):
    """A residual .bin is 'live raw data' (un-relocated debt) iff its raw bytes
    enter the link = it is INCBIN'd by a LINKED src/data source. De-pointered
    tables (.c rewritten to .4byte) and tables provided as relocated structs
    elsewhere (gClassData via data_classes.c) drop out automatically."""
    return os.path.basename(binpath) in _srcdata_incbin_bins()

_INCBIN_RANGES = None
def incbin_ranges(binname):
    """The byte ranges of a .bin that are STILL INCBIN'd (raw) in src/data -- a
    table can be PARTIALLY de-pointered (some sub-symbols rewritten to .4byte
    blocks, others still INCBIN), so counting the whole file double-counts the
    converted slices against the relocated total. Returns [(off, len), ...] or
    [(0, filesize)] for a whole-file INCBIN."""
    global _INCBIN_RANGES
    if _INCBIN_RANGES is None:
        _INCBIN_RANGES = {}
        # off/len may be HEX (0x108) or decimal. A decimal-only [0-9]+ mis-parsed a
        # hex-offset sliced INCBIN as a WHOLE-file incbin -> counted already-converted
        # __asm__-block words as still-raw (verified vs the linker: those offsets DO
        # carry R_ARM_ABS32 relocations). Accept 0x.. | decimal, parse with int(x, 0).
        # grep -E is POSIX ERE: NO (?:...) non-capturing groups (they break the pattern
        # so the optional offset group never matches -> false WHOLE). Use a plain hex/dec
        # char class for grep; the precise re.search below extracts/validates the numbers.
        out = subprocess.run(
            ["grep", "-rhoE",
             r'INCBIN_U[0-9]+\("data/residual/[A-Za-z0-9_.]+\.bin"'
             r'(\s*,\s*[0-9A-Fa-fxX]+\s*,\s*[0-9A-Fa-fxX]+)?',
             os.path.join(ROOT, "src", "data")],
            capture_output=True, text=True, errors="replace").stdout
        for line in out.splitlines():
            m = re.search(r'data/residual/([A-Za-z0-9_.]+\.bin)"(?:\s*,\s*(0[xX][0-9A-Fa-f]+|\d+)'
                          r'\s*,\s*(0[xX][0-9A-Fa-f]+|\d+))?', line)
            if not m:
                continue
            bn = m.group(1)
            if m.group(2) is not None:
                _INCBIN_RANGES.setdefault(bn, []).append((int(m.group(2), 0), int(m.group(3), 0)))
            else:
                _INCBIN_RANGES.setdefault(bn, "WHOLE")
    r = _INCBIN_RANGES.get(binname)
    return r

_OPAQUE_SYMS = None
def structureless_opaque_syms():
    """Return the set of GLOBAL symbols whose DEFINING OBJECT emits ZERO relocations in
    its own .data/.rodata sections -- i.e. a provably *structureless opaque data dump*
    (a raw INCBIN blob: graphics, sound, malloc/save-region data, a child boot image,
    etc.) that contains NO internal pointers of its own.

    A ROM-range word that resolves into the INTERIOR (off>=1) of such a symbol is a
    COINCIDENTAL constant, never a real data pointer -- exactly the same airtight logic
    the auditor already applies to FUNC-interior and ASSET-interior words, but driven by
    *positive structural evidence* (the linker's own reloc table) instead of a name regex.
    Nothing in the ROM stores a data pointer to a random byte in the middle of a sprite
    sheet, a sound sample, or a malloc heap blob; and a blob that DID carry a real pointer
    array would emit a .data/.rodata R_ARM_ABS32 for it (so it is NOT structureless and is
    excluded here -- a de-pointered table like data_080DC684 keeps its words classified).

    This is ungameable: it reads the linker's relocation records, not a hand-curated list.
    """
    global _OPAQUE_SYMS
    if _OPAQUE_SYMS is not None:
        return _OPAQUE_SYMS
    objs = []
    for root in (os.path.join(ROOT, "src", "data"),):
        for dp, _, fs in os.walk(root):
            for f in fs:
                if f.endswith(".o"):
                    objs.append(os.path.join(dp, f))
    # An object is "structured" iff it has >=1 R_ARM_ABS32 in a .data*/.rodata* section
    # (NOT .debug*, NOT .text). objdump -r on ONE file at a time so the section headers
    # are unambiguous (multi-file headers vary and mis-attribute records).
    structured_objs = set()
    for o in objs:
        out = subprocess.run(["arm-none-eabi-objdump", "-r", o],
                             capture_output=True, text=True, errors="replace").stdout
        in_data = False
        for line in out.splitlines():
            if line.startswith("RELOCATION RECORDS FOR ["):
                # extract the exact section name between [ and ] (NOT rstrip, which would
                # over-strip a name ending in ] or :).
                lb, rb = line.find("["), line.rfind("]")
                sec = line[lb + 1:rb] if lb >= 0 and rb > lb else ""
                in_data = ((".rodata" in sec or ".data" in sec)
                           and ".debug" not in sec and ".text" not in sec)
            elif in_data and "R_ARM_ABS32" in line:
                structured_objs.add(o)
                break
    # Restrict to symbols that are ACTUALLY in the linked ELF at a ROM address (the .o set
    # under src/data is a superset of what the manifest links; a symbol from a non-linked
    # placeholder .o must not enter the opaque set). The classify() target name set is the
    # ground truth of what is linked.
    elf_addrs, elf_a2n, _ = load_elf_symbols(ELF)
    elf_names = set(elf_a2n.values())
    # Map every GLOBAL symbol to its defining object; keep those in opaque (unstructured)
    # objects. nm --defined-only with file annotation.
    opaque = set()
    out = subprocess.run(["arm-none-eabi-nm", "-A", "--defined-only"] + objs,
                         capture_output=True, text=True, errors="replace").stdout
    for line in out.splitlines():
        # "path:addr type name"
        try:
            path, rest = line.split(":", 1)
        except ValueError:
            continue
        parts = rest.split()
        if len(parts) < 3:
            continue
        typ, name = parts[-2], parts[-1]
        if not IDENT.match(name):
            continue
        if path in structured_objs:
            continue
        # global/external defs only (uppercase), excluding absolute/undefined/debug -- same
        # filter as load_elf_symbols, so an A/U/N global can never enter the opaque set.
        if (not typ.isupper()) or typ in ("U", "A", "N"):
            continue
        if name in elf_names:
            opaque.add(name)
    _OPAQUE_SYMS = opaque
    return opaque


def _strip_c_comments_strings(txt):
    """Blank out /* */ block comments, // line comments and "..." string literals so a
    ROM address that appears only in a comment or an INCBIN path string is NOT mistaken
    for a live macro operand (e.g. frontier_df3_eventscr_ch's `STT_OBJECT(0x08A602F0)`
    mention lives in a comment, not code)."""
    txt = re.sub(r"/\*.*?\*/", " ", txt, flags=re.S)
    txt = re.sub(r"//[^\n]*", " ", txt)
    txt = re.sub(r'"(?:\\.|[^"\\])*"', '""', txt)
    return txt


_MACRO_ADDR_RE = re.compile(r"0x0?[89A-Fa-f][0-9A-Fa-f]{6}\b")
_MACRO_CALL_RE = re.compile(r"\b([A-Z][A-Z0-9_]{2,})\s*\(([^;{}]*?)\)")
_MACRO_SKIP = {"INCBIN_U8", "INCBIN_U16", "INCBIN_U32", "SECTION", "ASSERT",
               "STRUCT_PAD", "SHOULD_BE_CONST", "STATIC_ASSERT"}


def scan_macro_raw_ptr_debt(addrs, a2n, a2s):
    """Scan typed .c carves (event scripts / unit tables) for MACRO-form raw ROM-address
    operands -- CALL(0x08xxxxxx), LOAD1/2/3(n, 0x08xxxxxx), SVAL(slot, 0x08xxxxxx), etc.
    A macro operand that is a bare 0x08xxxxxx literal resolving to a linked data symbol is
    a BAKED pointer that escapes BOTH the .bin auditor (this is typed C, no .bin) AND the
    `.4byte`-literal scanner (it is an EA macro, not a `.4byte`). It must be rewritten to
    the symbolic form `SYM + off` so ld relocates it (byte-identical, shiftable).

    This is exactly the class that hid frontier_df3_ending_000's peers (D363): 8
    EventScr_*/UnitDef_*_ref carves baked CALL/LOAD/SVAL pointers into unit-def data and
    sibling event scripts. Comments, // lines and INCBIN path strings are stripped first.
    Returns a list of (relpath, macro, value, sym, off) for each still-raw pointer."""
    real = []
    for cf in glob.glob(os.path.join(ROOT, "src", "data", "**", "*.c"), recursive=True):
        try:
            txt = _strip_c_comments_strings(open(cf, errors="replace").read())
        except Exception:
            continue
        for m in _MACRO_CALL_RE.finditer(txt):
            macro, args = m.group(1), m.group(2)
            if macro in _MACRO_SKIP:
                continue
            for vm in _MACRO_ADDR_RE.finditer(args):
                v = int(vm.group(0), 16)
                if not (ROM_LO <= v < ROM_HI):
                    continue
                kind, sym, off = classify(v, addrs, a2n, a2s)
                if kind == "DANGLING":
                    continue   # no covering linked symbol -> not a provable pointer
                real.append((os.path.relpath(cf, ROOT), macro, v, sym, off))
    return real


def _int(v):
    return int(v, 0) if isinstance(v, str) else int(v)


def _sha256(data):
    return hashlib.sha256(data).hexdigest()


def _hit_sha256(hits):
    raw = "".join(f"{off:08X}:{value:08X}\n" for off, value in hits).encode()
    return _sha256(raw)


def _selfref_hits(blob, addr):
    return [
        (off, struct.unpack_from("<I", blob, off)[0])
        for off in range(0, len(blob) - 3, 4)
        if addr <= struct.unpack_from("<I", blob, off)[0] < addr + len(blob)
    ]


def load_opaque_selfref_evidence(path=SELFREF_EVIDENCE):
    with open(path, encoding="utf-8") as f:
        evidence = json.load(f)
    if evidence.get("version") != 1:
        raise ValueError(f"{path}: unsupported opaque-selfref evidence version")
    if not isinstance(evidence.get("resolved"), dict):
        raise ValueError(f"{path}: missing resolved evidence map")
    if not isinstance(evidence.get("exact_extents"), dict):
        raise ValueError(f"{path}: missing exact_extents evidence map")
    return evidence


def _strip_source_comments(txt):
    txt = re.sub(r"/\*.*?\*/", " ", txt, flags=re.S)
    txt = re.sub(r"//[^\n]*", " ", txt)
    txt = re.sub(r"(?m)^\s*@.*$", " ", txt)
    return txt


def _validate_incbin_provider(symbol, entry):
    errors = []
    provider = os.path.join(ROOT, entry["provider"])
    asset = entry["asset"]
    macro = entry["incbin_macro"]
    try:
        with open(provider, errors="replace") as f:
            txt = _strip_source_comments(f.read())
    except OSError as e:
        return [f"provider unreadable: {entry['provider']}: {e}"]
    pattern = (r"\b" + re.escape(symbol) + r"\s*\[\s*\].{0,600}?=\s*"
               + re.escape(macro) + r'\(\s*"' + re.escape(asset) + r'"\s*\)\s*;')
    if not re.search(pattern, txt, re.S):
        errors.append(
            f"provider no longer defines {symbol} with {macro}(\"{asset}\")")
    return errors


def _gba_lz77_decode(data):
    """Decode a BIOS-format 0x10 LZ stream; return (decoded, consumed input bytes)."""
    if len(data) < 4 or data[0] != 0x10:
        raise ValueError("missing GBA LZ77 0x10 header")
    decoded_size = int.from_bytes(data[1:4], "little")
    if decoded_size <= 0:
        raise ValueError("zero decoded size")
    out = bytearray()
    pos = 4
    while len(out) < decoded_size:
        if pos >= len(data):
            raise ValueError("truncated flag byte")
        flags = data[pos]
        pos += 1
        for bit in range(7, -1, -1):
            if len(out) >= decoded_size:
                break
            if flags & (1 << bit):
                if pos + 2 > len(data):
                    raise ValueError("truncated back-reference")
                a, b = data[pos], data[pos + 1]
                pos += 2
                count = (a >> 4) + 3
                distance = (((a & 0x0F) << 8) | b) + 1
                if distance > len(out):
                    raise ValueError("back-reference precedes decoded buffer")
                for _ in range(count):
                    out.append(out[-distance])
                    if len(out) >= decoded_size:
                        break
            else:
                if pos >= len(data):
                    raise ValueError("truncated literal")
                out.append(data[pos])
                pos += 1
    return bytes(out), pos


def _validate_common_selfref_facts(record, entry):
    errors = []
    expected_addr = _int(entry["address"])
    expected_size = _int(entry["size"])
    if record["address"] != expected_addr:
        errors.append(
            f"address changed: expected 0x{expected_addr:08X}, "
            f"got 0x{record['address']:08X}")
    if record["size"] != expected_size:
        errors.append(
            f"size changed: expected 0x{expected_size:X}, got 0x{record['size']:X}")
    if len(record["hits"]) != int(entry["hit_count"]):
        errors.append(
            f"hit count changed: expected {entry['hit_count']}, got {len(record['hits'])}")
    got_hit_hash = _hit_sha256(record["hits"])
    if got_hit_hash != entry["hit_sha256"]:
        errors.append(
            f"hit set changed: expected sha256 {entry['hit_sha256']}, got {got_hit_hash}")
    if "hits" in entry:
        expected_hits = [(_int(off), _int(value)) for off, value in entry["hits"]]
        if record["hits"] != expected_hits:
            errors.append("explicit hit offsets/values changed")
    return errors


def _validate_file_hash(path, expected, label):
    try:
        with open(os.path.join(ROOT, path), "rb") as f:
            data = f.read()
    except OSError as e:
        return None, [f"{label} unreadable: {path}: {e}"]
    actual = _sha256(data)
    if actual != expected:
        return data, [f"{label} hash changed: {path}: expected {expected}, got {actual}"]
    return data, []


def _validate_lz_selfref(record, entry):
    errors = _validate_incbin_provider(record["symbol"], entry)
    asset, hash_errors = _validate_file_hash(
        entry["asset"], entry["asset_sha256"], "compressed asset")
    errors.extend(hash_errors)
    _, source_errors = _validate_file_hash(
        entry["source_asset"], entry["source_asset_sha256"], "source image")
    errors.extend(source_errors)
    if asset is None:
        return errors
    if asset != record["bytes"]:
        errors.append("linked symbol bytes differ from the compressed asset")
    try:
        decoded, consumed = _gba_lz77_decode(asset)
    except ValueError as e:
        errors.append(f"invalid GBA LZ77 stream: {e}")
        return errors
    if len(decoded) != _int(entry["decoded_size"]):
        errors.append(
            f"decoded size changed: expected 0x{_int(entry['decoded_size']):X}, "
            f"got 0x{len(decoded):X}")
    if _sha256(decoded) != entry["decoded_sha256"]:
        errors.append("decoded payload hash changed")
    if consumed != _int(entry["consumed_size"]):
        errors.append(
            f"compressed bytes consumed changed: expected 0x{_int(entry['consumed_size']):X}, "
            f"got 0x{consumed:X}")
    for off, _ in record["hits"]:
        if off < 4 or off + 4 > consumed:
            errors.append(
                f"hit +0x{off:X} is not wholly inside the consumed compressed byte stream")
    return errors


def _validate_pcm_selfref(record, entry):
    errors = _validate_incbin_provider(record["symbol"], entry)
    asset, hash_errors = _validate_file_hash(
        entry["asset"], entry["asset_sha256"], "PCM asset")
    errors.extend(hash_errors)
    _, source_errors = _validate_file_hash(
        entry["source_asset"], entry["source_asset_sha256"], "AIFF source")
    errors.extend(source_errors)
    if asset is None:
        return errors
    if asset != record["bytes"]:
        errors.append("linked symbol bytes differ from the generated PCM asset")
    if len(asset) < 17:
        errors.append("DirectSound WaveData is shorter than its 16-byte header + data[1]")
        return errors
    wave_type_status, freq, loop_start, sample_count = struct.unpack_from("<4I", asset)
    expected_header = (
        _int(entry["wave_type_status"]),
        _int(entry["frequency"]),
        _int(entry["loop_start"]),
        _int(entry["sample_count"]),
    )
    if (wave_type_status, freq, loop_start, sample_count) != expected_header:
        errors.append("DirectSound WaveData header changed")
    if len(asset) != 17 + sample_count:
        errors.append(
            f"WaveData extent changed: size=0x{len(asset):X}, "
            f"expected data[1]+size = 0x{17 + sample_count:X}")
    if loop_start > sample_count:
        errors.append("WaveData loopStart exceeds sample count")
    header = os.path.join(ROOT, "include", "gba", "m4a_internal.h")
    try:
        with open(header, errors="replace") as f:
            htxt = _strip_source_comments(f.read())
    except OSError as e:
        errors.append(f"WaveData type definition unreadable: {e}")
    else:
        if not re.search(
                r"struct\s+WaveData\s*\{[^}]*u32\s+size\s*;"
                r"[^}]*s8\s+data\s*\[\s*1\s*\]\s*;", htxt, re.S):
            errors.append("struct WaveData no longer proves a 16-byte header + PCM byte payload")
    payload_end = 17 + sample_count
    for off, _ in record["hits"]:
        if off < 16 or off + 4 > payload_end:
            errors.append(
                f"hit +0x{off:X} is not wholly inside the DirectSound sample payload")
    return errors


def _source_identifier_uses(symbol):
    proc = subprocess.run(
        ["git", "-C", ROOT, "grep", "-l", "-w", symbol, "--", "src", "include", "asm"],
        capture_output=True, text=True, errors="replace")
    paths = proc.stdout.splitlines()
    uses = []
    ident = re.compile(r"\b" + re.escape(symbol) + r"\b")
    for rel in paths:
        path = os.path.join(ROOT, rel)
        try:
            with open(path, errors="replace") as f:
                txt = f.read()
        except OSError:
            continue
        txt = _strip_source_comments(txt)
        txt = re.sub(r'"(?:\\.|[^"\\])*"', '""', txt)
        txt = re.sub(r"'(?:\\.|[^'\\])*'", "''", txt)
        count = len(ident.findall(txt))
        if count:
            uses.append((rel, count))
    return uses


def _runtime_relocations_to_symbol(symbol):
    """Return non-debug relocations whose ROM slot targets symbol.

    Prefer the relocation-bearing final ELF used by shiftcheck. Its debug relocation
    offsets can numerically be enormous (the historical gUnkData_108 false consumer);
    only non-debug relocation sections with an r_offset in the ROM window count.
    """
    if not os.path.exists(RELOCS_ELF):
        return []
    out = subprocess.run(
        ["arm-none-eabi-readelf", "-rW", RELOCS_ELF],
        capture_output=True, text=True, errors="replace").stdout
    current = ""
    hits = []
    target_re = re.compile(r"(?:^|\s)" + re.escape(symbol) + r"(?:\s|$)")
    for line in out.splitlines():
        m = re.match(r"Relocation section '([^']+)'", line)
        if m:
            current = m.group(1)
            continue
        if not target_re.search(line) or ".debug" in current:
            continue
        parts = line.split()
        if not parts:
            continue
        try:
            offset = int(parts[0], 16)
        except ValueError:
            continue
        if ROM_LO <= offset < ROM_HI:
            hits.append((current, offset, line.strip()))
    return hits


def _object_runtime_relocations_to_symbol(object_path, symbol):
    out = subprocess.run(
        ["arm-none-eabi-objdump", "-r", object_path],
        capture_output=True, text=True, errors="replace").stdout
    current = ""
    hits = []
    target_re = re.compile(r"(?:^|\s)" + re.escape(symbol) + r"(?:[+\s]|$)")
    for line in out.splitlines():
        if line.startswith("RELOCATION RECORDS FOR ["):
            lb, rb = line.find("["), line.rfind("]")
            current = line[lb + 1:rb] if lb >= 0 and rb > lb else ""
            continue
        if ".debug" in current or not target_re.search(line):
            continue
        if "R_ARM_" in line:
            hits.append((current, line.strip()))
    return hits


def _validate_optional_fe8u_analogue(record, entry, evidence_notes):
    """Treat the sibling fe8u source as corroboration, never as a CI prerequisite."""
    errors = []
    fe8u_path = os.path.normpath(os.path.join(ROOT, entry["fe8u_provider"]))
    try:
        with open(fe8u_path, errors="replace") as f:
            fe8u = _strip_source_comments(f.read())
    except OSError:
        evidence_notes.append(
            f"optional fe8u corroboration unavailable: {entry['fe8u_provider']}; "
            "local definition/relocation/base-reference/hash proof remains authoritative")
        return errors

    fe8u_size = _int(entry["fe8u_size"])
    fe8u_pat = (r"\bCONST_DATA\s+u8\s+" + re.escape(record["symbol"])
                + r"\s*\[\s*" + re.escape(f"0x{fe8u_size:X}") + r"\s*\]\s*=\s*\{")
    if not re.search(fe8u_pat, fe8u, re.S):
        errors.append(
            f"present fe8u analogue contradicts evidence: expected flat inline "
            f"u8[0x{fe8u_size:X}]")
    return errors


def _validate_orphan_selfref(record, entry, rom, evidence_notes=None):
    errors = []
    if evidence_notes is None:
        evidence_notes = []
    provider = os.path.join(ROOT, entry["provider"])
    try:
        with open(provider, errors="replace") as f:
            txt = _strip_source_comments(f.read())
    except OSError as e:
        errors.append(f"orphan provider unreadable: {entry['provider']}: {e}")
    else:
        size = _int(entry["size"])
        pat = (r"\bu8\s+" + re.escape(record["symbol"]) + r"\s*\[\s*"
               + re.escape(f"0x{size:X}") + r"\s*\][^=;]*=\s*\{")
        if not re.search(pat, txt, re.S):
            errors.append("provider is no longer an inline flat u8[] definition")
    if _sha256(record["bytes"]) != entry["bytes_sha256"]:
        errors.append("linked orphan byte hash changed")

    uses = _source_identifier_uses(record["symbol"])
    if uses != [(entry["provider"], 1)]:
        errors.append(f"source consumers changed: expected definition only, got {uses}")

    if os.path.exists(RELOCS_ELF):
        relocs = _runtime_relocations_to_symbol(record["symbol"])
    else:
        provider_obj = os.path.splitext(provider)[0] + ".o"
        if not os.path.exists(provider_obj):
            errors.append(
                "cannot prove orphan relocation absence: neither "
                "fireemblem8_relocs.elf nor provider object exists")
            relocs = []
        else:
            relocs = _object_runtime_relocations_to_symbol(
                provider_obj, record["symbol"])
    if relocs:
        errors.append(f"runtime ROM relocations now target orphan: {relocs}")

    raw_base_slots = []
    for off in range(0, len(rom) - 3, 4):
        if struct.unpack_from("<I", rom, off)[0] == record["address"]:
            absolute = ROM_LO + off
            if not (record["address"] <= absolute < record["address"] + record["size"]):
                raw_base_slots.append(absolute)
    if raw_base_slots:
        errors.append(
            "raw aligned ROM words now target orphan base at "
            + ", ".join(f"0x{x:08X}" for x in raw_base_slots))

    errors.extend(_validate_optional_fe8u_analogue(
        record, entry, evidence_notes))
    return errors


def _object_section_size(path, section):
    out = subprocess.run(
        ["arm-none-eabi-objdump", "-h", path],
        capture_output=True, text=True, errors="replace").stdout
    for line in out.splitlines():
        parts = line.split()
        if len(parts) >= 3 and parts[1] == section:
            try:
                return int(parts[2], 16)
            except ValueError:
                return None
    return None


def _layout_addr(value):
    addr = int(value, 16)
    return addr if addr >= ROM_LO else ROM_LO + addr


def _validate_exact_extent(record, entry):
    errors = _validate_common_selfref_facts(record, entry)
    layout_path = os.path.join(ROOT, entry["layout"])
    expected_obj = f"{entry['object']}({entry['section']})"
    row_ok = False
    try:
        with open(layout_path, errors="replace") as f:
            for line in f:
                if not line.strip() or line.lstrip().startswith("#"):
                    continue
                parts = line.rstrip("\n").split("\t")
                if len(parts) >= 3:
                    if (_layout_addr(parts[0]) == record["address"]
                            and _layout_addr(parts[1]) == record["address"] + record["size"]
                            and parts[2] == expected_obj):
                        row_ok = True
                        break
    except OSError as e:
        errors.append(f"exact-extent layout unreadable: {entry['layout']}: {e}")
    if not row_ok:
        errors.append("exact provider layout row changed")
    obj_path = os.path.join(ROOT, entry["object"])
    obj_size = _object_section_size(obj_path, entry["section"])
    if obj_size != record["size"]:
        errors.append(
            f"provider object section extent changed: expected 0x{record['size']:X}, "
            f"got {None if obj_size is None else hex(obj_size)}")
    if not os.path.exists(os.path.join(ROOT, entry["source"])):
        errors.append(f"exact-extent source missing: {entry['source']}")
    if _sha256(record["bytes"]) != entry["bytes_sha256"]:
        errors.append("exact-extent linked byte hash changed")
    return errors


def scan_opaque_selfref_candidates(addrs, a2n, a2s, opaque_syms, rom, evidence):
    """Return exact records, unresolved-size skips, and every positive self-ref candidate.

    Critically, a zero-size ELF symbol is NEVER extended to the next unrelated global.
    A zero-size symbol is scanned only when `exact_extents` independently pins its source
    file, manifest row, object section and byte hash (currently sBanimEkrPopupProcNames).
    """
    tracked = set(evidence["resolved"]) | set(evidence["exact_extents"])
    records = {}
    skipped = []
    candidates = []
    for ad in sorted(addrs):
        nm = a2n[ad]
        if nm not in opaque_syms:
            continue
        size = a2s.get(ad, 0)
        if not size:
            exact = evidence["exact_extents"].get(nm)
            if exact is None:
                skipped.append((nm, ad))
                continue
            size = _int(exact["size"])
        fo = ad - ROM_LO
        if size < 4 or fo < 0 or fo + size > len(rom):
            if nm in tracked:
                records[nm] = {
                    "symbol": nm, "address": ad, "size": size, "bytes": b"", "hits": []}
            continue
        blob = rom[fo:fo + size]
        hits = _selfref_hits(blob, ad)
        record = {
            "symbol": nm, "address": ad, "size": size, "bytes": blob, "hits": hits}
        if hits or nm in tracked:
            records[nm] = record
        if hits:
            candidates.append(record)
    candidates.sort(key=lambda r: (len(r["hits"]), r["address"]))
    return records, skipped, candidates


def classify_opaque_selfrefs(records, skipped, candidates, evidence, rom):
    resolved = []
    unresolved = []
    candidate_names = {r["symbol"] for r in candidates}

    for symbol, entry in evidence["exact_extents"].items():
        record = records.get(symbol)
        if record is None:
            unresolved.append({
                "symbol": symbol, "address": _int(entry["address"]),
                "size": _int(entry["size"]), "hits": [],
                "errors": ["exact-size evidence symbol is no longer observable"]})
            continue
        errors = _validate_exact_extent(record, entry)
        if errors:
            item = dict(record)
            item["errors"] = errors
            unresolved.append(item)

    for record in candidates:
        symbol = record["symbol"]
        entry = evidence["resolved"].get(symbol)
        if entry is None:
            item = dict(record)
            item["errors"] = ["no narrow evidence-manifest entry"]
            unresolved.append(item)
            continue
        errors = _validate_common_selfref_facts(record, entry)
        evidence_notes = []
        category = entry.get("category")
        if category == "gba-lz77":
            errors.extend(_validate_lz_selfref(record, entry))
        elif category == "direct-sound-pcm":
            errors.extend(_validate_pcm_selfref(record, entry))
        elif category == "unreferenced-opaque-orphan":
            errors.extend(_validate_orphan_selfref(
                record, entry, rom, evidence_notes=evidence_notes))
        else:
            errors.append(f"unknown evidence category: {category!r}")
        item = dict(record)
        item["category"] = category
        item["provider"] = entry.get("provider")
        item["asset"] = entry.get("asset")
        if evidence_notes:
            item["evidence_notes"] = evidence_notes
        if errors:
            item["errors"] = errors
            unresolved.append(item)
        else:
            resolved.append(item)

    for symbol, entry in evidence["resolved"].items():
        if symbol in candidate_names:
            continue
        record = records.get(symbol)
        item = dict(record) if record is not None else {
            "symbol": symbol, "address": _int(entry["address"]),
            "size": _int(entry["size"]), "hits": []}
        item["errors"] = ["expected hit set disappeared or symbol is no longer opaque"]
        unresolved.append(item)

    return resolved, unresolved, skipped


def selfref_gate_count(unresolved):
    # Evidence drift with zero currently-observed words must still fail closed.
    return sum(max(1, len(item.get("hits", []))) for item in unresolved)


def main():
    if not os.path.exists(ELF):
        sys.exit(f"ELF not found: {ELF} (run `make` first)")
    addrs, addr2name, addr2size = load_elf_symbols(ELF)
    files = []
    for g in RESID_GLOBS:
        files.extend(sorted(glob.glob(g)))
    files = [f for f in files if is_live_raw(f)]

    tot = {"EXACT": 0, "INTERIOR": 0, "DANGLING": 0}
    per_file = []
    for path in files:
        with open(path, "rb") as f:
            b = f.read()
        n = len(b) // 4
        # only count words in byte ranges STILL INCBIN'd (raw); partially de-pointered
        # tables have some slices already converted to .4byte (counted as relocated).
        rngs = incbin_ranges(os.path.basename(path))
        def is_raw(off):
            if rngs == "WHOLE" or rngs is None:
                return True
            return any(o <= off < o + ln for (o, ln) in rngs)
        c = {"EXACT": 0, "INTERIOR": 0, "DANGLING": 0}
        for i in range(n):
            if not is_raw(i * 4):
                continue
            v = struct.unpack_from("<I", b, i * 4)[0]
            if ROM_LO <= v < ROM_HI:
                kind, _, _ = classify(v, addrs, addr2name, addr2size)
                c[kind] += 1
        npt = c["EXACT"] + c["INTERIOR"] + c["DANGLING"]
        if npt:
            for k in tot:
                tot[k] += c[k]
            per_file.append((npt, c, len(b), os.path.basename(path)))

    per_file.sort(key=lambda r: r[0], reverse=True)
    grand = tot["EXACT"] + tot["INTERIOR"] + tot["DANGLING"]
    print("== SHIFTABILITY AUDIT (axis #5) ==")
    print("COMPLETION CRITERION (D305, user-ratified): the REAL-POINTER GATE")
    print("  (`audit_pointers.py --true-debt --gate`) = 0, NOT the literal count below.")
    print("  The literal raw-0x08xxxxxx count is unreachable-to-0: a GBA ROM legitimately")
    print("  holds non-pointer constants in 0x08000000-0x09000000 (gfx pixels, packed")
    print("  bitfields, sine/sound data) -- relocating them would corrupt the shifted game.")
    print(f"un-relocated ROM-pointer words remaining : {grand}   (RAW word count incl. "
          f"coincidental constants -- NOT the completion gate; see --true-debt --gate)")
    print(f"  EXACT    (-> .4byte SYM)        : {tot['EXACT']}")
    print(f"  INTERIOR (-> SYM + offset)      : {tot['INTERIOR']}")
    print(f"  DANGLING (needs a label first)  : {tot['DANGLING']}")
    print(f"files containing un-relocated pointers   : {len(per_file)}")
    print()
    print("== top 30 files by pointer count (E/I/D) ==")
    for npt, c, sz, name in per_file[:30]:
        print(f"  {npt:>5}  E{c['EXACT']:>4} I{c['INTERIOR']:>4} D{c['DANGLING']:>4}  {sz:>7}B  {name}")

    if "--list-clean" in sys.argv:
        print()
        print("== fully-EXACT-resolvable tables (every pointer at a symbol boundary) ==")
        for npt, c, sz, name in per_file:
            if c["DANGLING"] == 0 and c["INTERIOR"] == 0:
                print(f"  {npt:>5}  {sz:>7}B  {name}")

    if "--metrics" in sys.argv:
        print()
        emit_metrics(grand)

    true_debt_gate = 0
    if "--true-debt" in sys.argv:
        print()
        true_debt_gate = emit_true_debt()
    return 1 if "--gate" in sys.argv and true_debt_gate else 0


# ---- formal tracked metrics (axes #5 SHIFTABILITY and #6 ASSET EDITABILITY) ----

GFX_HINTS = ("Map", "Tile", "Object", "Chr", "Pal", "Gfx", "Img", "Sprite",
             "Anim", "OBJ", "_gf", "Reel", "Portrait", "Icon")

def live_raw_bin(binpath):
    return is_live_raw(binpath)

def count_relocated_data_ptrs():
    """ABS32 relocations RESIDING in data sections (.rodata/.data) across the
    committed objects (src/ AND asm/) -- the already-shiftable data pointers (the
    'done' side of axis #5). asm/ is included because de-pointered asm-incbin
    tables emit their .4byte relocations into asm/*.o."""
    objs = []
    for root in (os.path.join(ROOT, "src"), os.path.join(ROOT, "asm")):
        for dp, _, fs in os.walk(root):
            for f in fs:
                if f.endswith(".o"):
                    objs.append(os.path.join(dp, f))
    total = 0
    for i in range(0, len(objs), 400):
        out = subprocess.run(["arm-none-eabi-objdump", "-r"] + objs[i:i+400],
                             capture_output=True, text=True, errors="replace").stdout
        in_data = False
        for line in out.splitlines():
            if line.startswith("RELOCATION RECORDS FOR ["):
                sec = line.split("[", 1)[1].rstrip("]:")
                in_data = (".rodata" in sec or ".data" in sec) and ".text" not in sec
            elif in_data and "R_ARM_ABS32" in line:
                total += 1
    return total

_GFX_RE = re.compile(
    r'Img|Tsa|Pal|Chr|Gfx|Sprite|Anim|banim|Map|Tile|Portrait|Icon|_gf|OBJ|'
    r'Reel|Sheet|BG|Frames|Obj|Menu|Lz|Comp|song|wave|sound', re.I)

def coincidental_floor():
    """ROM-range words in GRAPHICS/sound blobs are coincidental constants (pixel/
    sample bytes that happen to land in 0x08xxxxxx) -- they are NOT pointers, are
    never dereferenced as addresses, and CANNOT be relocated. Counting them as
    'hardcoded pointers' is a false positive, so report them separately: the real
    shiftability debt is the NON-graphics (logic) un-relocated words."""
    floor = 0
    for binp in glob.glob(os.path.join(ROOT, "data", "residual", "*.bin")):
        if not is_live_raw(binp):
            continue
        name = os.path.basename(binp)[:-4]
        if not _GFX_RE.search(name):
            continue
        with open(binp, "rb") as f:
            b = f.read()
        for i in range(len(b) // 4):
            v = struct.unpack_from("<I", b, i * 4)[0]
            if ROM_LO <= v < ROM_HI:
                floor += 1
    return floor

def emit_metrics(unrelocated):
    # axis #5 SHIFTABILITY
    relocated = count_relocated_data_ptrs()
    total_ptr = relocated + unrelocated
    shift_pct = (100.0 * relocated / total_ptr) if total_ptr else 100.0
    gfx_floor = coincidental_floor()
    real_debt = unrelocated - gfx_floor
    real_total = relocated + real_debt
    real_pct = (100.0 * relocated / real_total) if real_total else 100.0
    # axis #6 ASSET EDITABILITY (opaque raw-incbin data bytes)
    opaque_bytes = opaque_files = gfx_b = gfx_n = struct_b = struct_n = 0
    for binp in glob.glob(os.path.join(ROOT, "data", "residual", "*.bin")):
        if not live_raw_bin(binp):
            continue
        sz = os.path.getsize(binp)
        opaque_bytes += sz; opaque_files += 1
        base = os.path.basename(binp)
        if any(k in base for k in GFX_HINTS):
            gfx_b += sz; gfx_n += 1
        else:
            struct_b += sz; struct_n += 1
    print("== TRACKED METRICS: SHIFTABILITY (#5) + ASSET EDITABILITY (#6) ==")
    print(f"5. SHIFTABILITY (data ptrs) : {shift_pct:6.2f}%  "
          f"({relocated}/{total_ptr} data pointers are relocatable symbol refs; "
          f"{unrelocated} still hardcoded absolute ROM addresses)  -> target 100% (0 hardcoded)")
    print(f"5b. REAL-pointer shiftability: {real_pct:6.2f}%  "
          f"({relocated}/{real_total}; {real_debt} REAL hardcoded pointers remain, "
          f"excluding {gfx_floor} coincidental constants in graphics/sound blobs "
          f"-- not pointers, never relocatable)  -> target 100%")
    print(f"6. ASSET EDITABILITY        :  opaque raw-incbin data = {opaque_bytes} bytes "
          f"in {opaque_files} blobs  -> target: only irreducible binary assets")
    print(f"     - structured/logic-class (should be typed C): {struct_b} bytes, {struct_n} blobs")
    print(f"     - graphics/anim-class (legit binary, like fe8u .4bpp/.bin): {gfx_b} bytes, {gfx_n} blobs")
    print("The headline target is ungameable: 0 hardcoded pointers, 0 opaque structured blobs.")


def emit_true_debt():
    """Definitive classification of every remaining hardcoded ROM-range word via
    the fe8u oracle, to separate the TRUE real-pointer debt from the coincidental
    constants the byte-level auditor cannot distinguish (a 0x08xxxxxx stat/flag
    field is not a pointer and can never be relocated). Slow (per-word fe8u). """
    import bisect, re as _re
    sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
    import fe8u_ptr_offsets as F
    gfx = _re.compile(r'Img|Tsa|Pal|Chr|Gfx|Sprite|Anim|banim|Map|Tile|Portrait|'
                      r'Icon|_gf|OBJ|Reel|Sheet|BG|Frames|Obj|Menu|Lz|Comp|song|wave|sound', _re.I)
    smap = {}
    for cf in glob.glob(os.path.join(ROOT, "src", "data", "*", "*.c")):
        t = open(cf, errors="replace").read()
        for m in _re.finditer(r'u8\s+(\w+)\s*\[\s*\]\s*__attribute__\(\(section\("([^"]+)"\)\)\)'
                              r'\s*=\s*INCBIN_U8\("data/residual/([A-Za-z0-9_.]+\.bin)"'
                              r'(?:\s*,\s*(0[xX][0-9A-Fa-f]+|\d+)\s*,\s*(0[xX][0-9A-Fa-f]+|\d+))?\)', t):
            sym, sec, binn, off, ln = m.groups()
            smap.setdefault(binn, []).append((sym, sec, int(off, 0) if off else 0, ln))
    # PER-WORD fe8u oracle: for each hardcoded word, find its JP address (from the
    # sliced sub-symbol's .data.residue.<ADDR> section, or a data_<addr> name) and
    # ask fe8u whether it relocates there. Precise (spans symbol boundaries).
    real = coinc = bunk = 0
    realhits = []  # (name, off, jp) of fe8u-confirmed-real still-raw words
    blindhits = []  # (name, off, jp, value) of fe8u-blind still-raw words
    for b in glob.glob(os.path.join(ROOT, "data", "residual", "*.bin")):
        if not is_live_raw(b): continue
        name = os.path.basename(b)[:-4]
        if gfx.search(name): continue
        d = open(b, "rb").read()
        slices = smap.get(name + ".bin")
        nm = _re.match(r'(?:data|gUnkData|gap)_([0-9A-Fa-f]{6,8})$', name)
        # match the main scan's word set: only bytes STILL INCBIN'd (raw)
        rngs = incbin_ranges(os.path.basename(b))
        def _is_raw(off, _r=rngs):
            if _r == "WHOLE" or _r is None: return True
            return any(o <= off < o + ln for (o, ln) in _r)
        for i in range(len(d) // 4):
            if not _is_raw(i * 4): continue
            v = struct.unpack_from("<I", d, i * 4)[0]
            if not (ROM_LO <= v < ROM_HI): continue
            O = i * 4; jp = None
            if slices:
                for (sym, sec, off, ln) in slices:
                    ln = int(ln, 0) if ln else len(d) - off
                    if off <= O < off + ln:
                        # the bin maps to the section's residue base, so the word at
                        # bin-offset O is simply at base + O (the earlier `+ (O-off)`
                        # under-counted off>0 slices by their bin offset).
                        mm = _re.search(r'residue\.([0-9A-Fa-f]{6,8})', sec)
                        if mm: jp = int(mm.group(1), 16) + O
                        break
            elif nm:
                jp = int(nm.group(1), 16) + O
            r = F.fe8u_ptr_at_jp(jp) if jp is not None else None
            if r is True: real += 1; realhits.append((name, O, jp))
            elif r is False: coinc += 1
            else: bunk += 1; blindhits.append((name, O, jp, v))
    if "--list-real" in sys.argv:
        print("== fe8u-confirmed REAL still-raw words (convertible) ==")
        for (n, O, jp) in realhits:
            print(f"  {n}  off={O}  jp=0x{jp:08X}")
    if "--list-blind" in sys.argv:
        addrs, a2n, a2s = load_elf_symbols(ELF)
        # STT_FUNC name set: a word pointing into a function's INTERIOR (off>0, into
        # code) is structurally a coincidental constant, never a real data pointer.
        fnames = set()
        ro = subprocess.run(["arm-none-eabi-readelf", "-sW", ELF],
                            capture_output=True, text=True, errors="replace").stdout
        for ln in ro.splitlines():
            p = ln.split()
            if len(p) >= 8 and p[3] == "FUNC":
                fnames.add(p[7])
        _asset = _re.compile(r'Img|Tsa|Pal|Chr|Gfx|Sprite|Anim|banim|Map|Tile|Portrait|'
                             r'Icon|_gf|OBJ|Reel|Sheet|BG|Frames|Obj|Lz|Comp|song|wave|'
                             r'sound|DirectSound|^pad_|^gap_|frontier_', _re.I)
        from collections import Counter as _C
        kc = _C(); amb = []
        print("== fe8u-blind words: structural classification ==")
        for (n, O, jp, v) in blindhits:
            kind, sym, off = classify(v, addrs, a2n, a2s)
            if kind == "EXACT": cat = "EXACT (real ptr)"
            elif kind == "DANGLING": cat = "unresolved"
            elif sym in fnames: cat = "FUNC-interior (coincidental)"
            elif _asset.search(sym): cat = "ASSET-interior (coincidental)"
            else: cat = "DATA-interior (ambiguous)"; amb.append((n, O, v, sym, off))
            kc[cat] += 1
        print("  total fe8u-blind: %d" % len(blindhits))
        for k, c in kc.most_common(): print("   %-32s %d" % (k, c))
        print("  DATA-interior (ambiguous) words:")
        for (n, O, v, sym, off) in amb:
            print(f"   {n} off=0x{O:X} val=0x{v:08X} -> {sym}+0x{off:X}")
    # Structurally sub-classify the fe8u-blind bucket. A word whose value points into
    # the INTERIOR of a function (off>0, into code) is a coincidental constant -- never
    # a real data pointer (airtight). The remainder (DATA-interior) is ambiguous; per-
    # table spot checks (UnitDef level bitfields, gSinLookup, gap filler, the gUnkData_*
    # 18-21KB blobs whose sparse 0x08xx words hit random Img/banim/pad interiors) show
    # it is dominated by coincidental constants, but it is not exhaustively RE-proven.
    elfaddrs, _a2n, _a2s = load_elf_symbols(ELF)
    _fn = set()
    _ro = subprocess.run(["arm-none-eabi-readelf", "-sW", ELF],
                         capture_output=True, text=True, errors="replace").stdout
    for ln in _ro.splitlines():
        p = ln.split()
        if len(p) >= 8 and p[3] == "FUNC":
            _fn.add(p[7])
    # interior-of-an-asset: a word pointing INTO (off>0) a graphics/sound/anim/pad/
    # carved-blob symbol is a coincidental constant -- you never store a pointer to the
    # middle of a sprite sheet, sound sample, or padding (same logic as FUNC-interior).
    asset_re = _re.compile(r'Img|Tsa|Pal|Chr|Gfx|Sprite|Anim|banim|Map|Tile|Portrait|'
                           r'Icon|_gf|OBJ|Reel|Sheet|BG|Frames|Obj|Lz|Comp|song|wave|'
                           r'sound|DirectSound|^pad_|^gap_|frontier_', _re.I)
    # rom-header / ROM-base target: nothing stores a DATA pointer into the cartridge
    # header -- this is the UnitDef record-start case (packed {pid,jid,leader,bitfield};
    # bitfield byte 0x08 makes the u32 read 0x080000xx, nearest sym = rom_header).
    romhdr_re = _re.compile(r'^rom_header|^RomHeader|^gCartridge|^AgbMain')
    # a word whose containing blob is a gap_/code region carries literal-pool pointers
    # (real, but belong to the CODE-decompilation axis -- they relocate when the
    # surrounding Thumb function is decompiled, not via data de-pointering).
    code_re = _re.compile(r'^gap_|^pad_')
    # blobs POSITIVELY identified as graphics/tilemap (fe8u annotation + JP usage) whose
    # name doesn't match the gfx regex -> their 0x08xxxxxx words are coincidental pixel/
    # tile constants, same as any Img_/Chr_ blob. Evidence per blob:
    #   gUnkData_85, gUnkData_91 : fe8u variables.h annotates `// gfx`
    #   gUnkData_47             : chapter-title background gfx (PutChapterTitleBGAlt)
    #   gUnkData_26             : tilemap -- CallARM_FillTileRect(gBG2TilemapBuffer, .., ..)
    GFX_BLOBS = {"gUnkData_85", "gUnkData_91", "gUnkData_47", "gUnkData_26"}
    # struct UnitDefinition (stride 0x14) has exactly ONE pointer: redas @ 0x08. A
    # ROM-range word in a UnitDef_* table at any other offset (mod 0x14) is a packed
    # field (pid/jid/bitfield/coords/items/ai) that coincidentally reads 0x08xxxxxx --
    # provably not a pointer (positive struct evidence). A real redas (O%0x14==0x08)
    # stays classified as real.
    udef_re = _re.compile(r'^g?UnitDef')
    # interior of a STRUCTURELESS opaque blob (object with no .data/.rodata relocs of its
    # own) is coincidental -- positive structural evidence (the linker's reloc table), the
    # same airtight logic as FUNC-/ASSET-interior. Covers the opaque graphics/sound/malloc/
    # save blobs that lost their asset-hint name during the honest data/residual migration
    # (e.g. data_08BB8ED0 malloc region, data_086068D0 Bolting-bg gfx) whose name does not
    # match asset_re. A blob carrying a real pointer array emits a reloc -> excluded here.
    opaque_syms = structureless_opaque_syms()
    blind_func = blind_asset = blind_hdr = blind_code = blind_udef = blind_data = blind_exact = blind_unres = blind_opaque = 0
    real_data = []
    for (n, O, jp, v) in blindhits:
        kind, sym, off = classify(v, elfaddrs, _a2n, _a2s)
        if kind == "EXACT": blind_exact += 1; real_data.append((n, O, v, sym, off))
        elif kind == "DANGLING": blind_unres += 1
        # a word in a UnitDef_* table at a non-redas offset is a packed field
        # (pid/jid/bitfield/coords/items/ai), coincidental REGARDLESS of what it resolves
        # to -- must take precedence over the func+1 rule (a packed byte run can equal
        # func+1 by chance). Likewise the cart header.
        elif romhdr_re.search(sym): blind_hdr += 1
        elif udef_re.search(n) and (O % 0x14) != 0x08: blind_udef += 1
        # func+1 is a REAL thumb function pointer (the +1 is the Thumb bit, D303), not a
        # coincidental mid-code constant -- it is convertible (.4byte func+1). Only off>1
        # into a function's body is coincidental.
        elif sym in _fn and off == 1: blind_data += 1; real_data.append((n, O, v, sym, off))
        elif sym in _fn: blind_func += 1
        elif asset_re.search(sym): blind_asset += 1
        elif n in GFX_BLOBS: blind_asset += 1   # word in a fe8u-confirmed gfx/tilemap blob
        elif code_re.search(n): blind_code += 1
        # interior (off>=1) of a structureless opaque blob TARGET -> coincidental constant
        # (positive structural evidence: the target object emits no .data/.rodata reloc, so
        # it has no internal pointers; nothing legitimately points into its middle).
        elif off >= 1 and sym in opaque_syms: blind_opaque += 1
        # a word held BY a structureless opaque SOURCE blob (malloc/save region, cart
        # header, gfx/anim dump -- its own object emits no reloc) that resolves to an
        # INTERIOR (off>=1) of ANY symbol is a coincidental constant: e.g. data_08BB8ED0
        # malloc bytes reading as a voicegroup interior, the data_081A6774 gfx dump reading
        # as a character-endings interior, rom_header ARM-copy code words.
        #   SAFETY (vs the valid "an un-de-pointered REAL table also has no reloc" objection):
        #   the off>=1 guard means a real pointer to a structured table START (off==0) is
        #   NEVER masked -- it stays REAL below. A real *intra-blob* pointer table (which
        #   targets interiors) is independently cleared by TWO oracles already run green on
        #   this ROM: (1) the fe8u oracle confirms 0 of these words relocate in the US decomp
        #   (the gold standard keeps these exact regions as raw binary assets -- e.g. the
        #   data_08606D84 "ascending self-refs" are Img_BoltingBg battle-anim/TSA data, not
        #   pointers), and (2) `make shiftcheck` finds 0 HIGH-confidence coherent unrelocated
        #   pointer tables (it classes them [D] BLOB-INTERNAL self-references = embedded data).
        elif off >= 1 and n in opaque_syms: blind_opaque += 1
        else: blind_data += 1; real_data.append((n, O, v, sym, off))
    struct_coinc = coinc + blind_func + blind_asset + blind_hdr + blind_udef + blind_opaque
    # BLIND SPOT (found 2026-06-27): raw `.4byte 0x08xxxxxx` literals stuck in already-
    # de-pointered __asm__ blocks are NOT in any live .bin range, so the loop above never
    # saw them. Scan src/ for them and classify structurally (no fe8u: per-literal JP addr
    # is involved). NB this still cannot see pointers inside COMPRESSED data (Huffman text,
    # LZ77 banim/gfx) -- those need decompression+typed-asset extraction, see D306.
    stuck_real, stuck_coinc = _scan_stuck_asm_literals(elfaddrs, _a2n, _a2s, _fn, asset_re,
                                                       romhdr_re, opaque_syms)
    struct_coinc += stuck_coinc
    # BLIND SPOT (found 2026-07-10, D363): baked pointers in MACRO-form operands of typed
    # event/unit carves -- CALL/LOAD/SVAL(0x08xxxxxx) -- are invisible to BOTH the .bin
    # word loop (typed C, no .bin) AND the .4byte-literal scan (an EA macro, not `.4byte`).
    # Scan them directly; each resolving to a linked symbol is REAL relocatable debt.
    macro_real = scan_macro_raw_ptr_debt(elfaddrs, _a2n, _a2s)
    # BLIND SPOT (found 2026-07-10, D362 follow-up): a raw-INCBIN/opaque byte provider
    # (any dir, incl. graphics/) can BAKE self-pointers in its own interior with no reloc.
    # Decode every positive-size opaque symbol, then require each hit-set to match narrow,
    # reproducible evidence. Unknown hit-sets and any evidence drift are hard-gated.
    # Never invent a zero-size symbol extent by stretching it to the next global.
    _rom = None
    for _rp in (os.path.join(ROOT, "fireemblem8.gba"), os.path.join(ROOT, "baserom.gba")):
        if os.path.exists(_rp):
            _rom = open(_rp, "rb").read(); break
    selfref_resolved = []
    selfref_unresolved = []
    selfref_skipped = []
    if _rom:
        selfref_evidence = load_opaque_selfref_evidence()
        selfref_records, selfref_skipped, selfref_candidates = (
            scan_opaque_selfref_candidates(
                elfaddrs, _a2n, _a2s, opaque_syms, _rom, selfref_evidence))
        selfref_resolved, selfref_unresolved, selfref_skipped = classify_opaque_selfrefs(
            selfref_records, selfref_skipped, selfref_candidates, selfref_evidence, _rom)
    else:
        selfref_unresolved = [{
            "symbol": "<ROM unavailable>", "address": 0, "size": 0, "hits": [],
            "errors": ["cannot scan opaque self-references without fireemblem8.gba/baserom.gba"]}]
    resolved_selfref_words = sum(len(item["hits"]) for item in selfref_resolved)
    unresolved_selfref_words = sum(len(item["hits"]) for item in selfref_unresolved)
    selfref_evidence_notes = [
        (item["symbol"], note)
        for item in selfref_resolved + selfref_unresolved
        for note in item.get("evidence_notes", [])
    ]
    skipped_anim_sprites = sum(
        1 for symbol, _ in selfref_skipped if symbol.startswith("AnimSprite_"))
    selfref_gate = selfref_gate_count(selfref_unresolved)
    # completion gate: confirmed-real + unclassified DATA-pointer debt (code-axis excluded)
    gate = (real + blind_data + blind_exact + blind_unres + len(stuck_real)
            + len(macro_real) + selfref_gate)
    print("== SHIFTABILITY true debt (fe8u oracle + structural classification) ==")
    print(f"  raw 0x08xxxxxx words classified                      : {len(blindhits)+coinc+real}")
    print(f"  coincidental constants (never relocatable)           : {struct_coinc}")
    print(f"     fe8u-confirmed {coinc} + FUNC-interior {blind_func} + "
          f"ASSET-interior {blind_asset} + ROM-header {blind_hdr} + UnitDef-field {blind_udef} "
          f"+ opaque-blob-interior {blind_opaque}")
    print(f"  CODE-axis literal pools (relocate on code decomp)    : {blind_code}")
    print(f"  fe8u-confirmed REAL data ptr still raw (convertible)  : {real}")
    print(f"  unclassified DATA-interior / EXACT / dangling        : {blind_data + blind_exact + blind_unres}")
    print(f"  stuck .4byte literals in __asm__ blocks, REAL         : {len(stuck_real)}  "
          f"(auditor-blind until 2026-06-27)")
    print(f"  MACRO-form raw ptr in typed carves, REAL             : {len(macro_real)}  "
          f"(auditor-blind until 2026-07-10, D363)")
    print(f"  opaque SELF-REF embedded-data floors, RESOLVED       : "
          f"{len(selfref_resolved)} symbols / {resolved_selfref_words} hit words")
    print(f"  opaque SELF-REF unresolved review candidates, GATED  : "
          f"{len(selfref_unresolved)} symbols / {unresolved_selfref_words} hit words")
    print(f"  zero-size opaque symbols skipped (no exact extent)   : "
          f"{len(selfref_skipped)} ({skipped_anim_sprites} AnimSprite_*)")
    for symbol, note in selfref_evidence_notes:
        print(f"  EVIDENCE NOTE [{symbol}]: {note}")
    print(f"  => COMPLETION GATE (confirmed-real + unclassified)    : {gate}")
    print(f"  NOTE: aligned words inside consumed LZ/PCM input are payload bytes, not")
    print(f"  pointer slots. The evidence manifest validates format, provenance, byte hash,")
    print(f"  exact size and hit set; any drift becomes unresolved and fails this gate.")
    print(f"  SCOPE: the self-ref gate covers exact nonzero ELF extents plus independently")
    if selfref_skipped:
        print(f"  proven exact extents; zero-size symbols above remain an explicit blind spot.")
    else:
        print(f"  proven exact extents; no zero-size opaque symbols lack an exact extent.")
    if "--gate" in sys.argv:
        print("  -- residual real/unclassified DATA-pointer words (.bin) --")
        for (n, O, v, sym, off) in real_data:
            print(f"     {n} off=0x{O:X} val=0x{v:08X} -> {sym}+0x{off:X}")
        print("  -- real pointers stuck in __asm__ .4byte literals --")
        from collections import Counter as _C2
        for f, c in _C2(f for (f, v, s, o, k) in stuck_real).most_common(20):
            print(f"     {c:4d}  {f}")
        print("  -- MACRO-form raw ROM-addr pointers still not symbolized --")
        for (rp, macro, v, sym, off) in macro_real:
            print(f"     {rp}: {macro}(0x{v:08X}) -> {sym}+0x{off:X}")
        print("  -- evidence-resolved opaque embedded-data self-refs --")
        for item in selfref_resolved:
            asset = f" asset={item['asset']}" if item.get("asset") else ""
            print(f"     [{item['category']}] {item['symbol']} "
                  f"@0x{item['address']:08X} size=0x{item['size']:X} "
                  f"provider={item.get('provider')}{asset}")
            for off, value in item["hits"]:
                print(f"        +0x{off:X} value=0x{value:08X} "
                      f"(self+0x{value - item['address']:X})")
        print("  -- UNRESOLVED opaque self-ref candidates (gate failures) --")
        for item in selfref_unresolved:
            print(f"     {item['symbol']} @0x{item['address']:08X} "
                  f"size=0x{item['size']:X}")
            for off, value in item.get("hits", []):
                print(f"        +0x{off:X} value=0x{value:08X} "
                      f"(self+0x{value - item['address']:X})")
            for error in item["errors"]:
                print(f"        ERROR: {error}")
    return gate


def _scan_stuck_asm_literals(addrs, a2n, a2s, fn, asset_re, romhdr_re, opaque_syms=None):
    """Scan src/ for raw `.4byte 0x08xxxxxx` literals stuck in __asm__ blocks (the .bin
    auditor is blind to these -- the table no longer INCBINs its .bin). Classify each
    structurally: EXACT (off==0) / thumb-fn (FUNC+1) = REAL; func-interior(off>1) /
    asset-interior / rom-header / structureless-opaque-blob-interior / dangling =
    coincidental; other data-interior = REAL (conservative). Returns (real_list,
    coinc_count).

    opaque_syms (from structureless_opaque_syms()) lets a literal resolving into the
    interior of a provably structureless opaque blob be classified coincidental on
    positive evidence: e.g. EvtTextShow(msgid) words 0x08XX1B20 (cmd 0x1B20 + JP msgid),
    OAM/sprite words, the multiboot child-image ARM words, and map-change tile data --
    all land in data_08C01928 / REDA / opaque-blob interiors (no internal pointers), so
    they are constants, not pointers. A REAL pointer table emits a reloc -> not opaque ->
    stays REAL (the data_08A15984 ProcScr / data_080DC684 tables we de-pointered)."""
    opaque_syms = opaque_syms or set()
    real = []; coinc = 0
    try:
        files = subprocess.run(["grep", "-rlE", r'\.4byte 0x08[0-9A-Fa-f]{6}',
                                os.path.join(ROOT, "src")],
                               capture_output=True, text=True).stdout.split()
    except Exception:
        return real, coinc
    for cf in files:
        if not cf.endswith(".c"):
            continue   # the linked source is the .c; .s are excluded placeholders
        base = os.path.basename(cf)[:-2]
        try:
            txt = open(cf, errors="replace").read()
        except Exception:
            continue
        for m in re.finditer(r'\.4byte (0x08[0-9A-Fa-f]{6})\b', txt):
            v = int(m.group(1), 16)
            kind, sym, off = classify(v, addrs, a2n, a2s)
            if kind == "DANGLING": coinc += 1; continue
            if sym in fn and off == 1: real.append((base, v, sym, off, "THUMBFN")); continue
            if sym in fn and off > 1: coinc += 1; continue
            if romhdr_re.search(sym) or asset_re.search(sym): coinc += 1; continue
            if off == 0: real.append((base, v, sym, off, "EXACT")); continue
            # a word INSIDE (off>=1) a STRUCTURELESS opaque blob is a coincidental constant:
            # the EvtTextShow(msgid) words 0x08XX1B20 (cmd 0x1B20 + JP msgid), OAM/sprite
            # words, multiboot child-image ARM words, and map-change tile data all land in
            # data_08C01928 / REDA-interior. off>=1 only -> a real pointer to a structured
            # table START (off==0) stays REAL above, so genuine debt is never masked.
            if sym in opaque_syms: coinc += 1; continue
            real.append((base, v, sym, off, "DATA-int"))
    return real, coinc


if __name__ == "__main__":
    sys.exit(main())
