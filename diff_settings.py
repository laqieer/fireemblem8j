# asm-differ configuration for FE8J (GBA / ARM7TDMI / agbcc Thumb-interwork).
#
# asm-differ (tools/asm-differ, gitignored — install via
# scripts/tools/asm-differ/setup.sh) reads this file from the current working
# directory, so it must live at the repo root. Run diff.py from the repo root.
#
# FE8J is a single-ROM bootstrap decomp: `make` links every object into one
# fireemblem8.elf and emits fireemblem8.map. We diff per function out of that
# ELF/map. See docs/tools/asm-differ.md for invocation and caveats.


def apply(config, args):
    # ARM32 (ARM7TDMI, Thumb). Endianness is read from the ELF header for the
    # -o/-e (objfile/ELF) workflows we use, so "arm32" is correct here; it only
    # matters for raw -bbinary dumps, which we do not use.
    config["arch"] = "arm32"

    # arm-none-eabi binutils (same PREFIX as the Makefile). asm-differ appends
    # the function/symbol selection and the disassembly flags (-d -rz -j .text,
    # i.e. the project's "-drz" convention plus an explicit section) itself.
    config["objdump_executable"] = "arm-none-eabi-objdump"

    # GNU ld map from `make` (ROM -> fireemblem8.map). Used to locate the .o and
    # address of a symbol for the recommended -o (diff .o) workflow.
    config["mapfile"] = "fireemblem8.map"
    config["map_format"] = "gnu"

    # The built, non-stripped ELF. Used as `myimg` for the -e (two-ELF) flow and
    # as the link target the map points into.
    config["myimg"] = "fireemblem8.elf"

    # FE8J has no separate target ELF; the reference bytes live in the original
    # ROM (baserom.gba) and, after linking, inside fireemblem8.elf itself. For a
    # quick "what does this function currently assemble to" view, use single
    # mode (diff.py -o1 / -o3); two-sided -o diffing additionally wants an
    # expected/ copy of the .o (see docs/tools/asm-differ.md).
    config["baseimg"] = "fireemblem8.elf"

    # Where -o looks for the reference (OK) object files, if you maintain one.
    config["expected_dir"] = "expected/"

    # Source roots for -c/--source line interleaving.
    config["source_directories"] = ["."]
