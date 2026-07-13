#!/usr/bin/env python3

import unittest

import audit_pointer_classification as audit


def relocation(symbol_type, symbol_value, linked_value):
    return audit.RomAbs32Relocation(
        slot=0x08AC2830,
        linked_value=linked_value,
        symbol=audit.ElfSymbol(
            name="Target",
            value=symbol_value,
            size=0x40,
            st_type=symbol_type,
        ),
        source_section=".rel.rom",
        target_section=".rom",
    )


class AuditPointerClassificationTest(unittest.TestCase):
    def test_normal_thumb_entry_is_accepted(self):
        result = audit.classify_function_relocations(
            [relocation(audit.STT_FUNC, 0x08001001, 0x08001001)]
        )

        self.assertEqual(result.func_targets, 1)
        self.assertEqual(result.thumb_entries, 1)
        self.assertEqual(result.even_entries, 0)
        self.assertEqual(result.suspects, [])

    def test_even_function_entry_is_accepted(self):
        result = audit.classify_function_relocations(
            [relocation(audit.STT_FUNC, 0x08001001, 0x08001000)]
        )

        self.assertEqual(result.func_targets, 1)
        self.assertEqual(result.even_entries, 1)
        self.assertEqual(result.thumb_entries, 0)
        self.assertEqual(result.suspects, [])

    def test_function_interior_is_rejected(self):
        candidate = relocation(audit.STT_FUNC, 0x080501CD, 0x08050201)
        result = audit.classify_function_relocations([candidate])

        self.assertEqual(result.func_targets, 1)
        self.assertEqual(result.even_entries, 0)
        self.assertEqual(result.thumb_entries, 0)
        self.assertEqual(result.suspects, [candidate])
        self.assertEqual(
            candidate.linked_value - (candidate.symbol.value & ~1),
            0x35,
        )

    def test_object_interior_is_not_rejected_by_function_rule(self):
        result = audit.classify_function_relocations(
            [relocation(audit.STT_OBJECT, 0x08100000, 0x08100020)]
        )

        self.assertEqual(result.rom_abs32, 1)
        self.assertEqual(result.func_targets, 0)
        self.assertEqual(result.suspects, [])

    def test_non_rom_debug_relocation_is_ignored(self):
        debug = audit.ElfSection(
            index=7,
            name=".debug_info",
            sh_type=audit.SHT_PROGBITS,
            flags=0,
            addr=0,
            offset=0x1000,
            size=0x09000000,
            link=0,
            info=0,
            entsize=0,
        )

        self.assertIsNone(
            audit.rom_slot_for_relocation(debug, 0x08A5EA50)
        )

    def test_relocation_free_elf_is_rejected(self):
        result = audit.classify_function_relocations([])

        with self.assertRaisesRegex(
            audit.ElfFormatError,
            "no ROM R_ARM_ABS32 relocations",
        ):
            audit.require_relocation_bearing_elf(result, "fireemblem8.elf")


if __name__ == "__main__":
    unittest.main()
