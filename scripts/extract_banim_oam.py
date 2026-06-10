#!/usr/bin/env python3
"""Extract FE8J's banim OAM / AnimSprite / motion / modes DATA to committed `.bin`.

The banim battle-animation data files (`asm/data_banim.s`,
`asm/dat_banim_ekrdragonfx_*.s`, `asm/dat_banim_ekrskill_*.s`) had their graphics
SHEETS already extracted to committed `graphics/banim/*.png` + `.agbpal`, but the
per-animation DATA blobs the first banim batches honestly LEFT as
`.incbin "baserom.gba"`:

  * `*_oam_l_bin` / `*_oam_r_bin`  -- LZ-compressed AnimSprite OAM frame data
  * `*_motion_o`                   -- LZ-compressed motion script
  * `*_modes_bin`                  -- uncompressed mode/offset table
  * `AnimSprite_*`                 -- per-frame OAM data tables
  * `Img_*` / `Tsa_*` / `Pal_*`    -- (in the ekr files) residual LZ/raw asset blobs

Each is region-DIFFERENT (JP-specific sprites/timing) and most are LZ-compressed
opaque blobs. The fireemblem8u model for opaque, region-specific data is to commit
a descriptively-NAMED binary and `.incbin` THAT (never the ROM). So this script:

  1. Reads each `.incbin "baserom.gba", <off>, <size>` blob from baserom.gba.
  2. Writes it to a COMMITTED `data/banim/<symbol>.bin` (the symbol's own name).
  3. Rewrites the directive to `.incbin "data/banim/<symbol>.bin"`.

This is byte-identical BY CONSTRUCTION (the committed `.bin` is exactly the JP
bytes), removes `baserom.gba` from the build graph for these directives, and keeps
every symbol named. `make compare` is the oracle.

Run from the repo root with baserom.gba present. The `.bin` files are COMMITTED
source (self-contained); only `baserom.gba` is removed from the build graph.
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)

BASEROM = os.path.join(ROOT, "baserom.gba")
OUT_DIR = os.path.join(ROOT, "data", "banim")

TARGETS = (
    ["asm/data_banim.s"]
    + sorted(
        f"asm/{n}"
        for n in os.listdir(os.path.join(ROOT, "asm"))
        if (n.startswith("dat_banim_ekrdragonfx_") or n.startswith("dat_banim_ekrskill_"))
        and n.endswith(".s")
    )
)

# Match a `NAME:` label, then (the next non-blank source lines) a
# `.incbin "baserom.gba", <off>, <size>`. We track the most recent label so each
# baserom blob is named by the symbol that owns it.
LABEL_RE = re.compile(r"^([A-Za-z_][A-Za-z0-9_]*):\s*$")
INCBIN_RE = re.compile(
    r'^(\s*)\.incbin\s+"baserom\.gba"\s*,\s*'
    r'(0x[0-9A-Fa-f]+|\d+)\s*,\s*'
    r'(0x[0-9A-Fa-f]+|\d+)\s*$'
)


def parse_int(tok):
    return int(tok, 16) if tok.lower().startswith("0x") else int(tok)


def main():
    if not os.path.isfile(BASEROM):
        sys.exit("baserom.gba not found (needed once to extract the committed bytes)")
    rom = open(BASEROM, "rb").read()
    os.makedirs(OUT_DIR, exist_ok=True)

    grand_files = 0
    grand_bytes = 0
    used_names = {}

    for relpath in TARGETS:
        path = os.path.join(ROOT, relpath)
        lines = open(path, "r", encoding="utf-8").read().splitlines(keepends=True)
        out = []
        cur_label = None
        n_files = 0
        n_bytes = 0
        for line in lines:
            stripped = line.rstrip("\n")
            m_lab = LABEL_RE.match(stripped)
            if m_lab:
                cur_label = m_lab.group(1)
                out.append(line)
                continue
            m_inc = INCBIN_RE.match(stripped)
            if not m_inc:
                out.append(line)
                continue
            # A baserom incbin -- carve it to a committed .bin named by its label.
            indent, off_tok, size_tok = m_inc.groups()
            off = parse_int(off_tok)
            size = parse_int(size_tok)
            if cur_label is None:
                sys.exit(f"{relpath}: baserom incbin with no preceding label near: {stripped}")
            name = cur_label
            # Guard against a duplicate symbol name across files (would clobber a .bin).
            if name in used_names and used_names[name] != relpath:
                sys.exit(
                    f"symbol {name} appears in both {used_names[name]} and {relpath}; "
                    f"would collide on data/banim/{name}.bin"
                )
            used_names[name] = relpath
            blob = rom[off:off + size]
            if len(blob) != size:
                sys.exit(f"{relpath}: {name} range 0x{off:X}+0x{size:X} runs past ROM end")
            bin_rel = f"data/banim/{name}.bin"
            with open(os.path.join(ROOT, bin_rel), "wb") as fh:
                fh.write(blob)
            out.append(f'{indent}.incbin "{bin_rel}"\n')
            n_files += 1
            n_bytes += size
            cur_label = None  # consumed
        with open(path, "w", encoding="utf-8") as fh:
            fh.write("".join(out))
        print(f"{relpath}: {n_files} blobs -> data/banim/*.bin ({n_bytes} bytes)")
        grand_files += n_files
        grand_bytes += n_bytes

    print(f"\nTOTAL: {grand_files} committed .bin, {grand_bytes} bytes "
          f"({grand_bytes / 1024:.1f} KB) removed from baserom dependence")


if __name__ == "__main__":
    main()
