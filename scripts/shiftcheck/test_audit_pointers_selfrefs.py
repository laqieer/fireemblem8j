#!/usr/bin/env python3

import copy
import os
import struct
import sys
import tempfile
import unittest


SHIFT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(os.path.dirname(SHIFT_DIR))
sys.path.insert(0, os.path.join(REPO, "scripts"))

import audit_pointers as audit


class OpaqueSelfrefAuditTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.evidence = audit.load_opaque_selfref_evidence()
        cls.addrs, cls.a2n, cls.a2s = audit.load_elf_symbols(audit.ELF)
        cls.name2addr = {name: addr for addr, name in cls.a2n.items()}
        with open(os.path.join(REPO, "fireemblem8.gba"), "rb") as f:
            cls.rom = f.read()

    def record(self, symbol):
        addr = self.name2addr[symbol]
        size = self.a2s[addr]
        start = addr - audit.ROM_LO
        blob = self.rom[start:start + size]
        return {
            "symbol": symbol,
            "address": addr,
            "size": size,
            "bytes": blob,
            "hits": audit._selfref_hits(blob, addr),
        }

    def test_zero_size_symbol_is_not_extended_to_next_global(self):
        base = audit.ROM_LO + 0x40
        next_addr = base + 0x20
        rom = bytearray(0x100)
        struct.pack_into("<I", rom, 0x44, base + 8)
        evidence = {"version": 1, "resolved": {}, "exact_extents": {}}

        records, skipped, candidates = audit.scan_opaque_selfref_candidates(
            [base, next_addr],
            {base: "ZeroSized", next_addr: "NextGlobal"},
            {base: 0, next_addr: 4},
            {"ZeroSized"},
            bytes(rom),
            evidence,
        )

        self.assertEqual(records, {})
        self.assertEqual(candidates, [])
        self.assertEqual(skipped, [("ZeroSized", base)])

    def test_known_lz_pcm_and_orphan_evidence_resolve(self):
        checks = {
            "TowerOfValniObjectType": audit._validate_lz_selfref,
            "DirectSoundData_k_strings_13k_c4": audit._validate_pcm_selfref,
        }
        for symbol, validator in checks.items():
            with self.subTest(symbol=symbol):
                record = self.record(symbol)
                entry = self.evidence["resolved"][symbol]
                errors = audit._validate_common_selfref_facts(record, entry)
                errors.extend(validator(record, entry))
                self.assertEqual(errors, [])

        symbol = "gUnkData_108"
        record = self.record(symbol)
        entry = self.evidence["resolved"][symbol]
        errors = audit._validate_common_selfref_facts(record, entry)
        errors.extend(audit._validate_orphan_selfref(record, entry, self.rom))
        self.assertEqual(errors, [])

    def test_absent_fe8u_analogue_is_optional_corroboration(self):
        symbol = "gUnkData_108"
        record = self.record(symbol)
        entry = copy.deepcopy(self.evidence["resolved"][symbol])
        with tempfile.TemporaryDirectory() as tmpdir:
            entry["fe8u_provider"] = os.path.join(tmpdir, "missing.c")
            evidence = {
                "version": 1,
                "resolved": {symbol: entry},
                "exact_extents": {},
            }
            resolved, unresolved, _ = audit.classify_opaque_selfrefs(
                {symbol: record}, [], [record], evidence, self.rom)

        self.assertEqual(unresolved, [])
        self.assertEqual(len(resolved), 1)
        self.assertEqual(resolved[0]["evidence_notes"], [
            f"optional fe8u corroboration unavailable: {entry['fe8u_provider']}; "
            "local definition/relocation/base-reference/hash proof remains authoritative",
        ])

    def test_present_mismatching_fe8u_analogue_fails_closed(self):
        symbol = "gUnkData_108"
        record = self.record(symbol)
        entry = copy.deepcopy(self.evidence["resolved"][symbol])
        with tempfile.TemporaryDirectory() as tmpdir:
            path = os.path.join(tmpdir, "data_B1FE7C.c")
            with open(path, "w", encoding="utf-8") as f:
                f.write("CONST_DATA u16 gUnkData_108[0xA788] = { 0 };")
            entry["fe8u_provider"] = path
            evidence = {
                "version": 1,
                "resolved": {symbol: entry},
                "exact_extents": {},
            }
            resolved, unresolved, _ = audit.classify_opaque_selfrefs(
                {symbol: record}, [], [record], evidence, self.rom)

        self.assertEqual(resolved, [])
        self.assertEqual(len(unresolved), 1)
        self.assertGreaterEqual(audit.selfref_gate_count(unresolved), 1)
        self.assertEqual(unresolved[0]["errors"], [
            "present fe8u analogue contradicts evidence: "
            "expected flat inline u8[0xA788]",
        ])

    def test_popup_zero_size_uses_exact_provider_extent_and_has_no_hits(self):
        symbol = "sBanimEkrPopupProcNames"
        entry = self.evidence["exact_extents"][symbol]
        addr = self.name2addr[symbol]
        size = audit._int(entry["size"])
        start = addr - audit.ROM_LO
        blob = self.rom[start:start + size]
        record = {
            "symbol": symbol,
            "address": addr,
            "size": size,
            "bytes": blob,
            "hits": audit._selfref_hits(blob, addr),
        }

        self.assertEqual(self.a2s[addr], 0)
        self.assertEqual(record["hits"], [])
        self.assertEqual(audit._validate_exact_extent(record, entry), [])

    def test_current_review_set_is_fully_resolved(self):
        opaque = audit.structureless_opaque_syms()
        records, skipped, candidates = audit.scan_opaque_selfref_candidates(
            self.addrs, self.a2n, self.a2s, opaque, self.rom, self.evidence)
        resolved, unresolved, classified_skipped = audit.classify_opaque_selfrefs(
            records, skipped, candidates, self.evidence, self.rom)

        self.assertEqual(len(resolved), 8)
        self.assertEqual(sum(len(item["hits"]) for item in resolved), 267)
        self.assertEqual(unresolved, [])
        self.assertEqual(classified_skipped, skipped)
        # D380 (issue #143 false-func-reloc-gate lane) removed the one false
        # `Init` relocation baked into data_08B5B560/Tsa_OpAnimEphraimClose2,
        # making that object fully relocation-free. That legitimately promotes
        # it into the structureless-opaque population scanned here (zero-size,
        # so it lands in `skipped`), moving the "other" (non-AnimSprite_)
        # zero-size count from 209 to 210 and the total from 1074 to 1075.
        self.assertEqual(len(skipped), 1075)
        anim_sprite_skipped = [
            item for item in skipped if item[0].startswith("AnimSprite_")]
        self.assertEqual(len(anim_sprite_skipped), 865)
        self.assertEqual(len(skipped) - len(anim_sprite_skipped), 210)
        self.assertEqual(skipped, sorted(skipped, key=lambda item: item[1]))
        self.assertIn(
            ("AnimSprite_EkrMainMini_L_Far",
             self.name2addr["AnimSprite_EkrMainMini_L_Far"]),
            skipped,
        )
        self.assertNotIn(
            "sBanimEkrPopupProcNames",
            {item["symbol"] for item in candidates},
        )

    def test_changed_hit_set_and_provider_fail_closed(self):
        symbol = "TowerOfValniObjectType"
        record = self.record(symbol)
        record["hits"] = [(record["hits"][0][0], record["hits"][0][1] + 4)]
        entry = copy.deepcopy(self.evidence["resolved"][symbol])
        entry["provider"] = "src/data/not-the-provider.c"
        evidence = {
            "version": 1,
            "resolved": {symbol: entry},
            "exact_extents": {},
        }

        resolved, unresolved, _ = audit.classify_opaque_selfrefs(
            {symbol: record}, [], [record], evidence, self.rom)

        self.assertEqual(resolved, [])
        self.assertEqual(len(unresolved), 1)
        self.assertGreaterEqual(audit.selfref_gate_count(unresolved), 1)
        joined = "\n".join(unresolved[0]["errors"])
        self.assertIn("hit set changed", joined)
        self.assertIn("provider unreadable", joined)

    def test_unknown_selfref_is_unresolved_and_gates(self):
        base = audit.ROM_LO + 0x100
        record = {
            "symbol": "SyntheticOpaque",
            "address": base,
            "size": 8,
            "bytes": struct.pack("<II", base + 4, 0),
            "hits": [(0, base + 4)],
        }
        evidence = {"version": 1, "resolved": {}, "exact_extents": {}}

        resolved, unresolved, _ = audit.classify_opaque_selfrefs(
            {"SyntheticOpaque": record}, [], [record], evidence, bytes(0x200))

        self.assertEqual(resolved, [])
        self.assertEqual(len(unresolved), 1)
        self.assertEqual(audit.selfref_gate_count(unresolved), 1)
        self.assertIn("no narrow evidence", unresolved[0]["errors"][0])


if __name__ == "__main__":
    unittest.main()
