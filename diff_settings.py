# asm-differ configuration for FE8J (GBA / ARM7TDMI / agbcc Thumb-interwork).
#
# asm-differ (tools/asm-differ, gitignored — install via
# scripts/tools/asm-differ/setup.sh) reads this file from the current working
# directory, so it must live at the repo root. Run diff.py from the repo root.
#
# FE8J is a single-ROM bootstrap decomp: `make` links every object into one
# fireemblem8.gba (+ .elf/.map). The diff target is the ORIGINAL ROM,
# baserom.gba. Two workflows actually compare against it (see
# docs/tools/asm-differ.md for the full rationale):
#   1. raw-binary diff by file offset: `diff.py 0xSTART 0xEND`
#      (baseimg=baserom.gba vs myimg=fireemblem8.gba), and
#   2. per-object two-sided diff: `diff.py -o <Symbol>` against an expected/ .o.
# `diff.py -o1 <Symbol>` only *views* the current build (not a diff).


def apply(config, args):
    # ARM32, little-endian (GBA / ARM7TDMI, Thumb). Use "armel" (not "arm32"):
    # the raw -bbinary diff of baserom.gba vs fireemblem8.gba needs objdump -EL,
    # which asm-differ only passes when the arch is flagged little-endian
    # ("arm32" is big-endian and would mis-decode the flat ROM). For the -o/-e
    # (objfile/ELF) workflows endianness is read from the ELF header instead, so
    # "armel" is correct there too.
    config["arch"] = "armel"

    # arm-none-eabi binutils (same PREFIX as the Makefile). asm-differ appends
    # the function/symbol selection and the disassembly flags (-d -rz -j .text
    # for -o, or -Dz -bbinary -EL for the raw-binary mode) itself.
    config["objdump_executable"] = "arm-none-eabi-objdump"

    # objdump flags asm-differ prepends (arch_flags + objdump_flags) in EVERY
    # mode. asm-differ's "armel" arch has empty arch_flags, and the raw -bbinary
    # path (workflow #1) hands objdump only `-Dz -bbinary -EL`. A flat binary has
    # no ELF header, so without an explicit machine objdump exits with "can't
    # disassemble for architecture UNKNOWN"; and since FE8J code is Thumb (agbcc
    # Thumb-interwork) it must also force the Thumb decoder, else `-m arm` alone
    # decodes the Thumb bytes as ARM.
    #
    # These flags must NOT leak into the -o/-e (object/ELF) modes: there objdump
    # reads the ARM/Thumb state per-instruction from the ELF mapping symbols
    # ($a/$t), and a global -Mforce-thumb would mis-decode ARM-state code (e.g.
    # the ARM rom_header / Init). So set objdump_flags only for the raw-binary
    # invocation, detected from the parsed args: raw mode is "no -o and no -e".
    # (asm-differ calls apply(config, args) with the parsed argparse Namespace;
    # diff_obj is the -o flag, diff_elf_symbol is the -e SYMBOL.) See
    # docs/tools/asm-differ.md; to raw-diff a rare ARM range, drop -Mforce-thumb.
    is_raw_binary = not getattr(args, "diff_obj", False) and not getattr(
        args, "diff_elf_symbol", None
    )
    if is_raw_binary:
        config["objdump_flags"] = ["-m", "arm", "-Mforce-thumb"]

    # GNU ld map from `make` (ROM -> fireemblem8.map). Used by -o to find the
    # owning .o of a symbol. NOTE: asm-differ's *raw-binary* symbol lookup
    # additionally requires "load address" columns in the map (separate LMA), but
    # FE8J's ROM is linked and runs in place at 0x08000000 (ldscript.txt), so the
    # map has no load addresses and a symbol-name binary diff is not available.
    # Pass explicit file offsets instead (file_offset = vma - 0x08000000); see
    # docs/tools/asm-differ.md.
    config["mapfile"] = "fireemblem8.map"
    config["map_format"] = "gnu"

    # The reference ("OK") bytes are the ORIGINAL ROM, baserom.gba; what we built
    # is fireemblem8.gba. This makes the raw-binary diff a true per-function
    # delta of our build vs the target:
    #   baseimg = target/reference, myimg = our current build.
    config["baseimg"] = "baserom.gba"
    config["myimg"] = "fireemblem8.gba"

    # Where -o looks for the reference ("OK") object files, if you maintain one.
    # FE8J has no expected/ tree by default (see docs); without it, -o is only
    # usable in single mode (-o1 / -o3), which views asm but is not a diff.
    config["expected_dir"] = "expected/"

    # Source roots for -c/--source line interleaving.
    config["source_directories"] = ["."]
