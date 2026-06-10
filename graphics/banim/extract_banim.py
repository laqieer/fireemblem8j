#!/usr/bin/env python3
"""BANIM (battle-animation) graphics extractor -- Phase-1, banim subsystem only.

Replaces `.incbin "baserom.gba", off, size` in the JP banim `.s` files with
`.incbin` of an EXTRACTED, committed source asset ported from the sibling US decomp
(../fireemblem8u). The BANIM region is region-SAME (JP bytes == US bytes), proven by
byte-exact round-trip through gbagfx, so the US committed PNG / .agbpal IS the JP
source.

Why a banim-specific driver (not scripts/extract_graphics.py): the shared script
maps a JP symbol `nm` directly to `<us_dir>/nm.<ext>`, but the JP banim symbols use
suffix conventions the shared classifier does not handle:

  JP `banim_<u>_<v>_agbpal`     -> US `banim_<u>_<v>.agbpal`   (strip `_agbpal`),
                                   and the ROM stores it LZ-COMPRESSED (.agbpal.lz)
  JP `banim_<u>_<v>_sheet_N`    -> US `banim_<u>_<v>_sheet_N.png` (LZ .4bpp.lz)
  JP `battle_terrain_*_tileset` -> US terrain/<sym>.png         (LZ .4bpp.lz)
  JP `battle_terrain_*_pal`     -> US terrain/<sym>.agbpal      (verbatim)

The shared script also only commits palettes VERBATIM; banim character/sheet palettes
are LZ-compressed in ROM, which it cannot reproduce. Keeping this here leaves
scripts/extract_graphics.py untouched (parallel-conflict-free).

The OAM/motion/modes data (JP `_oam_l_bin`/`_oam_r_bin`/`_motion_o`/`_modes_bin`) is
NOT a committed graphics asset in US -- it is generated from `.s` assembler macros
(banim_frame_oam, ...). Those are OUTSIDE Phase-1 graphics extraction and are LEFT as
`.incbin "baserom.gba"` (honest). Likewise any `_sheet_blank`/`_discarded`/no-US-asset
entry is left as incbin.

The ONLY oracle is byte-exactness: each asset rebuilt through the SAME pipeline the
Makefile uses (gbagfx png->4bpp; optional LZ at the pinned -mindist; or palette bytes
verbatim) MUST equal the original ROM bytes. Entries that fail are reported and left
untouched. The caller then runs `make compare` (and `make clean && make compare`).

Usage (dry-run / verify):
  graphics/banim/extract_banim.py
Apply (commit assets + rewrite the .s + emit graphics/banim/banim.mk):
  graphics/banim/extract_banim.py --apply
"""
import os
import re
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
GBAGFX = os.path.join(ROOT, "tools", "gbagfx", "gbagfx")
US = os.environ.get("FE8U") or "/home/laqieer/fireemblem8u"

INCBIN_RE = re.compile(
    r'^\s*\.incbin\s+"baserom\.gba"\s*,\s*(0x[0-9A-Fa-f]+)\s*,\s*(0x[0-9A-Fa-f]+)'
)
GLOBAL_RE = re.compile(r"^\s*\.global\s+(\S+)")

# (JP `.s`, US graphics subdir under ../fireemblem8u/graphics/banim, out subdir).
TARGETS = [
    ("asm/data_banim.s", "graphics/banim", "graphics/banim"),
    ("asm/data_data_banim_terrain.s", "graphics/banim/terrain", "graphics/banim/terrain"),
]


def gbagfx(args):
    subprocess.run([GBAGFX, *args], check=True, capture_output=True)


def png_to_4bpp(png):
    fd, tmp = tempfile.mkstemp(suffix=".4bpp")
    os.close(fd)
    try:
        gbagfx([png, tmp])
        return open(tmp, "rb").read()
    finally:
        os.unlink(tmp)


def lz_compress(raw, mindist):
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


def parse_entries(text):
    entries = []
    pending = []
    for i, line in enumerate(text.splitlines()):
        m = GLOBAL_RE.match(line)
        if m:
            pending.append(m.group(1))
            continue
        m = INCBIN_RE.match(line)
        if m:
            entries.append((pending, int(m.group(1), 16), int(m.group(2), 16), i))
            pending = []
    return entries


def us_asset(names, us_dir):
    """Resolve (kind, us_path, out_basename) for a JP symbol, or (None, ...).

    kind in {pal_verbatim, pal_lz, tiles_lz}. out_basename is the COMMITTED source
    filename (PNG or .agbpal) that lands in this repo.
    """
    for nm in names:
        # palette: JP `..._agbpal` -> US `....agbpal` (strip the _agbpal suffix)
        if nm.endswith("_agbpal"):
            stem = nm[: -len("_agbpal")]
            p = os.path.join(us_dir, stem + ".agbpal")
            if os.path.exists(p):
                return ("palette", p, stem + ".agbpal")
        # terrain palette: JP symbol IS the filename stem, ext .agbpal
        p = os.path.join(us_dir, nm + ".agbpal")
        if os.path.exists(p):
            return ("palette", p, nm + ".agbpal")
        # tiles: JP symbol IS the filename stem, ext .png
        p = os.path.join(us_dir, nm + ".png")
        if os.path.exists(p):
            return ("tiles", p, nm + ".png")
    return (None, None, None)


def main():
    apply = "--apply" in sys.argv
    rom = open(os.path.join(ROOT, "baserom.gba"), "rb").read()

    total_ok = total_diff = total_nous = total_oam = 0
    bytes_removed = 0
    mk_lines = []  # lines for graphics/banim/banim.mk
    per_obj_deps = {}  # asm/<file>.o -> set(generated asset paths)

    for asm_rel, us_subdir, out_subdir in TARGETS:
        asm_path = os.path.join(ROOT, asm_rel)
        us_dir = os.path.join(US, us_subdir)
        out_dir = os.path.join(ROOT, out_subdir)
        text = open(asm_path).read()
        lines = text.splitlines()
        entries = parse_entries(text)
        obj = "asm/" + os.path.splitext(os.path.basename(asm_rel))[0] + ".o"
        per_obj_deps.setdefault(obj, set())

        ok = diff = nous = oam = 0
        for names, off, size, ln in entries:
            jp = rom[off : off + size]
            # OAM / motion / modes -> no committed graphics asset in US; honest skip.
            if any(
                n.endswith(("_oam_l_bin", "_oam_r_bin", "_motion_o", "_modes_bin"))
                for n in names
            ):
                oam += 1
                continue
            kind, us_path, base = us_asset(names, us_dir)
            if kind is None:
                nous += 1
                continue
            stem = base[: -len(".agbpal")] if base.endswith(".agbpal") else base[: -len(".png")]
            inc = None
            md = None
            if kind == "palette":
                reb = open(us_path, "rb").read()
                if reb == jp:
                    inc = f"{out_subdir}/{base}"  # verbatim committed binary
                else:
                    # ROM stores the palette LZ-compressed -> .agbpal.lz
                    for m in (1, 2, 3):
                        if lz_compress(reb, m) == jp:
                            inc = f"{out_subdir}/{stem}.agbpal.lz"
                            md = m
                            break
            else:  # tiles
                raw = png_to_4bpp(us_path)
                if raw == jp:
                    inc = f"{out_subdir}/{stem}.4bpp"
                else:
                    for m in (1, 2, 3):
                        if lz_compress(raw, m) == jp:
                            inc = f"{out_subdir}/{stem}.4bpp.lz"
                            md = m
                            break
            if inc is None:
                print(f"  REGION_DIFF {names[0]} @ {off:#x} ({size:#x}) [{kind}] -- left as incbin")
                diff += 1
                continue
            ok += 1
            bytes_removed += size
            if apply:
                # copy the committed US source asset (PNG/.agbpal) into this repo
                dst = os.path.join(out_dir, base)
                os.makedirs(os.path.dirname(dst), exist_ok=True)
                if not os.path.exists(dst):
                    with open(us_path, "rb") as f:
                        data = f.read()
                    with open(dst, "wb") as f:
                        f.write(data)
                lines[ln] = f'\t.incbin "{inc}"'
                # the .o depends on the *generated* asset (the .incbin target)
                per_obj_deps[obj].add(inc)
                if md is not None and md != 2:  # default mindist is 2 -> implicit
                    mk_lines.append(f"{inc}: LZ_FLAGS := -mindist {md}")

        if apply:
            with open(asm_path, "w") as f:
                f.write("\n".join(lines) + "\n")
        print(
            f"{asm_rel}: OK={ok} region-diff={diff} no-US-asset={nous} "
            f"oam/motion/modes(left-incbin)={oam}"
        )
        total_ok += ok
        total_diff += diff
        total_nous += nous
        total_oam += oam

    print(
        f"\nTOTAL: byte-match OK={total_ok}  region-diff={total_diff}  "
        f"no-US-asset={total_nous}  oam/motion/modes={total_oam}  "
        f"bytes_removed={bytes_removed}"
    )

    if not apply:
        print("(dry-run; pass --apply to commit assets + rewrite .s + emit banim.mk)")
        return 0

    # emit graphics/banim/banim.mk (per-object deps + non-default mindist pins)
    mk = os.path.join(ROOT, "graphics", "banim", "banim.mk")
    out = [
        "# graphics/banim -- battle-animation asset wiring (Phase-1, banim subsystem).",
        "# Auto-included by the root Makefile via `-include $(GRAPHICS_MK)`.",
        "# Region-SAME with US (JP bytes == US bytes): each committed PNG/.agbpal under",
        "# graphics/banim/ rebuilds (gbagfx png->4bpp->LZ, or .agbpal[.lz]) byte-identical",
        "# to the original ROM blob. OAM/motion/modes data has no committed graphics asset",
        "# in US (generated from .s macros) -> LEFT as `.incbin \"baserom.gba\"` (honest).",
        "# Generated by graphics/banim/extract_banim.py.",
        "",
    ]
    for obj in sorted(per_obj_deps):
        deps = sorted(per_obj_deps[obj])
        if deps:
            # chunk deps across multiple lines for readability
            out.append(f"{obj}: \\")
            for i, d in enumerate(deps):
                sep = " \\" if i < len(deps) - 1 else ""
                out.append(f"\t{d}{sep}")
            out.append("")
    if mk_lines:
        out.append("# non-default -mindist pins (default is gbagfx's mindist 2):")
        out.extend(sorted(set(mk_lines)))
        out.append("")
    with open(mk, "w") as f:
        f.write("\n".join(out) + "\n")
    print(f"wrote {mk} ({len(per_obj_deps)} objects, {len(set(mk_lines))} mindist pins)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
