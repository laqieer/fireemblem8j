#!/usr/bin/env python3
"""Emit small relocation-normalized JP-vs-US certificates for Q2a functions."""

from __future__ import annotations

import re
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[4]
JP_ELF = ROOT / "fireemblem8.elf"
US_ELF = ROOT.parent / "fireemblem8u" / "fireemblem8.elf"
FUNCS = ("GetGameClock", "AddTarget", "GreenText_OnLoop")


def objdump(elf: Path, sym: str) -> list[str]:
    out = subprocess.check_output(
        ["arm-none-eabi-objdump", "-d", f"--disassemble={sym}", str(elf)],
        text=True,
        cwd=ROOT,
    )
    rows: list[str] = []
    for line in out.splitlines():
        if not re.match(r"\s*[0-9a-f]{7,8}:", line):
            continue
        parts = line.split("\t")
        if len(parts) < 3:
            continue
        asm = parts[2].strip()
        if asm.startswith(".word"):
            rows.append(".word RELOC")
        elif asm.startswith("bl"):
            rows.append("bl RELOC_TARGET")
        else:
            asm = re.sub(r"0x[0-9a-fA-F]+|[0-9a-fA-F]{7,8}", "ADDR", asm)
            asm = re.sub(r"<[^>]+>", "<SYM>", asm)
            rows.append(asm)
    return rows


def main() -> int:
    ok = True
    for sym in FUNCS:
        jp = objdump(JP_ELF, sym)
        us = objdump(US_ELF, sym)
        same = jp == us
        ok = ok and same
        print(f"{sym}: {'MATCH' if same else 'DIFF'}")
        if not same:
            print("  JP:", jp)
            print("  US:", us)
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
