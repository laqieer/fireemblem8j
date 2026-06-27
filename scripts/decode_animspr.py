#!/usr/bin/env python3
"""decode_animspr.py -- decode AnimSpr_*/AnimSprite_* binary blobs to ANIM_SPRITE macro source.

Usage:
    python3 scripts/decode_animspr.py <blob.bin> [...]

Each .bin file is read as a sequence of 12-byte entries (6 × u16 LE):
    Normal entry: oam0, oam1, oam2, x(s16), y(s16), pad(=0)
    Affine entry: cnt, 0xFFFF, pa, pb, pc, pd      (oam1 == 0xFFFF)
    Terminator:   0x0001, 0, 0, 0, 0, 0

Output (per blob):
    A C source file at <blob>.c (or the path passed via --out) containing a
    single __asm__() block using ANIM_SPRITE / ANIM_SPRITE_AFFIN / ANIM_SPRITE_END
    macros (which expand to .short directives identical to the binary).

The output is byte-identical to the original .bin when assembled.

Verification:
    arm-none-eabi-as -o /tmp/test.o generated.s && arm-none-eabi-objcopy -O binary /tmp/test.o /tmp/test.bin && cmp /tmp/test.bin original.bin
"""

import struct
import sys
import os
import argparse


def decode_bin(path: str) -> str:
    """Decode a binary AnimSprite blob to an __asm__() body string."""
    with open(path, "rb") as f:
        data = f.read()

    if len(data) % 12 != 0:
        raise ValueError(f"{path}: size {len(data)} is not a multiple of 12")

    lines = []
    n = len(data) // 12
    for i in range(n):
        off = i * 12
        entry = data[off : off + 12]
        oam0, oam1, oam2, f3, f4, f5 = struct.unpack("<6H", entry)

        # Terminator: oam0=0x0001 and the rest are all zero
        if oam0 == 0x0001 and oam1 == 0 and oam2 == 0 and f3 == 0 and f4 == 0 and f5 == 0:
            lines.append("\tANIM_SPRITE_END")
            # Terminator marks end of meaningful data; no further entries expected
            break

        # Affine entry: oam1 == 0xFFFF  (cnt, 0xFFFF, pa, pb, pc, pd)
        if oam1 == 0xFFFF:
            cnt = oam0
            pa, pb, pc, pd = oam2, f3, f4, f5
            lines.append(
                f"\tANIM_SPRITE_AFFIN 0x{cnt:04X}, 0x{pa:04X}, 0x{pb:04X}, 0x{pc:04X}, 0x{pd:04X}"
            )
            continue

        # Normal OAM entry
        # f5 (pad) must be 0 per spec
        if f5 != 0:
            raise ValueError(
                f"{path}: entry {i}: expected pad=0 but got 0x{f5:04X} -- not a valid AnimSprite blob"
            )
        # x and y are signed 16-bit
        x = struct.unpack("<h", struct.pack("<H", f3))[0]
        y = struct.unpack("<h", struct.pack("<H", f4))[0]
        lines.append(
            f"\tANIM_SPRITE 0x{oam0:04X}, 0x{oam1:04X}, 0x{oam2:04X}, {x}, {y}"
        )

    return "\n".join(lines)


def make_c_source(sym_name: str, section: str, asm_body: str) -> str:
    """Wrap the asm body in a C __asm__() block with proper section + global."""
    # Each macro line must be terminated with \\n in the C string
    asm_lines = ["\t.include \"include/animscr.inc\""]
    asm_lines += asm_body.splitlines()

    c_str_lines = []
    for line in asm_lines:
        escaped = line.replace("\\", "\\\\").replace('"', '\\"')
        c_str_lines.append(f'"{escaped}\\n"')

    asm_block = "\n".join(c_str_lines)

    return f"""#include "global.h"

__asm__(
"\\t.section {section}, \\"a\\", %progbits\\n"
"\\t.global {sym_name}\\n"
"{sym_name}:\\n"
{asm_block}
);
"""


def make_plain_s_source(sym_name: str, section: str, asm_body: str) -> str:
    """Generate a standalone .s file (for verification or standalone use)."""
    lines = [
        f'\t.include "include/animscr.inc"',
        f"\t.section {section}, \"a\", %progbits",
        f"\t.global {sym_name}",
        f"{sym_name}:",
    ]
    lines += asm_body.splitlines()
    lines.append("")  # trailing newline
    return "\n".join(lines)


def verify_roundtrip(bin_path: str, asm_body: str, sym_name: str, section: str) -> bool:
    """
    Assemble a standalone .s and compare the binary output to the original.
    Returns True on match, False on mismatch.
    """
    import subprocess
    import tempfile

    s_src = make_plain_s_source(sym_name, section, asm_body)
    with tempfile.NamedTemporaryFile(suffix=".s", mode="w", delete=False) as sf:
        sf.write(s_src)
        s_path = sf.name

    o_path = s_path.replace(".s", ".o")
    bin_out = s_path.replace(".s", ".bin")

    try:
        # Must run from the repo root so .include "include/animscr.inc" resolves
        repo_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        r = subprocess.run(
            ["arm-none-eabi-as", "-I", repo_root, "-mthumb", "-mthumb-interwork",
             "-mlittle-endian", "-mcpu=arm7tdmi", s_path, "-o", o_path],
            capture_output=True,
            text=True,
            cwd=repo_root,
        )
        if r.returncode != 0:
            print(f"  AS error:\n{r.stderr}", file=sys.stderr)
            return False

        r2 = subprocess.run(
            ["arm-none-eabi-objcopy", "-O", "binary", "--only-section", section,
             o_path, bin_out],
            capture_output=True,
            text=True,
        )
        if r2.returncode != 0:
            print(f"  objcopy error:\n{r2.stderr}", file=sys.stderr)
            return False

        with open(bin_out, "rb") as f:
            assembled = f.read()
        with open(bin_path, "rb") as f:
            original = f.read()

        if assembled == original:
            return True
        else:
            print(f"  MISMATCH: assembled {len(assembled)} bytes, original {len(original)} bytes",
                  file=sys.stderr)
            if len(assembled) == len(original):
                diffs = [(i, assembled[i], original[i]) for i in range(len(assembled)) if assembled[i] != original[i]]
                print(f"  First diff at byte {diffs[0][0]}: got 0x{diffs[0][1]:02X} expected 0x{diffs[0][2]:02X}",
                      file=sys.stderr)
            return False
    finally:
        for p in [s_path, o_path, bin_out]:
            try:
                os.unlink(p)
            except FileNotFoundError:
                pass


def main():
    parser = argparse.ArgumentParser(description="Decode AnimSprite .bin blobs to macro source")
    parser.add_argument("bins", nargs="+", metavar="BLOB.bin", help="Binary blob files to decode")
    parser.add_argument("--section", default=None,
                        help="Override .section name (default: .rodata.<sym>)")
    parser.add_argument("--verify", action="store_true",
                        help="Assemble and byte-compare output against original .bin")
    parser.add_argument("--emit-s", action="store_true",
                        help="Emit standalone .s file instead of __asm__()-in-.c")
    parser.add_argument("--out", default=None,
                        help="Output path (only valid with a single input blob)")
    args = parser.parse_args()

    if args.out and len(args.bins) > 1:
        parser.error("--out can only be used with a single input blob")

    ok_count = 0
    fail_count = 0

    for bin_path in args.bins:
        sym_name = os.path.splitext(os.path.basename(bin_path))[0]
        section = args.section if args.section else f".rodata.{sym_name}"

        try:
            asm_body = decode_bin(bin_path)
        except Exception as e:
            print(f"ERROR {bin_path}: {e}", file=sys.stderr)
            fail_count += 1
            continue

        if args.verify:
            ok = verify_roundtrip(bin_path, asm_body, sym_name, section)
            status = "OK" if ok else "FAIL"
            print(f"{status} {bin_path}")
            if ok:
                ok_count += 1
            else:
                fail_count += 1
            continue

        # Emit output
        if args.emit_s:
            content = make_plain_s_source(sym_name, section, asm_body)
            ext = ".s"
        else:
            content = make_c_source(sym_name, section, asm_body)
            ext = ".c"

        if args.out:
            out_path = args.out
        else:
            out_path = os.path.splitext(bin_path)[0] + ext

        with open(out_path, "w") as f:
            f.write(content)
        print(f"Wrote {out_path}")
        ok_count += 1

    if args.verify:
        print(f"\n{ok_count} OK, {fail_count} FAIL out of {ok_count + fail_count} blobs")
        if fail_count > 0:
            sys.exit(1)


if __name__ == "__main__":
    main()
