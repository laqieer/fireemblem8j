#!/usr/bin/env python3
"""Generic mixed-file graphics extractor (driver helper).

Many FE8J `dat_*.s` files interleave real graphics blobs (Img_/Tsa_/Pal_/gImg_/
gPal_/gGfx_/Gfx_) with non-graphics data. This helper extracts ONLY the
graphics-prefixed symbols across a set of `.s` files and leaves everything else
as `.incbin "baserom.gba"` (honest). Each graphics blob is extracted FRESH from
the JP ROM (region-agnostic) and byte-verified:

  LZ77 tiles/tilemap   -> commit DECOMPRESSED .bin, Makefile %.lz: % recompresses
  uncompressed palette -> commit JASC .pal, Makefile %.gbapal: %.pal rebuilds
  uncompressed binary  -> commit verbatim .bin, incbin'd directly (no rule)

A per-subsystem driver calls run(out_dir, mk_name, globs, header). Returns stats.
Only `.incbin "baserom.gba"` entries are touched, so it is idempotent and safe to
re-run / run after a partial extraction.
"""
import glob
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import extract_lz_blobs as lib  # noqa: E402

GFX_RE = re.compile(r"^(Img_|Tsa_|TSA\d?_|Pal\d?_|gImg_|gPal_|gGfx_|Gfx_)")
PAL_RE = re.compile(r"^(Pal\d?_|gPal_)")


def run(out_dir, mk_name, globs, header, apply=False, extra_pal_syms=()):
    """extra_pal_syms: exact symbol names that are palettes despite a non-Pal prefix
    (e.g. unit_icon_pal_enemy). They are tried as uncompressed gbapal."""
    rom = open(os.path.join(lib.REPO, "baserom.gba"), "rb").read()
    files = []
    for g in globs:
        files += glob.glob(os.path.join(lib.REPO, g))
    files = sorted(set(files))
    all_deps = []
    all_pins = {}
    tot = dict(ok=0, fail=0, skip=0)

    for asm_abs in files:
        asm = os.path.relpath(asm_abs, lib.REPO)
        obj = "asm/" + os.path.splitext(os.path.basename(asm))[0] + ".o"
        deps, pins, st = _one(rom, asm, out_dir, apply, extra_pal_syms)
        if deps:
            all_deps.append((obj, deps))
        all_pins.update(pins)
        for k in tot:
            tot[k] += st[k]

    print(f"\n{out_dir} TOTAL: ok={tot['ok']} fail(left-incbin)={tot['fail']} "
          f"non-gfx(left-incbin)={tot['skip']}")
    if apply and (all_deps or any(True for _ in [0])):
        _write_mk(out_dir, mk_name, all_deps, all_pins, header)
        print(f"wrote {out_dir}/{mk_name} ({len(all_deps)} objects, {len(all_pins)} pins)")
    elif not apply:
        print("(dry-run; pass --apply)")
    return tot


def _is_pal(sym, extra):
    return bool(PAL_RE.match(sym)) or sym in extra


def _one(rom, asm, out_dir, apply, extra_pal):
    asm_path = os.path.join(lib.REPO, asm)
    lines = open(asm_path).read().splitlines()
    entries = lib.parse_entries(open(asm_path).read())
    st = dict(ok=0, fail=0, skip=0)
    deps = []
    pins = {}
    commits = {}

    for names, indent, off, size, ln in entries:
        sym = next((n for n in names if GFX_RE.match(n) or n in extra_pal), None)
        if sym is None:
            st["skip"] += 1
            continue
        blob = rom[off : off + size]

        # A "Pal_"-prefixed symbol that is actually LZ-compressed (firstbyte 0x10,
        # and not a tiny 0x20/0x40 palette) is mislabeled tile data -> fall through
        # to the LZ path. A genuine uncompressed palette goes through .pal; if its
        # JASC round-trip differs (e.g. GBA bit-15 set in a color, which gbagfx
        # clears) it is committed as a verbatim .bin instead (incbin'd directly).
        looks_lz = bool(blob) and blob[0] == 0x10 and size > 0x40
        if _is_pal(sym, extra_pal) and not looks_lz:
            try:
                pal_bytes = lib.gbapal_to_pal(blob)
                ok = lib.pal_to_gbapal(pal_bytes) == blob
            except Exception:
                ok = False
            if ok:
                inc_rel = f"{out_dir}/{sym}.gbapal"
                st["ok"] += 1
                if apply:
                    commits[os.path.join(lib.REPO, f"{out_dir}/{sym}.pal")] = pal_bytes
                    lines[ln] = f'{indent}.incbin "{inc_rel}"'
                    deps.append(inc_rel)
                continue
            # verbatim palette bytes (bit-15-set colors): commit .bin, incbin direct
            inc_rel = f"{out_dir}/{sym}.bin"
            st["ok"] += 1
            if apply:
                commits[os.path.join(lib.REPO, inc_rel)] = blob
                lines[ln] = f'{indent}.incbin "{inc_rel}"'
            continue

        if blob and blob[0] == 0x10:  # LZ77
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
            inc_rel = f"{out_dir}/{sym}.bin.lz"
            st["ok"] += 1
            if apply:
                commits[os.path.join(lib.REPO, f"{out_dir}/{sym}.bin")] = raw
                lines[ln] = f'{indent}.incbin "{inc_rel}"'
                deps.append(inc_rel)
                if mindist != 2:
                    pins[inc_rel] = mindist
            continue

        # uncompressed verbatim binary -> commit .bin, incbin directly (no rule)
        inc_rel = f"{out_dir}/{sym}.bin"
        st["ok"] += 1
        if apply:
            commits[os.path.join(lib.REPO, inc_rel)] = blob
            lines[ln] = f'{indent}.incbin "{inc_rel}"'

    if apply and st["ok"]:
        with open(asm_path, "w") as f:
            f.write("\n".join(lines) + "\n")
        for dst, data in commits.items():
            os.makedirs(os.path.dirname(dst), exist_ok=True)
            open(dst, "wb").write(data)
    if st["ok"] or st["fail"]:
        print(f"{asm}: ok={st['ok']} fail={st['fail']}")
    return deps, pins, st


def _write_mk(out_dir, mk_name, all_deps, all_pins, header):
    mk = os.path.join(lib.REPO, out_dir, mk_name)
    out = [f"# {l}" for l in header.splitlines()] + [""]
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
