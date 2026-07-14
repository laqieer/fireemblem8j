#!/usr/bin/env python3
"""Audit pointer classification for shiftability (#143), BOTH directions.

Both failure modes break the +0x40000 shifted ROM:
  * FALSE NEGATIVE — a real pointer left as a raw `.4byte 0x08XXXXXX` literal in an
    opaque blob: carries no relocation, stays stale under the shift -> wrong target.
  * FALSE POSITIVE — a NON-pointer value (packed metadata, e.g. msg-id<<16|flag like
    0x08D70002) symbolized as `Sym + off`: the link wrongly adds +0x40000 -> data
    corruption (the prologue defeat-quote bug, commit 2cce0d83b).

This flags SUSPECTS using method (2): "does the value point to a meaningful object?"
The symbol table (start addresses of every linked object) is the boundary oracle:
  * raw literal whose value == a symbol START  -> likely a REAL pointer (false negative)
  * symbolized value whose target lands in a GAP (no owning object) or reconstructs a
    packed-field pattern -> likely a NON-pointer (false positive)

It also performs a relocation-backed class-wide check. Every ROM-located
R_ARM_ABS32 relocation whose final ELF symbol type is STT_FUNC must resolve to
the exact function entry, either even or with the Thumb bit set. A linked value
inside the function is a high-confidence false pointer decode.

Additional packed-scalar classes are checked from the same final ELF:
  * a named zero-size resource symbol plus an addend >= 0x10000 that resolves
    back into ROM (excluding explicit pad_/gap_ placement anchors);
  * the proven sBanimEkrPopupProcNames/0x08100009 packed AREA command,
    independently of whether that resource later gains a nonzero ELF size;
  * RomHeaderNintendoLogo relocations whose linked word is the proven packed
    TileAnimations3 scalar 0x0800000B (.hword 11, 2048).
  * relocations to pad_BC3A00, all three of which occur inside LZ-compressed
    graphics streams and corrupt decompressed output when shifted.

Confirm each SUSPECT with method (1) source/struct and method (3) fe8u before changing
anything. This script only REPORTS; it never edits. Byte-identical fixes are manual/gated.

Usage:
  scripts/shiftcheck/audit_pointer_classification.py
      [--elf fireemblem8.elf] [--relocs-elf fireemblem8_relocs.elf]
"""
import argparse
import bisect
import linecache
import os
import re
import struct
import subprocess
import sys
from dataclasses import dataclass

ROM_LO = 0x08000000
ROM_HI = 0x0A000000
REPO = subprocess.check_output(["git", "rev-parse", "--show-toplevel"], text=True).strip()

# ELF32 / ARM constants used by the relocation-backed audit.
SHT_PROGBITS = 1
SHT_SYMTAB = 2
SHT_RELA = 4
SHT_NOBITS = 8
SHT_REL = 9
SHT_DYNSYM = 11
SHF_ALLOC = 0x2
EM_ARM = 40
STT_OBJECT = 1
STT_FUNC = 2
STT_SECTION = 3
R_ARM_ABS32 = 2
LARGE_ZERO_SIZE_ADDEND_MIN = 0x10000
PLACEMENT_ANCHOR_PREFIXES = ("pad_", "gap_")
ROM_HEADER_LOGO_SYMBOL = "RomHeaderNintendoLogo"
TILE_ANIMATIONS3_PACKED_SCALAR = 0x0800000B
AREA_PACKED_SYMBOL = "sBanimEkrPopupProcNames"
AREA_PACKED_SCALAR = 0x08100009
PROVEN_COMPRESSED_SCALAR_ANCHORS = frozenset({"pad_BC3A00"})

# Message-id range typically packed into the high half of talk/quote metadata words.
MSG_HI_LO, MSG_HI_HI = 0x0800, 0x0FFF   # high16 in this range => could be a packed msg id
FLAG_LO_MAX = 0x1000                     # low16 below this => flag-like (not a pointer low half)


class ElfFormatError(Exception):
    pass


@dataclass(frozen=True)
class ElfSection:
    index: int
    name: str
    sh_type: int
    flags: int
    addr: int
    offset: int
    size: int
    link: int
    info: int
    entsize: int


@dataclass(frozen=True)
class ElfSymbol:
    name: str
    value: int
    size: int
    st_type: int


@dataclass(frozen=True)
class RomAbs32Relocation:
    slot: int
    linked_value: int
    symbol: ElfSymbol
    source_section: str
    target_section: str


@dataclass
class FunctionRelocationAudit:
    rom_abs32: int
    func_targets: int
    even_entries: int
    thumb_entries: int
    suspects: list


@dataclass
class ScalarRelocationAudit:
    large_zero_size_addends: list
    placement_anchor_reviews: list
    compressed_anchor_suspects: list
    area_scalar_suspects: list
    header_inventory: list
    header_scalar_suspects: list


def _cstring(blob, offset):
    if offset < 0 or offset >= len(blob):
        return ""
    end = blob.find(b"\0", offset)
    if end < 0:
        end = len(blob)
    return blob[offset:end].decode("utf-8", errors="replace")


def is_rom_backed_section(target):
    return (
        (target.flags & SHF_ALLOC)
        and target.sh_type != SHT_NOBITS
        and target.addr < ROM_HI
        and target.addr + target.size > ROM_LO
    )


def rom_slot_for_relocation(target, reloc_offset):
    """Return the absolute ROM slot for a relocation, or None when its target
    section is debug/non-ROM/non-file-backed.

    Final executable relocation offsets are absolute VMAs, while relocatable
    objects use section-relative offsets. Supporting both forms also makes the
    section-context rule explicit: a huge .debug_info offset that numerically
    overlaps 0x08xxxxxx is still ignored because its target section is not an
    allocated ROM section.
    """
    if not is_rom_backed_section(target):
        return None

    if target.addr <= reloc_offset and reloc_offset + 4 <= target.addr + target.size:
        slot = reloc_offset
    elif 0 <= reloc_offset and reloc_offset + 4 <= target.size:
        slot = target.addr + reloc_offset
    else:
        return None

    if not (ROM_LO <= slot and slot + 4 <= ROM_HI):
        return None
    return slot


class Elf32Reader:
    """Small dependency-free ELF32 reader for linked symbols and retained RELs.

    The relocation-bearing ELF is hundreds of MiB because of debug sections, so
    this reader loads only section headers, ROM relocation/target sections, and
    .symtab/.strtab instead of the whole file.
    """

    def __init__(self, path):
        self.path = path
        self.fp = open(path, "rb")
        self._section_data = {}
        self._symbol_tables = {}

        ident = self._read_at(0, 16)
        if ident[:4] != b"\x7fELF" or ident[4] != 1:
            raise ElfFormatError(f"{path}: expected ELF32")
        if ident[5] == 1:
            self.endian = "<"
        elif ident[5] == 2:
            self.endian = ">"
        else:
            raise ElfFormatError(f"{path}: unsupported ELF data encoding")

        header = struct.unpack(
            self.endian + "HHIIIIIHHHHHH", self._read_at(16, 36)
        )
        if header[1] != EM_ARM:
            raise ElfFormatError(f"{path}: expected an ARM ELF")
        e_shoff = header[5]
        e_shentsize = header[10]
        e_shnum = header[11]
        e_shstrndx = header[12]
        if e_shentsize < 40 or not e_shnum or e_shstrndx >= e_shnum:
            raise ElfFormatError(f"{path}: unsupported section-header table")

        raw_sections = []
        for index in range(e_shnum):
            raw = self._read_at(e_shoff + index * e_shentsize, 40)
            raw_sections.append(struct.unpack(self.endian + "IIIIIIIIII", raw))

        shstr_raw = raw_sections[e_shstrndx]
        shstr = self._read_at(shstr_raw[4], shstr_raw[5])
        self.sections = []
        for index, raw in enumerate(raw_sections):
            self.sections.append(
                ElfSection(
                    index=index,
                    name=_cstring(shstr, raw[0]),
                    sh_type=raw[1],
                    flags=raw[2],
                    addr=raw[3],
                    offset=raw[4],
                    size=raw[5],
                    link=raw[6],
                    info=raw[7],
                    entsize=raw[9],
                )
            )

    def close(self):
        self.fp.close()

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc, tb):
        self.close()

    def _read_at(self, offset, size):
        self.fp.seek(offset)
        data = self.fp.read(size)
        if len(data) != size:
            raise ElfFormatError(
                f"{self.path}: short read at 0x{offset:X} "
                f"(wanted 0x{size:X}, got 0x{len(data):X})"
            )
        return data

    def _symbol_table(self, section_index):
        cached = self._symbol_tables.get(section_index)
        if cached is not None:
            return cached

        if section_index >= len(self.sections):
            raise ElfFormatError(f"{self.path}: invalid symbol-table index {section_index}")
        section = self.sections[section_index]
        if section.sh_type not in (SHT_SYMTAB, SHT_DYNSYM):
            raise ElfFormatError(f"{self.path}: relocation does not link a symbol table")
        if section.link >= len(self.sections):
            raise ElfFormatError(f"{self.path}: invalid symbol string-table index")

        entsize = section.entsize or 16
        if entsize < 16 or section.size % entsize:
            raise ElfFormatError(f"{self.path}: malformed symbol table")
        symbols = self._read_at(section.offset, section.size)
        strings_section = self.sections[section.link]
        strings = self._read_at(strings_section.offset, strings_section.size)
        cached = (symbols, strings, entsize, {})
        self._symbol_tables[section_index] = cached
        return cached

    def section_data(self, section):
        cached = self._section_data.get(section.index)
        if cached is None:
            cached = self._read_at(section.offset, section.size)
            self._section_data[section.index] = cached
        return cached

    def symbol(self, section_index, symbol_index):
        symbols, strings, entsize, cache = self._symbol_table(section_index)
        cached = cache.get(symbol_index)
        if cached is not None:
            return cached

        offset = symbol_index * entsize
        if offset + 16 > len(symbols):
            raise ElfFormatError(f"{self.path}: invalid symbol index {symbol_index}")
        st_name, st_value, st_size, st_info, _st_other, _st_shndx = struct.unpack_from(
            self.endian + "IIIBBH", symbols, offset
        )
        result = ElfSymbol(
            name=_cstring(strings, st_name),
            value=st_value,
            size=st_size,
            st_type=st_info & 0xF,
        )
        cache[symbol_index] = result
        return result

    def iter_rom_abs32_relocations(self):
        for rel_section in self.sections:
            if rel_section.sh_type not in (SHT_REL, SHT_RELA):
                continue
            if rel_section.info >= len(self.sections):
                raise ElfFormatError(f"{self.path}: invalid relocation target section")
            target = self.sections[rel_section.info]
            if not is_rom_backed_section(target):
                continue

            default_entsize = 8 if rel_section.sh_type == SHT_REL else 12
            entsize = rel_section.entsize or default_entsize
            if entsize < default_entsize or rel_section.size % entsize:
                raise ElfFormatError(f"{self.path}: malformed relocation section")
            relocs = self._read_at(rel_section.offset, rel_section.size)
            target_data = self.section_data(target)

            for offset in range(0, len(relocs), entsize):
                reloc_offset, reloc_info = struct.unpack_from(
                    self.endian + "II", relocs, offset
                )
                if (reloc_info & 0xFF) != R_ARM_ABS32:
                    continue

                slot = rom_slot_for_relocation(target, reloc_offset)
                if slot is None:
                    continue
                linked = struct.unpack(
                    self.endian + "I",
                    target_data[slot - target.addr:slot - target.addr + 4],
                )[0]
                yield RomAbs32Relocation(
                    slot=slot,
                    linked_value=linked,
                    symbol=self.symbol(rel_section.link, reloc_info >> 8),
                    source_section=rel_section.name,
                    target_section=target.name,
                )


def iter_rom_abs32_relocations(path):
    with Elf32Reader(path) as elf:
        yield from elf.iter_rom_abs32_relocations()


def classify_function_relocations(relocations):
    rom_abs32 = 0
    func_targets = 0
    even_entries = 0
    thumb_entries = 0
    suspects = []

    for reloc in relocations:
        rom_abs32 += 1
        if reloc.symbol.st_type != STT_FUNC:
            continue

        func_targets += 1
        function_even = reloc.symbol.value & ~1
        if reloc.linked_value == function_even:
            even_entries += 1
        elif reloc.linked_value == (function_even | 1):
            thumb_entries += 1
        else:
            suspects.append(reloc)

    return FunctionRelocationAudit(
        rom_abs32=rom_abs32,
        func_targets=func_targets,
        even_entries=even_entries,
        thumb_entries=thumb_entries,
        suspects=suspects,
    )


def classify_scalar_relocations(relocations):
    large_zero_size_addends = []
    placement_anchor_reviews = []
    compressed_anchor_suspects = []
    area_scalar_suspects = []
    header_inventory = []
    header_scalar_suspects = []

    for reloc in relocations:
        symbol = reloc.symbol
        if symbol.name in PROVEN_COMPRESSED_SCALAR_ANCHORS:
            compressed_anchor_suspects.append(reloc)
            # Consumer proof promotes this exact pure-padding anchor above the
            # generic pad_/gap_ REVIEW bucket: each live relocation is bytes
            # inside an LZ stream, not a semantic pointer.
            continue

        if (
            symbol.name == AREA_PACKED_SYMBOL
            and reloc.linked_value == AREA_PACKED_SCALAR
        ):
            area_scalar_suspects.append(reloc)
            # This exact semantic rule is stronger than the generic zero-size
            # heuristic and remains active if the provider is later sized.
            continue

        if symbol.name == ROM_HEADER_LOGO_SYMBOL:
            header_inventory.append(reloc)
            if reloc.linked_value == TILE_ANIMATIONS3_PACKED_SCALAR:
                header_scalar_suspects.append(reloc)

        addend = reloc.linked_value - symbol.value
        large_zero_size = (
            bool(symbol.name)
            and symbol.st_type != STT_SECTION
            and symbol.size == 0
            and ROM_LO <= reloc.linked_value < ROM_HI
            and addend >= LARGE_ZERO_SIZE_ADDEND_MIN
        )
        if not large_zero_size:
            continue

        record = (reloc, addend)
        if symbol.name.startswith(PLACEMENT_ANCHOR_PREFIXES):
            # pad_/gap_ labels are explicit build-layout anchors, not semantic
            # resources. Keep them visible for review, but do not apply the
            # high-confidence zero-size-resource rule without consumer proof.
            placement_anchor_reviews.append(record)
        else:
            large_zero_size_addends.append(record)

    return ScalarRelocationAudit(
        large_zero_size_addends=large_zero_size_addends,
        placement_anchor_reviews=placement_anchor_reviews,
        compressed_anchor_suspects=compressed_anchor_suspects,
        area_scalar_suspects=area_scalar_suspects,
        header_inventory=header_inventory,
        header_scalar_suspects=header_scalar_suspects,
    )


def require_relocation_bearing_elf(audit, path):
    if audit.rom_abs32 == 0:
        raise ElfFormatError(
            f"{path}: no ROM R_ARM_ABS32 relocations; "
            "use the final ELF linked with --emit-relocs"
        )


def report_function_relocations(audit, relocs_elf, limit):
    print("\n" + "=" * 78)
    print(f"FUNCTION-TARGET ABS32 audit ({os.path.basename(relocs_elf)})")
    print("=" * 78)
    for reloc in audit.suspects[:limit]:
        function_even = reloc.symbol.value & ~1
        delta = reloc.linked_value - function_even
        print(
            f"  [HIGH] slot=0x{reloc.slot:08X} linked=0x{reloc.linked_value:08X} "
            f"symbol={reloc.symbol.name} S_even=0x{function_even:08X} "
            f"delta={delta:+#x}"
        )
    if len(audit.suspects) > limit:
        print(f"  ... +{len(audit.suspects)-limit} more")
    print(
        f"RELOCATION SUMMARY: ROM ABS32={audit.rom_abs32:,}, "
        f"FUNC targets={audit.func_targets:,}, "
        f"even-entry={audit.even_entries:,}, "
        f"Thumb-entry={audit.thumb_entries:,}, "
        f"function-interior false relocations={len(audit.suspects):,}"
    )


def report_scalar_relocations(audit, limit):
    print("\n" + "=" * 78)
    print("PACKED-SCALAR ABS32 audit")
    print("=" * 78)
    for reloc, addend in audit.large_zero_size_addends[:limit]:
        print(
            f"  [HIGH] slot=0x{reloc.slot:08X} linked=0x{reloc.linked_value:08X} "
            f"symbol={reloc.symbol.name} size=0 addend=0x{addend:X}"
        )
    for reloc in audit.compressed_anchor_suspects[:limit]:
        addend = reloc.linked_value - reloc.symbol.value
        print(
            f"  [HIGH] slot=0x{reloc.slot:08X} linked=0x{reloc.linked_value:08X} "
            f"symbol={reloc.symbol.name} addend=0x{addend:X} packed=LZ-stream"
        )
    for reloc in audit.area_scalar_suspects[:limit]:
        print(
            f"  [HIGH] slot=0x{reloc.slot:08X} linked=0x{reloc.linked_value:08X} "
            f"symbol={reloc.symbol.name} packed=AREA(..., 9, 0, 16, 8)"
        )
    for reloc in audit.header_scalar_suspects[:limit]:
        print(
            f"  [HIGH] slot=0x{reloc.slot:08X} linked=0x{reloc.linked_value:08X} "
            f"symbol={reloc.symbol.name} packed=.hword 11, 2048"
        )
    for reloc, addend in audit.placement_anchor_reviews[:limit]:
        print(
            f"  [REVIEW] slot=0x{reloc.slot:08X} linked=0x{reloc.linked_value:08X} "
            f"placement-anchor={reloc.symbol.name} addend=0x{addend:X}"
        )
    print(
        "SCALAR SUMMARY: "
        f"zero-size large-addend false relocations={len(audit.large_zero_size_addends):,}, "
        f"compressed-anchor false relocations={len(audit.compressed_anchor_suspects):,}, "
        f"AREA packed-scalar false relocations={len(audit.area_scalar_suspects):,}, "
        f"{ROM_HEADER_LOGO_SYMBOL} inventory={len(audit.header_inventory):,}, "
        f"packed-scalar false relocations={len(audit.header_scalar_suspects):,}, "
        f"placement-anchor reviews={len(audit.placement_anchor_reviews):,}"
    )


def load_symbols(elf):
    """Return (sorted_addrs, addr->name, set_of_starts, name->addr)."""
    out = subprocess.check_output(["arm-none-eabi-nm", "-n", elf], text=True, errors="replace")
    addr2name, name2addr, starts = {}, {}, set()
    addrs = []
    for line in out.splitlines():
        m = re.match(r"^([0-9A-Fa-f]{8})\s+[a-zA-Z]\s+(\S+)", line)
        if not m:
            continue
        a = int(m.group(1), 16)
        n = m.group(2)
        if ROM_LO <= a < ROM_HI:
            addr2name.setdefault(a, n)
            name2addr.setdefault(n, a)
            starts.add(a)
            addrs.append(a)
    # `nm` prints cleared Thumb-function addresses for many symbols, but ABS32
    # relocations use the ELF symbol value (LSB set for Thumb functions). Use
    # readelf to recover those expression values so `Sym+off` is evaluated the
    # same way the linker/assembler emits it.
    try:
        rout = subprocess.check_output(["arm-none-eabi-readelf", "-s", elf],
                                       text=True, errors="replace")
        for line in rout.splitlines():
            m = re.match(r"^\s*\d+:\s+([0-9A-Fa-f]{8})\s+\d+\s+FUNC\s+\S+\s+\S+\s+\S+\s+(\S+)$", line)
            if not m:
                continue
            raw = int(m.group(1), 16)
            n = m.group(2)
            if ROM_LO <= raw < ROM_HI:
                name2addr[n] = raw
                addr2name.setdefault(raw, n)
                starts.add(raw)
                addrs.append(raw)
    except (OSError, subprocess.CalledProcessError):
        pass
    addrs = sorted(set(addrs))
    return addrs, addr2name, starts, name2addr


def load_code_symbols(elf):
    """Return symbol names that are real code entry points/callbacks."""
    code = {"IrqMain"}  # ABS vector symbol in this repo, still a code target.
    try:
        out = subprocess.check_output(["arm-none-eabi-readelf", "-s", elf],
                                      text=True, errors="replace")
    except (OSError, subprocess.CalledProcessError):
        return code

    for line in out.splitlines():
        m = re.match(r"^\s*\d+:\s+([0-9A-Fa-f]{8})\s+\d+\s+FUNC\s+\S+\s+\S+\s+\S+\s+(\S+)$", line)
        if not m:
            continue
        a = int(m.group(1), 16)
        if ROM_LO <= a < ROM_HI:
            code.add(m.group(2))
    return code


def owning(addrs, addr2name, a):
    """Return (owner_start, owner_name, offset_into_owner) for address a, or None if a
    sits below the first symbol / above the last (a 'gap')."""
    i = bisect.bisect_right(addrs, a) - 1
    if i < 0:
        return None
    start = addrs[i]
    return start, addr2name[start], a - start


def iter_4byte_values():
    """Yield (path, lineno, kind, raw_text, sym, off, is_raw) for every .4byte we can
    read from src/data (both .s and the __asm__ strings inside .c)."""
    files = subprocess.check_output(
        ["git", "-C", REPO, "ls-files", "src/data"], text=True).splitlines()
    sym_off = re.compile(r"\.4byte\s+([A-Za-z_][A-Za-z0-9_]*)\s*(?:\+\s*(0x[0-9A-Fa-f]+|\d+))?")
    raw = re.compile(r"\.4byte\s+(0x0[89][0-9A-Fa-f]{6})\b")
    for rel in files:
        if not (rel.endswith(".s") or rel.endswith(".c")):
            continue
        p = os.path.join(REPO, rel)
        try:
            with open(p, errors="replace") as f:
                for ln, line in enumerate(f, 1):
                    text = line
                    if rel.endswith(".c"):
                        # unwrap a C string literal that carries an asm line
                        if ".4byte" not in text:
                            continue
                        text = text.replace('\\t', ' ').replace('\\n', ' ').replace('"', ' ')
                    mr = raw.search(text)
                    if mr:
                        yield rel, ln, "raw", mr.group(1), None, int(mr.group(1), 16), True
                        continue
                    ms = sym_off.search(text)
                    if ms and not text.lstrip().startswith("@"):
                        sym = ms.group(1)
                        off = int(ms.group(2), 0) if ms.group(2) else 0
                        yield rel, ln, "sym", ms.group(0), sym, off, False
        except (FileNotFoundError, IsADirectoryError, PermissionError):
            continue


def looks_packed(value):
    hi, lo = (value >> 16) & 0xFFFF, value & 0xFFFF
    return MSG_HI_LO <= hi <= MSG_HI_HI and lo < FLAG_LO_MAX


def looks_packed_pair(value):
    """Strong OAM/frame-data tell: two adjacent u16 fields packed into one word."""
    hi, lo = (value >> 16) & 0xFFFF, value & 0xFFFF
    return (hi == lo + 1 and (hi & 0xFF00) == (lo & 0xFF00)
            and (hi >> 8) in {0x04, 0x08, 0x0C})


def looks_suspicious_code_ref(rel, ln, sym, value, code_symbols, unitdef_files):
    """Flag code symbols embedded where nearby fields show packed data, not callbacks."""
    if sym not in code_symbols or not looks_packed(value):
        return False

    if rel in unitdef_files:
        return not re.search(r"^(REDA|UnitDef_)", sym)

    if "banim" not in rel:
        return False

    line = linecache.getline(os.path.join(REPO, rel), ln)
    text = line.replace('\\t', ' ').replace('\\n', ' ').replace('"', ' ')
    # Banim/OAM command streams frequently use 0xFFFF sentinels and adjacent
    # packed fields. A code symbol immediately following such data is the same
    # false-positive class as 0x08000201 -> IrqMain+0x105, not a function pointer.
    return bool(re.search(r"0x[0-9A-Fa-f]*FFFF\s*,\s*" + re.escape(sym) + r"\b", text))


# Resource-type inference from a symbol name prefix — used for the cross-type signal
# (a talk entry pointing into "banim_drum" graphics is the false-positive tell).
TYPE_RULES = [
    ("event", re.compile(r"eventscr|EventListScr|EventScr|MapChanges|_event")),
    ("anim", re.compile(r"AnimSprite|banim|_anim|EfxDrv|frontier_.*banim")),
    ("sound", re.compile(r"DirectSoundData|voicegroup|song|_m4a|SoundRoom")),
    ("font", re.compile(r"fontgrp|font|glyph|sjis")),
    ("msg", re.compile(r"gMsgTable|MsgString|CompressedText|_MSG_")),
    ("unit", re.compile(r"UnitDef|_unitdef|gUnit")),
    ("gfx", re.compile(r"sheet|_gfx|_img|_pal|_tsa|_chr|TileConfig|ObjectType|Opinfo")),
]


def restype(name):
    for t, rx in TYPE_RULES:
        if rx.search(name):
            return t
    return "?"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--elf", default=os.path.join(REPO, "fireemblem8.elf"))
    ap.add_argument(
        "--relocs-elf",
        default=os.path.join(REPO, "fireemblem8_relocs.elf"),
        help="final linked ELF retaining relocation sections",
    )
    ap.add_argument("--limit", type=int, default=60)
    ap.add_argument("--fail-on-suspects", action="store_true",
                    help="exit nonzero when any suspect remains")
    args = ap.parse_args()
    if not os.path.exists(args.elf):
        print(f"need {args.elf} (run `make` first)", file=sys.stderr)
        return 2
    if not os.path.exists(args.relocs_elf):
        print(f"need {args.relocs_elf} (run `make {os.path.basename(args.relocs_elf)}` first)",
              file=sys.stderr)
        return 2

    try:
        rom_relocations = list(iter_rom_abs32_relocations(args.relocs_elf))
        function_relocs = classify_function_relocations(rom_relocations)
        scalar_relocs = classify_scalar_relocations(rom_relocations)
        require_relocation_bearing_elf(function_relocs, args.relocs_elf)
    except (OSError, ElfFormatError) as exc:
        print(f"cannot audit {args.relocs_elf}: {exc}", file=sys.stderr)
        return 2

    addrs, addr2name, starts, name2addr = load_symbols(args.elf)
    code_symbols = load_code_symbols(args.elf)

    # First pass: collect every reference so we can consistency-check each ROM address.
    refs = list(iter_4byte_values())
    unitdef_files = set()
    for rel, *_ in refs:
        if rel in unitdef_files:
            continue
        try:
            with open(os.path.join(REPO, rel), errors="replace") as f:
                if re.search(r"^UnitDef_", f.read(), re.M):
                    unitdef_files.add(rel)
        except OSError:
            pass
    raw_targets = {}     # addr -> [(rel,ln)]
    sym_targets = {}     # addr -> [(rel,ln,sym,off)]
    for rel, ln, kind, txt, sym, off, is_raw in refs:
        if is_raw:
            raw_targets.setdefault(off, []).append((rel, ln))
        else:
            base = name2addr.get(sym)
            if base is not None:
                sym_targets.setdefault(base + off, []).append((rel, ln, sym, off))

    fn_suspects, fp_suspects, inconsistent = [], [], []

    # CONSISTENCY: an address referenced BOTH as a raw literal AND as a symbol is a
    # strong tell — the raw one is a missed pointer (false negative) OR the symbolized
    # one is a false positive. Either way it must be reconciled.
    for a in sorted(set(raw_targets) & set(sym_targets)):
        if a in starts or (a & 1) == 0:   # even/aligned or a known object start
            rawloc = raw_targets[a][0]
            symloc = sym_targets[a][0]
            # A UnitDefinition's first packed word can coincidentally equal a real
            # Thumb callback pointer in an unrelated proc table. That is legal
            # mixed use, not an inconsistent classification of the same datum.
            if rawloc[0] in unitdef_files and not re.search(r"^(REDA|UnitDef_)", symloc[2]):
                continue
            inconsistent.append((f"0x{a:08X}", rawloc, symloc, addr2name.get(a, "?")))

    for rel, ln, kind, txt, sym, off, is_raw in refs:
        if is_raw:
            a = off
            if a in starts:
                own = owning(addrs, addr2name, a)
                fn_suspects.append((rel, ln, f"0x{a:08X}", f"== START {own[1]}", "HIGH"))
        else:
            base = name2addr.get(sym)
            if base is None:
                continue
            a = base + off
            own = owning(addrs, addr2name, a)
            # NOISE FILTER 1 — FORCESPRITE/anim embedded pointers: an anim instruction word
            # ORs opcode bits (>= 0x10000000) onto a real ROM pointer, so `Sym + 0x7000....`
            # computes an out-of-ROM value that still relocates the low pointer bits
            # correctly under the shift (see commit 7dd9a675d). NOT a false positive.
            if off >= 0x10000000 or a >= ROM_HI:
                continue
            # STT_FUNC arbitrary-offset references are the broad false-positive class from
            # issue #143: a packed data word happens to equal func+off. Legitimate Thumb
            # callbacks are exact function entries (`func` or `func + 1`); real aliases to
            # local function starts must be named as that target + 1, not as a mid-function
            # offset from a different FUNC symbol.
            func_arbitrary_offset = sym in code_symbols and off not in (0, 1)
            in_gap = own is None or (a - own[0]) > 0x40000
            # CROSS-TYPE: containing file's resource type vs the pointer target's type.
            ftype = restype(rel)
            ttype = restype(sym)
            # NOISE FILTER 2 — chapter/event data legitimately references UnitDef tables.
            compatible = {ftype, ttype} <= {"event", "unit"}
            # Exact resource starts are strong real-pointer evidence (e.g. portrait/bg
            # palette tables); do not flag them solely because the numeric value also
            # resembles packed metadata.
            exact_start = off == 0 and a in starts
            pair = looks_packed_pair(a) and "banim" in rel
            unitdef_packed = (rel in unitdef_files and looks_packed(a)
                              and not re.search(r"^(REDA|UnitDef_)", sym))
            code_packed = looks_suspicious_code_ref(rel, ln, sym, a, code_symbols, unitdef_files)
            cross = (ftype != "?" and ttype != "?" and ftype != ttype
                     and not compatible and looks_packed(a) and not exact_start)
            if in_gap:
                fp_suspects.append((rel, ln, f"{sym}+0x{off:X}",
                                    f"=0x{a:08X} lands in a GAP (no owning object)", "HIGH"))
            elif func_arbitrary_offset:
                fp_suspects.append((rel, ln, f"{sym}+0x{off:X}",
                                    f"STT_FUNC arbitrary offset; use exact callback target or raw packed literal", "HIGH"))
            elif pair:
                fp_suspects.append((rel, ln, f"{sym}+0x{off:X}",
                                    f"=0x{a:08X} packed adjacent-u16 pair in banim/OAM data", "HIGH"))
            elif unitdef_packed:
                fp_suspects.append((rel, ln, f"{sym}+0x{off:X}",
                                    f"=0x{a:08X} packed UnitDefinition first word", "HIGH"))
            elif code_packed:
                fp_suspects.append((rel, ln, f"{sym}+0x{off:X}",
                                    f"=0x{a:08X} code symbol embedded in packed data row", "HIGH"))
            elif cross:
                fp_suspects.append((rel, ln, f"{sym}+0x{off:X}",
                                    f"=0x{a:08X} CROSS-TYPE {ftype}->{ttype}, packed-looking", "MED"))

    print("=" * 78)
    print(f"INCONSISTENT (same ROM address is BOTH raw literal AND symbolized): {len(inconsistent)}")
    print("=" * 78)
    for a, rl, sl, nm in inconsistent[:args.limit]:
        print(f"  {a} ({nm}): raw@{rl[0]}:{rl[1]}  vs  sym@{sl[0]}:{sl[1]} ({sl[2]}+0x{sl[3]:X})")

    print("\n" + "=" * 78)
    print(f"FALSE-NEGATIVE suspects (raw literal == symbol START => likely real pointer): {len(fn_suspects)}")
    print("=" * 78)
    for r in fn_suspects[:args.limit]:
        print(f"  [{r[4]}] {r[0]}:{r[1]}  .4byte {r[2]}  {r[3]}")

    print("\n" + "=" * 78)
    print(f"FALSE-POSITIVE suspects (symbolized non-pointer => wrongly relocated): {len(fp_suspects)}")
    print("=" * 78)
    for r in fp_suspects[:args.limit]:
        print(f"  [{r[4]}] {r[0]}:{r[1]}  .4byte {r[2]}  {r[3]}")
    if len(fp_suspects) > args.limit:
        print(f"  ... +{len(fp_suspects)-args.limit} more")

    print(f"\nSUMMARY: inconsistent={len(inconsistent)}, "
          f"false-negative(missed-ptr)={len(fn_suspects)}, "
          f"false-positive(mis-id)={len(fp_suspects)}")
    print("Confirm each with (1) source/struct, (2) target meaningfulness, (3) fe8u before editing.")
    report_function_relocations(function_relocs, args.relocs_elf, args.limit)
    report_scalar_relocations(scalar_relocs, args.limit)
    if args.fail_on_suspects and (
        inconsistent or fn_suspects or fp_suspects or function_relocs.suspects
        or scalar_relocs.large_zero_size_addends
        or scalar_relocs.compressed_anchor_suspects
        or scalar_relocs.area_scalar_suspects
        or scalar_relocs.header_scalar_suspects
    ):
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
