#!/usr/bin/env python3
"""gmapunit graphics-symbol extractor -- Phase-1.

The 259 asm/dat_worldmap_gmapunit_p*.s files are an address-page carve, NOT a
subsystem: each holds a grab-bag of symbols from many regions (battle-anim
sprite data tables, unit defs, event scripts, song data, ...) INTERLEAVED with
real graphics blobs. This driver extracts ONLY the graphics-prefixed symbols
(Img_ / Tsa_ / TSA_ / Pal_ / gImg_ / gPal_ / gGfx_ / Gfx_) and LEAVES every
non-graphics symbol as `.incbin "baserom.gba"` (honest -- those belong to later
data-table / code phases).

Each graphics blob is extracted FRESH from the JP ROM (region-agnostic):
  LZ77 tiles/tilemap   -> commit DECOMPRESSED .bin, Makefile %.lz: % recompresses
  uncompressed palette -> commit JASC .pal, Makefile %.gbapal: %.pal rebuilds
  uncompressed binary  -> commit verbatim .bin, incbin'd directly (no build step)

The only oracle is byte-exactness (recompress / rebuild == ROM blob). Any blob
that fails (e.g. a "Pal_"-named struct that isn't a real palette) is reported and
left as incbin. Per-object deps + non-default -mindist pins accumulate into
graphics/gmapunit/gmapunit.mk.

Usage:
  graphics/gmapunit/extract_gmapunit_gfx.py            # dry-run / verify
  graphics/gmapunit/extract_gmapunit_gfx.py --apply    # commit + rewrite + .mk
"""
import glob
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "_lib"))
import extract_lz_blobs as lib  # noqa: E402

OUT_DIR = "graphics/gmapunit"
GFX_RE = re.compile(r"^(Img_|Tsa_|TSA\d?_|Pal\d?_|gImg_|gPal_|gGfx_|Gfx_)")
PAL_RE = re.compile(r"^(Pal\d?_|gPal_)")


def main():
    apply = "--apply" in sys.argv
    files = sorted(glob.glob(os.path.join(lib.REPO, "asm/dat_worldmap_gmapunit_p*.s")))
    all_deps = []
    all_pins = {}
    tot = dict(ok=0, fail=0, skip=0)

    for asm_abs in files:
        asm = os.path.relpath(asm_abs, lib.REPO)
        obj = "asm/" + os.path.splitext(os.path.basename(asm))[0] + ".o"
        deps, pins, st = run_one(asm, obj, apply)
        if deps:
            all_deps.append((obj, deps))
        all_pins.update(pins)
        for k in tot:
            tot[k] += st[k]

    print(f"\ngmapunit-gfx TOTAL: ok={tot['ok']} fail(left-incbin)={tot['fail']} "
          f"non-gfx(left-incbin)={tot['skip']}")
    if apply:
        write_mk(all_deps, all_pins)
        print(f"wrote {OUT_DIR}/gmapunit.mk "
              f"({len(all_deps)} objects, {len(all_pins)} pins)")
    else:
        print("(dry-run; pass --apply)")


def run_one(asm, obj, apply):
    rom = open(os.path.join(lib.REPO, "baserom.gba"), "rb").read()
    asm_path = os.path.join(lib.REPO, asm)
    lines = open(asm_path).read().splitlines()
    entries = lib.parse_entries(open(asm_path).read())
    st = dict(ok=0, fail=0, skip=0)
    deps = []
    pins = {}
    commits = {}

    for names, indent, off, size, ln in entries:
        sym = next((n for n in names if GFX_RE.match(n)), None)
        if sym is None:
            st["skip"] += 1
            continue
        blob = rom[off : off + size]

        if PAL_RE.match(sym):  # uncompressed palette
            try:
                pal_bytes = lib.gbapal_to_pal(blob)
                ok = lib.pal_to_gbapal(pal_bytes) == blob
            except Exception:
                ok = False
            if not ok:
                st["fail"] += 1
                print(f"  PAL_FAIL {sym} @ {off:#x} ({size:#x}) -- left as incbin")
                continue
            inc_rel = f"{OUT_DIR}/{sym}.gbapal"
            st["ok"] += 1
            if apply:
                commits[os.path.join(lib.REPO, f"{OUT_DIR}/{sym}.pal")] = pal_bytes
                lines[ln] = f'{indent}.incbin "{inc_rel}"'
                deps.append(inc_rel)
            continue

        if blob and blob[0] == 0x10:  # LZ77 tiles/tilemap
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
            if mindist is None:
                st["fail"] += 1
                print(f"  LZ_FAIL {sym} @ {off:#x} ({size:#x}) -- left as incbin")
                continue
            inc_rel = f"{OUT_DIR}/{sym}.bin.lz"
            st["ok"] += 1
            if apply:
                commits[os.path.join(lib.REPO, f"{OUT_DIR}/{sym}.bin")] = raw
                lines[ln] = f'{indent}.incbin "{inc_rel}"'
                deps.append(inc_rel)
                if mindist != 2:
                    pins[inc_rel] = mindist
            continue

        # uncompressed verbatim binary (raw tiles / tilemap) -> commit .bin, incbin
        # it directly (the bytes ARE the source; no build step).
        inc_rel = f"{OUT_DIR}/{sym}.bin"
        st["ok"] += 1
        if apply:
            commits[os.path.join(lib.REPO, inc_rel)] = blob
            lines[ln] = f'{indent}.incbin "{inc_rel}"'
            # not a generated target -> not added as an object dep (already tracked)
        # (verbatim .bin needs no Makefile rule; it is committed source itself)

    if apply and (st["ok"]):
        with open(asm_path, "w") as f:
            f.write("\n".join(lines) + "\n")
        for dst, data in commits.items():
            os.makedirs(os.path.dirname(dst), exist_ok=True)
            open(dst, "wb").write(data)
    if st["ok"] or st["fail"]:
        print(f"{asm}: ok={st['ok']} fail={st['fail']}")
    return deps, pins, st


def write_mk(all_deps, all_pins):
    mk = os.path.join(lib.REPO, OUT_DIR, "gmapunit.mk")
    out = [
        "# graphics/gmapunit -- graphics blobs carved out of the dat_worldmap_gmapunit_p*",
        "# address-page files (which are mostly NON-graphics data tables left as incbin).",
        "# LZ77 tiles/tilemaps commit the DECOMPRESSED .bin (Makefile %.lz: % recompresses",
        "# byte-identical); uncompressed palettes commit a JASC .pal (-> .gbapal).",
        "# Verbatim uncompressed .bin blobs are committed source themselves (no rule, no",
        "# dep line). Auto-generated by graphics/gmapunit/extract_gmapunit_gfx.py.",
        "",
    ]
    for obj, deps in all_deps:
        deps = sorted(set(deps))
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
