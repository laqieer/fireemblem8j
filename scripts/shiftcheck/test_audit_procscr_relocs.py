#!/usr/bin/env python3
"""Focused unit tests for the ProcCmd relocation audit (issue #143 follow-up).

Uses small synthetic ROM buffers (no toolchain / build artifacts needed) so
missing-relocation, unknown-opcode, bad-size, out-of-range, unexpected-
relocation-on-non-pointer-field, and clean-array behavior are all covered
directly against the pure decode/verification functions.
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


def make_array(rom, addr, records):
    """records: list of (opcode, data_imm, data_ptr)."""
    for i, (opcode, data_imm, data_ptr) in enumerate(records):
        make_record(rom, addr + i * p.RECORD_SIZE, opcode, data_imm, data_ptr)
    return len(records) * p.RECORD_SIZE


class OpcodeTableTest(unittest.TestCase):
    def test_pointer_opcodes_match_proc_h(self):
        # Mirrors include/proc.h's PROC_* macro table: every macro whose third
        # field is a real operand, not the literal 0.
        self.assertEqual(p.POINTER_OPCODES,
                          {0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
                           0x09, 0x0A, 0x0D, 0x14, 0x16, 0x18})

    def test_non_pointer_opcodes_excluded(self):
        non_pointer = {0x00, 0x0B, 0x0C, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x15, 0x17, 0x19}
        self.assertEqual(non_pointer & p.POINTER_OPCODES, set())
        self.assertTrue(non_pointer <= p.KNOWN_OPCODES)


class AuditArrayCleanTest(unittest.TestCase):
    def test_clean_array_fully_relocated(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        target = BASE + 0x2000
        size = make_array(rom, addr, [
            (0x01, 0, target),   # PROC_NAME(target)
            (0x03, 0, target),   # PROC_REPEAT(target) -- reuses same word for simplicity
            (0x00, 0, 0),        # PROC_END
        ])
        relocs = {addr + 4, addr + 8 + 4}
        result = p.audit_array(rom.bytes(), addr, size, relocs)

        self.assertEqual(result["records"], 3)
        self.assertEqual(result["slots"], 2)
        self.assertEqual(result["relocated"], 2)
        self.assertEqual(result["missing"], [])
        self.assertEqual(result["malformed"], [])

    def test_null_pointer_field_needs_no_relocation(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        size = make_array(rom, addr, [
            (0x03, 0, 0),   # PROC_REPEAT(NULL) -- unusual but not our concern
            (0x00, 0, 0),
        ])
        result = p.audit_array(rom.bytes(), addr, size, relocs=frozenset())
        self.assertEqual(result["slots"], 0)
        self.assertEqual(result["missing"], [])
        self.assertEqual(result["malformed"], [])

    def test_non_pointer_opcode_ignored(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        size = make_array(rom, addr, [
            (0x0F, 0xA, 0),   # PROC_MARK(0xA) -- dataImm carries the payload, not dataPtr
            (0x0E, 5, 0),     # PROC_SLEEP(5)
            (0x00, 0, 0),
        ])
        result = p.audit_array(rom.bytes(), addr, size, relocs=frozenset())
        self.assertEqual(result["slots"], 0)
        self.assertEqual(result["missing"], [])
        self.assertEqual(result["malformed"], [])


class AuditArrayMissingRelocationTest(unittest.TestCase):
    def test_unrelocated_proc_name_is_reported_missing(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        target = BASE + 0x2000
        size = make_array(rom, addr, [
            (0x01, 0, target),   # PROC_NAME(target) -- the exact issue #143 bug class:
                                  # a raw literal instead of `&sym`, no relocation.
            (0x03, 0, target),   # PROC_REPEAT IS relocated
            (0x00, 0, 0),
        ])
        relocs = {addr + 8 + 4}   # only the PROC_REPEAT word relocates
        result = p.audit_array(rom.bytes(), addr, size, relocs)

        self.assertEqual(len(result["missing"]), 1)
        miss = result["missing"][0]
        self.assertEqual(miss["source"], addr + 4)
        self.assertEqual(miss["target"], target)
        self.assertEqual(miss["opcode"], 0x01)
        self.assertEqual(result["relocated"], 1)
        self.assertEqual(result["slots"], 2)


class AuditArrayMalformedTest(unittest.TestCase):
    def test_bad_size_not_multiple_of_8(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        make_array(rom, addr, [(0x00, 0, 0)])
        result = p.audit_array(rom.bytes(), addr, 7, relocs=frozenset())
        self.assertEqual(len(result["malformed"]), 1)
        self.assertEqual(result["malformed"][0]["reason"], "bad-size")

    def test_out_of_range_array(self):
        rom = FakeRom()
        addr = 0x02000000  # EWRAM, not a valid ROM array address
        result = p.audit_array(rom.bytes(), addr, 8, relocs=frozenset())
        self.assertEqual(len(result["malformed"]), 1)
        self.assertEqual(result["malformed"][0]["reason"], "out-of-range")

    def test_unknown_opcode(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        size = make_array(rom, addr, [(0x7F, 0, 0), (0x00, 0, 0)])
        result = p.audit_array(rom.bytes(), addr, size, relocs=frozenset())
        reasons = [m["reason"] for m in result["malformed"]]
        self.assertIn("unknown-opcode", reasons)

    def test_pointer_out_of_range_target(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        bogus = 0x02000000  # EWRAM value, not a valid ROM pointer
        size = make_array(rom, addr, [(0x01, 0, bogus), (0x00, 0, 0)])
        result = p.audit_array(rom.bytes(), addr, size, relocs=frozenset())
        reasons = [m["reason"] for m in result["malformed"]]
        self.assertIn("ptr-out-of-range", reasons)
        self.assertEqual(result["missing"], [])  # never double-reported as missing

    def test_unexpected_relocation_on_opcode_field(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        size = make_array(rom, addr, [(0x00, 0, 0)])
        relocs = {addr}  # a relocation on the opcode/dataImm word makes no sense
        result = p.audit_array(rom.bytes(), addr, size, relocs)
        reasons = [m["reason"] for m in result["malformed"]]
        self.assertIn("unexpected-reloc-opcode-field", reasons)

    def test_unexpected_relocation_on_null_pointer_field(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        size = make_array(rom, addr, [(0x03, 0, 0)])  # PROC_REPEAT(NULL)
        relocs = {addr + 4}  # a relocation on a NULL dataPtr is nonsensical
        result = p.audit_array(rom.bytes(), addr, size, relocs)
        reasons = [m["reason"] for m in result["malformed"]]
        self.assertIn("unexpected-reloc-null-ptr", reasons)

    def test_unexpected_relocation_on_non_pointer_opcode(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        size = make_array(rom, addr, [(0x0F, 0xA, 0)])  # PROC_MARK: dataPtr never a pointer
        relocs = {addr + 4}
        result = p.audit_array(rom.bytes(), addr, size, relocs)
        reasons = [m["reason"] for m in result["malformed"]]
        self.assertIn("unexpected-reloc-non-ptr-opcode", reasons)


class DefinitionScanTest(unittest.TestCase):
    def test_extern_declaration_is_not_a_definition(self):
        text = "extern struct ProcCmd NAME[];\n"
        m = p.DECL_RE.search(text)
        self.assertIsNotNone(m)
        self.assertFalse(p._is_definition(text, m.end()))

    def test_real_definition_is_detected(self):
        text = ('struct ProcCmd NAME[] __attribute__((section(".data.x"))) = {\n'
                '    PROC_END,\n};\n')
        m = p.DECL_RE.search(text)
        self.assertIsNotNone(m)
        self.assertTrue(p._is_definition(text, m.end()))

    def test_mistyped_extern_of_a_differently_typed_symbol_is_excluded(self):
        # The exact sCpProcData class: an extern struct ProcCmd forward decl
        # for a symbol whose REAL definition elsewhere is a plain u32[].
        text = "extern struct ProcCmd sCpProcData[];\n"
        m = p.DECL_RE.search(text)
        self.assertIsNotNone(m)
        self.assertFalse(p._is_definition(text, m.end()))


class VerifyShiftTest(unittest.TestCase):
    def _build_pair(self, shift):
        rom = FakeRom(0x10000)
        addr = BASE + 0x1000
        target = BASE + 0x2000
        size = make_array(rom, addr, [
            (0x01, 0, target),
            (0x0F, 0xA, 0),   # non-pointer opcode: must NOT be shifted/checked
            (0x00, 0, 0),
        ])
        base_bytes = rom.bytes()
        shifted = bytearray(len(base_bytes) + shift)
        shifted[shift:shift + len(base_bytes)] = base_bytes

        def patch_u32(a, value):
            off = (a - BASE) + shift
            shifted[off:off + 4] = (value & 0xFFFFFFFF).to_bytes(4, "little")

        patch_u32(addr + 4, target + shift)
        return base_bytes, bytes(shifted), addr, size

    def test_clean_shift_has_no_mismatches(self):
        shift = 0x40000
        base_bytes, shifted_bytes, addr, size = self._build_pair(shift)
        checked, mismatches = p.verify_shift(base_bytes, shifted_bytes, addr, size, shift)
        self.assertEqual(checked, 1)  # only the one pointer-bearing field
        self.assertEqual(mismatches, [])

    def test_stale_link_is_reported(self):
        shift = 0x40000
        base_bytes, shifted_bytes, addr, size = self._build_pair(shift)
        mutable = bytearray(shifted_bytes)
        off = (addr + 4 - BASE) + shift
        # Corrupt it back to the UNSHIFTED value -- the exact issue #143 bug:
        # a raw literal that never moved.
        mutable[off:off + 4] = (BASE + 0x2000).to_bytes(4, "little")

        checked, mismatches = p.verify_shift(base_bytes, bytes(mutable), addr, size, shift)
        self.assertEqual(len(mismatches), 1)
        self.assertEqual(mismatches[0]["source"], addr + 4)
        self.assertEqual(mismatches[0]["expected"], BASE + 0x2000 + shift)
        self.assertEqual(mismatches[0]["shifted"], BASE + 0x2000)


if __name__ == "__main__":
    unittest.main()
