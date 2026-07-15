#!/usr/bin/env python3

import collections
import glob
import hashlib
import os
import re
import struct
import subprocess
import sys
import unittest


SHIFT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(os.path.dirname(SHIFT_DIR))
sys.path.insert(0, os.path.join(REPO, "scripts"))

import audit_pointers as audit


SELF_SIZE_RE = re.compile(
    r"(?m)^\s*\.size\s+([A-Za-z_][A-Za-z0-9_]*)\s*,\s*\.\s*-\s*\1\s*$")
ANY_SIZE_RE = re.compile(
    r"(?m)^\s*\.size\s+([A-Za-z_][A-Za-z0-9_]*)\s*,")
OBJECT_SPEC_RE = re.compile(r"([^\s+]+\.o)\(([^)]+)\)")

PREEXISTING_NONANIM_SELF_SIZES = {
    "ApConf_MapanimTorchAnim_0",
    "SpriteAnim_BrownTextBox",
    "SpriteAnim_FireTrap",
    "SpriteAnim_FrontierEndingCgTail_B3B334",
    "SpriteAnim_GasTrapHorizontal",
    "SpriteAnim_GasTrapVertical",
    "SpriteAnim_ManimStatGain",
    "SpriteAnim_PikeTrap",
    "SpriteAnim_PlayerRankFog",
}

MULTI_SOURCES = (
    "src/data/data_081F6D00/data_081F6D00.s",
    "src/data/anim_mine_fx/dat_anim_mine_fx.s",
    "src/data/anim_mapanim_torchfx/dat_anim_mapanim_torchfx.s",
    "src/data/anim_mapanim_objects/dat_anim_mapanim_objects.s",
    "src/data/anim_mapanim_berserk_silence/dat_anim_mapanim_berserk_silence.s",
    "src/data/worldmap_gmapunit/dat_worldmap_gmapunit_p1601.s",
    "src/data/anim_worldmap_sprite/dat_anim_worldmap_sprite.s",
    "src/data/anim_worldmap_highlight/dat_anim_worldmap_highlight.s",
    "src/data/titlescreen/dat_titlescreen.s",
)

EXTRA_SAME_ADDRESS_ALIASES = {
    "Ap_WmHightLightMap2_motion",
    "Ap_WmHightLightMapFrecia_motion",
    "SpritAnim_MineFx_motion",
}

FULL_AP_ALIAS_SIZES = {
    "Ap_WmHightLightMap2": 0x13C,
    "Ap_WmHightLightMap2_motion": 0x13C,
    "Ap_WmHightLightMapFrecia": 0x70,
    "Ap_WmHightLightMapFrecia_motion": 0x70,
    "SpritAnim_MineFx": 0x94,
    "SpritAnim_MineFx_motion": 0x94,
}

ORIGINAL_BLIND_IDENTITIES_SHA256 = (
    "2439c803dc47ce64466a0fcda8601290d71c8aaf6af5732a98de5b467d5bc7eb")


def _run(*args):
    return subprocess.run(
        args, check=True, capture_output=True, text=True, errors="replace").stdout


def _object_facts(objects):
    section_sizes = collections.defaultdict(dict)
    symbols = collections.defaultdict(lambda: collections.defaultdict(list))
    current = None
    output = _run("arm-none-eabi-objdump", "-h", "-t", *objects)
    for line in output.splitlines():
        match = re.match(r"^(.+):\s+file format\s+", line)
        if match:
            current = os.path.relpath(match.group(1), REPO)
            continue
        if current is None:
            continue
        parts = line.split()
        if len(parts) >= 3 and parts[0].isdigit() and parts[1].startswith("."):
            section_sizes[current][parts[1]] = int(parts[2], 16)
            continue
        if len(parts) < 5 or "g" not in parts[1:-3]:
            continue
        try:
            offset = int(parts[0], 16)
            size = int(parts[-2], 16)
        except ValueError:
            continue
        section = parts[-3]
        name = parts[-1]
        if re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", name):
            symbols[current][section].append((offset, size, name))
    return section_sizes, symbols


def _layout_rows():
    rows = collections.defaultdict(list)
    paths = [os.path.join(REPO, "layout", "carved_rom.tsv")]
    paths.extend(glob.glob(os.path.join(REPO, "layout", "carved_rom.d", "*.tsv")))
    for path in paths:
        with open(path, errors="replace") as stream:
            for line in stream:
                if not line.strip() or line.lstrip().startswith("#"):
                    continue
                parts = line.rstrip("\n").split("\t")
                if len(parts) < 3:
                    continue
                start = int(parts[0], 16)
                end = int(parts[1], 16)
                for match in OBJECT_SPEC_RE.finditer(parts[2]):
                    rows[(match.group(1), match.group(2))].append((start, end))
    return rows


def _linked_symbols():
    symbols = collections.defaultdict(list)
    output = _run(
        "arm-none-eabi-nm", "-S", "--defined-only", audit.ELF)
    for line in output.splitlines():
        parts = line.split()
        if len(parts) != 4:
            continue
        try:
            address = int(parts[0], 16)
            size = int(parts[1], 16)
        except ValueError:
            continue
        symbols[parts[3]].append((address, size))
    return symbols


class OpaqueExtentMetadataTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.source_text = {}
        cls.self_size_names = collections.defaultdict(set)
        for path in glob.glob(os.path.join(REPO, "src", "data", "**", "*.s"),
                              recursive=True):
            source = os.path.relpath(path, REPO)
            with open(path, errors="replace") as stream:
                text = stream.read()
            cls.source_text[source] = text
            cls.self_size_names[source].update(SELF_SIZE_RE.findall(text))

        cls.anim_names = {
            name
            for names in cls.self_size_names.values()
            for name in names
            if name.startswith("AnimSprite_")
        }
        cls.nonanim_self_names = {
            name
            for names in cls.self_size_names.values()
            for name in names
            if not name.startswith("AnimSprite_")
        }
        cls.new_singleton_names = (
            cls.nonanim_self_names - PREEXISTING_NONANIM_SELF_SIZES)
        cls.multi_names = set()
        for source in MULTI_SOURCES:
            cls.multi_names.update(ANY_SIZE_RE.findall(cls.source_text[source]))

        cls.closed_names = (
            cls.anim_names
            | cls.new_singleton_names
            | (cls.multi_names - EXTRA_SAME_ADDRESS_ALIASES)
        )
        cls.source_names = collections.defaultdict(set)
        for source, names in cls.self_size_names.items():
            cls.source_names[source].update(names)
        for source in MULTI_SOURCES:
            cls.source_names[source].update(
                ANY_SIZE_RE.findall(cls.source_text[source]))

        cls.objects = sorted({
            os.path.splitext(source)[0] + ".o"
            for source, names in cls.source_names.items()
            if names
        })
        cls.section_sizes, cls.object_symbols = _object_facts(cls.objects)
        cls.layout = _layout_rows()
        cls.linked = _linked_symbols()
        cls.addrs, cls.a2n, cls.a2s = audit.load_elf_symbols(audit.ELF)
        cls.name2addr = {name: address for address, name in cls.a2n.items()}
        with open(os.path.join(REPO, "fireemblem8.gba"), "rb") as stream:
            cls.rom = stream.read()

    def _source_symbol_entries(self, source, names):
        obj = os.path.splitext(source)[0] + ".o"
        by_name = collections.defaultdict(list)
        for section, entries in self.object_symbols[obj].items():
            for offset, size, name in entries:
                if name in names:
                    by_name[name].append((section, offset, size))
        self.assertEqual(set(by_name), set(names))
        for name, entries in by_name.items():
            self.assertEqual(len(entries), 1, name)
        return obj, by_name

    def _assert_exact_layout(self, obj, section):
        rows = self.layout[(obj, section)]
        self.assertEqual(len(rows), 1, (obj, section, rows))
        start, end = rows[0]
        self.assertEqual(end - start, self.section_sizes[obj][section])
        return start

    def test_original_blind_population_identities_are_preserved(self):
        self.assertEqual(len(self.anim_names), 865)
        self.assertEqual(
            len({source for source, names in self.self_size_names.items()
                 if any(name.startswith("AnimSprite_") for name in names)}),
            80,
        )
        self.assertEqual(len(self.nonanim_self_names), 127)
        self.assertEqual(len(self.new_singleton_names), 118)
        self.assertEqual(len(self.multi_names), 96)
        self.assertEqual(
            self.new_singleton_names
            & (self.multi_names - EXTRA_SAME_ADDRESS_ALIASES),
            {"sCcramifyProcData"},
        )
        self.assertEqual(len(self.closed_names - self.anim_names), 210)
        self.assertEqual(len(self.closed_names), 1075)
        self.assertEqual(self.closed_names - set(self.name2addr), set())
        self.assertTrue(all(self.a2s[self.name2addr[name]] for name in self.closed_names))

        payload = "".join(
            f"{name}\t{self.name2addr[name]:08X}\n"
            for name in sorted(self.closed_names)
        ).encode()
        self.assertEqual(
            hashlib.sha256(payload).hexdigest(),
            ORIGINAL_BLIND_IDENTITIES_SHA256,
        )

    def test_animsprite_source_extents_follow_the_record_grammar(self):
        terminator = struct.pack("<I", 1) + bytes(8)
        total_size = 0
        total_records = 0
        for name in sorted(self.anim_names):
            address = self.name2addr[name]
            size = self.a2s[address]
            self.assertGreater(size, 0, name)
            self.assertEqual(size % 12, 0, name)
            blob = self.rom[address - audit.ROM_LO:address - audit.ROM_LO + size]
            self.assertEqual(len(blob), size, name)
            self.assertEqual(blob[-12:], terminator, name)
            self.assertEqual(
                [offset for offset in range(0, size, 12)
                 if blob[offset:offset + 12] == terminator],
                [size - 12],
                name,
            )
            self.assertEqual(audit._selfref_hits(blob, address), [], name)
            total_size += size
            total_records += size // 12
        self.assertEqual(total_size, 0xDCEC)
        self.assertEqual(total_records, 4713)

    def test_source_boundary_extents_partition_exact_input_sections(self):
        grouped = collections.defaultdict(list)
        for source, names in self.self_size_names.items():
            if not names:
                continue
            obj, by_name = self._source_symbol_entries(source, names)
            for name, entries in by_name.items():
                section, offset, size = entries[0]
                self.assertGreater(size, 0, name)
                grouped[(obj, section)].append((offset, size, name))

        for (obj, section), entries in grouped.items():
            entries.sort()
            section_size = self.section_sizes[obj][section]
            self.assertEqual(entries[0][0], 0, (obj, section))
            for current, following in zip(entries, entries[1:]):
                self.assertEqual(
                    current[0] + current[1],
                    following[0],
                    (obj, section, current, following),
                )
            self.assertEqual(
                entries[-1][0] + entries[-1][1],
                section_size,
                (obj, section, entries[-1]),
            )
            layout_start = self._assert_exact_layout(obj, section)
            for offset, size, name in entries:
                linked = self.linked[name]
                self.assertEqual(len(linked), 1, name)
                self.assertEqual(linked[0], (
                    audit.ROM_LO + layout_start + offset,
                    size,
                ))

    def test_audited_multi_symbol_sections_cover_every_byte(self):
        grouped = collections.defaultdict(list)
        for source in MULTI_SOURCES:
            names = set(ANY_SIZE_RE.findall(self.source_text[source]))
            obj, by_name = self._source_symbol_entries(source, names)
            for name, entries in by_name.items():
                section, offset, size = entries[0]
                self.assertGreater(size, 0, name)
                self.assertLessEqual(
                    offset + size,
                    self.section_sizes[obj][section],
                    name,
                )
                grouped[(obj, section)].append((offset, offset + size, name))

        self.assertEqual(len(grouped), 10)
        for (obj, section), entries in grouped.items():
            layout_start = self._assert_exact_layout(obj, section)
            intervals = sorted((start, end) for start, end, _name in entries)
            merged = []
            for start, end in intervals:
                if not merged or start > merged[-1][1]:
                    merged.append([start, end])
                else:
                    merged[-1][1] = max(merged[-1][1], end)
            self.assertEqual(
                merged,
                [[0, self.section_sizes[obj][section]]],
                (obj, section, merged),
            )
            for start, end, name in entries:
                linked = self.linked[name]
                self.assertEqual(len(linked), 1, name)
                self.assertEqual(linked[0], (
                    audit.ROM_LO + layout_start + start,
                    end - start,
                ))

        for name, expected_size in FULL_AP_ALIAS_SIZES.items():
            self.assertEqual(self.linked[name][0][1], expected_size, name)


if __name__ == "__main__":
    unittest.main()
