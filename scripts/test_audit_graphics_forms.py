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
    h = len(pixels)
    w = len(pixels[0])
    im = Image.new("L", (w, h))
    px = im.load()
    for y in range(h):
        for x in range(w):
            px[x, y] = pixels[y][x]
    im.save(path)


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

    def test_l_mode_inverts_index(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.png")
            pixels = [[x for x in range(8)] for _ in range(8)]
            make_l_png(path, pixels)
            out = a.png_to_tiles_4bpp(path)
            # raw x=0,1 -> 0,1; inverted -> 15,14; byte = (14<<4)|15 = 0xEF.
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
            kind, reason = a.classify_tsa_bin(path, "graphics/misc/gMenuSoundroom_4.tsa.bin")
            self.assertEqual(kind, "named_exception")

    def test_garbage_size_is_unknown(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "t.tsa.bin")
            with open(path, "wb") as f:
                f.write(b"\x01\x02\x03\x04\x05")
            kind, reason = a.classify_tsa_bin(path, "graphics/x/t.tsa.bin")
            self.assertEqual(kind, "unknown")
            self.assertIsNotNone(reason)


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
    can be exercised end-to-end without touching the real, huge repo tree."""

    def __init__(self, tmp):
        self.root = tmp
        os.makedirs(os.path.join(tmp, "graphics", "sub"), exist_ok=True)
        subprocess.run(["git", "init", "-q"], cwd=tmp, check=True)
        subprocess.run(["git", "config", "user.email", "t@example.com"], cwd=tmp, check=True)
        subprocess.run(["git", "config", "user.name", "t"], cwd=tmp, check=True)

    def add(self, rel_path, content=b""):
        path = os.path.join(self.root, rel_path)
        os.makedirs(os.path.dirname(path), exist_ok=True)
        if isinstance(content, str):
            content = content.encode()
        with open(path, "wb") as f:
            f.write(content)
        subprocess.run(["git", "add", rel_path], cwd=self.root, check=True)

    def add_png(self, rel_path, pixels):
        path = os.path.join(self.root, rel_path)
        os.makedirs(os.path.dirname(path), exist_ok=True)
        make_p_png(path, pixels)
        subprocess.run(["git", "add", rel_path], cwd=self.root, check=True)

    def commit(self):
        subprocess.run(["git", "commit", "-q", "-m", "fixture"], cwd=self.root, check=True)


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


if __name__ == "__main__":
    unittest.main()
