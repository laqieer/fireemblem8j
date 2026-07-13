#!/usr/bin/env python3

from collections import Counter
import unittest

import scan_code_rom_literals as scanner


class ScanCodeRomLiteralsTest(unittest.TestCase):
    def test_comments_strings_and_chars_are_stripped(self):
        text = r'''
// 0x8001234
/* 0X900ABCDu */
const char * a = "escaped \" 0x008001234ULL";
int b = 'x';
'''
        findings, allowed = scanner.scan_source("src/example.c", text)
        self.assertEqual(findings, [])
        self.assertEqual(allowed, Counter())

    def test_valid_huffman_initializer_is_classified(self):
        text = """
const u32 gMsgHuffmanTable[] = {
    0x8020801, 0X90A0909u,
};
"""
        findings, allowed = scanner.scan_source("src/msg_data.c", text)
        self.assertEqual(findings, [])
        self.assertEqual(allowed[scanner.ALLOW_HUFFMAN], 2)

    def test_only_exact_worldmap_initializer_word_is_allowed(self):
        text = """
int gWorldmapMapmu_1[] = {
    0x8001000u,
    0x8002000,
};
int other = 0x008001000UL;
"""
        findings, allowed = scanner.scan_source(
            "src/worldmap_mapmu_080C2224.c", text
        )
        self.assertEqual(allowed[scanner.ALLOW_WORLDMAP], 1)
        self.assertEqual(
            [(finding.line, finding.token) for finding in findings],
            [(4, "0x8002000"), (6, "0x008001000UL")],
        )

    def test_only_exact_opsubtitle_fill_call_is_allowed(self):
        text = """
CpuFastFill(0X8A708A7u, PAL_BG(0xE), 0x20);
int other = 0x08A708A7;
"""
        findings, allowed = scanner.scan_source(
            "src/opsubtitle_080C9644.c", text
        )
        self.assertEqual(allowed[scanner.ALLOW_OPSUBTITLE], 1)
        self.assertEqual(
            [(finding.line, finding.token) for finding in findings],
            [(3, "0x08A708A7")],
        )

    def test_alternate_spellings_are_reported_without_substring_matches(self):
        text = """
void * short_form = (void *)0x8001234;
int upper = 0X900ABCDu;
unsigned long padded = 0x008001234ULL;
int identifier_0x8001234 = 0;
unsigned long wider = 0x80012340UL;
double hex_float = 0x8001234p0;
"""
        findings, allowed = scanner.scan_source("src/example.c", text)
        self.assertEqual(allowed, Counter())
        self.assertEqual(
            [(finding.line, finding.token) for finding in findings],
            [
                (2, "0x8001234"),
                (3, "0X900ABCDu"),
                (4, "0x008001234ULL"),
            ],
        )

    def test_forbidden_cast_assignment_and_macro_are_reported(self):
        text = """
void * ptr = (void *)0x08001234;
int value = 0x0900ABCDU;
#define RAW_ROM_WORD ((const u16 *)0x08123456)
"""
        findings, allowed = scanner.scan_source("src/example.c", text)
        self.assertEqual(allowed, Counter())
        self.assertEqual(
            [(finding.line, finding.token) for finding in findings],
            [
                (2, "0x08001234"),
                (3, "0x0900ABCDU"),
                (4, "0x08123456"),
            ],
        )

    def test_linked_source_filter_uses_object_list(self):
        paths = [
            "src/linked.c",
            "src/not_linked.c",
            "src/nested/also_linked.c",
        ]
        objects = {"src/linked.o", "src/nested/also_linked.o"}
        self.assertEqual(
            scanner.filter_linked_sources(paths, objects),
            ["src/linked.c", "src/nested/also_linked.c"],
        )


if __name__ == "__main__":
    unittest.main()
