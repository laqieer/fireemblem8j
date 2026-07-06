#!/usr/bin/env python3
"""Small in-repo assembler helpers for the angr THUMB equivalence spike."""
from __future__ import annotations

import os
import re
import subprocess
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parents[4]
BUILD = ROOT / "build" / "angr_spike"


@dataclass(frozen=True)
class Blob:
    name: str
    path: Path
    base: int
    entry: int
    symbols: dict[str, int]
    code: bytes


def _run(argv: list[str]) -> str:
    r = subprocess.run(argv, cwd=ROOT, text=True, capture_output=True)
    if r.returncode != 0:
        raise RuntimeError(f"command failed: {' '.join(argv)}\n{r.stdout}\n{r.stderr}")
    return r.stdout


def assemble_thumb(name: str, asm: str, base: int = 0x1000) -> Blob:
    """Assemble a THUMB snippet and return a raw .text blob path under build/."""
    safe = re.sub(r"[^A-Za-z0-9_.-]", "_", name)
    BUILD.mkdir(parents=True, exist_ok=True)
    s = BUILD / f"{safe}.s"
    o = BUILD / f"{safe}.o"
    b = BUILD / f"{safe}.bin"
    prelude = ".syntax unified\n.thumb\n.global entry\n.type entry,%function\nentry:\n"
    s.write_text(prelude + asm.strip() + "\n", encoding="utf-8")
    _run(["arm-none-eabi-as", "-mthumb", "-mcpu=arm7tdmi", str(s), "-o", str(o)])
    _run(["arm-none-eabi-objcopy", "-O", "binary", "--only-section=.text", str(o), str(b)])
    nm = _run(["arm-none-eabi-nm", str(o)])
    symbols: dict[str, int] = {}
    for line in nm.splitlines():
        parts = line.split()
        if len(parts) == 3:
            symbols[parts[2]] = base + int(parts[0], 16)
    return Blob(name=safe, path=b, base=base, entry=base + 1, symbols=symbols, code=b.read_bytes())
