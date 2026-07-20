#!/usr/bin/env python3
"""Focused regression tests for nonzero decomp.me synchronization."""

import contextlib
import io
import json
import re
import unittest
from unittest import mock

import sync_improvement as sync


class J1ka1FE8JCompilerTest(unittest.TestCase):
    source = (
        "#ifndef FE8J_DECOMPME_CONTEXT\r\n"
        '#include "global.h"\r\n'
        "#endif\r\n"
        "int sub_807D3BC(void) { return 1; }\r\n"
    )
    local_flags = (
        "-mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -mjp-promote"
    )
    hosted_flags = local_flags
    settings = {
        "compiler": "agbcc-fe8j",
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
            "550",
            "--local-residual",
            "61/392 linked bytes",
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
        self.assertEqual(settings["compiler"], "agbcc-fe8j")
        self.assertIn("-mjp-promote", settings["compiler_flags"].split())
        return 550, 18700

    def patches(self):
        return (
            mock.patch.object(sync, "registry_entries", return_value={"J1ka1": "sub_807D3BC"}),
            mock.patch.object(sync, "read_source", return_value=self.source),
            mock.patch.object(sync, "get_scratch", return_value=dict(self.target)),
            mock.patch.object(sync, "candidate_settings", side_effect=self.candidate_settings),
            mock.patch.object(sync, "compile_score", side_effect=self.compile_score),
        )

    def test_exact_flags_use_fe8j_compiler(self):
        patches = self.patches()
        with patches[0], patches[1], patches[2], patches[3], patches[4]:
            output = io.StringIO()
            with contextlib.redirect_stdout(output):
                self.assertEqual(
                    sync.main(self.args("--compiler-flags", self.local_flags)), 0
                )

        text = output.getvalue()
        self.assertIn("local_score=550", text)
        self.assertIn("local_residual=61/392 linked bytes", text)
        self.assertIn("decompme_compiler=agbcc-fe8j", text)
        self.assertNotIn("toolchain flags differ", text)
        self.assertIn("registry row remains active", text)

    def test_provenance_and_normalized_source_identity(self):
        description = sync.sync_description(
            "",
            self.source,
            "550",
            "61/392 linked bytes",
            self.local_flags,
            "PROVEN-BOUNDED(1)",
            "EQUIV 60/60",
            550,
            self.settings,
        )
        match = re.search(
            re.escape(sync.SYNC_START) + r"(.*?)" + re.escape(sync.SYNC_END),
            description,
            re.DOTALL,
        )
        record = json.loads(match.group(1))
        self.assertEqual(record["local_score"], "550")
        self.assertEqual(record["local_residual"], "61/392 linked bytes")
        self.assertEqual(record["proof_result"], "PROVEN-BOUNDED(1)")
        self.assertEqual(record["equivalence_result"], "EQUIV 60/60")
        self.assertEqual(record["decompme_score"], 550)
        self.assertEqual(record["decompme_compiler"], "agbcc-fe8j")
        self.assertTrue(record["scores_directly_comparable"])

        scratch = dict(self.target)
        scratch.update(
            source_code=sync.normalize_source(self.source),
            description=description,
        )
        scratch["score"] = 550
        sync.verify(scratch, self.source, self.settings, description, 550)

    def test_transport_may_strip_one_final_newline(self):
        description = sync.sync_description(
            "",
            self.source,
            "550",
            "61/392 linked bytes",
            self.local_flags,
            "PROVEN-BOUNDED(1)",
            "EQUIV 60/60",
            550,
            self.settings,
        )
        scratch = dict(
            self.target,
            score=550,
            source_code=sync.normalize_source(self.source).rstrip("\n"),
            context=self.settings["context"].rstrip("\n"),
            description=description,
        )

        sync.verify(scratch, self.source, self.settings, description, 550)

    def test_transport_does_not_hide_extra_blank_line(self):
        self.assertNotEqual(
            sync.normalize_transport_text("context\n\n"),
            sync.normalize_transport_text("context\n"),
        )


if __name__ == "__main__":
    unittest.main()
