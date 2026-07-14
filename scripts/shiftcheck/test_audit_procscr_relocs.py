#!/usr/bin/env python3
"""Focused unit tests for the broadened ProcCmd relocation audit (issue #143
follow-up rescan: strict-decode every ROM symbol address, not just
source-declared `struct ProcCmd` arrays).

Uses small synthetic ROM buffers (no toolchain / build artifacts needed) so
missing-relocation, unknown-opcode, non-pointer-opcode-with-nonzero-ptr,
pointer-out-of-range, non-terminating (runaway) decode, unexpected relocation
on a non-pointer field, alias/dedup-by-address, and clean-prefix behavior are
all covered directly against the pure decode/audit/verification functions.
"""
import unittest

import audit_procscr_relocs as p

BASE = 0x08000000


class FakeRom:
    def __init__(self, size=0x10000):
        self.buf = bytearray(size)

    def poke_u16(self, addr, value):
        off = addr - BASE
        if off + 2 > len(self.buf):
            self.buf.extend(b"\x00" * (off + 2 - len(self.buf)))
        self.buf[off:off + 2] = (value & 0xFFFF).to_bytes(2, "little")

    def poke_u32(self, addr, value):
        off = addr - BASE
        if off + 4 > len(self.buf):
            self.buf.extend(b"\x00" * (off + 4 - len(self.buf)))
        self.buf[off:off + 4] = (value & 0xFFFFFFFF).to_bytes(4, "little")

    def bytes(self):
        return bytes(self.buf)


def make_record(rom, addr, opcode, data_imm, data_ptr):
    rom.poke_u16(addr, opcode)
    rom.poke_u16(addr + 2, data_imm)
    rom.poke_u32(addr + 4, data_ptr)


def make_script(rom, addr, records):
    """records: list of (opcode, data_imm, data_ptr). Returns end address."""
    for i, (opcode, data_imm, data_ptr) in enumerate(records):
        make_record(rom, addr + i * p.RECORD_SIZE, opcode, data_imm, data_ptr)
    return addr + len(records) * p.RECORD_SIZE


class OpcodeTableTest(unittest.TestCase):
    def test_pointer_opcodes_match_proc_h(self):
        self.assertEqual(p.POINTER_OPCODES,
                          {0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
                           0x09, 0x0A, 0x0D, 0x14, 0x16, 0x18})

    def test_non_pointer_opcodes_excluded(self):
        non_pointer = {0x00, 0x0B, 0x0C, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x15, 0x17, 0x19}
        self.assertEqual(non_pointer & p.POINTER_OPCODES, set())
        self.assertTrue(non_pointer <= p.KNOWN_OPCODES)


class DecodePrefixCleanTest(unittest.TestCase):
    def test_single_record_script_decodes(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        target = BASE + 0x2000
        make_script(rom, addr, [
            (0x01, 0, target),   # PROC_NAME(target)
            (0x03, 0, target),   # PROC_REPEAT(target)
            (0x00, 0, 0),        # PROC_END
        ])
        events = p.decode_prefix(rom.bytes(), addr)
        self.assertIsNotNone(events)
        # 3 records * 2 events (opcode-field, ptr-field) = 6 events.
        self.assertEqual(len(events), 6)
        result = p.audit_prefix(events, relocs=frozenset())
        self.assertEqual(result["records"], 3)
        self.assertEqual(result["slots"], 2)

    def test_null_pointer_field_in_valid_script(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        make_script(rom, addr, [(0x03, 0, 0), (0x00, 0, 0)])
        events = p.decode_prefix(rom.bytes(), addr)
        self.assertIsNotNone(events)
        result = p.audit_prefix(events, relocs=frozenset())
        self.assertEqual(result["slots"], 0)

    def test_non_pointer_opcode_with_dataimm_payload(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        make_script(rom, addr, [(0x0F, 0xA, 0), (0x0E, 5, 0), (0x00, 0, 0)])
        events = p.decode_prefix(rom.bytes(), addr)
        self.assertIsNotNone(events)
        result = p.audit_prefix(events, relocs=frozenset())
        self.assertEqual(result["slots"], 0)
        self.assertEqual(result["records"], 3)


class DecodePrefixRejectionTest(unittest.TestCase):
    def test_unknown_opcode_rejects(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        make_script(rom, addr, [(0x7F, 0, 0), (0x00, 0, 0)])
        self.assertIsNone(p.decode_prefix(rom.bytes(), addr))

    def test_non_pointer_opcode_nonzero_ptr_rejects(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        # PROC_MARK's dataPtr is always 0 in real data; a nonzero value here
        # means this is NOT genuine ProcCmd data (the whole point of a STRICT
        # decode: false positives from coincidental byte patterns are rejected).
        make_script(rom, addr, [(0x0F, 0xA, 0x1234), (0x00, 0, 0)])
        self.assertIsNone(p.decode_prefix(rom.bytes(), addr))

    def test_pointer_out_of_range_rejects(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        bogus = 0x02000000  # EWRAM, not a valid ROM pointer
        make_script(rom, addr, [(0x01, 0, bogus), (0x00, 0, 0)])
        self.assertIsNone(p.decode_prefix(rom.bytes(), addr))

    def test_malformed_proc_end_with_nonzero_dataimm_rejects(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        make_script(rom, addr, [(0x03, 0, 0), (0x00, 0x5, 0)])  # "PROC_END" with junk dataImm
        self.assertIsNone(p.decode_prefix(rom.bytes(), addr))

    def test_never_terminating_rejects_without_hanging(self):
        rom = FakeRom(p.MAX_RECORDS * p.RECORD_SIZE + 0x100)
        addr = BASE + 0x1000
        # Fill with a repeating valid-looking non-terminating record so the
        # decode must hit the MAX_RECORDS cap instead of running away.
        for i in range(p.MAX_RECORDS + 4):
            make_record(rom, addr + i * p.RECORD_SIZE, 0x03, 0, 0)  # PROC_REPEAT(NULL), never PROC_END
        self.assertIsNone(p.decode_prefix(rom.bytes(), addr))

    def test_out_of_bounds_read_rejects(self):
        rom = FakeRom(8)  # only one record's worth of space
        addr = BASE
        make_record(rom, addr, 0x03, 0, 0)  # PROC_REPEAT(NULL): valid but never ends
        # No bytes exist for the next record -> must reject, not crash.
        self.assertIsNone(p.decode_prefix(rom.bytes(), addr))


class AuditPrefixMissingRelocationTest(unittest.TestCase):
    def test_unrelocated_pointer_field_is_reported_missing(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        target = BASE + 0x2000
        make_script(rom, addr, [
            (0x01, 0, target),   # PROC_NAME(target) -- the exact bug class: a raw
                                  # literal instead of `&sym`, no relocation.
            (0x03, 0, target),   # PROC_REPEAT IS relocated
            (0x00, 0, 0),
        ])
        events = p.decode_prefix(rom.bytes(), addr)
        relocs = {addr + 8 + 4}  # only the PROC_REPEAT word relocates
        result = p.audit_prefix(events, relocs)

        self.assertEqual(len(result["missing"]), 1)
        miss = result["missing"][0]
        self.assertEqual(miss["source"], addr + 4)
        self.assertEqual(miss["target"], target)
        self.assertEqual(miss["opcode"], 0x01)
        self.assertEqual(result["relocated"], 1)
        self.assertEqual(result["slots"], 2)


class AuditPrefixUnexpectedRelocationTest(unittest.TestCase):
    def test_unexpected_relocation_on_opcode_field(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        make_script(rom, addr, [(0x00, 0, 0)])
        events = p.decode_prefix(rom.bytes(), addr)
        result = p.audit_prefix(events, relocs={addr})
        reasons = [m["reason"] for m in result["malformed"]]
        self.assertIn("unexpected-reloc-opcode-field", reasons)

    def test_unexpected_relocation_on_null_pointer_field(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        make_script(rom, addr, [(0x03, 0, 0), (0x00, 0, 0)])
        events = p.decode_prefix(rom.bytes(), addr)
        result = p.audit_prefix(events, relocs={addr + 4})
        reasons = [m["reason"] for m in result["malformed"]]
        self.assertIn("unexpected-reloc-null-ptr", reasons)

    def test_unexpected_relocation_on_non_pointer_opcode(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        make_script(rom, addr, [(0x0F, 0xA, 0), (0x00, 0, 0)])
        events = p.decode_prefix(rom.bytes(), addr)
        result = p.audit_prefix(events, relocs={addr + 4})
        reasons = [m["reason"] for m in result["malformed"]]
        self.assertIn("unexpected-reloc-non-ptr-opcode", reasons)


class FindScriptPrefixesDedupTest(unittest.TestCase):
    def test_only_valid_addresses_are_returned(self):
        rom = FakeRom()
        good = BASE + 0x1000
        bad = BASE + 0x2000
        make_script(rom, good, [(0x03, 0, 0), (0x00, 0, 0)])
        rom.poke_u16(bad, 0x7F)  # unknown opcode -> invalid prefix

        prefixes = p.find_script_prefixes(rom.bytes(), [good, bad])
        self.assertEqual(set(prefixes.keys()), {good})

    def test_duplicate_address_from_alias_names_decoded_once(self):
        # Mirrors ProcScr_efxFireOBJ / frontier_df4_banim_a_010_5FF7C8: two nm
        # names sharing one address. The caller (main()) dedupes via
        # names_by_addr's dict keys, so find_script_prefixes only ever sees the
        # address once regardless of how many names map to it.
        rom = FakeRom()
        addr = BASE + 0x1000
        make_script(rom, addr, [(0x01, 0, BASE + 0x2000), (0x00, 0, 0)])
        prefixes = p.find_script_prefixes(rom.bytes(), [addr])
        self.assertEqual(len(prefixes), 1)


class VerifyShiftTest(unittest.TestCase):
    def _build_pair(self, shift):
        rom = FakeRom(0x10000)
        addr = BASE + 0x1000
        target = BASE + 0x2000
        make_script(rom, addr, [
            (0x01, 0, target),
            (0x0F, 0xA, 0),   # non-pointer opcode: must NOT be checked/shifted
            (0x00, 0, 0),
        ])
        base_bytes = rom.bytes()
        shifted = bytearray(len(base_bytes) + shift)
        shifted[shift:shift + len(base_bytes)] = base_bytes

        def patch_u32(a, value):
            off = (a - BASE) + shift
            shifted[off:off + 4] = (value & 0xFFFFFFFF).to_bytes(4, "little")

        patch_u32(addr + 4, target + shift)
        return base_bytes, bytes(shifted), addr

    def test_clean_shift_has_no_mismatches(self):
        shift = 0x40000
        base_bytes, shifted_bytes, addr = self._build_pair(shift)
        events = p.decode_prefix(base_bytes, addr)
        checked, mismatches = p.verify_shift(events, base_bytes, shifted_bytes, shift)
        self.assertEqual(checked, 1)
        self.assertEqual(mismatches, [])

    def test_stale_link_is_reported(self):
        shift = 0x40000
        base_bytes, shifted_bytes, addr = self._build_pair(shift)
        events = p.decode_prefix(base_bytes, addr)
        mutable = bytearray(shifted_bytes)
        off = (addr + 4 - BASE) + shift
        # Corrupt it back to the UNSHIFTED value -- the exact issue #143 bug:
        # a raw literal that never moved.
        mutable[off:off + 4] = (BASE + 0x2000).to_bytes(4, "little")

        checked, mismatches = p.verify_shift(events, base_bytes, bytes(mutable), shift)
        self.assertEqual(len(mismatches), 1)
        self.assertEqual(mismatches[0]["source"], addr + 4)
        self.assertEqual(mismatches[0]["expected"], BASE + 0x2000 + shift)
        self.assertEqual(mismatches[0]["shifted"], BASE + 0x2000)


if __name__ == "__main__":
    unittest.main()
