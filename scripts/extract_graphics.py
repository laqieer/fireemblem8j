#!/usr/bin/env python3
"""Phase-1 graphics extractor: replace `.incbin "baserom.gba"` with COMMITTED assets.

The real decomp goal (docs/decomp-completion-standard.md) is to reproduce the ROM
byte-for-byte from COMMITTED SOURCE with `baserom.gba` REMOVED. Today ~83% of the
ROM is `.incbin "baserom.gba"`. This script removes that dependence for a graphics
region by replacing each `.incbin "baserom.gba", off, size` with an `.incbin` of an
EXTRACTED, descriptively-named, committed source asset (PNG -> 4bpp[/.lz] via gbagfx,
or a committed `.agbpal`/`.gbapal` palette / `.bin` tilemap).

STRATEGY -- leverage the sibling US decomp (fireemblem8u), which already has EVERY
graphic extracted (3,434 PNG, palettes, tilemaps) under descriptive names:

  REGION-SAME  (JP bytes == US bytes): the JP asset IS the US asset. Port the US
               committed source (PNG / .agbpal / .bin) by symbol name; for a PNG,
               gbagfx re-encodes it to the exact 4bpp[/.lz] the ROM contains.
  REGION-DIFF  (JP bytes != US): the US PNG won't reproduce the JP bytes. Reported
               and LEFT as incbin for fresh extraction (decompress -> commit fresh
               PNG -> tune -mindist) -- never committed if it doesn't byte-match.

The ONLY oracle is the byte-exactness check: for every entry, the asset rebuilt
through the SAME pipeline the Makefile uses (gbagfx PNG->4bpp, optional LZ at the
pinned -mindist; or the committed palette/tilemap bytes verbatim) MUST equal the
original ROM bytes. Entries that fail are reported and left untouched. The caller
then runs `make compare` (and `make clean && make compare`) as the final gate.

This is the SCALED, REUSABLE pattern for the Phase-1 data grind: point it at a
`dat_*.s` graphics file, give it the matching US graphics dir, and it ports +
rewrites + verifies the whole region, printing the per-asset -mindist pins to add
to the Makefile.

Usage:
  scripts/extract_graphics.py --asm asm/dat_data_item_icon.s \
      --us-dir graphics/item_icon [--out-dir graphics/item_icon] [--apply]

  --asm      the JP `.s` whose baserom incbins are graphics for ONE subsystem
  --us-dir   the matching US graphics dir (relative to the US repo root)
  --out-dir  where committed assets land in THIS repo (default: same as --us-dir)
  --apply    actually write assets + rewrite the .s (default: dry-run / verify only)
  --us       path to the US decomp (default: $FE8U or ../fireemblem8u)

Per-entry asset-format inference (matches the US `data_*.c` INCBIN extension):
  US has <name>.agbpal/.gbapal -> palette (committed binary, verbatim)
  US has <name>.png            -> 4bpp tiles (gbagfx PNG->4bpp; +LZ if needed)
  US has <name>.map.bin/.bin   -> tilemap (committed binary, verbatim)

Exit 0 if every entry byte-matches (region fully extractable); 1 otherwise.
"""
import argparse
import os
import re
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
GBAGFX = os.path.join(ROOT, "tools", "gbagfx", "gbagfx")

INCBIN_RE = re.compile(
    r'^\s*\.incbin\s+"baserom\.gba"\s*,\s*(0x[0-9A-Fa-f]+)\s*,\s*(0x[0-9A-Fa-f]+)'
)
GLOBAL_RE = re.compile(r"^\s*\.global\s+(\S+)")


def us_root(arg):
    if arg:
        return os.path.abspath(arg)
    env = os.environ.get("FE8U")
    if env and os.path.isdir(env):
        return os.path.abspath(env)
    for cand in (os.path.join(ROOT, "..", "fireemblem8u"), "/home/laqieer/fireemblem8u"):
        if os.path.isdir(cand):
            return os.path.abspath(cand)
    sys.exit("error: cannot locate fireemblem8u (set FE8U or pass --us)")


def gbagfx(args):
    subprocess.run([GBAGFX, *args], check=True, capture_output=True)


def png_to_4bpp(png):
    """gbagfx-encode a PNG to raw 4bpp bytes (the Makefile's `%.4bpp: %.png` rule)."""
    fd, tmp = tempfile.mkstemp(suffix=".4bpp")
    os.close(fd)
    try:
        gbagfx([png, tmp])
        return open(tmp, "rb").read()
    finally:
        os.unlink(tmp)


def lz_compress(raw, mindist):
    """gbagfx-LZ-compress raw bytes at a given -mindist (the `%.lz: %` rule)."""
    fd, src = tempfile.mkstemp(suffix=".bin")
    os.close(fd)
    fd, dst = tempfile.mkstemp(suffix=".lz")
    os.close(fd)
    try:
        open(src, "wb").write(raw)
        gbagfx([src, dst, "-mindist", str(mindist)])
        return open(dst, "rb").read()
    finally:
        os.unlink(src)
        os.unlink(dst)


def fk_wrap(raw):
    """FE "fake-compression" (.fk) wrapper -- the `%.fk: %` rule via scripts/compressor.py.

    A 4-byte LE header `(len(raw)+4) << 8` (i.e. total-size<<8, low byte = comp-type 0
    meaning "uncompressed") followed by the raw bytes verbatim. The ROM marks portrait
    tilesets (and similar graphics) as compressed but stores them raw under this header.
    """
    import struct

    return struct.pack("<I", (len(raw) + 4) << 8) + raw


def parse_entries(asm_text):
    """List of (names[list], off, size, line_index) for each baserom incbin, with the
    .global labels that immediately precede it (the symbol names the C uses)."""
    entries = []
    pending = []
    for i, line in enumerate(asm_text.splitlines()):
        m = GLOBAL_RE.match(line)
        if m:
            pending.append(m.group(1))
            continue
        m = INCBIN_RE.match(line)
        if m:
            entries.append((pending, int(m.group(1), 16), int(m.group(2), 16), i))
            pending = []
    return entries


def classify(names, us_dir):
    """(kind, us_path) for the first US asset that matches a name. kind in
    {palette, tiles, tilemap}; None if no US asset exists for any name."""
    for nm in names:
        for ext, kind in (
            (".agbpal", "palette"),
            (".gbapal", "palette"),
            (".png", "tiles"),
            (".map.bin", "tilemap"),
            (".bin", "tilemap"),
        ):
            p = os.path.join(us_dir, nm + ext)
            if os.path.exists(p):
                return (kind, p)
    return (None, None)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--asm", required=True)
    ap.add_argument("--us-dir", required=True, help="US graphics dir, relative to US root")
    ap.add_argument("--out-dir", default=None, help="this-repo dir for committed assets")
    ap.add_argument("--apply", action="store_true")
    ap.add_argument("--us", default=None)
    args = ap.parse_args()

    usroot = us_root(args.us)
    us_dir = os.path.join(usroot, args.us_dir)
    if not os.path.isdir(us_dir):
        sys.exit(f"error: US graphics dir not found: {us_dir}")
    out_dir = os.path.join(ROOT, args.out_dir or args.us_dir)
    rel_out = os.path.relpath(out_dir, ROOT)

    asm_path = os.path.join(ROOT, args.asm)
    asm_text = open(asm_path).read()
    rom = open(os.path.join(ROOT, "baserom.gba"), "rb").read()

    entries = parse_entries(asm_text)
    print(f"{args.asm}: {len(entries)} baserom incbin entries")

    # plan[line_index] = (incbin_path, src_us_path, mindist_or_None)
    plan = {}
    ok = diff = nous = 0
    pins = []
    for names, off, size, ln in entries:
        jp = rom[off : off + size]
        kind, us_path = classify(names, us_dir)
        if kind is None:
            print(f"  NO_US_ASSET  {names} @ {off:#x} ({size:#x}) -- left as incbin")
            nous += 1
            continue
        base = os.path.basename(us_path)
        stem = base[: -len(".map.bin")] if base.endswith(".map.bin") else os.path.splitext(base)[0]
        if kind in ("palette", "tilemap"):
            reb = open(us_path, "rb").read()
            if reb == jp:
                plan[ln] = (f"{rel_out}/{base}", us_path, None)
                ok += 1
            else:
                print(f"  REGION_DIFF  {names[0]} @ {off:#x} ({size:#x}) [{kind}] -- left as incbin")
                diff += 1
            continue
        # tiles: try uncompressed 4bpp, then .fk (raw under a fake-comp header),
        # then LZ at mindist 1/2/3. The committed source is always the PNG; the
        # .4bpp / .4bpp.fk / .4bpp.lz is the Makefile-generated incbin target.
        raw = png_to_4bpp(us_path)
        if raw == jp:
            plan[ln] = (f"{rel_out}/{stem}.4bpp", us_path, None)
            ok += 1
            continue
        if fk_wrap(raw) == jp:
            plan[ln] = (f"{rel_out}/{stem}.4bpp.fk", us_path, None)
            ok += 1
            continue
        matched = False
        for md in (1, 2, 3):
            if lz_compress(raw, md) == jp:
                inc = f"{rel_out}/{stem}.4bpp.lz"
                plan[ln] = (inc, us_path, md)
                pins.append((inc, md))
                ok += 1
                matched = True
                break
        if not matched:
            print(f"  REGION_DIFF  {names[0]} @ {off:#x} ({size:#x}) [tiles] -- left as incbin")
            diff += 1

    print(f"  byte-match OK: {ok}   region-diff: {diff}   no-US-asset: {nous}")

    if not args.apply:
        print("  (dry-run; pass --apply to commit assets + rewrite the .s)")
        return 0 if diff == 0 and nous == 0 else 1

    # --- apply: copy US source assets in, rewrite the .s -------------------------
    os.makedirs(out_dir, exist_ok=True)
    lines = asm_text.splitlines()
    for ln, (incpath, us_path, _md) in plan.items():
        dst = os.path.join(out_dir, os.path.basename(us_path))
        if not os.path.exists(dst):
            with open(us_path, "rb") as f:
                data = f.read()
            with open(dst, "wb") as f:
                f.write(data)
        lines[ln] = f'\t.incbin "{incpath}"'
    with open(asm_path, "w") as f:
        f.write("\n".join(lines) + "\n")

    print(f"  rewrote {len(plan)} incbins in {args.asm} -> committed assets in {rel_out}/")
    if pins:
        print("  ADD THESE -mindist PINS to the Makefile (one per LZ asset):")
        for inc, md in pins:
            print(f"    {inc}: LZ_FLAGS := -mindist {md}")
    else:
        print("  (no LZ assets in this region -- uncompressed 4bpp / palettes only)")
    return 0 if diff == 0 and nous == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
