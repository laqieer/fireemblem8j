#!/usr/bin/env python3

import unittest

import audit_pointer_classification as audit


def relocation(
    symbol_type,
    symbol_value,
    linked_value,
    *,
    name="Target",
    size=0x40,
    slot=0x08AC2830,
):
    return audit.RomAbs32Relocation(
        slot=slot,
        linked_value=linked_value,
        symbol=audit.ElfSymbol(
            name=name,
            value=symbol_value,
            size=size,
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

    def test_large_addend_from_zero_size_resource_is_rejected(self):
        candidate = relocation(
            0,
            0x08010000,
            0x08020000,
            name="ZeroSizeResource",
            size=0,
            slot=0x08A5BDA8,
        )
        result = audit.classify_scalar_relocations([candidate])

        self.assertEqual(
            result.large_zero_size_addends,
            [(candidate, 0x10000)],
        )
        self.assertEqual(result.placement_anchor_reviews, [])
        self.assertEqual(result.area_scalar_suspects, [])

    def test_area_scalar_is_rejected_even_if_resource_becomes_sized(self):
        candidate = relocation(
            audit.STT_OBJECT,
            0x080ED67C,
            0x08100009,
            name=audit.AREA_PACKED_SYMBOL,
            size=0x178,
            slot=0x08A5BDA8,
        )
        result = audit.classify_scalar_relocations([candidate])

        self.assertEqual(result.large_zero_size_addends, [])
        self.assertEqual(result.area_scalar_suspects, [candidate])

    def test_nonzero_size_symbol_is_not_in_large_addend_class(self):
        candidate = relocation(
            audit.STT_OBJECT,
            0x080ED67C,
            0x08100009,
            name="SizedResource",
            size=0x178,
        )
        result = audit.classify_scalar_relocations([candidate])

        self.assertEqual(result.large_zero_size_addends, [])
        self.assertEqual(result.area_scalar_suspects, [])

    def test_proven_compressed_anchor_is_rejected_at_every_live_addend(self):
        cases = (
            (0x085E2C4C, 0x08BCCBCC),
            (0x085E2DD4, 0x08BCBD35),
            (0x0875096C, 0x08BF6674),
        )
        for slot, linked_value in cases:
            with self.subTest(slot=slot):
                candidate = relocation(
                    0,
                    0x08BC3A00,
                    linked_value,
                    name="pad_BC3A00",
                    size=0,
                    slot=slot,
                )
                result = audit.classify_scalar_relocations([candidate])

                self.assertEqual(result.large_zero_size_addends, [])
                self.assertEqual(result.placement_anchor_reviews, [])
                self.assertEqual(result.compressed_anchor_suspects, [candidate])

    def test_unproven_padding_anchor_large_addend_is_review_only(self):
        candidate = relocation(
            0,
            0x08BC3A00,
            0x08BF6674,
            name="pad_Unproven",
            size=0,
            slot=0x0875096C,
        )
        result = audit.classify_scalar_relocations([candidate])

        self.assertEqual(result.compressed_anchor_suspects, [])
        self.assertEqual(
            result.placement_anchor_reviews,
            [(candidate, 0x32C74)],
        )

    def test_tile_animations_header_scalar_is_rejected_and_inventoried(self):
        candidate = relocation(
            0,
            0x08000004,
            0x0800000B,
            name=audit.ROM_HEADER_LOGO_SYMBOL,
            size=0,
            slot=0x085C5BD8,
        )
        result = audit.classify_scalar_relocations([candidate])

        self.assertEqual(result.header_inventory, [candidate])
        self.assertEqual(result.header_scalar_suspects, [candidate])

    def test_other_header_relocation_is_inventory_only(self):
        candidate = relocation(
            0,
            0x08000004,
            0x08000007,
            name=audit.ROM_HEADER_LOGO_SYMBOL,
            size=0,
        )
        result = audit.classify_scalar_relocations([candidate])

        self.assertEqual(result.header_inventory, [candidate])
        self.assertEqual(result.header_scalar_suspects, [])


if __name__ == "__main__":
    unittest.main()
