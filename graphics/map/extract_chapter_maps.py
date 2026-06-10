#!/usr/bin/env python3
"""Chapter-map tileset/tilemap/palette extractor -- Phase-1.

asm/dat_const_data_chapter_maps_p{0..9}.s hold the per-chapter map graphics:
  ObjectType*          LZ77 tilesets        (.bin -> .bin.lz)
  TileConfiguration*   LZ77 tile-config     (.bin -> .bin.lz)
  *Map / *MapPast      LZ77 tilemap layout  (.bin -> .bin.lz)
  *Palette / MapPalette*  uncompressed gbapal (.pal -> .gbapal)

These are REGION-DIFFERENT from US (the JP decompressed tilesets differ in both
bytes and size -- e.g. ObjectType8 is 1019 tiles vs US 1024), so they cannot be
ported from fireemblem8u. We extract them FRESH from the JP ROM: decompress each
LZ blob and commit it as a descriptively-named raw `.bin` (the Makefile's generic
`%.lz: %` gbagfx rule recompresses it byte-identically); commit uncompressed
palettes as a JASC `.pal` and rebuild `.pal -> .gbapal`. PNG is NOT used because
the JP tilesets are non-rectangular tile counts that gbagfx would pad, changing
the bytes. The committed `.bin`/`.pal` rebuild the exact JP ROM bytes with
baserom removed.

The only oracle is byte-exactness (recompress == ROM blob). Each p*.s -> its own
.o; all object deps + non-default -mindist pins accumulate into graphics/map/map.mk.

Usage:
  graphics/map/extract_chapter_maps.py            # dry-run / verify
  graphics/map/extract_chapter_maps.py --apply    # commit + rewrite + write map.mk
"""
import glob
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "_lib"))
import extract_lz_blobs as lib  # noqa: E402

OUT_DIR = "graphics/map"

# category (by symbol regex, ordered) -> (committed source ext, incbin target ext)
SUFFIX_MAP = [
    (r"Palette", (".pal", ".gbapal")),          # uncompressed palette
    (r"ObjectType", (".bin", ".bin.lz")),       # incl. TowerOfValniObjectType
    (r"TileConfiguration", (".bin", ".bin.lz")),
    (r"Map", (".bin", ".bin.lz")),              # any *Map* tilemap layout
]


def main():
    apply = "--apply" in sys.argv
    files = sorted(glob.glob(os.path.join(lib.REPO, "asm/dat_const_data_chapter_maps_p*.s")))
    all_deps = []
    all_pins = {}
    tot = dict(total=0, ok=0, skip=0, fail=0)

    for asm_abs in files:
        asm = os.path.relpath(asm_abs, lib.REPO)
        obj = "asm/" + os.path.splitext(os.path.basename(asm))[0] + ".o"
        deps, pins, st = run_one(asm, obj, apply)
        all_deps.append((obj, deps))
        all_pins.update(pins)
        for k in tot:
            tot[k] += st[k]

    print(f"\nchapter_maps TOTAL: total={tot['total']} ok={tot['ok']} "
          f"skip(non-gfx)={tot['skip']} fail(left-incbin)={tot['fail']}")

    if apply:
        write_map_mk(all_deps, all_pins)
        print(f"wrote {OUT_DIR}/map.mk "
              f"({sum(1 for _, d in all_deps if d)} objects, {len(all_pins)} pins)")
    else:
        print("(dry-run; pass --apply to commit + rewrite + write map.mk)")


def run_one(asm, obj, apply):
    """Like lib.run_subsystem but returns deps/pins instead of writing the .mk."""
    rom = open(os.path.join(lib.REPO, "baserom.gba"), "rb").read()
    asm_path = os.path.join(lib.REPO, asm)
    text = open(asm_path).read()
    lines = text.splitlines()
    entries = lib.parse_entries(text)
    st = dict(total=len(entries), ok=0, skip=0, fail=0)
    deps = []
    pins = {}
    commits = {}

    for names, indent, off, size, ln in entries:
        sym, src_ext, lz_ext = lib.classify(names, SUFFIX_MAP)
        if sym is None:
            st["skip"] += 1
            continue
        blob = rom[off : off + size]
        stem = sym

        if lz_ext == ".gbapal":  # raw palette
            pal_bytes = lib.gbapal_to_pal(blob)
            if lib.pal_to_gbapal(pal_bytes) != blob:
                st["fail"] += 1
                print(f"  RAWPAL_NO_MATCH {sym} @ {off:#x}")
                continue
            inc_rel = f"{OUT_DIR}/{stem}{lz_ext}"
            st["ok"] += 1
            if apply:
                commits[os.path.join(lib.REPO, f"{OUT_DIR}/{stem}{src_ext}")] = pal_bytes
                lines[ln] = f'{indent}.incbin "{inc_rel}"'
                deps.append(inc_rel)
            continue

        if not blob or blob[0] != 0x10:
            st["fail"] += 1
            print(f"  NOT_LZ {sym} @ {off:#x} ({size:#x})")
            continue
        raw = lib.lz_decompress(blob)
        mindist = None
        for md in (2, 1, 3):
            if lib.lz_compress(raw, md) == blob:
                mindist = md
                break
        if mindist is None:
            st["fail"] += 1
            print(f"  LZ_NO_MATCH {sym} @ {off:#x}")
            continue
        inc_rel = f"{OUT_DIR}/{stem}{lz_ext}"
        st["ok"] += 1
        if apply:
            commits[os.path.join(lib.REPO, f"{OUT_DIR}/{stem}{src_ext}")] = raw
            lines[ln] = f'{indent}.incbin "{inc_rel}"'
            deps.append(inc_rel)
            if mindist != 2:
                pins[inc_rel] = mindist

    print(f"{asm}: ok={st['ok']} fail={st['fail']}")
    if apply and st["ok"]:
        with open(asm_path, "w") as f:
            f.write("\n".join(lines) + "\n")
        for dst, data in commits.items():
            os.makedirs(os.path.dirname(dst), exist_ok=True)
            open(dst, "wb").write(data)
    return deps, pins, st


def write_map_mk(all_deps, all_pins):
    mk = os.path.join(lib.REPO, OUT_DIR, "map.mk")
    out = [
        "# graphics/map -- chapter map tilesets/tilemaps/palettes, extracted FRESH",
        "# from the JP ROM (region-DIFFERENT from US). dat_const_data_chapter_maps_p*.s:",
        "# ObjectType*/TileConfiguration*/*Map LZ77 blobs commit the DECOMPRESSED .bin",
        "# (Makefile %.lz: % recompresses byte-identical); *Palette* uncompressed gbapal",
        "# commits a JASC .pal (-> .gbapal). Auto-generated by",
        "# graphics/map/extract_chapter_maps.py.",
        "",
    ]
    for obj, deps in all_deps:
        deps = sorted(set(deps))
        if not deps:
            continue
        out.append(f"{obj}: \\")
        for i, d in enumerate(deps):
            out.append(f"  {d}{'' if i == len(deps) - 1 else ' \\'}")
        out.append("")
    if all_pins:
        out.append("# non-default -mindist pins (gbagfx default is 2):")
        for inc in sorted(all_pins):
            out.append(f"{inc}: LZ_FLAGS := -mindist {all_pins[inc]}")
        out.append("")
    with open(mk, "w") as f:
        f.write("\n".join(out) + "\n")


if __name__ == "__main__":
    main()
