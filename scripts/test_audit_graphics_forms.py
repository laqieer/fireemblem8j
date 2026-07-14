#!/usr/bin/env python3
"""Focused unit tests + fixture-driven self-tests for audit_graphics_forms.py.

Run: python3 -m unittest scripts.test_audit_graphics_forms -v
     (or `cd scripts && python3 -m unittest test_audit_graphics_forms -v`)

These deliberately exercise FAILURE paths (a corrupt/mismatched fixture must be
REJECTED), not just the current tree's fixtures -- a gate that only ever sees
passing input can't prove it would catch a regression.
"""
import os
import struct
import subprocess
import sys
import tempfile
import unittest

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import audit_graphics_forms as a  # noqa: E402

from PIL import Image  # noqa: E402


def setUpModule():
    """HERMETICITY (real incident, fixed here): this repo's own githooks/
    pre-commit hook runs `make shiftcheck` (which runs THIS test module) as a
    git pre-commit hook. Git sets GIT_DIR/GIT_WORK_TREE/GIT_INDEX_FILE in the
    hook's environment, and EVERY `git` subprocess call anywhere in this
    process (and its children) inherits them -- overriding any `-C <path>`/
    `cwd=` a test passes, no matter how carefully. Without this, a test
    fixture's `git init`/`git commit` in an isolated tempfile.TemporaryDirectory()
    silently operates on the REAL, wrapping FE8J repository instead (this
    happened twice while developing this fix: once via RepoGraphFixture, once
    via CleanGitEnvTest's own "outer" simulated-wrapper-repo setup -- both
    recovered with `git reset --hard` before anything was pushed).
    Module-level stripping (once, here) is the primary defense: it protects
    EVERY git subprocess call in this file, present or future, rather than
    relying on each call site to remember `env=a.clean_git_env()` individually
    (which is exactly what was missed the second time)."""
    global _ORIGINAL_ENVIRON
    _ORIGINAL_ENVIRON = dict(os.environ)
    for key in list(os.environ):
        if key.startswith("GIT_"):
            del os.environ[key]


def tearDownModule():
    os.environ.clear()
    os.environ.update(_ORIGINAL_ENVIRON)



def make_p_png(path, pixels, palette=None):
    """pixels: 2D list [y][x] of index values. palette: flat RGB list (len 768) or
    None (identity grayscale ramp, sufficient for pure index-value tests)."""
    h = len(pixels)
    w = len(pixels[0])
    im = Image.new("P", (w, h))
    if palette is None:
        palette = []
        for i in range(256):
            palette += [i, i, i]
    im.putpalette(palette)
    px = im.load()
    for y in range(h):
        for x in range(w):
            px[x, y] = pixels[y][x]
    im.save(path)


def make_l_png(path, pixels):
    """Pillow's PNG encoder always saves 'L' mode at on-disk bit_depth 8 (raw
    byte values, no rescale) -- exercises audit_graphics_forms's bit_depth==8
    grayscale branch (`pillow_value & 0xF`)."""
    h = len(pixels)
    w = len(pixels[0])
    im = Image.new("L", (w, h))
    px = im.load()
    for y in range(h):
        for x in range(w):
            px[x, y] = pixels[y][x]
    im.save(path)


def make_l4_png(path, pixels):
    """Hand-write a genuine PNG color_type=0 (grayscale) bit_depth=4 file --
    Pillow's encoder has no supported way to produce one (its `bits=` save
    kwarg is silently ignored for 'L' mode), but this is exactly what 1,389 of
    the 1,393 tracked L-mode assets actually are on disk. Samples are 4-bit
    values 0-15, MSB-first packed 2/byte per the PNG spec. Exercises
    audit_graphics_forms's bit_depth==4 branch (Pillow rescales each sample by
    17 on read: e.g. raw 7 -> pixel value 119; read_grayscale_index() must
    recover 7 via `// 17`)."""
    h = len(pixels)
    w = len(pixels[0])

    def chunk(tag, data):
        out = struct.pack(">I", len(data)) + tag + data
        import zlib
        crc = zlib.crc32(tag + data) & 0xFFFFFFFF
        return out + struct.pack(">I", crc)

    import zlib
    sig = b"\x89PNG\r\n\x1a\n"
    ihdr = struct.pack(">IIBBBBB", w, h, 4, 0, 0, 0, 0)
    row_bytes = (w + 1) // 2
    raw = bytearray()
    for row in pixels:
        raw.append(0)  # filter type 0 (none)
        rb = bytearray(row_bytes)
        for i, v in enumerate(row):
            byte_i = i // 2
            if i % 2 == 0:
                rb[byte_i] |= (v & 0xF) << 4
            else:
                rb[byte_i] |= (v & 0xF)
        raw += rb
    idat = zlib.compress(bytes(raw), 9)
    with open(path, "wb") as f:
        f.write(sig)
        f.write(chunk(b"IHDR", ihdr))
        f.write(chunk(b"IDAT", idat))
        f.write(chunk(b"IEND", b""))


class TileOrderTest(unittest.TestCase):
    """Validated against a real gbagfx run (tools/gbagfx/gbagfx) at audit-authoring
    time: a 2x2-tile P-mode PNG with tile (tx,ty) filled uniformly with value
    tx+ty*2 produces tile blocks in row-major order (ty outer, tx inner); a
    16x8 PNG with px[x,y]=x%16 produces low-nibble=even-x, high-nibble=odd-x
    packing per row. This test hard-codes those known-good gbagfx outputs so a
    change to png_to_tiles_4bpp() that silently changes the tile/nibble order
    is caught without needing the gbagfx binary at test time.
    """

    def test_row_major_tile_order(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.png")
            # 2x2 tiles; each tile uniformly filled with tx+ty*2.
            pixels = [[0] * 16 for _ in range(16)]
            for ty in range(2):
                for tx in range(2):
                    val = tx + ty * 2
                    for row in range(8):
                        for col in range(8):
                            pixels[ty * 8 + row][tx * 8 + col] = val
            make_p_png(path, pixels)
            out = a.png_to_tiles_4bpp(path)
            self.assertEqual(len(out), 4 * 32)
            # Each tile is 32 bytes of a single repeated value nibble-packed as (v<<4)|v.
            for i, val in enumerate([0, 1, 2, 3]):
                tile_bytes = out[i * 32:(i + 1) * 32]
                self.assertEqual(tile_bytes, bytes([(val << 4) | val] * 32))

    def test_nibble_packing_low_even_high_odd(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.png")
            pixels = [[x % 16 for x in range(16)] for _ in range(8)]
            make_p_png(path, pixels)
            out = a.png_to_tiles_4bpp(path)
            # tile0 (x 0-7): bytes 0x10 0x32 0x54 0x76 per row.
            self.assertEqual(out[0:4], bytes([0x10, 0x32, 0x54, 0x76]))
            # tile1 (x 8-15): bytes 0x98 0xba 0xdc 0xfe per row.
            self.assertEqual(out[32:36], bytes([0x98, 0xba, 0xdc, 0xfe]))

    def test_l_mode_inverts_index_bit_depth_8(self):
        """make_l_png() saves at on-disk bit_depth 8 (Pillow's default for 'L'),
        so raw byte values 0-7 are used as-is (`& 0xF`, no /17 un-rescale)."""
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.png")
            pixels = [[x for x in range(8)] for _ in range(8)]
            make_l_png(path, pixels)
            _w, _h, bit_depth, _ct = a.read_png_ihdr(path)
            self.assertEqual(bit_depth, 8)
            out = a.png_to_tiles_4bpp(path)
            # raw x=0,1 -> 0,1; inverted -> 15,14; byte = (14<<4)|15 = 0xEF.
            self.assertEqual(out[0], 0xEF)

    def test_l_mode_inverts_index_bit_depth_4(self):
        """A genuine 4-bit-depth grayscale PNG (color_type 0): Pillow rescales
        each 4-bit sample by *17 on decode (e.g. raw 3 -> pixel value 51), so
        the audit must recover the ORIGINAL sample via `// 17` before
        inverting -- naively using Pillow's rescaled value directly (or
        masking it with `& 0xF`, which happens to coincide only because
        sample*17 is always a repeated hex digit, e.g. 3*17=51=0x33) would
        silently apply the wrong transform for any value that ISN'T a clean
        multiple of 17."""
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.png")
            pixels = [[x for x in range(8)] for _ in range(8)]
            make_l4_png(path, pixels)
            _w, _h, bit_depth, _ct = a.read_png_ihdr(path)
            self.assertEqual(bit_depth, 4)
            im = Image.open(path)
            px = im.load()
            self.assertEqual(px[3, 0], 51)  # Pillow's rescaled (3 * 17) value
            out = a.png_to_tiles_4bpp(path)
            # raw x=0,1 -> 0,1; inverted -> 15,14; byte = (14<<4)|15 = 0xEF (same
            # end result as the bit_depth-8 case above, via the CORRECT formula).
            self.assertEqual(out[0], 0xEF)

    def test_num_tiles_truncates_regardless_of_tail_content(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.png")
            # 3 tiles wide, tile2 non-zero (gbagfx's default -num_tiles mode
            # (NUM_TILES_IGNORE) truncates even if the discarded tail isn't blank).
            pixels = [[0] * 24 for _ in range(8)]
            for row in range(8):
                for col in range(8):
                    pixels[row][16 + col] = 5
            make_p_png(path, pixels)
            out_full = a.png_to_tiles_4bpp(path)
            out_2 = a.png_to_tiles_4bpp(path, num_tiles=2)
            self.assertEqual(len(out_full), 3 * 32)
            self.assertEqual(len(out_2), 2 * 32)
            self.assertEqual(out_2, out_full[:64])


class ReadGrayscaleIndexTest(unittest.TestCase):
    def test_bit_depth_4_recovers_exact_sample(self):
        for sample in range(16):
            pillow_value = sample * 17
            self.assertEqual(a.read_grayscale_index(pillow_value, 4), sample)

    def test_bit_depth_4_rejects_non_multiple_of_17(self):
        with self.assertRaises(ValueError):
            a.read_grayscale_index(100, 4)  # not a multiple of 17

    def test_bit_depth_8_is_a_plain_mask(self):
        self.assertEqual(a.read_grayscale_index(0x37, 8), 0x7)

    def test_unhandled_bit_depth_raises(self):
        with self.assertRaises(ValueError):
            a.read_grayscale_index(3, 2)


class ReadPngIhdrTest(unittest.TestCase):
    def test_reads_dimensions_and_depth(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.png")
            make_l4_png(path, [[0] * 8 for _ in range(8)])
            w, h, bit_depth, color_type = a.read_png_ihdr(path)
            self.assertEqual((w, h, bit_depth, color_type), (8, 8, 4, 0))


class CheckGeneric4bppTest(unittest.TestCase):
    def test_matching_bytes_pass(self):
        with tempfile.TemporaryDirectory() as tmp:
            png = os.path.join(tmp, "t.png")
            make_p_png(png, [[x % 16 for x in range(8)] for _ in range(8)])
            expected = a.png_to_tiles_4bpp(png)
            bpp = os.path.join(tmp, "t.4bpp")
            with open(bpp, "wb") as f:
                f.write(expected)
            self.assertIsNone(a.check_generic_4bpp(png, bpp))

    def test_corrupted_bytes_fail(self):
        with tempfile.TemporaryDirectory() as tmp:
            png = os.path.join(tmp, "t.png")
            make_p_png(png, [[x % 16 for x in range(8)] for _ in range(8)])
            expected = bytearray(a.png_to_tiles_4bpp(png))
            expected[0] ^= 0xFF  # flip a byte
            bpp = os.path.join(tmp, "t.4bpp")
            with open(bpp, "wb") as f:
                f.write(bytes(expected))
            err = a.check_generic_4bpp(png, bpp)
            self.assertIsNotNone(err)
            self.assertIn("mismatch", err)

    def test_num_tiles_wrong_size_fails(self):
        with tempfile.TemporaryDirectory() as tmp:
            png = os.path.join(tmp, "t.png")
            make_p_png(png, [[0] * 16 for _ in range(8)])  # 2 tiles
            bpp = os.path.join(tmp, "t.4bpp")
            with open(bpp, "wb") as f:
                f.write(b"\x00" * 32)  # only 1 tile's worth -- claims num_tiles=2
            err = a.check_generic_4bpp(png, bpp, num_tiles=2)
            self.assertIsNotNone(err)
            self.assertIn("expects", err)


class FetsatoolPngTest(unittest.TestCase):
    def test_method1_all_indices_below_16_passes(self):
        with tempfile.TemporaryDirectory() as tmp:
            png = os.path.join(tmp, "t.png")
            make_p_png(png, [[x % 16 for x in range(8)] for _ in range(8)])
            self.assertIsNone(a.check_fetsatool_png(png, method=1))

    def test_method1_index_above_15_fails(self):
        with tempfile.TemporaryDirectory() as tmp:
            png = os.path.join(tmp, "t.png")
            pixels = [[0] * 8 for _ in range(8)]
            pixels[0][0] = 20  # out of 4bpp range
            make_p_png(png, pixels)
            err = a.check_fetsatool_png(png, method=1)
            self.assertIsNotNone(err)
            self.assertIn(">15", err)

    def test_method3_single_bank_per_tile_passes(self):
        with tempfile.TemporaryDirectory() as tmp:
            png = os.path.join(tmp, "t.png")
            # One tile, all pixels in bank 4 (values 64-79), like real btl_bg sources.
            pixels = [[64 + (x + y) % 16 for x in range(8)] for y in range(8)]
            make_p_png(png, pixels)
            self.assertIsNone(a.check_fetsatool_png(png, method=3))

    def test_method3_mixed_bank_in_one_tile_fails(self):
        with tempfile.TemporaryDirectory() as tmp:
            png = os.path.join(tmp, "t.png")
            pixels = [[64] * 8 for _ in range(8)]
            pixels[0][0] = 80  # bank 5, rest of tile is bank 4 -- mixed
            make_p_png(png, pixels)
            err = a.check_fetsatool_png(png, method=3)
            self.assertIsNotNone(err)
            self.assertIn("mixes palette banks", err)

    def test_l_mode_rejected(self):
        with tempfile.TemporaryDirectory() as tmp:
            png = os.path.join(tmp, "t.png")
            make_l_png(png, [[0] * 8 for _ in range(8)])
            err = a.check_fetsatool_png(png, method=1)
            self.assertIsNotNone(err)
            self.assertIn("mode P", err)


class JascPalTest(unittest.TestCase):
    def _write(self, tmp, body_lines):
        path = os.path.join(tmp, "t.pal")
        with open(path, "wb") as f:
            f.write(b"\r\n".join(body_lines) + b"\r\n")
        return path

    def test_valid_pal_parses(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = self._write(tmp, [b"JASC-PAL", b"0100", b"2", b"0 0 0", b"255 255 255"])
            colors = a.parse_jasc_pal(path)
            self.assertEqual(colors, [(0, 0, 0), (255, 255, 255)])

    def test_wrong_declared_count_fails(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = self._write(tmp, [b"JASC-PAL", b"0100", b"3", b"0 0 0", b"255 255 255"])
            with self.assertRaises(a.JascPalError):
                a.parse_jasc_pal(path)

    def test_bad_signature_fails(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = self._write(tmp, [b"NOT-JASC", b"0100", b"1", b"0 0 0"])
            with self.assertRaises(a.JascPalError):
                a.parse_jasc_pal(path)

    def test_garbage_after_colors_fails(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.pal")
            with open(path, "wb") as f:
                f.write(b"JASC-PAL\r\n0100\r\n1\r\n0 0 0\r\ngarbage")
            with self.assertRaises(a.JascPalError):
                a.parse_jasc_pal(path)

    def test_lf_only_file_parses(self):
        """gbagfx's ReadJascPaletteLine accepts a bare '\\n' terminator (not
        just '\\r\\n') -- an LF-only file (e.g. saved/normalized by a Unix
        tool) is completely valid and must not be rejected."""
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.pal")
            with open(path, "wb") as f:
                f.write(b"JASC-PAL\n0100\n2\n0 0 0\n255 255 255\n")
            colors = a.parse_jasc_pal(path)
            self.assertEqual(colors, [(0, 0, 0), (255, 255, 255)])

    def test_crlf_only_file_parses(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = self._write(tmp, [b"JASC-PAL", b"0100", b"2", b"0 0 0", b"255 255 255"])
            colors = a.parse_jasc_pal(path)
            self.assertEqual(colors, [(0, 0, 0), (255, 255, 255)])

    def test_mixed_lf_and_crlf_lines_parse(self):
        """gbagfx's terminator check is PER-LINE, not a whole-file mode -- a
        file mixing bare '\\n' and '\\r\\n' line-to-line is still valid."""
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.pal")
            with open(path, "wb") as f:
                f.write(b"JASC-PAL\r\n0100\n2\r\n0 0 0\n255 255 255\r\n")
            colors = a.parse_jasc_pal(path)
            self.assertEqual(colors, [(0, 0, 0), (255, 255, 255)])

    def test_real_tree_style_lf_fixture(self):
        """Mirrors the exact byte shape of a real tracked source
        (graphics/reuse/bg_Castle_Night_palette.pal's grammar), but with bare
        LF line endings throughout, to prove a real-file-style LF-only
        palette is accepted end to end (header + N color lines + EOF)."""
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.pal")
            lines = [b"JASC-PAL", b"0100", b"4", b"0 0 0", b"0 0 32",
                     b"72 72 96", b"128 128 160"]
            with open(path, "wb") as f:
                f.write(b"\n".join(lines) + b"\n")
            colors = a.parse_jasc_pal(path)
            self.assertEqual(colors, [(0, 0, 0), (0, 0, 32), (72, 72, 96), (128, 128, 160)])

    def test_lone_cr_not_followed_by_lf_fails(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.pal")
            with open(path, "wb") as f:
                # '\r' followed by a digit, not '\n' -- gbagfx's "CR line
                # endings aren't supported" fatal error.
                f.write(b"JASC-PAL\r0100\r\n1\r\n0 0 0\r\n")
            with self.assertRaises(a.JascPalError):
                a.parse_jasc_pal(path)

    def test_unterminated_final_line_fails(self):
        """No trailing '\\n' or '\\r\\n' after the last color line -- gbagfx's
        "Unexpected EOF. No LF or CRLF at end of file." fatal error."""
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.pal")
            with open(path, "wb") as f:
                f.write(b"JASC-PAL\r\n0100\r\n1\r\n0 0 0")  # no terminator at all
            with self.assertRaises(a.JascPalError):
                a.parse_jasc_pal(path)

    def test_extra_trailing_blank_line_is_garbage(self):
        """gbagfx's EOF check is a raw fgetc() after the last color line's
        terminator is consumed -- even an otherwise-harmless extra blank line
        counts as garbage."""
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.pal")
            with open(path, "wb") as f:
                f.write(b"JASC-PAL\r\n0100\r\n1\r\n0 0 0\r\n\r\n")
            with self.assertRaises(a.JascPalError):
                a.parse_jasc_pal(path)


class GbapalRoundtripTest(unittest.TestCase):
    def test_correct_conversion_passes(self):
        colors = [(0, 0, 0), (255, 255, 255), (150, 75, 0)]
        expected = a.expected_gbapal_bytes(colors)
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.gbapal")
            with open(path, "wb") as f:
                f.write(expected)
            self.assertIsNone(a.check_gbapal_roundtrip(colors, path))

    def test_wrong_conversion_fails(self):
        colors = [(255, 255, 255)]
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.gbapal")
            with open(path, "wb") as f:
                f.write(struct.pack("<H", 0))  # should be 0x7FFF, not 0
            self.assertIsNotNone(a.check_gbapal_roundtrip(colors, path))

    def test_downconvert_is_integer_division_by_8(self):
        # r=250 -> 250//8=31 (not a rounded/clamped value).
        colors = [(250, 8, 16)]
        expected = a.expected_gbapal_bytes(colors)
        word = struct.unpack("<H", expected)[0]
        self.assertEqual(word & 0x1F, 31)
        self.assertEqual((word >> 5) & 0x1F, 1)
        self.assertEqual((word >> 10) & 0x1F, 2)


class TsaBinClassifyTest(unittest.TestCase):
    def test_exact_form(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.tsa.bin")
            w, h = 2, 1  # zero-based: 3 wide, 2 tall
            payload = b"\x00" * ((w + 1) * (h + 1) * 2)
            with open(path, "wb") as f:
                f.write(bytes([w, h]) + payload)
            kind, reason = a.classify_tsa_bin(path, "graphics/x/t.tsa.bin")
            self.assertEqual(kind, "exact")
            self.assertIsNone(reason)

    def test_plus2_form(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.tsa.bin")
            w, h = 2, 1
            payload = b"\x00" * ((w + 1) * (h + 1) * 2)
            with open(path, "wb") as f:
                f.write(bytes([w, h]) + payload + b"\x00\x00")
            kind, reason = a.classify_tsa_bin(path, "graphics/x/t.tsa.bin")
            self.assertEqual(kind, "plus2")

    def test_plus2_form_requires_trailing_zero(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.tsa.bin")
            w, h = 2, 1
            payload = b"\x00" * ((w + 1) * (h + 1) * 2)
            with open(path, "wb") as f:
                f.write(bytes([w, h]) + payload + b"\x01\x00")  # non-zero trailer
            kind, reason = a.classify_tsa_bin(path, "graphics/x/t.tsa.bin")
            self.assertEqual(kind, "unknown")

    def test_named_exception_bypasses_size_formula(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.tsa.bin")
            with open(path, "wb") as f:
                f.write(b"\x01\x02\x03")  # garbage size, wouldn't match either formula
            kind, reason = a.classify_tsa_bin(path, "graphics/misc/gUnkData_26.tsa.bin")
            self.assertEqual(kind, "named_exception")

    def test_garbage_size_is_unknown(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.tsa.bin")
            with open(path, "wb") as f:
                f.write(b"\x01\x02\x03\x04\x05")
            kind, reason = a.classify_tsa_bin(path, "graphics/x/t.tsa.bin")
            self.assertEqual(kind, "unknown")
            self.assertIsNotNone(reason)


class GtsaUnkData0TransitionalTest(unittest.TestCase):
    """graphics/misc_gfx2/gTsa_UnkData_0.tsa.bin's narrowly-scoped, structurally
    validated transitional shape (276B: standard 242B TSA + 2 zero bytes + a
    16-color trailing GBA-palette-shaped remnant), pending a separate worker's
    split into a 244B plain TSA + Pal_ChapterTitleFire.pal."""

    def _make(self, tmp, w=29, h=3, tail_words=None, zero_pad=b"\x00\x00"):
        if tail_words is None:
            tail_words = [0x1234] * 16  # all bit-15 clear -> valid GBA colors
        payload = b"\x00" * ((w + 1) * (h + 1) * 2)
        tail = b"".join(struct.pack("<H", wd) for wd in tail_words)
        path = os.path.join(tmp, "t.tsa.bin")
        with open(path, "wb") as f:
            f.write(bytes([w, h]) + payload + zero_pad + tail)
        return path

    def test_valid_transitional_shape_passes(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = self._make(tmp)
            kind, reason = a.classify_tsa_bin(path, a.GTSA_UNKDATA_0_TRANSITIONAL_PATH)
            self.assertEqual(kind, "transitional_palette_tail")
            self.assertIsNone(reason)

    def test_only_applies_to_the_exact_named_path(self):
        # The SAME 276B bytes at a DIFFERENT path must NOT get a free pass --
        # this is not a generic "oversized TSA is fine" bypass.
        with tempfile.TemporaryDirectory() as tmp:
            path = self._make(tmp)
            kind, reason = a.classify_tsa_bin(path, "graphics/x/some_other.tsa.bin")
            self.assertEqual(kind, "unknown")

    def test_bit15_set_in_tail_is_rejected(self):
        with tempfile.TemporaryDirectory() as tmp:
            tail = [0x1234] * 15 + [0x8000]  # last color has bit 15 set -- invalid
            path = self._make(tmp, tail_words=tail)
            kind, reason = a.classify_tsa_bin(path, a.GTSA_UNKDATA_0_TRANSITIONAL_PATH)
            self.assertEqual(kind, "unknown")
            self.assertIn("bit 15 set", reason)

    def test_wrong_size_is_rejected(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = self._make(tmp, tail_words=[0x1234] * 15)  # one color short
            kind, reason = a.classify_tsa_bin(path, a.GTSA_UNKDATA_0_TRANSITIONAL_PATH)
            self.assertEqual(kind, "unknown")

    def test_missing_zero_padding_is_rejected(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = self._make(tmp, zero_pad=b"\x01\x00")
            kind, reason = a.classify_tsa_bin(path, a.GTSA_UNKDATA_0_TRANSITIONAL_PATH)
            self.assertEqual(kind, "unknown")

    def test_post_migration_244_byte_file_uses_plain_plus2_not_transitional(self):
        # Once the split lands (242B standard TSA + 2 zero bytes, no palette
        # tail), the plain "plus2" formula takes over -- the transitional
        # branch must not (and structurally cannot) match a 244B file.
        with tempfile.TemporaryDirectory() as tmp:
            w, h = 29, 3
            payload = b"\x00" * ((w + 1) * (h + 1) * 2)
            path = os.path.join(tmp, "t.tsa.bin")
            with open(path, "wb") as f:
                f.write(bytes([w, h]) + payload + b"\x00\x00")
            kind, reason = a.classify_tsa_bin(path, a.GTSA_UNKDATA_0_TRANSITIONAL_PATH)
            self.assertEqual(kind, "plus2")


class MenuSoundroom4ManifestTest(unittest.TestCase):
    """graphics/misc/gMenuSoundroom_4.tsa.bin's evidence manifest: a concatenated
    one-row TSA template library (not a malformed single TSA) -- every record
    must decode exactly as documented, and the terminal 4 bytes must be the
    exact proven truncated remnant."""

    def _build_valid_bytes(self):
        out = bytearray()
        for offset, w, h in a.MENU_SOUNDROOM_4_RECORDS:
            self.assertEqual(offset, len(out))
            out += bytes([w - 1, h - 1])
            out += b"\x00" * (w * h * 2)
        self.assertEqual(len(out), a.MENU_SOUNDROOM_4_REMNANT_OFFSET)
        out += a.MENU_SOUNDROOM_4_REMNANT_BYTES
        self.assertEqual(len(out), a.MENU_SOUNDROOM_4_TOTAL_SIZE)
        return bytes(out)

    def test_exact_manifest_passes(self):
        data = self._build_valid_bytes()
        self.assertIsNone(a.validate_menu_soundroom_4(data))

    def test_classify_tsa_bin_routes_to_manifest_check(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.tsa.bin")
            with open(path, "wb") as f:
                f.write(self._build_valid_bytes())
            kind, reason = a.classify_tsa_bin(path, a.MENU_SOUNDROOM_4_PATH)
            self.assertEqual(kind, "menu_soundroom_4_manifest")
            self.assertIsNone(reason)

    def test_wrong_record_dims_rejected(self):
        data = bytearray(self._build_valid_bytes())
        data[0] = 99  # corrupt record 0's declared width
        err = a.validate_menu_soundroom_4(bytes(data))
        self.assertIsNotNone(err)
        self.assertIn("offset 0", err)

    def test_wrong_terminal_remnant_rejected(self):
        data = bytearray(self._build_valid_bytes())
        data[-1] = 0xFF  # corrupt the proven truncated remnant's last byte
        err = a.validate_menu_soundroom_4(bytes(data))
        self.assertIsNotNone(err)
        self.assertIn("remnant", err)

    def test_wrong_total_size_rejected(self):
        data = self._build_valid_bytes() + b"\x00"
        err = a.validate_menu_soundroom_4(data)
        self.assertIsNotNone(err)
        self.assertIn("total size", err)


class MultibootSplitTargetsTest(unittest.TestCase):
    """gUnkData_26.tsa.bin's successors are DORMANT until each path is actually
    committed by the migration worker -- a fresh tree without them must not
    fail, and each must be validated the instant it appears."""

    def test_dormant_when_no_successor_paths_exist(self):
        with tempfile.TemporaryDirectory() as tmp:
            os.makedirs(os.path.join(tmp, "graphics", "misc"))
            report = a.Report()
            a.check_multiboot_split_targets(tmp, report)
            self.assertEqual(report.failures, [])
            self.assertNotIn("multiboot_split_target_ok", report.counts)

    def test_validates_narrow_bar_the_instant_it_appears(self):
        with tempfile.TemporaryDirectory() as tmp:
            d = os.path.join(tmp, "graphics", "misc")
            os.makedirs(d)
            # 156B = 154B standard 19x4 (w=18,h=3 zero-based) + 2 zero bytes.
            w, h = 18, 3
            payload = b"\x00" * ((w + 1) * (h + 1) * 2)
            with open(os.path.join(d, "Tsa_MultiBootSendListBarNarrow.bin"), "wb") as f:
                f.write(bytes([w, h]) + payload + b"\x00\x00")
            report = a.Report()
            a.check_multiboot_split_targets(tmp, report)
            self.assertEqual(report.failures, [])
            self.assertEqual(report.counts.get("multiboot_split_target_ok"), 1)

    def test_wrong_size_narrow_bar_fails(self):
        with tempfile.TemporaryDirectory() as tmp:
            d = os.path.join(tmp, "graphics", "misc")
            os.makedirs(d)
            with open(os.path.join(d, "Tsa_MultiBootSendListBarNarrow.bin"), "wb") as f:
                f.write(b"\x00" * 100)  # wrong size
            report = a.Report()
            a.check_multiboot_split_targets(tmp, report)
            self.assertTrue(any("156" in msg for msg in report.failures))

    def test_raw_tilemap_is_not_tsa_header_parsed(self):
        with tempfile.TemporaryDirectory() as tmp:
            d = os.path.join(tmp, "graphics", "misc")
            os.makedirs(d)
            # A plausible flat u16 tilemap: 1280 bytes, all tile ids in range.
            data = struct.pack("<640H", *([0] * 640))
            with open(os.path.join(d, "Tilemap_MultiBootSendBg.bin"), "wb") as f:
                f.write(data)
            report = a.Report()
            a.check_multiboot_split_targets(tmp, report)
            self.assertEqual(report.failures, [])
            self.assertEqual(report.counts.get("multiboot_split_target_ok"), 1)

    def test_raw_tilemap_odd_length_fails(self):
        with tempfile.TemporaryDirectory() as tmp:
            d = os.path.join(tmp, "graphics", "misc")
            os.makedirs(d)
            with open(os.path.join(d, "Tilemap_MultiBootSendBg.bin"), "wb") as f:
                f.write(b"\x00" * 1279)  # odd length, wrong size too
            report = a.Report()
            a.check_multiboot_split_targets(tmp, report)
            self.assertTrue(report.failures)


class MapBinTest(unittest.TestCase):
    def test_valid_even_length_passes(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.map.bin")
            with open(path, "wb") as f:
                f.write(struct.pack("<H", 5) + struct.pack("<H", 1023))
            self.assertIsNone(a.check_map_bin(path))

    def test_odd_length_fails(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.map.bin")
            with open(path, "wb") as f:
                f.write(b"\x00\x00\x00")
            err = a.check_map_bin(path)
            self.assertIsNotNone(err)
            self.assertIn("odd length", err)


class FetsaTileBoundsTest(unittest.TestCase):
    def test_in_bounds_passes(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.fetsa3.bin")
            with open(path, "wb") as f:
                f.write(struct.pack("<H", 5))
                f.write(struct.pack("<H", a.FETSA_BLANK_SENTINEL))  # sentinel is allowed
            self.assertIsNone(a.check_fetsa_tile_bounds(path, num_tiles_in_feimg=416))

    def test_out_of_bounds_fails(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.fetsa3.bin")
            with open(path, "wb") as f:
                f.write(struct.pack("<H", 500))  # >= 416, not the sentinel
            err = a.check_fetsa_tile_bounds(path, num_tiles_in_feimg=416)
            self.assertIsNotNone(err)
            self.assertIn("out of bounds", err)


class RepoGraphFixture:
    """Builds a minimal git-tracked fixture repo (Makefile + graphics/) so
    classify_pngs()/parse_explicit_fetsatool_pngs()/parse_num_tiles_overrides()
    can be exercised end-to-end without touching the real, huge repo tree.

    IMPORTANT (hermeticity, defense in depth): every `git` call here passes
    `env=a.clean_git_env()` EXPLICITLY. This module's setUpModule() also
    strips GIT_* process-wide once at test-suite start, but that alone is
    NOT sufficient -- a real incident while developing this fix showed that a
    LATER test can legitimately re-introduce GIT_DIR into os.environ mid-run
    (CleanGitEnvTest's hermeticity regression test does exactly this, to
    simulate a wrapping git hook), and any RepoGraphFixture call made during
    that window would inherit it if it didn't clean explicitly. Both layers
    together (module-level baseline + per-call explicit) are needed."""

    def __init__(self, tmp):
        self.root = tmp
        os.makedirs(os.path.join(tmp, "graphics", "sub"), exist_ok=True)
        subprocess.run(["git", "init", "-q"], cwd=tmp, check=True, env=a.clean_git_env())
        subprocess.run(["git", "config", "user.email", "t@example.com"],
                        cwd=tmp, check=True, env=a.clean_git_env())
        subprocess.run(["git", "config", "user.name", "t"],
                        cwd=tmp, check=True, env=a.clean_git_env())

    def add(self, rel_path, content=b""):
        path = os.path.join(self.root, rel_path)
        os.makedirs(os.path.dirname(path), exist_ok=True)
        if isinstance(content, str):
            content = content.encode()
        with open(path, "wb") as f:
            f.write(content)
        subprocess.run(["git", "add", rel_path], cwd=self.root, check=True, env=a.clean_git_env())

    def add_png(self, rel_path, pixels):
        path = os.path.join(self.root, rel_path)
        os.makedirs(os.path.dirname(path), exist_ok=True)
        make_p_png(path, pixels)
        subprocess.run(["git", "add", rel_path], cwd=self.root, check=True, env=a.clean_git_env())

    def commit(self):
        subprocess.run(["git", "commit", "-q", "-m", "fixture"],
                        cwd=self.root, check=True, env=a.clean_git_env())


class ClassifyPngsIntegrationTest(unittest.TestCase):
    def test_generic_png_classified_when_4bpp_sibling_exists(self):
        with tempfile.TemporaryDirectory() as tmp:
            fx = RepoGraphFixture(tmp)
            fx.add("Makefile", "")
            fx.add_png("graphics/sub/a.png", [[0] * 8 for _ in range(8)])
            fx.commit()
            with open(os.path.join(tmp, "graphics/sub/a.4bpp"), "wb") as f:
                f.write(b"\x00" * 32)  # simulate a completed build's intermediate
            buckets, _methods = a.classify_pngs(tmp)
            self.assertIn("graphics/sub/a.png", buckets["generic_4bpp"])
            self.assertEqual(buckets["unknown"], [])

    def test_unconsumed_png_is_unknown(self):
        with tempfile.TemporaryDirectory() as tmp:
            fx = RepoGraphFixture(tmp)
            fx.add("Makefile", "")
            fx.add_png("graphics/sub/orphan.png", [[0] * 8 for _ in range(8)])
            fx.commit()
            # No .4bpp/.gbapal/.feimg+.fetsa sibling generated -- nothing consumes it.
            buckets, _methods = a.classify_pngs(tmp)
            self.assertIn("graphics/sub/orphan.png", buckets["unknown"])

    def test_explicit_renamed_fetsatool_rule_is_found(self):
        with tempfile.TemporaryDirectory() as tmp:
            fx = RepoGraphFixture(tmp)
            fx.add("Makefile", (
                "graphics/sub/Tsa_Renamed.bin: graphics/sub/Source.png\n"
                "\t$(PYTHON) scripts/gfxtools/tsa_generator.py $< "
                "$(@D)/Tsa_Renamed.feimg4.bin $@ --num_tiles=256\n"
            ))
            fx.add_png("graphics/sub/Source.png", [[0] * 8 for _ in range(8)])
            fx.commit()
            # No basename-matching sibling exists on disk -- only the explicit-rule
            # parse can find this consumer.
            buckets, methods = a.classify_pngs(tmp)
            self.assertIn("graphics/sub/Source.png", buckets["fetsatool"])
            self.assertEqual(methods["graphics/sub/Source.png"], 4)

    def test_documentation_preview_outside_graphics_is_not_unknown(self):
        with tempfile.TemporaryDirectory() as tmp:
            fx = RepoGraphFixture(tmp)
            fx.add("Makefile", "")
            fx.add_png("preview/x.png", [[0] * 8 for _ in range(8)])
            fx.commit()
            buckets, _methods = a.classify_pngs(tmp)
            self.assertIn("preview/x.png", buckets["documentation_preview"])
            self.assertEqual(buckets["unknown"], [])

    def test_num_tiles_override_parsed(self):
        with tempfile.TemporaryDirectory() as tmp:
            fx = RepoGraphFixture(tmp)
            fx.add("Makefile", "")
            fx.add(
                "graphics/sub/sub.mk",
                "DIR := graphics/sub\n"
                "$(DIR)/a_sheet.4bpp: %.4bpp: %.png\n"
                "\t$(GBAGFX) $< $@ -num_tiles 241\n",
            )
            fx.commit()
            overrides = a.parse_num_tiles_overrides(tmp)
            self.assertEqual(overrides.get("graphics/sub/a_sheet.4bpp"), 241)


class PayloadRelocOverlapTest(unittest.TestCase):
    """The optional --relocs-check companion (Makefile `graphicscheck-relocs` /
    `make shiftcheck`): a real ROM word that coincidentally looks like a
    pointer inside a pure-payload byte array is fine; an ACTUAL relocation
    slot landing inside one is a real defect. These test the parsing +
    overlap-detection logic against literal tool-output text (mirroring
    scripts/shiftcheck/test_scan_talk_table_relocs.py's approach), so no
    toolchain or real ELF is needed to exercise the logic."""

    def test_parse_readelf_filters_to_rom_range(self):
        text = (
            "\nRelocation section '.rel.rom' at offset 0x10 contains 2 entries:\n"
            " Offset     Info    Type            Sym.Value  Sym. Name\n"
            "08a5ea5c  01020304 R_ARM_ABS32       08000100   some_symbol\n"
            "00001234  01020304 R_ARM_ABS32       00000001   debug_sym\n"
        )
        offsets = a.parse_readelf_abs32_rom_offsets(text)
        self.assertEqual(offsets, [0x08A5EA5C])

    def test_parse_readelf_ignores_non_abs32(self):
        text = "08a5ea5c  01020304 R_ARM_ABS16       08000100   some_symbol\n"
        self.assertEqual(a.parse_readelf_abs32_rom_offsets(text), [])

    def test_parse_nm_sized_symbols(self):
        text = (
            "087d10e4 00002850 T btl_bg_59_tiles\n"
            "087d3934 00000050 T btl_bg_59_palette\n"
            "087d3984 00000000 T zero_size_label\n"
        )
        syms = a.parse_nm_sized_symbols(text)
        self.assertEqual(syms["btl_bg_59_tiles"], [(0x087D10E4, 0x2850)])
        self.assertEqual(syms["btl_bg_59_palette"], [(0x087D3934, 0x50)])
        self.assertNotIn("zero_size_label", syms)  # zero size -- nothing to overlap-check

    def test_is_payload_path_recognizes_all_documented_extensions(self):
        for path in [
            "graphics/x/a.4bpp", "graphics/x/a.4bpp.lz",
            "graphics/x/a.gbapal", "graphics/x/a.gbapal.lz",
            "graphics/x/a.agbpal", "graphics/x/a.agbpal.lz",
            "graphics/x/a.tsa.bin", "graphics/x/a.tsa.bin.lz",
            "graphics/x/a.map.bin", "graphics/x/a.map.bin.lz",
            "graphics/x/a.fetsa3.bin", "graphics/x/a.fetsa3.bin.lz",
            "graphics/x/a.feimg2.bin", "graphics/x/a.feimg2.bin.lz",
            "graphics/x/a.4bpp.fk",
        ]:
            self.assertTrue(a._is_payload_path(path), path)

    def test_is_payload_path_rejects_non_graphics_and_generic_bin(self):
        self.assertFalse(a._is_payload_path("sound/x/a.bin"))
        self.assertFalse(a._is_payload_path("graphics/x/a.bin"))  # generic residual blob
        self.assertFalse(a._is_payload_path("graphics/x/a.mid"))

    def test_find_incbin_payload_names_end_to_end(self):
        with tempfile.TemporaryDirectory() as tmp:
            fx = RepoGraphFixture(tmp)
            fx.add(
                "src/data/x/x.c",
                'u8 gFoo_tiles[] = INCBIN_U8("graphics/x/gFoo.4bpp.lz");\n'
                'u16 gFoo_palette[] = INCBIN_U16("graphics/x/gFoo.gbapal.lz");\n'
                'u8 gFoo_sound[] = INCBIN_U8("sound/x/gFoo.bin");\n'
                'u8 gFoo_residue[] __attribute__((section(".data.gap0"))) = '
                'INCBIN_U8("graphics/x/gFoo_residue.bin.lz");\n',
            )
            fx.commit()
            names = a.find_incbin_payload_names(tmp)
            self.assertEqual(names, {"gFoo_tiles", "gFoo_palette"})

    def test_find_incbin_payload_names_extra_target_paths(self):
        with tempfile.TemporaryDirectory() as tmp:
            fx = RepoGraphFixture(tmp)
            fx.add(
                "src/data/x/x.c",
                'u8 Tsa_Renamed[] = INCBIN_U8("graphics/x/Tsa_Renamed.bin.lz");\n',
            )
            fx.commit()
            # "graphics/x/Tsa_Renamed.bin" doesn't match any recognized suffix on
            # its own (plain .bin) -- only the explicit-rule target list finds it.
            self.assertEqual(a.find_incbin_payload_names(tmp), set())
            names = a.find_incbin_payload_names(
                tmp, extra_target_paths=["graphics/x/Tsa_Renamed.bin"])
            self.assertEqual(names, {"Tsa_Renamed"})

    def test_overlap_detects_reloc_inside_symbol(self):
        reloc_offsets = [0x1000, 0x1010, 0x2000]
        name_to_ranges = {"payload_a": [(0x1000, 0x20)]}  # covers 0x1000-0x101F
        violations = a.check_payload_reloc_overlap(
            reloc_offsets, name_to_ranges, {"payload_a"})
        # One violation entry per overlapping (name, addr, size) range (reporting
        # the first offending reloc address); both 0x1000 and 0x1010 fall inside
        # this range but are summarized as a single reported defect.
        self.assertEqual(len(violations), 1)
        self.assertEqual(violations[0][:3], ("payload_a", 0x1000, 0x20))

    def test_no_overlap_when_relocs_are_elsewhere(self):
        reloc_offsets = [0x2000, 0x3000]
        name_to_ranges = {"payload_a": [(0x1000, 0x20)]}
        violations = a.check_payload_reloc_overlap(
            reloc_offsets, name_to_ranges, {"payload_a"})
        self.assertEqual(violations, [])

    def test_overlap_ignores_unrequested_names(self):
        # A relocation inside a symbol NOT in the requested `names` set (e.g. a
        # legitimately pointer-bearing object the caller deliberately excluded
        # from the pure-payload classification) must not be flagged -- only
        # symbols the caller actually classified as pure payload are checked.
        reloc_offsets = [0x1000]
        name_to_ranges = {"payload_a": [(0x2000, 0x20)], "other_sym": [(0x1000, 0x20)]}
        violations = a.check_payload_reloc_overlap(
            reloc_offsets, name_to_ranges, {"payload_a"})
        self.assertEqual(violations, [])


class FindIncbinGraphicsNamesTest(unittest.TestCase):
    """The relocation-CONTAINMENT denominator (find_incbin_graphics_names):
    EVERY `graphics/`-prefixed INCBIN declaration regardless of extension --
    unlike _is_payload_path()'s format-semantic allowlist, a generic `.bin`/
    `.bin.lz` blob (e.g. the real graphics/map/TileConfiguration7.bin.lz) is
    just as real a "shouldn't contain a relocation slot" candidate as a
    `.tsa.bin`."""

    def test_generic_bin_under_graphics_is_included(self):
        with tempfile.TemporaryDirectory() as tmp:
            fx = RepoGraphFixture(tmp)
            fx.add(
                "src/data/x/x.c",
                'u8 TileConfiguration7[] = INCBIN_U8("graphics/map/TileConfiguration7.bin.lz");\n',
            )
            fx.commit()
            names = a.find_incbin_graphics_names(tmp)
            self.assertEqual(names, {"TileConfiguration7"})

    def test_non_graphics_bin_is_excluded(self):
        with tempfile.TemporaryDirectory() as tmp:
            fx = RepoGraphFixture(tmp)
            fx.add(
                "src/data/x/x.c",
                'u8 gSound[] = INCBIN_U8("sound/x/gSound.bin");\n',
            )
            fx.commit()
            self.assertEqual(a.find_incbin_graphics_names(tmp), set())

    def test_superset_of_the_narrow_format_classifier(self):
        with tempfile.TemporaryDirectory() as tmp:
            fx = RepoGraphFixture(tmp)
            fx.add(
                "src/data/x/x.c",
                'u8 gFoo_tiles[] = INCBIN_U8("graphics/x/gFoo.4bpp.lz");\n'
                'u8 gFoo_residue[] = INCBIN_U8("graphics/x/gFoo_residue.bin.lz");\n',
            )
            fx.commit()
            narrow = a.find_incbin_payload_names(tmp)
            broad = a.find_incbin_graphics_names(tmp)
            self.assertEqual(narrow, {"gFoo_tiles"})
            self.assertEqual(broad, {"gFoo_tiles", "gFoo_residue"})
            self.assertTrue(narrow <= broad)

    def test_multiline_comment_with_bracket_annotations_does_not_leak(self):
        """Regression: a source comment documenting byte ranges in
        `[0xNNN,0xMMM)`-style notation (the REAL style used by e.g.
        src/data/frontier_df3_ending/frontier_df3_ending.c) must not be
        misparsed as an array declarator -- an earlier version of
        _INCBIN_DECL_RE's `[^\\]]*` bracket-content class matched across
        newlines (character classes aren't limited by re.DOTALL, which only
        affects `.`), letting the regex run away through an unrelated
        comment block and mis-pair a comment word with a much-later,
        unrelated INCBIN_U8() call."""
        with tempfile.TemporaryDirectory() as tmp:
            fx = RepoGraphFixture(tmp)
            fx.add(
                "src/data/x/x.c",
                "/* some comment describing sub-ranges:\n"
                " *   Tsa_SomeName_0  [0x000,0x4B4)  1204 B  hdr 0x131D\n"
                " *   Tsa_SomeName_1  [0x4B4,0x8F0)  1084 B  hdr 0x111D\n"
                " */\n"
                'u8 real_symbol_name[] __attribute__((section(".data.gap1"))) = INCBIN_U8(\n'
                '    "graphics/x/Tsa_SomeName_0.bin",\n'
                '    "graphics/x/Tsa_SomeName_1.bin");\n',
            )
            fx.commit()
            names = a.find_incbin_graphics_names(tmp)
            # Only the REAL declared variable is found; the comment's bracketed
            # byte-range annotations must not leak in as bogus symbol names.
            self.assertEqual(names, {"real_symbol_name"})


class NmAddrNameAndDerivationTest(unittest.TestCase):
    """parse_nm_addr_name() + derive_missing_symbol_sizes(): recovering a byte
    range for a hand-assembled label nm -S gives no explicit size for, from
    the next DISTINCT address in the full symbol table."""

    def test_parse_nm_addr_name_sorts_by_address(self):
        text = (
            "08000010 T zzz_last_in_text_but_lower_addr\n"
            "08000000 T aaa_first\n"
        )
        entries = a.parse_nm_addr_name(text)
        self.assertEqual(entries, [(0x08000000, "aaa_first"),
                                    (0x08000010, "zzz_last_in_text_but_lower_addr")])

    def test_derives_size_from_next_distinct_address(self):
        all_sorted = [
            (0x1000, "AnimSprite_A"),  # sizeless -- needs derivation
            (0x1020, "AnimSprite_B"),  # next distinct address -> A's size = 0x20
            (0x1040, "AnimSprite_C"),
        ]
        derived, undeliverable = a.derive_missing_symbol_sizes(
            all_sorted, {"AnimSprite_A"}, explicit_sizes={})
        self.assertEqual(derived["AnimSprite_A"], [(0x1000, 0x20)])
        self.assertEqual(undeliverable, set())

    def test_skips_same_address_alias_to_find_the_real_next_address(self):
        all_sorted = [
            (0x1000, "AnimSprite_A"),
            (0x1000, "AnimSprite_A_alias"),  # same address -- must be skipped
            (0x1030, "AnimSprite_B"),
        ]
        derived, undeliverable = a.derive_missing_symbol_sizes(
            all_sorted, {"AnimSprite_A"}, explicit_sizes={})
        self.assertEqual(derived["AnimSprite_A"], [(0x1000, 0x30)])

    def test_last_symbol_in_table_is_undeliverable(self):
        all_sorted = [
            (0x1000, "AnimSprite_A"),
            (0x1020, "AnimSprite_LAST"),  # nothing follows -- can't derive a size
        ]
        derived, undeliverable = a.derive_missing_symbol_sizes(
            all_sorted, {"AnimSprite_LAST"}, explicit_sizes={})
        self.assertEqual(derived, {})
        self.assertEqual(undeliverable, {"AnimSprite_LAST"})

    def test_already_explicit_names_are_not_rederived(self):
        all_sorted = [(0x1000, "AnimSprite_A"), (0x1020, "AnimSprite_B")]
        derived, undeliverable = a.derive_missing_symbol_sizes(
            all_sorted, {"AnimSprite_A"}, explicit_sizes={"AnimSprite_A": [(0x1000, 5)]})
        self.assertEqual(derived, {})  # already has an explicit size -- skipped
        self.assertEqual(undeliverable, set())


class CleanGitEnvTest(unittest.TestCase):
    """clean_git_env() -- part of the fix for a real incident where this test
    suite, run from inside this repo's own `make shiftcheck` pre-commit hook,
    committed synthetic fixture files into the ACTUAL FE8J repository because
    git hooks set GIT_DIR/GIT_WORK_TREE/GIT_INDEX_FILE in the environment, and
    those override any -C/cwd-based repo discovery for every `git` subprocess
    call, no matter the path passed. The PRIMARY fix is setUpModule() at the
    top of this file (stripping GIT_* from the process environment once, for
    every test); clean_git_env() is the reusable helper it (and
    audit_graphics_forms.git_ls_files()) are built on."""

    def test_strips_all_git_prefixed_vars_but_keeps_others(self):
        old = dict(os.environ)
        try:
            os.environ["GIT_DIR"] = "/some/wrapping/repo/.git"
            os.environ["GIT_WORK_TREE"] = "/some/wrapping/repo"
            os.environ["GIT_INDEX_FILE"] = "/some/wrapping/repo/.git/index"
            os.environ["PATH"] = old.get("PATH", "")
            env = a.clean_git_env()
            self.assertNotIn("GIT_DIR", env)
            self.assertNotIn("GIT_WORK_TREE", env)
            self.assertNotIn("GIT_INDEX_FILE", env)
            self.assertIn("PATH", env)  # non-GIT_ vars are preserved
        finally:
            os.environ.clear()
            os.environ.update(old)

    def test_fixture_commit_is_hermetic_against_inherited_git_dir(self):
        """Regression test for the exact incident: simulate a wrapping git hook
        by setting GIT_DIR/GIT_WORK_TREE/GIT_INDEX_FILE to point at a SEPARATE
        'outer' repo (built with clean_git_env() itself, so this test is not
        ALSO vulnerable to whatever environment the test runner happens to
        have -- this is the second thing that bit the real incident: the
        'outer' repo's own setup calls need to be hermetic too, independent of
        setUpModule(), since a test verifying hermeticity must not silently
        depend on a DIFFERENT hermeticity mechanism to set up its own fixture),
        then build+commit a RepoGraphFixture in its own tmp dir (as every
        other test in this file does) and confirm the commit landed in the
        fixture's OWN repo, not the simulated outer one."""
        with tempfile.TemporaryDirectory() as outer, tempfile.TemporaryDirectory() as inner:
            subprocess.run(["git", "init", "-q"], cwd=outer, check=True, env=a.clean_git_env())
            subprocess.run(["git", "config", "user.email", "outer@example.com"],
                            cwd=outer, check=True, env=a.clean_git_env())
            subprocess.run(["git", "config", "user.name", "outer"],
                            cwd=outer, check=True, env=a.clean_git_env())
            with open(os.path.join(outer, "outer.txt"), "w") as f:
                f.write("outer")
            subprocess.run(["git", "add", "outer.txt"], cwd=outer, check=True, env=a.clean_git_env())
            subprocess.run(["git", "commit", "-q", "-m", "outer initial"],
                            cwd=outer, check=True, env=a.clean_git_env())
            outer_log_before = subprocess.run(
                ["git", "log", "--oneline"], cwd=outer, capture_output=True, text=True,
                check=True, env=a.clean_git_env()).stdout

            old_env = dict(os.environ)
            try:
                # Simulate a git hook's environment: GIT_DIR/GIT_WORK_TREE/GIT_INDEX_FILE
                # pointing at the OUTER repo, as githooks/pre-commit's invocation of
                # `make shiftcheck` (which runs this whole test file) would set.
                os.environ["GIT_DIR"] = os.path.join(outer, ".git")
                os.environ["GIT_WORK_TREE"] = outer
                os.environ["GIT_INDEX_FILE"] = os.path.join(outer, ".git", "index")

                fx = RepoGraphFixture(inner)
                fx.add("Makefile", "")
                fx.add_png("graphics/sub/hermetic.png", [[0] * 8 for _ in range(8)])
                fx.commit()
            finally:
                os.environ.clear()
                os.environ.update(old_env)

            outer_log_after = subprocess.run(
                ["git", "log", "--oneline"], cwd=outer, capture_output=True, text=True,
                check=True, env=a.clean_git_env()).stdout
            # The outer repo must be COMPLETELY untouched (still 1 commit, unchanged).
            self.assertEqual(outer_log_before, outer_log_after)
            self.assertEqual(len(outer_log_after.strip().splitlines()), 1)
            # The inner fixture repo must have received the real commit.
            inner_log = subprocess.run(
                ["git", "-C", inner, "log", "--oneline"], capture_output=True, text=True,
                check=True, env=a.clean_git_env()).stdout
            self.assertIn("fixture", inner_log)
            self.assertTrue(
                os.path.exists(os.path.join(inner, "graphics", "sub", "hermetic.png")))
            # And the outer repo must NOT have gained the fixture's files.
            self.assertFalse(os.path.exists(os.path.join(outer, "graphics")))


if __name__ == "__main__":
    unittest.main()
