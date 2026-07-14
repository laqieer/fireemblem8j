#!/usr/bin/env python3
"""Focused unit tests for the glyph relocation audit (issue #143).

Uses small synthetic ROM buffers (no toolchain / build artifacts needed) so
missing-relocation, cycle, malformed-target, and clean-chain behavior are all
covered directly against the pure traversal/verification functions.
"""
import unittest

import audit_glyph_relocs as g

BASE = 0x08000000


class FakeRom:
    """A minimal, growable little-endian word-addressable ROM buffer."""

    def __init__(self, size=0x10000):
        self.buf = bytearray(size)

    def poke_u32(self, addr, value):
        off = addr - BASE
        if off + 4 > len(self.buf):
            self.buf.extend(b"\x00" * (off + 4 - len(self.buf)))
        self.buf[off:off + 4] = (value & 0xFFFFFFFF).to_bytes(4, "little")

    def bytes(self):
        return bytes(self.buf)


def make_glyph(rom, addr, sjis_next, sjis_byte1, width, bitmap=None):
    """Write a struct Glyph record (0x48 bytes) at `addr`."""
    rom.poke_u32(addr, sjis_next)
    rom.poke_u32(addr + 4, (width << 8) | sjis_byte1)
    bitmap = bitmap or [0] * 16
    assert len(bitmap) == 16
    for i, w in enumerate(bitmap):
        rom.poke_u32(addr + 8 + i * 4, w)


def make_table(rom, table_addr, head_map):
    """head_map: {trail_index (0..0xC0): head_addr_or_0}."""
    for i in range(g.TABLE_HEADS):
        rom.poke_u32(table_addr + i * 4, head_map.get(i, 0))


class ReadU32Test(unittest.TestCase):
    def test_in_range_read(self):
        rom = FakeRom()
        rom.poke_u32(BASE + 0x100, 0xDEADBEEF)
        self.assertEqual(g.read_u32(rom.bytes(), BASE, BASE + 0x100), 0xDEADBEEF)

    def test_out_of_range_returns_none(self):
        rom = FakeRom(0x10)
        self.assertIsNone(g.read_u32(rom.bytes(), BASE, BASE + 0x1000))
        self.assertIsNone(g.read_u32(rom.bytes(), BASE, BASE - 4))


class AuditTableCleanChainTest(unittest.TestCase):
    def test_clean_single_node_chain_fully_relocated(self):
        rom = FakeRom()
        table_addr = BASE + 0x1000
        glyph_addr = BASE + 0x2000
        make_table(rom, table_addr, {5: glyph_addr})
        make_glyph(rom, glyph_addr, sjis_next=0, sjis_byte1=0x82, width=8)

        relocs = {table_addr + 5 * 4}  # the only pointer word: the table head
        result = g.audit_table(rom.bytes(), table_addr, relocs)

        self.assertEqual(result["unique"], 1)
        self.assertEqual(result["slots"], 1)
        self.assertEqual(result["relocated"], 1)
        self.assertEqual(result["missing"], [])
        self.assertEqual(result["malformed"], [])

    def test_multi_node_chain_fully_relocated(self):
        rom = FakeRom()
        table_addr = BASE + 0x1000
        head = BASE + 0x2000
        second = BASE + 0x2100
        make_table(rom, table_addr, {7: head})
        make_glyph(rom, head, sjis_next=second, sjis_byte1=0x82, width=8)
        make_glyph(rom, second, sjis_next=0, sjis_byte1=0x83, width=9)

        relocs = {table_addr + 7 * 4, head}  # head slot + the one sjisNext word
        result = g.audit_table(rom.bytes(), table_addr, relocs)

        self.assertEqual(result["unique"], 2)
        self.assertEqual(result["slots"], 2)
        self.assertEqual(result["relocated"], 2)
        self.assertEqual(result["missing"], [])
        self.assertEqual(result["malformed"], [])


class AuditTableMissingRelocationTest(unittest.TestCase):
    def test_unrelocated_sjis_next_is_reported_missing(self):
        rom = FakeRom()
        table_addr = BASE + 0x1000
        head = BASE + 0x2000
        second = BASE + 0x2100
        index = 0x0E  # trail byte = index + 0x40 = 0x4E
        make_table(rom, table_addr, {index: head})
        make_glyph(rom, head, sjis_next=second, sjis_byte1=0x97, width=8)
        make_glyph(rom, second, sjis_next=0, sjis_byte1=0x82, width=8)

        # Table head IS relocated; the sjisNext word at `head` is NOT -- the
        # exact issue #143 bug class (a raw literal instead of `&sym`).
        relocs = {table_addr + index * 4}
        result = g.audit_table(rom.bytes(), table_addr, relocs)

        self.assertEqual(len(result["missing"]), 1)
        miss = result["missing"][0]
        self.assertEqual(miss["kind"], "sjisNext")
        self.assertEqual(miss["source"], head)
        self.assertEqual(miss["target"], second)
        self.assertEqual(miss["trail"], 0x4E)
        self.assertEqual(result["relocated"], 1)
        self.assertEqual(result["slots"], 2)
        # Traversal still succeeds (missing a relocation doesn't stop the walk
        # in the byte-identical build -- the VALUE is still correct there).
        self.assertEqual(result["unique"], 2)

    def test_unrelocated_table_head_is_reported_missing(self):
        rom = FakeRom()
        table_addr = BASE + 0x1000
        head = BASE + 0x2000
        make_table(rom, table_addr, {1: head})
        make_glyph(rom, head, sjis_next=0, sjis_byte1=0x82, width=8)

        result = g.audit_table(rom.bytes(), table_addr, relocs=frozenset())

        self.assertEqual(len(result["missing"]), 1)
        self.assertEqual(result["missing"][0]["kind"], "table-head")
        self.assertEqual(result["missing"][0]["source"], table_addr + 4)


class AuditTableMalformedTest(unittest.TestCase):
    def test_cycle_is_detected_and_does_not_hang(self):
        rom = FakeRom()
        table_addr = BASE + 0x1000
        a = BASE + 0x2000
        b = BASE + 0x2100
        make_table(rom, table_addr, {2: a})
        make_glyph(rom, a, sjis_next=b, sjis_byte1=0x82, width=8)
        make_glyph(rom, b, sjis_next=a, sjis_byte1=0x83, width=8)  # cycle back to a

        relocs = {table_addr + 2 * 4, a, b}
        result = g.audit_table(rom.bytes(), table_addr, relocs)

        self.assertEqual(len(result["malformed"]), 1)
        self.assertEqual(result["malformed"][0]["reason"], "cycle")
        # Both nodes visited exactly once before the cycle is caught.
        self.assertEqual(result["unique"], 2)

    def test_out_of_range_target_is_malformed_not_a_crash(self):
        rom = FakeRom()
        table_addr = BASE + 0x1000
        bogus = 0x02000000  # EWRAM-range value, not a valid ROM glyph address
        make_table(rom, table_addr, {3: bogus})

        result = g.audit_table(rom.bytes(), table_addr, relocs=frozenset())

        self.assertEqual(len(result["malformed"]), 1)
        self.assertEqual(result["malformed"][0]["reason"], "out-of-range")
        self.assertEqual(result["malformed"][0]["addr"], bogus)
        self.assertEqual(result["unique"], 0)

    def test_truncated_rom_reports_oob_not_a_crash(self):
        table_addr = BASE + 0x1000
        table_end = table_addr + g.TABLE_HEADS * 4  # 0x1000 + 0x300 = 0x1300

        # An all-NULL table that fits entirely in the buffer: nothing to read
        # past, so no malformed entries (every head is 0, chains never start).
        rom = FakeRom(table_end - BASE)
        make_table(rom, table_addr, {})
        result = g.audit_table(rom.bytes(), table_addr, relocs=frozenset())
        self.assertEqual(result["malformed"], [])

        # Now force a real OOB: a head glyph address whose OWN sjisNext read
        # (4 bytes at the glyph address) runs past the end of the buffer --
        # the glyph address itself is in-range, but dereferencing it is not.
        rom2 = FakeRom(table_end - BASE)
        glyph_addr = table_end  # right at the truncation boundary
        make_table(rom2, table_addr, {9: glyph_addr})
        result2 = g.audit_table(rom2.bytes(), table_addr, relocs=frozenset())
        self.assertEqual(len(result2["malformed"]), 1)
        self.assertEqual(result2["malformed"][0]["reason"], "sjisNext-oob")
        self.assertEqual(result2["malformed"][0]["addr"], glyph_addr)


class ReachableGlyphsTest(unittest.TestCase):
    def test_matches_audit_table_unique_count(self):
        rom = FakeRom()
        table_addr = BASE + 0x1000
        head = BASE + 0x2000
        second = BASE + 0x2100
        make_table(rom, table_addr, {0: head})
        make_glyph(rom, head, sjis_next=second, sjis_byte1=0x82, width=8)
        make_glyph(rom, second, sjis_next=0, sjis_byte1=0x83, width=8)

        addrs = g.reachable_glyphs(rom.bytes(), table_addr)
        self.assertEqual(addrs, {head, second})


class VerifyShiftTest(unittest.TestCase):
    def _build_pair(self, shift):
        rom = FakeRom(0x10000)
        table_addr = BASE + 0x1000
        head = BASE + 0x2000
        second = BASE + 0x2100
        make_table(rom, table_addr, {0x10: head})
        make_glyph(rom, head, sjis_next=second, sjis_byte1=0x97, width=9,
                   bitmap=list(range(16)))
        make_glyph(rom, second, sjis_next=0, sjis_byte1=0x82, width=8,
                   bitmap=list(range(16, 32)))
        base_bytes = rom.bytes()

        # A correctly shifted ROM: file offset (addr - BASE) + shift, every
        # link bumped by +shift, payload bytes copied verbatim.
        shifted = bytearray(len(base_bytes) + shift)
        shifted[shift:shift + len(base_bytes)] = base_bytes
        # Patch the table head + sjisNext links to carry +shift.
        def patch_u32(addr, value):
            off = (addr - BASE) + shift
            shifted[off:off + 4] = (value & 0xFFFFFFFF).to_bytes(4, "little")
        patch_u32(table_addr + 0x10 * 4, head + shift)
        patch_u32(head, second + shift)
        patch_u32(second, 0)
        return base_bytes, bytes(shifted), table_addr, head, second

    def test_clean_shift_has_no_mismatches(self):
        shift = 0x40000
        base_bytes, shifted_bytes, table_addr, head, second = self._build_pair(shift)
        n_unique, mismatches = g.verify_shift(base_bytes, shifted_bytes, table_addr, shift)
        self.assertEqual(n_unique, 2)
        self.assertEqual(mismatches, [])

    def test_stale_link_is_reported(self):
        shift = 0x40000
        base_bytes, shifted_bytes, table_addr, head, second = self._build_pair(shift)
        # Corrupt the shifted head's sjisNext word back to the UNSHIFTED value
        # (the exact issue #143 failure mode: a raw literal that didn't move).
        mutable = bytearray(shifted_bytes)
        off = (head - BASE) + shift
        mutable[off:off + 4] = second.to_bytes(4, "little")  # stale (missing +shift)

        n_unique, mismatches = g.verify_shift(base_bytes, bytes(mutable), table_addr, shift)
        self.assertEqual(n_unique, 2)
        self.assertEqual(len(mismatches), 1)
        self.assertEqual(mismatches[0]["kind"], "sjisNext")
        self.assertEqual(mismatches[0]["source"], head)
        self.assertEqual(mismatches[0]["expected"], second + shift)
        self.assertEqual(mismatches[0]["shifted"], second)

    def test_payload_mismatch_is_reported(self):
        shift = 0x40000
        base_bytes, shifted_bytes, table_addr, head, second = self._build_pair(shift)
        mutable = bytearray(shifted_bytes)
        # Corrupt one bitmap byte of the shifted `head` glyph's payload.
        off = (head - BASE) + shift + 4 + 8  # inside .bitmap
        mutable[off] ^= 0xFF

        n_unique, mismatches = g.verify_shift(base_bytes, bytes(mutable), table_addr, shift)
        kinds = [m["kind"] for m in mismatches]
        self.assertIn("payload", kinds)


class NamedRunContractTest(unittest.TestCase):
    def _fixture(self):
        rom = FakeRom()
        system = BASE + 0x1000
        talk = BASE + 0x1400
        run = BASE + 0x3000
        count = 3
        size = count * g.GLYPH_SIZE
        internal = {0: 1}

        make_table(rom, system, {0: run, 1: run + 2 * g.GLYPH_SIZE})
        make_table(rom, talk, {})
        make_glyph(rom, run, run + g.GLYPH_SIZE, 0x82, 8)
        make_glyph(rom, run + g.GLYPH_SIZE, 0, 0x83, 8)
        make_glyph(rom, run + 2 * g.GLYPH_SIZE, 0, 0x84, 8)

        relocs = {system, system + 4, run}
        tables = {"TextGlyphs_System": system, "TextGlyphs_Talk": talk}
        return rom, run, size, count, internal, tables, relocs

    def _audit(self, rom, run, size, count, internal, tables, relocs,
               symbol_addr=None, symbol_size=None):
        return g.audit_named_glyph_run(
            rom.bytes(), run, size, count, internal, tables, relocs,
            run if symbol_addr is None else symbol_addr,
            size if symbol_size is None else symbol_size,
        )

    def test_clean_named_run_contract(self):
        args = self._fixture()
        result = self._audit(*args)
        self.assertEqual(result["errors"], [])
        self.assertEqual(result["system"], 3)
        self.assertEqual(result["talk"], 0)
        self.assertEqual(result["incoming"], 3)
        self.assertEqual(result["external"], 2)
        self.assertEqual(result["internal"], 1)
        self.assertEqual(result["relocated"], 3)
        self.assertEqual(result["run_relocs"], 1)

    def test_missing_inbound_record_is_rejected(self):
        rom, run, size, count, internal, tables, relocs = self._fixture()
        make_table(rom, tables["TextGlyphs_System"], {0: run})
        relocs.remove(tables["TextGlyphs_System"] + 4)

        result = self._audit(rom, run, size, count, internal, tables, relocs)
        self.assertTrue(any("record 2 incoming=0" in error for error in result["errors"]))
        self.assertTrue(any("reaches 2/3" in error for error in result["errors"]))

    def test_duplicate_incoming_is_rejected(self):
        rom, run, size, count, internal, tables, relocs = self._fixture()
        system = tables["TextGlyphs_System"]
        make_table(rom, system, {0: run, 1: run + 2 * g.GLYPH_SIZE,
                                 2: run + 2 * g.GLYPH_SIZE})
        relocs.add(system + 8)

        result = self._audit(rom, run, size, count, internal, tables, relocs)
        self.assertTrue(any("record 2 incoming=2" in error for error in result["errors"]))

    def test_wrong_internal_target_is_rejected(self):
        rom, run, size, count, internal, tables, relocs = self._fixture()
        rom.poke_u32(run, run + 2 * g.GLYPH_SIZE)

        result = self._audit(rom, run, size, count, internal, tables, relocs)
        self.assertTrue(any("record 0 sjisNext" in error for error in result["errors"]))

    def test_relocation_in_bitmap_payload_is_rejected(self):
        rom, run, size, count, internal, tables, relocs = self._fixture()
        relocs.add(run + 8)

        result = self._audit(rom, run, size, count, internal, tables, relocs)
        self.assertTrue(any("relocation sources inside run" in error
                            for error in result["errors"]))
        self.assertTrue(any(f"0x{run + 8:08X}" in error for error in result["errors"]))

    def test_wrong_symbol_extent_is_rejected(self):
        rom, run, size, count, internal, tables, relocs = self._fixture()

        result = self._audit(
            rom, run, size, count, internal, tables, relocs,
            symbol_addr=run, symbol_size=size - 4,
        )
        self.assertTrue(any("symbol extent" in error for error in result["errors"]))


if __name__ == "__main__":
    unittest.main()
