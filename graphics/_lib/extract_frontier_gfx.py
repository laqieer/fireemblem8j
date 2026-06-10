#!/usr/bin/env python3
"""Generic byte-typed graphics extractor for table-pinned / unnamed blob files.

Several FE8J `.s` files are flat lists of `.global Sym` + `.incbin "baserom.gba",
off, size` where the blobs are GRAPHICS (LZ77 tiles/tilemaps, raw 4bpp tile
sheets, palettes) but the symbols carry NO descriptive type suffix -- they are
auto-generated `frontier_<x>_NNN_OFFSET` / `gfx_data_bg_NNN_<name>` labels for
region-DIFFERENT gaps the code-literal carver could not name (see
asm/gfx_data_bg.s, asm/frontier_*.s). The US PNG won't reproduce the JP bytes
(region-different), so we extract FRESH from the JP ROM and the asset TYPE is
inferred from the BYTES, not the symbol name:

  LZ77 (first byte 0x10)         -> commit the DECOMPRESSED `.bin`; the Makefile
                                    `%.lz: %` rule (gbagfx) recompresses it at the
                                    pinned -mindist byte-identical to the ROM blob.
  raw palette (size 0x20/0x40/   -> commit a JASC `.pal`; the `%.gbapal: %.pal`
   0x100/0x200, gbapal round-trip)  rule rebuilds it (round-trip is byte-exact).
  any other raw blob             -> commit the bytes VERBATIM as `.bin`, incbin'd
                                    directly (no build step; still baserom-free).

The ONLY oracle is byte-exactness: every committed source, rebuilt through the
SAME pipeline the Makefile uses, MUST equal the original JP ROM blob. An entry
that does not round-trip is reported and LEFT as `.incbin "baserom.gba"` (honest).
Verbatim `.bin` always round-trips (it is the bytes themselves), so this driver
removes the baserom dependence for the WHOLE region while never emitting a byte
that differs from the ROM.

A per-subsystem driver calls run_file(asm, out_dir, name_prefix, ...). It rewrites
the incbins, commits the sources, and writes the subsystem `.mk` (object deps +
non-default -mindist pins). Idempotent: only `.incbin "baserom.gba"` lines are
touched, so re-running after a partial extraction is safe.
"""
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import extract_lz_blobs as lib  # noqa: E402

# raw palette sizes (bytes): 16/32/256/512 colors at 2 bytes/color
_PAL_SIZES = {0x20, 0x40, 0x100, 0x200}


def _stem_for(names, off, name_prefix, idx):
    """Descriptive committed-source stem from the blob's `.global` label(s).

    The frontier labels already encode a unique address (e.g.
    `frontier_chap_title_017_A7F2A4`); reuse that so the asset name is stable and
    descriptive. Falls back to `<name_prefix>_<idx>_<off>` if no label is present.
    """
    if names:
        return names[0]
    return f"{name_prefix}_{idx:03d}_{off:06X}"


def run_file(asm, out_dir, name_prefix, header, apply=False, mk_name=None):
    rom = open(os.path.join(lib.REPO, "baserom.gba"), "rb").read()
    asm_path = os.path.join(lib.REPO, asm)
    text = open(asm_path).read()
    lines = text.splitlines()
    entries = lib.parse_entries(text)
    obj = "asm/" + os.path.splitext(os.path.basename(asm))[0] + ".o"

    st = dict(total=len(entries), lz=0, pal=0, raw=0, fail=0)
    deps = []
    pins = {}
    commits = {}  # abspath -> bytes

    for idx, (names, indent, off, size, ln) in enumerate(entries):
        blob = rom[off : off + size]
        stem = _stem_for(names, off, name_prefix, idx)

        # 1) LZ77 tiles/tilemap -> commit decompressed .bin, recompress via %.lz: %
        if blob and blob[0] == 0x10:
            try:
                raw = lib.lz_decompress(blob)
            except Exception:
                raw = None
            mindist = None
            if raw is not None:
                for md in (2, 1, 3):
                    if lib.lz_compress(raw, md) == blob:
                        mindist = md
                        break
            if mindist is not None:
                inc_rel = f"{out_dir}/{stem}.bin.lz"
                st["lz"] += 1
                if apply:
                    commits[os.path.join(lib.REPO, f"{out_dir}/{stem}.bin")] = raw
                    lines[ln] = f'{indent}.incbin "{inc_rel}"'
                    deps.append(inc_rel)
                    if mindist != 2:
                        pins[inc_rel] = mindist
                continue
            # LZ header but doesn't round-trip: fall through to verbatim .bin below.

        # 2) raw palette -> commit JASC .pal, rebuild via %.gbapal: %.pal
        if size in _PAL_SIZES:
            try:
                pal_bytes = lib.gbapal_to_pal(blob)
                ok = lib.pal_to_gbapal(pal_bytes) == blob
            except Exception:
                ok = False
            if ok:
                inc_rel = f"{out_dir}/{stem}.gbapal"
                st["pal"] += 1
                if apply:
                    commits[os.path.join(lib.REPO, f"{out_dir}/{stem}.pal")] = pal_bytes
                    lines[ln] = f'{indent}.incbin "{inc_rel}"'
                    deps.append(inc_rel)
                continue
            # palette round-trip lost bits (bit-15 colors) -> verbatim .bin below.

        # 3) verbatim raw blob -> commit .bin, incbin directly (no build rule).
        inc_rel = f"{out_dir}/{stem}.bin"
        st["raw"] += 1
        if apply:
            commits[os.path.join(lib.REPO, inc_rel)] = blob
            lines[ln] = f'{indent}.incbin "{inc_rel}"'

    if apply and (st["lz"] or st["pal"] or st["raw"]):
        with open(asm_path, "w") as f:
            f.write("\n".join(lines) + "\n")
        for dst, data in commits.items():
            os.makedirs(os.path.dirname(dst), exist_ok=True)
            open(dst, "wb").write(data)
        _write_mk(out_dir, mk_name or (os.path.basename(out_dir) + ".mk"),
                  obj, deps, pins, header)

    print(f"{asm}: total={st['total']} lz={st['lz']} pal={st['pal']} "
          f"raw-verbatim={st['raw']} left-incbin={st['fail']}")
    return st


def _write_mk(out_dir, mk_name, obj, deps, pins, header):
    mk = os.path.join(lib.REPO, out_dir, mk_name)
    out = [f"# {l}" for l in header.splitlines()] + [""]
    deps = sorted(set(deps))
    if deps:
        out.append(f"{obj}: \\")
        for i, d in enumerate(deps):
            out.append(f"  {d}{'' if i == len(deps) - 1 else ' \\'}")
        out.append("")
    if pins:
        out.append("# non-default -mindist pins (gbagfx default is 2):")
        for inc in sorted(pins):
            out.append(f"{inc}: LZ_FLAGS := -mindist {pins[inc]}")
        out.append("")
    with open(mk, "w") as f:
        f.write("\n".join(out) + "\n")
