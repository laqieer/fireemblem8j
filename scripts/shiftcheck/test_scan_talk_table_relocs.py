#!/usr/bin/env python3

import unittest

import scan_talk_table_relocs as scanner


class ScanTalkTableRelocsTest(unittest.TestCase):
    def test_debug_offsets_in_rom_window_are_ignored(self):
        objdump = """
RELOCATION RECORDS FOR [.debug_info]:
08a5e9e9 R_ARM_ABS32       .debug_abbrev
08a5ea50 R_ARM_ABS32       .rom
08a5ea54 R_ARM_ABS32       .debug_line

RELOCATION RECORDS FOR [.rom]:
00a5ea5c R_ARM_ABS32       EventScr_Allowed
00a5ea60 R_ARM_ABS32       PackedWord_Bad
"""
        self.assertEqual(
            list(scanner.parse_relocs(objdump)),
            [
                (0x08A5EA5C, "EventScr_Allowed"),
                (0x08A5EA60, "PackedWord_Bad"),
            ],
        )

    def test_genuine_rom_metadata_relocation_still_fails(self):
        start = 0x08A5EA50
        ranges = [
            ("gBattleTalkList", start, start + 0x20, 16, 12),
        ]
        relocs = [
            (start + 12, "EventScr_Allowed"),
            (start + 16, "PackedWord_Bad"),
        ]

        self.assertEqual(
            scanner.find_bad_relocs(relocs, ranges),
            [
                (
                    "gBattleTalkList",
                    start + 16,
                    1,
                    0,
                    "PackedWord_Bad",
                ),
            ],
        )

    def test_absolute_rom_offsets_are_preserved(self):
        objdump = """
RELOCATION RECORDS FOR [.rom]:
08a5ea60 R_ARM_ABS32       PackedWord_Bad
"""
        self.assertEqual(
            list(scanner.parse_relocs(objdump)),
            [(0x08A5EA60, "PackedWord_Bad")],
        )


if __name__ == "__main__":
    unittest.main()
