#!/usr/bin/env python3
"""Deterministic BLOCKING graphics/source-format invariant audit (issue #143).

Why this exists: `make compare`'s SHA-1 oracle proves the ROM's BYTES are
correct, but it says nothing about whether the COMMITTED EDITABLE SOURCE that
produced those bytes is itself well-formed. A malformed PNG (wrong mode,
mis-aligned dimensions, an out-of-range pixel index that `gbagfx` would
silently truncate), a JASC `.pal` with a wrong declared color count, or a
`.tsa.bin`/`.map.bin` with a corrupt header can all currently still pass
`make compare` by accident (e.g. because the byte in question doesn't happen
to change the final compressed/linked bytes this build). This script is a
second, source-level gate: it decodes every tracked graphics source (and the
generated artifacts a full, self-contained build produces from it) and
enforces the invariants documented in docs/decomp_agent_playbook.md and
re-derived directly from tools/gbagfx + scripts/gfxtools/tsa_generator.py.

Never touches baserom.gba. Wired as `graphicscheck` in the Makefile, which
`compare` depends on (see Makefile) so it always runs against a fresh,
fully-built tree -- never racing the asset-generation rules.

Usage:
    python3 scripts/audit_graphics_forms.py [--root ROOT]

Exits 0 and prints exhaustive coverage counts with zero defects, or exits 1
and prints every offender (including anything that falls into an "unknown"
classification bucket -- an unclassifiable asset is a HARD FAILURE, not a
silent skip).
"""
import argparse
import os
import re
import struct
import subprocess
import sys

from PIL import Image

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
DEFAULT_ROOT = os.path.dirname(SCRIPT_DIR)

# Named, reasoned exceptions to the two `.tsa.bin` size formulas (docs/decomp_agent_playbook.md
# lever: "3 native CallARM_FillTileRect .tsa.bin exceptions"). These use a still-unreverse-engineered
# convention distinct from both the dimensioned-header and dimensioned-header+trailing-zero-word
# forms. This set must stay EXACTLY these 3 paths until separate RE resolves them -- both a missing
# and an extra path are audit failures (drift guard).
TSA_NAMED_EXCEPTIONS = frozenset({
    "graphics/misc_gfx2/gTsa_UnkData_0.tsa.bin",
    "graphics/misc/gMenuSoundroom_4.tsa.bin",
    "graphics/misc/gUnkData_26.tsa.bin",
})

# The six live btl_bg FETSA3/FEIMG3 pairs whose editable source is a plain linear 4bpp tile-strip
# PNG (NOT a TSA screen-image) -- see graphics/btl_bg/btl_bg.mk "wave-2 (axis #6)". btl_bg_59 is
# DELIBERATELY excluded: it shares the same PNG->4bpp->cp pipeline but its `.fetsa3.bin` is never
# incbin'd anywhere (only `_tiles`/`_palette` are referenced, no `_map`) -- it has no live tilemap
# consumer, so it is not part of the paired-tilemap invariant. This set must stay exactly these six
# until the underlying btl_bg.mk wiring changes (drift guard both ways).
BTL_BG_FETSA_PAIRS = (14, 27, 33, 55, 58, 60)
BTL_BG_FEIMG_BYTES = 13312  # 416 tiles * 32 bytes/tile
BTL_BG_FEIMG_TILES = 416
BTL_BG_FETSA_BYTES = 1200  # 30 * 20 entries * 2 bytes/entry
BTL_BG_FETSA_ENTRIES = 600
FETSA_BLANK_SENTINEL = 1023  # 0x3FF, --max_empty_index / method-3 blank marker


class Failure(Exception):
    """A single, reported audit defect. Collected, never raised to abort early."""


class Report:
    """Accumulates PASS counts per bucket and FAIL messages; used for the final verdict."""

    def __init__(self):
        self.counts = {}
        self.failures = []

    def count(self, bucket, n=1):
        self.counts[bucket] = self.counts.get(bucket, 0) + n

    def fail(self, msg):
        self.failures.append(msg)

    def ok(self):
        return not self.failures


# --------------------------------------------------------------------------
# git / filesystem helpers
# --------------------------------------------------------------------------

def git_ls_files(root, pattern):
    out = subprocess.run(
        ["git", "-C", root, "ls-files", "-z", pattern],
        capture_output=True, text=True, check=True,
    ).stdout
    return sorted(p for p in out.split("\0") if p)


def read_text(path):
    with open(path, "r", encoding="utf-8", errors="replace") as f:
        return f.read()


# --------------------------------------------------------------------------
# Lightweight Makefile/*.mk static-rule parsing (NOT a full GNU Make evaluator --
# just enough to build a reliable png -> consumer classification without
# fragile basename-only guessing). See classify_pngs() for how this is used.
# --------------------------------------------------------------------------

_VAR_ASSIGN_RE = re.compile(r"^([A-Za-z_][A-Za-z0-9_]*)\s*(?::=|\+=|=)\s*(.*)$")
_VAR_REF_RE = re.compile(r"\$\(([A-Za-z_][A-Za-z0-9_]*)\)")


def _resolve_vars(text):
    """Resolve simple `VAR := literal` / `VAR = literal` assignments and substitute
    `$(VAR)` references textually. This is intentionally NOT a full Make evaluator
    (no functions, no recursion tracking beyond a fixed-point loop) -- it only
    needs to handle the flat directory-prefix variables actually used in this
    repo's graphics/*.mk (e.g. `MOVEUNITGFXDIR_D307 := graphics/unit_icon/move`).
    """
    variables = {}
    for line in text.splitlines():
        m = _VAR_ASSIGN_RE.match(line)
        if m:
            variables[m.group(1)] = m.group(2).strip()

    def substitute(s):
        for _ in range(8):  # fixed-point: vars may reference other vars
            new_s = _VAR_REF_RE.sub(lambda m: variables.get(m.group(1), m.group(0)), s)
            if new_s == s:
                return new_s
            s = new_s
        return s

    return [substitute(line) for line in text.splitlines()]


def find_makefile_sources(root):
    paths = [os.path.join(root, "Makefile")]
    paths += sorted(
        os.path.join(dirpath, f)
        for dirpath, _dirs, files in os.walk(os.path.join(root, "graphics"))
        for f in files
        if f.endswith(".mk")
    )
    return paths


_RULE_LINE_RE = re.compile(r"^([^\s:#][^:]*?)\s*(&?):\s*(.*?)\s*(?:;.*)?$")


_FEIMG_METHOD_RE = re.compile(r"\.feimg(\d+)\.bin")


def parse_explicit_fetsatool_pngs(root):
    """Return {png_path: method_or_None} for every PNG that is the PREREQUISITE
    of an explicit (non-generic-pattern) tsa_generator.py ($(FETSATOOL)) rule --
    i.e. a rule whose target(s) are literal paths (no `%`) and whose recipe
    invokes the tool. This covers both same-basename grouped rules
    (graphics/btl_bg/btl_bg_1.mk-style) and the renamed-output rules
    (graphics/misc_gfx/Tsa_OpAnimEphraim.bin: .../OpAnimEphraim.png) where the
    generic `%.feimgN.bin %.fetsaN.bin &: %.png` basename-matching heuristic
    cannot find the PNG (the output name doesn't match the input). `method` is
    the N in the recipe's `.feimgN.bin` output arg (tsa_generator.py's dedup
    algorithm selector -- see scripts/gfxtools/tsa_generator.py
    extract_suffix_from_filename); None if no `.feimgN.bin` token is found
    (falls back to the method-1/default per-tile invariant).
    """
    explicit_png_methods = {}
    for path in find_makefile_sources(root):
        lines = _resolve_vars(read_text(path))
        for i, line in enumerate(lines):
            if not line.strip() or line.startswith("#") or line.startswith("\t"):
                continue
            m = _RULE_LINE_RE.match(line)
            if not m:
                continue
            targets_str, _amp, prereqs_str = m.groups()
            if "%" in targets_str:
                continue  # generic pattern rule; handled by disk-presence matching
            prereq_tokens = prereqs_str.split()
            png_prereqs = [t for t in prereq_tokens if t.endswith(".png")]
            if not png_prereqs:
                continue
            # Recipe is either after `;` on the same line, or the next line(s) starting with a tab.
            recipe = line.split(";", 1)[1] if ";" in line else ""
            j = i + 1
            while not recipe and j < len(lines) and lines[j].startswith("\t"):
                recipe += lines[j]
                j += 1
            # NOTE: _resolve_vars() already expanded $(FETSATOOL) to its definition
            # (`$(PYTHON) scripts/gfxtools/tsa_generator.py`), so match on the
            # script name rather than the pre-expansion macro text.
            if "tsa_generator.py" not in recipe and "FETSATOOL" not in recipe:
                continue
            method_match = _FEIMG_METHOD_RE.search(recipe)
            method = int(method_match.group(1)) if method_match else None
            for png in png_prereqs:
                norm = os.path.normpath(png)
                explicit_png_methods[norm] = method
    return explicit_png_methods


_NUM_TILES_RE = re.compile(r"-num_tiles\s+(\d+)")


def parse_num_tiles_overrides(root):
    """Return {generated_4bpp_path: num_tiles} for every explicit static-pattern
    rule of the form `TARGET.4bpp: %.4bpp: %.png` whose recipe passes -num_tiles N.
    """
    overrides = {}
    for path in find_makefile_sources(root):
        lines = _resolve_vars(read_text(path))
        for i, line in enumerate(lines):
            stripped = line.strip()
            if not stripped.endswith(": %.4bpp: %.png"):
                continue
            target = stripped.split(":", 1)[0].strip()
            if i + 1 < len(lines):
                m = _NUM_TILES_RE.search(lines[i + 1])
                if m:
                    overrides[os.path.normpath(target)] = int(m.group(1))
    return overrides


# --------------------------------------------------------------------------
# PNG classification
# --------------------------------------------------------------------------

def classify_pngs(root):
    """Classify every tracked PNG into exactly one bucket:
      - 'generic_4bpp' / 'generic_1bpp' / 'generic_8bpp': feeds the plain gbagfx
        pixel-chain (png -> .Nbpp -> .Nbpp.lz -> incbin).
      - 'fetsatool': consumed by scripts/gfxtools/tsa_generator.py (dedup'd TSA
        tile image + tilemap), either via the generic %.feimgN.bin %.fetsaN.bin
        &: %.png pattern (basename match) or an explicit renamed-output rule.
      - 'palette_only': the PNG's only build consumer is the generic
        %.gbapal: %.png rule (its own embedded PLTE is the palette source; no
        pixel data from it is otherwise used).
      - 'documentation_preview': tracked but NOT a build input at all (lives
        outside graphics/, referenced by no Makefile rule). Currently exactly
        one file; asserted as a drift guard, never silently ignored.
      - 'unknown': none of the above. HARD FAILURE (see main()).
    Returns (buckets, fetsatool_methods): buckets is dict bucket -> list of png
    paths (relative to root); fetsatool_methods is {png_path: method_int_or_None}
    for every png in the 'fetsatool' bucket (the tsa_generator.py dedup
    algorithm N, from `.feimgN.bin` -- selects which per-tile pixel invariant
    applies, see check_fetsatool_png()).
    """
    pngs = git_ls_files(root, "*.png")
    explicit_fetsatool = parse_explicit_fetsatool_pngs(root)

    buckets = {
        "generic_4bpp": [], "generic_1bpp": [], "generic_8bpp": [],
        "fetsatool": [], "palette_only": [], "documentation_preview": [],
        "unknown": [],
    }
    fetsatool_methods = {}

    for png in pngs:
        abspath = os.path.join(root, png)
        base = abspath[:-len(".png")]
        norm = os.path.normpath(png)

        has_1bpp = os.path.exists(base + ".1bpp")
        has_4bpp = os.path.exists(base + ".4bpp")
        has_8bpp = os.path.exists(base + ".8bpp")
        matched_method = next(
            (n for n in range(1, 5)
             if os.path.exists(base + f".feimg{n}.bin") and os.path.exists(base + f".fetsa{n}.bin")),
            None,
        )
        has_gbapal = os.path.exists(base + ".gbapal")

        if norm in explicit_fetsatool:
            buckets["fetsatool"].append(png)
            fetsatool_methods[png] = explicit_fetsatool[norm]
        elif has_4bpp:
            buckets["generic_4bpp"].append(png)
        elif has_1bpp:
            buckets["generic_1bpp"].append(png)
        elif has_8bpp:
            buckets["generic_8bpp"].append(png)
        elif matched_method is not None:
            buckets["fetsatool"].append(png)
            fetsatool_methods[png] = matched_method
        elif has_gbapal:
            buckets["palette_only"].append(png)
        elif not png.startswith("graphics/"):
            buckets["documentation_preview"].append(png)
        else:
            buckets["unknown"].append(png)

    return buckets, fetsatool_methods


# --------------------------------------------------------------------------
# Basic PNG validity (item 2, applies to every tracked PNG regardless of bucket)
# --------------------------------------------------------------------------

def check_png_basic(path):
    """Return None if OK, else an error string. Decodable, mode P or L, dims
    multiples of 8 (GBA tile size)."""
    try:
        im = Image.open(path)
        im.load()
    except Exception as e:  # noqa: BLE001 - report any decode error as a defect
        return f"not decodable: {e}"
    if im.mode not in ("P", "L"):
        return f"unsupported mode {im.mode!r} (only P/L accepted)"
    w, h = im.size
    if w % 8 != 0 or h % 8 != 0:
        return f"dimensions {w}x{h} not multiples of 8"
    return None


# --------------------------------------------------------------------------
# Generic 4bpp round-trip (GBA 8x8 tile order, verified against tools/gbagfx/gfx.c
# ConvertToTiles4Bpp + the invertColors semantics for non-palette (L-mode) images)
# --------------------------------------------------------------------------

def png_to_tiles_4bpp(path, num_tiles=None):
    """Compute the exact bytes gbagfx's `%.4bpp: %.png` rule would produce:
    tile order is row-major over 8x8 tiles (top-to-bottom, left-to-right);
    within a tile, 8 rows top-to-bottom, each row packed 2 pixels/byte (low
    nibble = even x, high nibble = odd x). L-mode (non-palette) images have
    their index INVERTED (value' = 15 - value) -- gbagfx's `invertColors =
    !hasPalette`. If num_tiles is given, only that many tiles (in the same
    order) are produced (gbagfx's default `-num_tiles` NUM_TILES_IGNORE mode
    truncates unconditionally, regardless of what the discarded tail contains).
    """
    im = Image.open(path)
    if im.mode not in ("P", "L"):
        raise ValueError(f"unsupported mode {im.mode!r}")
    invert = im.mode == "L"
    w, h = im.size
    if w % 8 != 0 or h % 8 != 0:
        raise ValueError(f"dimensions {w}x{h} not multiples of 8")
    px = im.load()
    tiles_w, tiles_h = w // 8, h // 8
    n = num_tiles if num_tiles is not None else tiles_w * tiles_h
    out = bytearray()
    count = 0
    for ty in range(tiles_h):
        for tx in range(tiles_w):
            if count >= n:
                return bytes(out)
            for row in range(8):
                y = ty * 8 + row
                for col in range(4):
                    x0 = tx * 8 + col * 2
                    x1 = x0 + 1
                    v0 = px[x0, y] & 0xF
                    v1 = px[x1, y] & 0xF
                    if invert:
                        v0 = 15 - v0
                        v1 = 15 - v1
                    out.append((v1 << 4) | v0)
            count += 1
    return bytes(out)


def check_generic_4bpp(png_path, bpp_path, num_tiles=None):
    """Return None if OK, else an error string."""
    try:
        expected = png_to_tiles_4bpp(png_path, num_tiles)
    except Exception as e:  # noqa: BLE001
        return f"failed to compute expected tile bytes: {e}"
    try:
        with open(bpp_path, "rb") as f:
            actual = f.read()
    except OSError as e:
        return f"cannot read generated {bpp_path}: {e}"
    if num_tiles is not None:
        expected_size = num_tiles * 32
        if len(actual) != expected_size:
            return (f"-num_tiles {num_tiles} expects {expected_size} bytes, "
                     f"generated file has {len(actual)}")
    if actual != expected:
        first_diff = next((i for i in range(min(len(actual), len(expected)))
                            if actual[i] != expected[i]), None)
        return (f"tile-order nibble mismatch vs PNG indices "
                 f"(len actual={len(actual)} expected={len(expected)}, "
                 f"first diff at byte {first_diff})")
    return None


# --------------------------------------------------------------------------
# FETSATOOL PNG source invariants (per-tile pixel range; tsa_generator.py
# requires mode P strictly, and packs each tile via `& 0xF` -- a source pixel
# value >= 16 anywhere in a tile would be silently corrupted, not rejected)
# --------------------------------------------------------------------------

def check_fetsatool_png(path, method=None):
    """Return None if OK, else an error string.

    tsa_generator.py has TWO distinct per-tile pixel conventions depending on
    dedup method (extract_suffix_from_filename's N from the `.feimgN.bin` output
    arg):
      - method None/1 (process_tiles_method1, banim): `convert_to_4bpp` masks
        each pixel with `& 0xF` directly -- every pixel in the source PNG must
        already be < 16, or the mask silently corrupts it.
      - method 2/3/4 (scripts/gfxtools/tsa2.py CheckTile): each tile can use ANY
        of 16 "palette banks" of 16 colors (up to 256 total across the whole
        image -- confirmed empirically against every tracked btl_bg/opanim
        source: e.g. graphics/btl_bg/btl_bg_0.png tile (0,1) uses indices
        {65,67,69,72,73,74}, all bank 4 = value // 16). `pal_id = tile[0] // 16`
        and `original = tile - pal_id*16` are computed PER TILE, so the real
        invariant is that every pixel within a single tile shares the same
        `value // 16` bank (not that the raw value is < 16) -- a tile mixing
        two banks would have its pal_id computed from pixel [0] only and every
        other-bank pixel silently corrupted by the same subtraction.
    """
    try:
        im = Image.open(path)
        im.load()
    except Exception as e:  # noqa: BLE001
        return f"not decodable: {e}"
    if im.mode != "P":
        return f"FETSATOOL requires mode P, got {im.mode!r}"
    w, h = im.size
    if w % 8 != 0 or h % 8 != 0:
        return f"dimensions {w}x{h} not multiples of 8"
    px = im.load()
    tiles_w, tiles_h = w // 8, h // 8
    banked = method in (2, 3, 4)
    for ty in range(tiles_h):
        for tx in range(tiles_w):
            if banked:
                banks = set()
                for row in range(8):
                    y = ty * 8 + row
                    for col in range(8):
                        banks.add(px[tx * 8 + col, y] // 16)
                if len(banks) > 1:
                    return (f"tile ({tx},{ty}) mixes palette banks {sorted(banks)} "
                             f"(method {method}: pal_id is derived from a single pixel "
                             f"per tile, so a tile must use only ONE 16-color bank)")
            else:
                for row in range(8):
                    y = ty * 8 + row
                    for col in range(8):
                        x = tx * 8 + col
                        v = px[x, y]
                        if v > 15:
                            return (f"tile ({tx},{ty}) pixel ({x},{y}) has index {v} "
                                     f">15: 4bpp packing (method {method}) would "
                                     f"silently truncate it")
    return None


def decode_tile_ids_le16(data):
    """Decode a little-endian u16 stream, returning (tile_id, raw_word) pairs.
    tile_id is the low 10 bits (bits 0-9); matches both scripts/gfxtools/tsa2.py's
    Tile.from_bytes bit layout and the plain little-endian encoding used by
    tsa_generator.py's process_tiles_method1 (banim)."""
    if len(data) % 2 != 0:
        raise ValueError(f"odd length {len(data)}, not a whole number of u16 entries")
    out = []
    for i in range(0, len(data), 2):
        word = data[i] | (data[i + 1] << 8)
        out.append((word & 0x3FF, word))
    return out


def check_fetsa_tile_bounds(fetsa_path, num_tiles_in_feimg):
    """Return None if OK, else an error string. Every decoded tile_id must be
    < num_tiles_in_feimg, except the FETSA_BLANK_SENTINEL (1023) blank marker."""
    with open(fetsa_path, "rb") as f:
        data = f.read()
    try:
        entries = decode_tile_ids_le16(data)
    except ValueError as e:
        return str(e)
    for idx, (tile_id, _word) in enumerate(entries):
        if tile_id != FETSA_BLANK_SENTINEL and tile_id >= num_tiles_in_feimg:
            return (f"entry {idx}: tile_id {tile_id} out of bounds "
                     f"(feimg has {num_tiles_in_feimg} tiles, sentinel is {FETSA_BLANK_SENTINEL})")
    return None


# --------------------------------------------------------------------------
# Palette invariants (item 3): JASC .pal header/count validity, source -> .gbapal
# channel conversion (gbagfx WriteGbaPalette: DOWNCONVERT_BIT_DEPTH(x) = x / 8).
# --------------------------------------------------------------------------

class JascPalError(ValueError):
    pass


def parse_jasc_pal(path):
    """Parse a JASC-PAL file per tools/gbagfx/jasc_pal.c's exact grammar (CRLF
    line endings, "JASC-PAL"/"0100" header, declared count on line 3 must equal
    the actual number of trailing color lines, no garbage after). Returns a list
    of (r, g, b) tuples. Raises JascPalError with a precise reason otherwise."""
    with open(path, "rb") as f:
        data = f.read()
    if b"\r\n" not in data and b"\n" in data:
        raise JascPalError("no CRLF line endings found (gbagfx requires \\r\\n)")
    lines = data.split(b"\r\n")
    if lines and lines[-1] == b"":
        lines = lines[:-1]
    else:
        raise JascPalError("file does not end with a terminated CRLF line")
    if len(lines) < 3:
        raise JascPalError(f"only {len(lines)} lines, need at least signature+version+count")
    if lines[0] != b"JASC-PAL":
        raise JascPalError(f"bad signature {lines[0]!r}")
    if lines[1] != b"0100":
        raise JascPalError(f"unsupported version {lines[1]!r}")
    try:
        declared = int(lines[2])
    except ValueError:
        raise JascPalError(f"cannot parse declared color count from {lines[2]!r}")
    if not (1 <= declared <= 256):
        raise JascPalError(f"declared count {declared} outside [1, 256]")
    color_lines = lines[3:]
    if len(color_lines) != declared:
        raise JascPalError(
            f"declared count {declared} does not match actual color line count {len(color_lines)}")
    colors = []
    for line in color_lines:
        parts = line.split(b" ")
        if len(parts) != 3:
            raise JascPalError(f"malformed color line {line!r}")
        try:
            r, g, b = (int(p) for p in parts)
        except ValueError:
            raise JascPalError(f"non-integer color component in {line!r}")
        if not (0 <= r <= 255 and 0 <= g <= 255 and 0 <= b <= 255):
            raise JascPalError(f"color component out of [0,255] in {line!r}")
        colors.append((r, g, b))
    return colors


def read_png_plte(path):
    """Parse the raw PNG PLTE chunk directly (independent of Pillow's palette
    handling) to get the exact, non-padded (r,g,b) list gbagfx's ReadPngPalette
    (png_get_PLTE) would see."""
    with open(path, "rb") as f:
        data = f.read()
    if data[:8] != b"\x89PNG\r\n\x1a\n":
        raise ValueError("not a PNG (bad signature)")
    pos = 8
    while pos + 8 <= len(data):
        length = int.from_bytes(data[pos:pos + 4], "big")
        ctype = data[pos + 4:pos + 8]
        cdata = data[pos + 8:pos + 8 + length]
        if ctype == b"PLTE":
            if length % 3 != 0:
                raise ValueError(f"PLTE length {length} not a multiple of 3")
            return [tuple(cdata[i:i + 3]) for i in range(0, length, 3)]
        pos += 8 + length + 4
    raise ValueError("no PLTE chunk found")


def expected_gbapal_bytes(colors):
    out = bytearray()
    for (r, g, b) in colors:
        word = (r // 8) | ((g // 8) << 5) | ((b // 8) << 10)
        out += struct.pack("<H", word)
    return bytes(out)


def check_gbapal_roundtrip(colors, gbapal_path):
    """Return None if OK, else an error string."""
    expected = expected_gbapal_bytes(colors)
    try:
        with open(gbapal_path, "rb") as f:
            actual = f.read()
    except OSError as e:
        return f"cannot read generated {gbapal_path}: {e}"
    if actual != expected:
        return (f"channel-conversion mismatch (expected {len(expected)} bytes, "
                 f"got {len(actual)}; first diff at "
                 f"{next((i for i in range(min(len(actual), len(expected))) if actual[i] != expected[i]), 'n/a')})")
    return None


# --------------------------------------------------------------------------
# .tsa.bin invariants (item 4): scripts/tmap2tsa.py / scripts/gfxtools/tsa2.py
# TSA.to_bytes(with_dimensions=True) format: 2-byte header (width-1, height-1),
# payload (w+1)*(h+1)*2 bytes. A second observed form appends one extra zero
# u16 word (48 files); 3 named files use a different, not-yet-reverse-engineered
# convention and are explicit, asserted exceptions (see TSA_NAMED_EXCEPTIONS).
# --------------------------------------------------------------------------

def classify_tsa_bin(path, rel_path):
    """Returns one of 'exact', 'plus2', 'named_exception', or ('unknown', reason)."""
    if rel_path in TSA_NAMED_EXCEPTIONS:
        return ("named_exception", None)
    with open(path, "rb") as f:
        data = f.read()
    if len(data) < 2:
        return ("unknown", f"file too short ({len(data)} bytes, need >= 2 for header)")
    w, h = data[0], data[1]
    expected = 2 + (w + 1) * (h + 1) * 2
    if len(data) == expected:
        return ("exact", None)
    if len(data) == expected + 2 and data[-2:] == b"\x00\x00":
        return ("plus2", None)
    return ("unknown", f"size {len(data)} matches neither exact ({expected}) "
                        f"nor +2-trailing-zero ({expected + 2}) form for header w={w} h={h}")


# --------------------------------------------------------------------------
# .map.bin invariants (item 4): banim/opanim/FETSATOOL families intentionally
# omit dimensions. even length; every decoded 10-bit tile_id <= 1023 (a decode
# regression guard -- the mask is a tautology today, but it exercises the exact
# same little-endian-u16 decode path scan_relocs-style tools rely on, and would
# catch a future change that widens the tile-id field beyond 10 bits).
# --------------------------------------------------------------------------

def check_map_bin(path):
    """Return None if OK, else an error string."""
    with open(path, "rb") as f:
        data = f.read()
    if len(data) % 2 != 0:
        return f"odd length {len(data)}"
    for tile_id, _word in decode_tile_ids_le16(data):
        if tile_id > 1023:
            return f"decoded tile_id {tile_id} > 1023"  # unreachable given the 10-bit mask; kept as a guard
    return None


# --------------------------------------------------------------------------
# The six live btl_bg FETSA3/FEIMG3 paired assets (item 4)
# --------------------------------------------------------------------------

def check_btl_bg_pair(root, n, report):
    feimg = os.path.join(root, "graphics", "btl_bg", f"btl_bg_{n}.feimg3.bin")
    fetsa = os.path.join(root, "graphics", "btl_bg", f"btl_bg_{n}.fetsa3.bin")
    for path, label in ((feimg, "feimg3"), (fetsa, "fetsa3")):
        if not os.path.exists(path):
            report.fail(f"btl_bg_{n}.{label}.bin: MISSING generated artifact at {path}")
            return
    feimg_size = os.path.getsize(feimg)
    fetsa_size = os.path.getsize(fetsa)
    if feimg_size != BTL_BG_FEIMG_BYTES:
        report.fail(f"btl_bg_{n}.feimg3.bin: size {feimg_size} != expected {BTL_BG_FEIMG_BYTES} "
                    f"({BTL_BG_FEIMG_TILES} tiles)")
    if fetsa_size != BTL_BG_FETSA_BYTES:
        report.fail(f"btl_bg_{n}.fetsa3.bin: size {fetsa_size} != expected {BTL_BG_FETSA_BYTES} "
                    f"({BTL_BG_FETSA_ENTRIES} entries, 30x20)")
    if feimg_size == BTL_BG_FEIMG_BYTES and fetsa_size == BTL_BG_FETSA_BYTES:
        err = check_fetsa_tile_bounds(fetsa, BTL_BG_FEIMG_TILES)
        if err:
            report.fail(f"btl_bg_{n}.fetsa3.bin: {err}")
        else:
            report.count("btl_bg_pair_ok")


# --------------------------------------------------------------------------
# main
# --------------------------------------------------------------------------

def audit(root, report):
    # --- item 2: PNGs ---
    buckets, fetsatool_methods = classify_pngs(root)
    num_tiles_overrides = parse_num_tiles_overrides(root)

    for png in buckets["unknown"]:
        report.fail(f"{png}: UNKNOWN classification (no generic/FETSATOOL/palette consumer found)")

    if len(buckets["documentation_preview"]) != 1:
        report.fail(
            "documentation_preview PNG count drifted: expected exactly 1 (the known "
            f"non-build preview render), found {len(buckets['documentation_preview'])}: "
            f"{buckets['documentation_preview']}")

    all_pngs = [p for k, v in buckets.items() for p in v]
    for png in all_pngs:
        err = check_png_basic(os.path.join(root, png))
        if err:
            report.fail(f"{png}: {err}")
        else:
            report.count("png_basic_ok")

    for png in buckets["generic_4bpp"]:
        bpp_path = os.path.join(root, png)[:-len(".png")] + ".4bpp"
        num_tiles = num_tiles_overrides.get(os.path.normpath(os.path.relpath(bpp_path, root)))
        err = check_generic_4bpp(os.path.join(root, png), bpp_path, num_tiles)
        if err:
            report.fail(f"{png}: {err}")
        else:
            report.count("generic_4bpp_roundtrip_ok")
    report.count("num_tiles_overrides_seen", len(num_tiles_overrides))

    for png in buckets["fetsatool"]:
        err = check_fetsatool_png(os.path.join(root, png), fetsatool_methods.get(png))
        if err:
            report.fail(f"{png}: {err}")
        else:
            report.count("fetsatool_png_ok")

    for png in buckets["palette_only"]:
        abspath = os.path.join(root, png)
        base = abspath[:-len(".png")]
        gbapal = base + ".gbapal"
        try:
            colors = read_png_plte(abspath)
        except ValueError as e:
            report.fail(f"{png}: {e}")
            continue
        err = check_gbapal_roundtrip(colors, gbapal)
        if err:
            report.fail(f"{png}: palette round-trip: {err}")
        else:
            report.count("palette_only_roundtrip_ok")

    report.count("png_generic_4bpp", len(buckets["generic_4bpp"]))
    report.count("png_generic_1bpp", len(buckets["generic_1bpp"]))
    report.count("png_generic_8bpp", len(buckets["generic_8bpp"]))
    report.count("png_fetsatool", len(buckets["fetsatool"]))
    report.count("png_palette_only", len(buckets["palette_only"]))
    report.count("png_documentation_preview", len(buckets["documentation_preview"]))
    report.count("png_total", len(all_pngs))

    # --- item 3: palettes ---
    pals = git_ls_files(root, "*.pal")
    orphans = []
    for pal in pals:
        abspath = os.path.join(root, pal)
        try:
            colors = parse_jasc_pal(abspath)
        except JascPalError as e:
            report.fail(f"{pal}: JASC-PAL parse error: {e}")
            continue
        report.count("jasc_pal_header_ok")
        gbapal = abspath[:-len(".pal")] + ".gbapal"
        if not os.path.exists(gbapal):
            orphans.append(pal)
            continue
        err = check_gbapal_roundtrip(colors, gbapal)
        if err:
            report.fail(f"{pal}: {err}")
        else:
            report.count("pal_gbapal_roundtrip_ok")
    report.count("pal_total", len(pals))
    if len(orphans) != 1:
        report.fail(
            "orphan (unconsumed) .pal count drifted: expected exactly 1 (a pre-existing, "
            f"out-of-scope residual source), found {len(orphans)}: {orphans}")
    else:
        report.count("orphan_pal_no_gbapal", 1)

    # --- item 4: .tsa.bin ---
    tsa_files = git_ls_files(root, "*.tsa.bin")
    seen_exceptions = set()
    for tsa in tsa_files:
        kind, reason = classify_tsa_bin(os.path.join(root, tsa), tsa)
        if kind == "unknown":
            report.fail(f"{tsa}: {reason}")
        else:
            report.count(f"tsa_{kind}")
            if kind == "named_exception":
                seen_exceptions.add(tsa)
    report.count("tsa_total", len(tsa_files))
    missing_exceptions = TSA_NAMED_EXCEPTIONS - seen_exceptions
    if missing_exceptions:
        report.fail(f".tsa.bin named exceptions missing/no-longer-tracked: {sorted(missing_exceptions)}")

    # --- item 4: .map.bin ---
    map_files = git_ls_files(root, "*.map.bin")
    for mapf in map_files:
        err = check_map_bin(os.path.join(root, mapf))
        if err:
            report.fail(f"{mapf}: {err}")
        else:
            report.count("map_bin_ok")
    report.count("map_bin_total", len(map_files))

    # --- item 4: six btl_bg FETSA3/FEIMG3 pairs ---
    for n in BTL_BG_FETSA_PAIRS:
        check_btl_bg_pair(root, n, report)
    report.count("btl_bg_pairs_total", len(BTL_BG_FETSA_PAIRS))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", default=DEFAULT_ROOT,
                         help="repo root (default: parent of scripts/)")
    args = parser.parse_args()

    report = Report()
    audit(os.path.abspath(args.root), report)

    print("=== graphics/source-format invariant audit ===")
    for key in sorted(report.counts):
        print(f"  {key}: {report.counts[key]}")

    if report.failures:
        print(f"\n{len(report.failures)} DEFECT(S):")
        for f in report.failures:
            print(f"  FAIL: {f}")
        print("\ngraphicscheck: FAILED")
        return 1

    print("\ngraphicscheck: OK (zero defects)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
