#!/usr/bin/env python3
"""Build a US<->JP ROM-address correspondence map from FEBuilderGBA's ROM defs.

FEBuilderGBA (GPL-3.0) ships per-region ROM definitions in
``ROMFE8JP.cs`` / ``ROMFE8U.cs`` with IDENTICAL field-name sets (``name = 0x<v>;``).
This script parses BOTH, joins by field name, classifies each value (only ROM
*addresses* are emitted), converts to GBA VMAs, byte-compares the JP vs US ROM
windows to decide region same/diff, and crosswalks the US VMA to the US decomp
symbol table. The result is REFERENCE DATA only (it is not a build input and
cannot affect ``make compare``).

Only factual addresses are emitted. No FEBuilder comment text is copied into the
output; the ``source`` column cites the .cs line instead.

Output ``reference/maps/febuilder_rom_us_jp.tsv`` (tab-separated):
    name  jp_vma  us_vma  region  exact_symbol  nearest_symbol_off  source

Deterministic: re-running regenerates an identical TSV.
"""

import os
import re
import subprocess
import sys
from bisect import bisect_right

# --- Shared read-only inputs (absolute paths). ---------------------------------
FEB_DIR = "/home/laqieer/FEBuilderGBA/FEBuilderGBA.Core"
JP_CS = os.path.join(FEB_DIR, "ROMFE8JP.cs")
US_CS = os.path.join(FEB_DIR, "ROMFE8U.cs")
US_ELF = "/home/laqieer/fireemblem8u/fireemblem8.elf"
US_GBA = "/home/laqieer/fireemblem8u/fireemblem8.gba"  # prebuilt US binary, if present
JP_GBA = "/home/laqieer/fireemblem8j/baserom.gba"

# Output, relative to repo root (this script lives in <root>/scripts/).
REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT_TSV = os.path.join(REPO_ROOT, "reference", "maps", "febuilder_rom_us_jp.tsv")

NM = os.environ.get("NM", "arm-none-eabi-nm")
OBJCOPY = os.environ.get("OBJCOPY", "arm-none-eabi-objcopy")

ROM_VMA_BASE = 0x08000000
ROM_VMA_END = 0x0A000000      # 0x08000000..0x09FFFFFF is cartridge ROM space
RAM_LO = 0x02000000
RAM_HI = 0x04000000
WINDOW = 32                   # bytes compared for region same/diff

# Field-name tokens that mark a small (< 0x02000000) value as a ROM *file offset*.
ADDR_TOKENS = ("pointer", "address", "base", "table", "list")

# A field assignment ``name = 0xHEX [ + 0xHEX | + DEC ] ;``. The required '(' in
# the C# override-method signatures (``name(out uint ...) = ...`` never occurs;
# methods are ``override public uint name(...) { ... }``) means anchoring on
# ``name = 0x`` excludes them. ``U.FindROMPointer(...)`` dynamic entries are
# matched separately and skipped.
RE_HEX = re.compile(
    r"^\s*([A-Za-z_][A-Za-z0-9_]*)\s*=\s*"
    r"(0x[0-9A-Fa-f]+(?:\s*\+\s*(?:0x[0-9A-Fa-f]+|\d+))?)\s*;"
)
RE_DYNAMIC = re.compile(r"^\s*([A-Za-z_][A-Za-z0-9_]*)\s*=\s*U\.FindROMPointer\b")


def eval_value(expr):
    """Evaluate ``0xHEX`` or ``0xHEX + N`` (used for Thumb +1 function ptrs)."""
    total = 0
    for tok in expr.split("+"):
        tok = tok.strip()
        total += int(tok, 16) if tok.lower().startswith("0x") else int(tok, 10)
    return total


def parse_cs(path):
    """Return (hex_entries, dynamic_names).

    hex_entries: dict name -> (value:int, line:int)
    dynamic_names: set of names assigned via U.FindROMPointer (to be skipped)
    """
    hex_entries = {}
    dynamic = set()
    with open(path, encoding="utf-8-sig") as f:
        for lineno, line in enumerate(f, 1):
            m = RE_HEX.match(line)
            if m:
                name = m.group(1)
                if name in hex_entries:
                    raise ValueError(f"{path}:{lineno}: duplicate field {name!r}")
                hex_entries[name] = (eval_value(m.group(2)), lineno)
                continue
            d = RE_DYNAMIC.match(line)
            if d:
                dynamic.add(d.group(1))
    return hex_entries, dynamic


def classify(name, value):
    """Classify a raw FEBuilder value.

    Returns the GBA VMA (int) if it is a ROM address, else None (skip).

    Strict rules (decide by name + range, never blindly +0x08000000):
      * value == 0                              -> sentinel; skip
      * RAM_LO <= value < RAM_HI                -> RAM; skip (RAM unit's job)
      * ROM_VMA_BASE <= value < ROM_VMA_END     -> already a ROM VMA; use as-is
      * 0 < value < RAM_LO and the field name
        contains an address token               -> ROM file offset; +0x08000000
      * else                                    -> count/id/size/crc/etc; skip
    """
    if value == 0:
        return None
    if RAM_LO <= value < RAM_HI:
        return None
    if ROM_VMA_BASE <= value < ROM_VMA_END:
        return value
    if 0 < value < RAM_LO:
        lname = name.lower()
        if any(tok in lname for tok in ADDR_TOKENS):
            return value + ROM_VMA_BASE
        return None
    return None


def load_us_symbols():
    """Return (exact: dict vma->name, sorted_addrs: list, addr_to_name: dict).

    exact prefers, for a given address, a global/text symbol over local/debug
    junk and the lexicographically smallest name for determinism.
    """
    out = subprocess.run(
        [NM, "-n", US_ELF], check=True, capture_output=True, text=True
    ).stdout
    by_addr = {}
    for line in out.splitlines():
        parts = line.split()
        if len(parts) < 3:
            continue
        addr_s, typ, name = parts[0], parts[1], parts[2]
        # Skip absolute/undefined and non-address symbols.
        if typ in ("U", "u", "a", "A", "N"):
            continue
        try:
            addr = int(addr_s, 16)
        except ValueError:
            continue
        if addr < ROM_VMA_BASE or addr >= ROM_VMA_END:
            continue
        # Prefer code/data globals (uppercase type) and deterministic names.
        prev = by_addr.get(addr)
        cand = (0 if typ.isupper() else 1, name)
        if prev is None or cand < prev[0]:
            by_addr[addr] = (cand, name)
    addr_to_name = {a: v[1] for a, v in by_addr.items()}
    sorted_addrs = sorted(addr_to_name)
    return addr_to_name, sorted_addrs


def nearest_symbol(us_vma, addr_to_name, sorted_addrs):
    """Greatest nm symbol <= us_vma, formatted ``Name+0xNN`` (or ``Name`` at 0)."""
    i = bisect_right(sorted_addrs, us_vma)
    if i == 0:
        return ""
    base = sorted_addrs[i - 1]
    name = addr_to_name[base]
    off = us_vma - base
    return name if off == 0 else f"{name}+0x{off:X}"


def ensure_us_rom():
    """Return path to a raw US ROM binary, building it from the ELF if needed."""
    if os.path.isfile(US_GBA):
        return US_GBA
    tmp = "/tmp/usrom.bin"
    subprocess.run(
        [OBJCOPY, "--strip-debug", "-O", "binary",
         "--pad-to", "0x9000000", "--gap-fill=0xff", US_ELF, tmp],
        check=True,
    )
    return tmp


def read_window(buf, vma):
    """Return WINDOW bytes at VMA from a ROM image, or None if out of range."""
    off = vma - ROM_VMA_BASE
    if off < 0 or off + WINDOW > len(buf):
        return None
    return buf[off:off + WINDOW]


def main():
    jp_hex, jp_dyn = parse_cs(JP_CS)
    us_hex, us_dyn = parse_cs(US_CS)

    addr_to_name, sorted_addrs = load_us_symbols()
    us_rom_path = ensure_us_rom()
    with open(us_rom_path, "rb") as f:
        us_rom = f.read()
    with open(JP_GBA, "rb") as f:
        jp_rom = f.read()

    rows = []
    skipped_dynamic = skipped_class = skipped_nojoin = 0

    # Iterate JP fields in file order for a stable, reviewable TSV.
    for name, (jp_val, jp_line) in sorted(jp_hex.items(), key=lambda kv: kv[1][1]):
        if name in jp_dyn:  # never happens (hex vs dynamic are disjoint), be safe
            skipped_dynamic += 1
            continue
        if name not in us_hex:
            skipped_nojoin += 1
            continue

        jp_vma = classify(name, jp_val)
        us_val, _ = us_hex[name]
        us_vma = classify(name, us_val)
        if jp_vma is None or us_vma is None:
            skipped_class += 1
            continue

        jw = read_window(jp_rom, jp_vma)
        uw = read_window(us_rom, us_vma)
        if jw is None or uw is None:
            region = "oob"  # at least one window outside the 16 MB image
        else:
            region = "same" if jw == uw else "diff"

        exact = addr_to_name.get(us_vma, "")
        nearest = nearest_symbol(us_vma, addr_to_name, sorted_addrs)
        rows.append((
            name, f"0x{jp_vma:08X}", f"0x{us_vma:08X}",
            region, exact, nearest, f"ROMFE8JP.cs:{jp_line}",
        ))

    # Skip the 9 FindROMPointer dynamic entries (handled by a separate unit).
    skipped_dynamic += len(jp_dyn)

    os.makedirs(os.path.dirname(OUT_TSV), exist_ok=True)
    with open(OUT_TSV, "w", encoding="utf-8") as out:
        out.write(
            "# US<->JP ROM-address map derived from FEBuilderGBA (GPL-3.0) ROM "
            "definitions: ROMFE8JP.cs / ROMFE8U.cs.\n"
            "# Factual addresses only; no copied code/text. Reference data only "
            "(not a build input).\n"
            "# Generated by scripts/extract_febuilder_map.py (deterministic).\n"
            "# region: byte comparison of a 32-byte window at jp_vma (baserom.gba) "
            "vs us_vma (US ROM); oob = window outside the 16 MB image.\n"
            "# name\tjp_vma\tus_vma\tregion\texact_symbol\tnearest_symbol_off\tsource\n"
        )
        for r in rows:
            out.write("\t".join(r) + "\n")

    counts = {}
    for r in rows:
        counts[r[3]] = counts.get(r[3], 0) + 1
    print(f"wrote {len(rows)} address rows -> {OUT_TSV}", file=sys.stderr)
    print(f"  region: {counts}", file=sys.stderr)
    print(f"  skipped: dynamic={skipped_dynamic} non-address(class)="
          f"{skipped_class} not-in-US={skipped_nojoin}", file=sys.stderr)


if __name__ == "__main__":
    main()
