#!/usr/bin/env python3
"""Focused regression tests for decomp.me compile repair settings."""

import unittest

import verify_compile as verify


class RepairSettingsTest(unittest.TestCase):
    def test_migrates_jp_promote_from_stock_agbcc(self):
        flags = "-mthumb-interwork -O2 -mjp-promote"

        compiler, repaired_flags, changes = verify.repair_settings(
            "agbcc",
            flags,
            "agbcc: Invalid option `jp-promote'",
        )

        self.assertEqual(compiler, "agbcc-fe8j")
        self.assertEqual(repaired_flags, flags)
        self.assertEqual(changes, ["compiler agbcc -> agbcc-fe8j"])

    def test_removes_other_invalid_option(self):
        compiler, repaired_flags, changes = verify.repair_settings(
            "agbcc-fe8j",
            "-O2 -fbogus",
            "agbcc: Invalid option `bogus'",
        )

        self.assertEqual(compiler, "agbcc-fe8j")
        self.assertEqual(repaired_flags, "-O2")
        self.assertEqual(changes, ["removed -fbogus"])

    def test_removes_werror_for_warning_failure(self):
        compiler, repaired_flags, changes = verify.repair_settings(
            "agbcc-fe8j",
            "-O2 -Werror",
            "warnings being treated as errors",
        )

        self.assertEqual(compiler, "agbcc-fe8j")
        self.assertEqual(repaired_flags, "-O2")
        self.assertEqual(changes, ["removed -Werror"])


if __name__ == "__main__":
    unittest.main()
