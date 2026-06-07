#!/usr/bin/env bash
# decomp-permuter compile script for FE8J (agbcc pipeline).
#
# decomp-permuter calls this as:  compile.sh <input.c> -o <output.o>
# where <input.c> is the *preprocessed* candidate C (import.py already ran cpp).
# This mirrors the Makefile C rule minus the cpp step:
#     iconv UTF-8 -> CP932  |  agbcc -> .s  ;  arm-none-eabi-as -> .o
# Codegen flags are kept identical to the Makefile's CC1FLAGS/ASFLAGS so the
# bytes match; -Werror is dropped so a randomized-but-valid candidate that emits
# a warning still compiles.
set -euo pipefail

INPUT="$(realpath "$1")"
OUTPUT="$(realpath "$3")"          # $2 is the literal "-o"
ROOT="$(cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/../.." && pwd)"
cd "$ROOT"

ASM="$(mktemp --suffix=.s)"
trap 'rm -f "$ASM"' EXIT

iconv -f UTF-8 -t CP932 "$INPUT" \
  | tools/agbcc/bin/agbcc -mthumb-interwork -Wimplicit -Wparentheses -O2 -fhex-asm -ffix-debug-line -g -o "$ASM"
echo '.ALIGN 2, 0' >> "$ASM"
arm-none-eabi-as -mcpu=arm7tdmi -mthumb-interwork -I include -I . "$ASM" -o "$OUTPUT"
