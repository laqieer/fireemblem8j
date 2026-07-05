#!/bin/sh
# Build a reproducible FE8J shifted ROM without touching the matching artifacts.
#
# Default output:
#   scripts/shiftcheck/build_shifted_rom.sh
# writes ./fireemblem8_shifted.gba using a uniform +0x40000 post-header shift.
set -eu

SHIFT=0x40000
OUT=fireemblem8_shifted.gba
WORK=build/shifted
PATCH_OPAQUE=1

while [ "$#" -gt 0 ]; do
    case "$1" in
        --shift)
            SHIFT="$2"; shift 2 ;;
        --out)
            OUT="$2"; shift 2 ;;
        --work)
            WORK="$2"; shift 2 ;;
        --no-patch)
            PATCH_OPAQUE=0; shift ;;
        -h|--help)
            echo "usage: $0 [--shift 0x40000] [--out fireemblem8_shifted.gba] [--work build/shifted] [--no-patch]"
            exit 0 ;;
        *)
            echo "unknown argument: $1" >&2
            exit 2 ;;
    esac
done

PYTHON="${PYTHON:-python3}"
AS="${AS:-arm-none-eabi-as}"
OBJCOPY="${OBJCOPY:-arm-none-eabi-objcopy}"
NM="${NM:-arm-none-eabi-nm}"
LD="${LD:-arm-none-eabi-ld}"

mkdir -p "$WORK"

# Ensure vanilla build inputs and the response file exist. This may update normal
# build outputs if they are absent/stale, but does not alter source/layout files.
make --no-print-directory fireemblem8.gba fireemblem8.elf objects.lst

SHIFT_HEX="$SHIFT" WORK="$WORK" "$PYTHON" - <<'PY'
import os
import re
from pathlib import Path

shift = int(os.environ["SHIFT_HEX"], 0)
work = Path(os.environ["WORK"])
work.mkdir(parents=True, exist_ok=True)

def shift_rom_value(match):
    value = int(match.group(0), 16)
    if 0x08000000 <= value < 0x09000000:
        return f"0x{value + shift:08X}"
    return match.group(0)

def build_ldscript():
    src = Path("ldscript.txt").read_text()
    anchor = "        src/rom_header.o(.text);\n"
    if anchor not in src:
        raise SystemExit("could not find rom_header anchor in ldscript.txt")
    src = src.replace(anchor, anchor + f"        . += 0x{shift:X}; /* FE8J shifted ROM proof: move post-header content */\n", 1)

    def bump_rom_noload(m):
        addr = int(m.group(1), 16)
        return f"{m.group(0)[:m.start(1)-m.start(0)]}0x{addr + shift:08X}{m.group(0)[m.end(1)-m.start(0):]}"

    # Only ROM-backed NOLOAD overlays mirror bytes that moved in the sequential
    # ROM body. RAM NOLOAD placements must stay fixed.
    src = re.sub(r"\.bss_\d+\s+(0x[0-9A-Fa-f]+)\s+\(NOLOAD\)[^\n]*>\s+rom[^\n]*", bump_rom_noload, src)
    # Point the banim .data placement at the shifted-base rebuilt blob (its
    # internal motion->sheet pointers are relinked at 0x08C02000+shift). The
    # ldscript names the object by path, so the objects.lst swap alone is not
    # enough to move the placed section.
    src = src.replace("banim/data_banim.o(.data)",
                      f"{work}/data_banim_shift_0x{shift:X}.o(.data)")
    (work / f"ldscript_shift_0x{shift:X}.txt").write_text(src)

def build_jp_syms():
    text = Path("asm/jp_syms.s").read_text()
    text = re.sub(r"0x08[0-9A-Fa-f]{6}", shift_rom_value, text)
    (work / f"jp_syms_shift_0x{shift:X}.s").write_text(text)

build_ldscript()
build_jp_syms()
PY

"$AS" -o "$WORK/jp_syms_shift_${SHIFT}.o" "$WORK/jp_syms_shift_${SHIFT}.s"

# banim: rebuild the pre-linked battle-animation blob at the SHIFTED base so its
# INTERNAL motion->sheet pointers relocate too. The vanilla banim/data_banim.o is
# pre-linked by arm_compressing_linker.py at 0x08C02000 with those pointers baked
# absolute; feeding only its shifted symbol table (as before) fixes external refs
# but leaves the blob's own motion->sheet words stale, so battle animations read
# the wrong (unshifted) sheet address and freeze. Re-linking the blob at
# 0x08C02000+SHIFT regenerates both the internal pointers AND a correct .sym.o.
BANIM_BASE=$("$PYTHON" -c "print(hex(0x8c02000 + $SHIFT))")
SHIFT_BANIM="$WORK/data_banim_shift_${SHIFT}.o"
"$PYTHON" ./scripts/arm_compressing_linker.py -o "$SHIFT_BANIM" \
    -t linker_script_banim.txt -b "$BANIM_BASE" -l "$LD" --objcopy "$OBJCOPY" \
    -c ./scripts/compressor.py >/dev/null

ORIG_JP=asm/jp_syms.o
SHIFT_JP="$WORK/jp_syms_shift_${SHIFT}.o"
ORIG_BANIM=banim/data_banim.o
python3 - "$ORIG_JP" "$SHIFT_JP" "$ORIG_BANIM" "$SHIFT_BANIM" objects.lst "$WORK/objects_shift_${SHIFT}.lst" <<'PY'
import sys
from pathlib import Path
orig_jp, repl_jp, orig_banim, repl_banim, src, dst = sys.argv[1:7]
txt = Path(src).read_text().replace(orig_jp, repl_jp).replace(orig_banim, repl_banim)
Path(dst).write_text(txt)
PY

ELF="$WORK/fireemblem8_shifted_${SHIFT}.elf"
LDS="$WORK/ldscript_shift_${SHIFT}.txt"
OBJECTS_LST="$WORK/objects_shift_${SHIFT}.lst" \
    scripts/shiftcheck/emit_relocs_link.sh "$ELF" "$LDS" -R "$SHIFT_BANIM.sym.o"

PAD_TO=$("$PYTHON" - "$SHIFT" <<'PY'
import sys
print(hex(0x09000000 + int(sys.argv[1], 0)))
PY
)
"$OBJCOPY" --strip-debug -O binary --pad-to "$PAD_TO" --gap-fill=0xff "$ELF" "$OUT"

if [ "$PATCH_OPAQUE" -eq 1 ]; then
    "$PYTHON" - "$OUT" "$SHIFT" <<'PY'
import struct
import sys
from pathlib import Path

path = Path(sys.argv[1])
shift = int(sys.argv[2], 0)
data = bytearray(path.read_bytes())

patches = [
    # crt0 opaque residue literal pool: bx AgbMain|thumb. The adjacent
    # 0x03007FFC IRQ RAM slot is intentionally not shifted.
    (0x08000220, 0x08000A21, "crt0 AgbMain|thumb literal"),
]

for loc, expected, name in patches:
    off = (loc - 0x08000000) + shift
    old = struct.unpack_from("<I", data, off)[0]
    if old != expected:
        raise SystemExit(f"{name}: expected 0x{expected:08X} at shifted file offset 0x{off:X}, found 0x{old:08X}")
    new = expected + shift
    struct.pack_into("<I", data, off, new)
    print(f"patched {name}: file+0x{off:X} 0x{old:08X} -> 0x{new:08X}")

path.write_bytes(data)
PY
else
    echo "opaque pointer patching disabled (--no-patch)"
fi

echo "wrote $OUT (shift $SHIFT)"
