#!/usr/bin/env python3
"""Focused regression tests for nonzero decomp.me synchronization."""

import contextlib
import io
import json
import re
import unittest
from unittest import mock

import sync_improvement as sync


class J1ka1FallbackTest(unittest.TestCase):
    source = (
        "#ifndef FE8J_DECOMPME_CONTEXT\r\n"
        '#include "global.h"\r\n'
        "#endif\r\n"
        "int sub_807D3BC(void) { return 1; }\r\n"
    )
    local_flags = (
        "-mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -mjp-promote"
    )
    hosted_flags = "-mthumb-interwork -Wimplicit -Wparentheses -Werror -O2"
    settings = {
        "compiler": "agbcc",
        "compiler_flags": hosted_flags,
        "context": "#define FE8J_DECOMPME_CONTEXT 1\n",
        "diff_flags": [],
        "diff_label": "sub_807D3BC",
        "libraries": [],
    }
    target = {
        "score": 10499,
        "source_code": "old source\n",
        "description": "",
        "match_override": False,
        "last_updated": "before",
        "owner": {"username": "owner"},
        **settings,
    }

    def args(self, *extra):
        return [
            "J1ka1",
            "--source",
            "src/nonmatching/sub_807D3BC.c",
            "--local-score",
            "655",
            "--local-residual",
            "82/392 linked bytes",
            "--local-flags",
            self.local_flags,
            "--proof-result",
            "PROVEN-BOUNDED(1)",
            "--equiv-result",
            "EQUIV 60/60",
            "--dry-run",
            *extra,
        ]

    def candidate_settings(self, target, source, compiler_source=None, compiler_flags=None):
        settings = dict(self.settings)
        if compiler_flags is not None:
            settings["compiler_flags"] = compiler_flags
        return settings

    def compile_score(self, slug, source, settings):
        if "-mjp-promote" in settings["compiler_flags"].split():
            raise sync.SyncError("agbcc: Invalid option 'jp-promote'")
        return 10499, 18700

    def patches(self):
        return (
            mock.patch.object(sync, "registry_entries", return_value={"J1ka1": "sub_807D3BC"}),
            mock.patch.object(sync, "read_source", return_value=self.source),
            mock.patch.object(sync, "get_scratch", return_value=dict(self.target)),
            mock.patch.object(sync, "candidate_settings", side_effect=self.candidate_settings),
            mock.patch.object(sync, "compile_score", side_effect=self.compile_score),
        )

    def test_exact_flag_rejection_then_stock_fallback(self):
        patches = self.patches()
        with patches[0], patches[1], patches[2], patches[3], patches[4]:
            with self.assertRaisesRegex(sync.SyncError, "Invalid option 'jp-promote'"):
                sync.main(self.args("--compiler-flags", self.local_flags))

            output = io.StringIO()
            with contextlib.redirect_stdout(output):
                self.assertEqual(sync.main(self.args()), 0)

        text = output.getvalue()
        self.assertIn("local_score=655", text)
        self.assertIn("local_residual=82/392 linked bytes", text)
        self.assertIn("toolchain flags differ", text)
        self.assertIn("registry row remains active", text)

    def test_provenance_and_normalized_source_identity(self):
        description = sync.sync_description(
            "",
            self.source,
            "655",
            "82/392 linked bytes",
            self.local_flags,
            "PROVEN-BOUNDED(1)",
            "EQUIV 60/60",
            10499,
            self.settings,
        )
        match = re.search(
            re.escape(sync.SYNC_START) + r"(.*?)" + re.escape(sync.SYNC_END),
            description,
            re.DOTALL,
        )
        record = json.loads(match.group(1))
        self.assertEqual(record["local_score"], "655")
        self.assertEqual(record["local_residual"], "82/392 linked bytes")
        self.assertEqual(record["proof_result"], "PROVEN-BOUNDED(1)")
        self.assertEqual(record["equivalence_result"], "EQUIV 60/60")
        self.assertEqual(record["decompme_score"], 10499)
        self.assertFalse(record["scores_directly_comparable"])

        scratch = dict(self.target)
        scratch.update(
            source_code=sync.normalize_source(self.source),
            description=description,
        )
        sync.verify(scratch, self.source, self.settings, description, 10499)


if __name__ == "__main__":
    unittest.main()
