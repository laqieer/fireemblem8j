#!/usr/bin/env python3
"""migrate_animspr.py -- rewrite src/data/banim/*.c files, replacing
u8 AnimSpr*/AnimSprite* INCBIN_U8("data/residual/*.bin") declarations with
inline __asm__() blocks using ANIM_SPRITE / ANIM_SPRITE_AFFIN / ANIM_SPRITE_END
macros (from include/animscr.inc).

Usage:
    python3 scripts/migrate_animspr.py [--dry-run] [files...]
    # Default: all src/data/banim/*.c

The resulting .c is byte-identical to the original (gated by make compare).

Strategy:
- Parse each line for: <attrs> u8 <SYM>[] ... = INCBIN_U8("data/residual/<SYM>.bin");
- Replace with an __asm__() block that emits the section + ANIM_SPRITE macros
- Non-AnimSpr lines are left unchanged
- First AnimSpr line in a file gets a leading '.include "include/animscr.inc"' in its asm block
"""

import os
import re
import struct
import sys
import argparse
import glob


def decode_bin(path: str):
    """Decode a .bin file to a list of (kind, args) tuples.
    kind: 'sprite', 'affin', 'end'
    """
    with open(path, "rb") as f:
        data = f.read()

    if len(data) % 12 != 0:
        raise ValueError(f"{path}: size {len(data)} not multiple of 12")

    entries = []
    for i in range(0, len(data), 12):
        entry = data[i : i + 12]
        oam0, oam1, oam2, f3, f4, f5 = struct.unpack("<6H", entry)

        # Terminator
        if oam0 == 0x0001 and oam1 == 0 and oam2 == 0 and f3 == 0 and f4 == 0 and f5 == 0:
            entries.append(("end", ()))
            break

        # Affine
        if oam1 == 0xFFFF:
            cnt = oam0
            pa, pb, pc, pd = oam2, f3, f4, f5
            entries.append(("affin", (cnt, pa, pb, pc, pd)))
            continue

        # Normal sprite
        x = struct.unpack("<h", struct.pack("<H", f3))[0]
        y = struct.unpack("<h", struct.pack("<H", f4))[0]
        entries.append(("sprite", (oam0, oam1, oam2, x, y)))

    return entries


def entries_to_asm_lines(entries):
    """Convert decoded entries to assembly macro lines."""
    lines = []
    for kind, args in entries:
        if kind == "end":
            lines.append("\tANIM_SPRITE_END")
        elif kind == "affin":
            cnt, pa, pb, pc, pd = args
            lines.append(
                f"\tANIM_SPRITE_AFFIN 0x{cnt:04X}, 0x{pa:04X}, 0x{pb:04X}, 0x{pc:04X}, 0x{pd:04X}"
            )
        elif kind == "sprite":
            oam0, oam1, oam2, x, y = args
            lines.append(
                f"\tANIM_SPRITE 0x{oam0:04X}, 0x{oam1:04X}, 0x{oam2:04X}, {x}, {y}"
            )
    return lines


# Match: SECTION("...") u8 SYM[] = INCBIN_U8("data/residual/ANIMSPR_NAME.bin");
# Also: u8 SYM[] __attribute__((section("..."))) = INCBIN_U8("data/residual/ANIMSPR_NAME.bin");
INCBIN_LINE_RE = re.compile(
    r"""^
    # optional SECTION macro or __attribute__((section(...)))
    (?:
        (?:SECTION\("[^"]+"\)\s+) |
        (?:u8\s+\w+\[\]\s+__attribute__\(\(section\("[^"]+"\)\)\)\s+=\s*INCBIN_U8\("[^"]+"\);) |
        \s*
    )
    u8\s+
    ((?:AnimSpr_|AnimSprite_)\w+)  # capture symbol name
    \[\]\s*
    (?:__attribute__\(\(section\("([^"]+)"\)\)\)\s*)?
    =\s*INCBIN_U8\("(data/residual/(?:AnimSpr_|AnimSprite_)\w+\.bin)"\)\s*;
    """,
    re.VERBOSE,
)

# Simpler single-pass parser: look for lines containing both an AnimSp* symbol and INCBIN_U8("data/residual/AnimSp*)
def parse_animspr_line(line: str):
    """Return (sym_name, section_name, bin_path) if this line is an AnimSpr INCBIN_U8, else None."""
    stripped = line.strip()
    if "INCBIN_U8" not in stripped:
        return None
    # Must reference data/residual/ AnimSpr or AnimSprite
    m_bin = re.search(r'INCBIN_U8\("(data/residual/(AnimSpr_|AnimSprite_)[^"]+\.bin)"\)', stripped)
    if not m_bin:
        return None

    bin_path = m_bin.group(1)
    # Extract symbol name from the variable declaration
    m_sym = re.search(r'\bu8\s+((?:AnimSpr_|AnimSprite_)\w+)\b', stripped)
    if not m_sym:
        return None
    sym_name = m_sym.group(1)

    # Extract section name from SECTION("...") or __attribute__((section("...")))
    m_sec = re.search(r'SECTION\("([^"]+)"\)', stripped)
    if not m_sec:
        m_sec = re.search(r'__attribute__\(\(section\("([^"]+)"\)\)\)', stripped)
    section = m_sec.group(1) if m_sec else None

    return sym_name, section, bin_path


def entries_to_shorts(entries) -> list:
    """Convert decoded AnimSprite entries to raw .short directives.

    This avoids relying on .include "include/animscr.inc" inside __asm__() blocks,
    which triggers a GAS parsing-state bug in large files (>~1800 lines of stabs).
    The output is identical to what ANIM_SPRITE/ANIM_SPRITE_AFFIN/ANIM_SPRITE_END expand to.
    """
    lines = []
    for kind, args in entries:
        if kind == "end":
            # ANIM_SPRITE_END = ANIM_SPRITE 0x1, 0, 0, 0, 0
            lines.append("\t.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000")
        elif kind == "affin":
            cnt, pa, pb, pc, pd = args
            # ANIM_SPRITE_AFFIN cnt, pa, pb, pc, pd
            lines.append(f"\t.short 0x{cnt:04X}, 0xFFFF, 0x{pa:04X}, 0x{pb:04X}, 0x{pc:04X}, 0x{pd:04X}")
        elif kind == "sprite":
            oam0, oam1, oam2, x, y = args
            # ANIM_SPRITE oam0, oam1, oam2, x, y
            # x and y are signed but .short handles negative values correctly
            lines.append(f"\t.short 0x{oam0:04X}, 0x{oam1:04X}, 0x{oam2:04X}, {x}, {y}, 0")
    return lines


def make_asm_block(sym_name: str, section: str, entries, include_header: bool, repo_root: str) -> str:
    """Generate a C __asm__() block for one AnimSprite symbol.

    Emits raw .short directives (equivalent to expanding ANIM_SPRITE/ANIM_SPRITE_AFFIN/ANIM_SPRITE_END)
    instead of using .include "include/animscr.inc". This avoids a GAS parsing-state bug
    that occurs in large files (>~1800 lines of stabs) when .include is used.

    include_header: ignored (kept for API compatibility), was used for .include approach
    """
    asm_lines = []
    asm_lines.append(f"\t.section {section}, \"a\", %progbits")
    asm_lines.append(f"\t.global {sym_name}")
    asm_lines.append(f"{sym_name}:")
    asm_lines.extend(entries_to_shorts(entries))

    # Build C string concatenation for __asm__()
    c_strings = []
    for asm_line in asm_lines:
        # Escape backslashes and quotes for embedding in C string literals
        escaped = asm_line.replace("\\", "\\\\").replace('"', '\\"')
        c_strings.append(f'"{escaped}\\n"')

    return "__asm__(\n" + "\n".join(c_strings) + "\n);"


def migrate_file(c_path: str, repo_root: str, dry_run: bool = False) -> tuple:
    """Migrate one .c file. Returns (n_converted, n_failed) tuple."""
    with open(c_path, "r") as f:
        original_lines = f.readlines()

    new_lines = []
    n_converted = 0
    n_failed = 0

    for line in original_lines:
        parsed = parse_animspr_line(line)
        if parsed is None:
            new_lines.append(line)
            continue

        sym_name, section, bin_path = parsed

        # Resolve bin_path relative to repo_root
        full_bin_path = os.path.join(repo_root, bin_path)
        if not os.path.exists(full_bin_path):
            print(f"  WARN: {bin_path} not found, leaving INCBIN", file=sys.stderr)
            new_lines.append(line)
            n_failed += 1
            continue

        # If section wasn't found in the line, we can't emit the __asm__ block properly
        if section is None:
            print(f"  WARN: {sym_name}: no section found, leaving INCBIN", file=sys.stderr)
            new_lines.append(line)
            n_failed += 1
            continue

        try:
            entries = decode_bin(full_bin_path)
        except Exception as e:
            print(f"  WARN: {sym_name}: decode failed: {e}, leaving INCBIN", file=sys.stderr)
            new_lines.append(line)
            n_failed += 1
            continue

        asm_block = make_asm_block(sym_name, section, entries, False, repo_root)

        # Preserve leading whitespace/indentation of original line (none for global decls)
        new_lines.append(asm_block + "\n")
        n_converted += 1

    if n_converted == 0:
        return 0, n_failed

    if not dry_run:
        with open(c_path, "w") as f:
            f.writelines(new_lines)

    return n_converted, n_failed


def main():
    parser = argparse.ArgumentParser(description="Migrate AnimSpr INCBIN_U8 lines to __asm__() macro blocks")
    parser.add_argument("files", nargs="*", help="Specific .c files to migrate (default: all src/data/banim/*.c)")
    parser.add_argument("--dry-run", action="store_true", help="Show what would change without writing")
    args = parser.parse_args()

    repo_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

    if args.files:
        c_files = args.files
    else:
        c_files = sorted(glob.glob(os.path.join(repo_root, "src/data/banim/*.c")))

    total_converted = 0
    total_failed = 0

    for c_path in c_files:
        n, f = migrate_file(c_path, repo_root, dry_run=args.dry_run)
        if n > 0 or f > 0:
            print(f"{'[DRY] ' if args.dry_run else ''}{'MIGRATED' if n > 0 else 'PARTIAL'} {os.path.basename(c_path)}: {n} converted, {f} failed")
        total_converted += n
        total_failed += f

    print(f"\nTotal: {total_converted} AnimSpr symbols converted, {total_failed} failed")
    if total_failed > 0:
        sys.exit(1)


if __name__ == "__main__":
    main()
