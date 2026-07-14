#!/usr/bin/env python3

import unittest
from collections import Counter

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

    def test_all_twelve_proven_header_relocations_are_rejected(self):
        candidates = [
            relocation(
                0,
                0x08000004,
                audit.TILE_ANIMATIONS3_PACKED_SCALAR,
                name=audit.ROM_HEADER_LOGO_SYMBOL,
                size=0,
                slot=slot,
            )
            for slot in sorted(audit.TILE_ANIMATIONS3_SCALAR_SLOTS)
        ]
        candidates.append(
            relocation(
                0,
                0x08000000,
                0x08000000,
                name="Init",
                size=0,
                slot=0x08B5B614,
            )
        )
        candidates.extend(
            relocation(
                0,
                0x08000000,
                0x08000000,
                name="Init",
                size=0,
                slot=slot,
            )
            for slot in (0x08FE0234, 0x08FE14D8, 0x08FE200C)
        )

        result = audit.classify_header_relocations(candidates)
        schemas = Counter(schema for _, schema in result.suspects)

        self.assertEqual(result.total, 12)
        self.assertEqual(len(result.suspects), 12)
        self.assertEqual(schemas[audit.HEADER_SCHEMA_TILE_SCALAR], 8)
        self.assertEqual(schemas["Tsa_OpAnimEphraimClose2 LZ stream"], 1)
        self.assertEqual(schemas["DACS/IS-AGB debug-monitor image"], 3)

    def test_tile_animation_frame_pointers_are_positive_controls(self):
        candidates = [
            relocation(
                audit.STT_OBJECT,
                0x085D0000 + index * 0x100,
                0x085D0000 + index * 0x100,
                name=f"TileAnimations3_frame_{index}",
                size=0x100,
                slot=slot + 4,
            )
            for index, slot in enumerate(sorted(audit.TILE_ANIMATIONS3_SCALAR_SLOTS))
        ]

        result = audit.classify_header_relocations(candidates)

        self.assertEqual(result.total, 0)
        self.assertEqual(result.suspects, [])

    def test_exact_typed_header_code_pointer_is_accepted(self):
        candidate = relocation(
            audit.STT_FUNC,
            0x08000001,
            0x08000001,
            name="TypedHeaderEntry",
            size=0x20,
            slot=0x08100000,
        )
        result = audit.classify_header_relocations([candidate])

        self.assertEqual(result.typed_code, [candidate])
        self.assertEqual(result.suspects, [])

    def test_exact_sized_header_object_pointer_is_accepted(self):
        candidate = relocation(
            audit.STT_OBJECT,
            0x08000004,
            0x08000004,
            name="TypedNintendoLogo",
            size=0x9C,
            slot=0x08100004,
        )
        result = audit.classify_header_relocations([candidate])

        self.assertEqual(result.typed_objects, [candidate])
        self.assertEqual(result.suspects, [])

    def test_untyped_header_target_fails_closed(self):
        candidate = relocation(
            0,
            0x08000000,
            0x08000000,
            name="InitAlias",
            size=0,
            slot=0x08100008,
        )
        result = audit.classify_header_relocations([candidate])

        self.assertEqual(
            result.suspects,
            [(candidate, audit.HEADER_SCHEMA_UNTYPED)],
        )

    def test_explicitly_audited_pinned_header_slot_is_accepted(self):
        candidate = relocation(
            0,
            0x08000080,
            0x08000080,
            name="PinnedHeaderField",
            size=0,
            slot=0x0810000C,
        )
        result = audit.classify_header_relocations(
            [candidate],
            pinned_slots=frozenset({candidate.slot}),
        )

        self.assertEqual(result.pinned, [candidate])
        self.assertEqual(result.suspects, [])

    def test_intentional_raw_header_domains_do_not_become_false_negatives(self):
        for relpath in audit.INTENTIONAL_RAW_HEADER_DOMAIN_FILES:
            with self.subTest(relpath=relpath):
                self.assertTrue(
                    audit.is_intentional_raw_header_domain(relpath, 0x08000000)
                )

        self.assertFalse(
            audit.is_intentional_raw_header_domain(
                "src/data/ordinary_pointer_table.s",
                0x08000000,
            )
        )
        self.assertFalse(
            audit.is_intentional_raw_header_domain(
                "src/data/data_08FE0000/data_08FE0000.s",
                0x080000C0,
            )
        )

    def test_intentional_raw_header_domain_does_not_collide_with_symbolic_use(self):
        raw_targets = {}
        tracked = audit.record_raw_target(
            raw_targets,
            "src/data/data_08FE0000/data_08FE0000.s",
            148,
            0x08000000,
        )
        symbolic_targets = {0x08000000: [("src/typed_table.c", 10, "Init", 0)]}

        self.assertFalse(tracked)
        self.assertEqual(raw_targets, {})
        self.assertEqual(set(raw_targets) & set(symbolic_targets), set())


if __name__ == "__main__":
    unittest.main()
