#!/usr/bin/env python3
"""Focused regression tests for decomp.me compile repair settings."""

import contextlib
import io
import unittest
from unittest import mock

import verify_compile as verify


class RepairSettingsTest(unittest.TestCase):
    def test_profile_migrates_compiling_legacy_settings(self):
        compiler, repaired_flags, changes = verify.required_profile_settings(
            "jp-promote",
            "agbcc",
            "-mthumb-interwork -O2",
        )

        self.assertEqual(compiler, "agbcc-fe8j")
        self.assertEqual(repaired_flags, "-mthumb-interwork -O2 -mjp-promote")
        self.assertEqual(
            changes,
            ["compiler agbcc -> agbcc-fe8j", "added -mjp-promote"],
        )

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

    def test_never_drops_jp_promote_from_fe8j_compiler(self):
        compiler, repaired_flags, changes = verify.repair_settings(
            "agbcc-fe8j",
            "-O2 -mjp-promote",
            "agbcc: Invalid option `jp-promote'",
        )

        self.assertIsNone(compiler)
        self.assertIsNone(repaired_flags)
        self.assertEqual(changes, [])

    def test_removes_werror_for_warning_failure(self):
        compiler, repaired_flags, changes = verify.repair_settings(
            "agbcc-fe8j",
            "-O2 -Werror",
            "warnings being treated as errors",
        )

        self.assertEqual(compiler, "agbcc-fe8j")
        self.assertEqual(repaired_flags, "-O2")
        self.assertEqual(changes, ["removed -Werror"])

    @mock.patch.object(verify, "compile_scratch")
    @mock.patch.object(verify, "get_scratch")
    @mock.patch.object(verify, "_req")
    def test_repair_transaction_rechecks_persisted_settings(
        self, request, get_scratch, compile_scratch
    ):
        scratch = {
            "owner": {"username": "laqieer"},
            "compiler": "agbcc",
            "compiler_flags": "-O2",
            "source_code": "int func(void) { return 1; }\n",
            "context": "",
        }
        stored = dict(
            scratch,
            compiler="agbcc-fe8j",
            compiler_flags="-O2 -mjp-promote",
        )
        compile_scratch.return_value = {"success": True}
        get_scratch.return_value = stored

        with contextlib.redirect_stdout(io.StringIO()):
            self.assertTrue(
                verify.apply_repair(
                    "J1ka1",
                    scratch,
                    "agbcc-fe8j",
                    "-O2 -mjp-promote",
                    ["compiler agbcc -> agbcc-fe8j", "added -mjp-promote"],
                    "cookie",
                    "csrf",
                    "laqieer",
                )
            )

        request.assert_called_once()
        get_scratch.assert_called_once_with("J1ka1", fresh=True)
        self.assertEqual(compile_scratch.call_count, 2)

    @mock.patch.object(verify, "compile_scratch")
    @mock.patch.object(verify, "get_scratch")
    @mock.patch.object(verify, "_req")
    def test_repair_transaction_rejects_ignored_patch(
        self, request, get_scratch, compile_scratch
    ):
        scratch = {
            "owner": {"username": "laqieer"},
            "compiler": "agbcc",
            "compiler_flags": "-O2",
            "source_code": "int func(void) { return 1; }\n",
            "context": "",
        }
        compile_scratch.return_value = {"success": True}
        get_scratch.return_value = scratch

        with contextlib.redirect_stdout(io.StringIO()):
            self.assertFalse(
                verify.apply_repair(
                    "J1ka1",
                    scratch,
                    "agbcc-fe8j",
                    "-O2 -mjp-promote",
                    ["compiler agbcc -> agbcc-fe8j", "added -mjp-promote"],
                    "cookie",
                    "csrf",
                    "laqieer",
                )
            )

        request.assert_called_once()
        get_scratch.assert_called_once_with("J1ka1", fresh=True)
        compile_scratch.assert_called_once()

    @mock.patch.object(verify, "compile_scratch")
    @mock.patch.object(verify, "get_scratch")
    @mock.patch.object(verify, "_req")
    def test_repair_transaction_restores_partial_patch(
        self, request, get_scratch, compile_scratch
    ):
        scratch = {
            "owner": {"username": "laqieer"},
            "compiler": "agbcc",
            "compiler_flags": "-O2",
            "source_code": "int func(void) { return 1; }\n",
            "context": "",
            "name": "func",
            "description": "",
            "match_override": False,
            "libraries": [],
            "diff_flags": [],
            "diff_label": "func",
        }
        partial = dict(scratch, compiler_flags="-O2 -mjp-promote")
        compile_scratch.return_value = {"success": True}
        get_scratch.side_effect = [partial, scratch]

        with contextlib.redirect_stdout(io.StringIO()):
            self.assertFalse(
                verify.apply_repair(
                    "J1ka1",
                    scratch,
                    "agbcc-fe8j",
                    "-O2 -mjp-promote",
                    ["compiler agbcc -> agbcc-fe8j", "added -mjp-promote"],
                    "cookie",
                    "csrf",
                    "laqieer",
                )
            )

        self.assertEqual(request.call_count, 2)
        self.assertEqual(
            request.call_args_list[1].kwargs["data"],
            {"compiler": "agbcc", "compiler_flags": "-O2"},
        )
        self.assertEqual(get_scratch.call_count, 2)
        compile_scratch.assert_called_once()


if __name__ == "__main__":
    unittest.main()
