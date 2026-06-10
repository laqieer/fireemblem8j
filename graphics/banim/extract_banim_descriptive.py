#!/usr/bin/env python3
"""BANIM descriptive-symbol graphics extractor -- Phase-1, banim subsystem only.

Companion to graphics/banim/extract_banim.py. That driver handles the JP banim
`.s` files whose symbols use the `_agbpal`/`_sheet_N` suffix convention
(asm/data_banim.s, terrain). THIS driver handles the *other* banim `.s` files,
whose symbols are the descriptive US-style `Img_*` / `Tsa_* `/ `Pal_*` names:

  asm/dat_banim_ekrdragonfx_*.s   (dragon battle-fx graphics)
  asm/dat_data_banim_p*.s         (battle-anim sprite sheets + tilemaps + palettes)

These map 1:1 onto US assets defined in fireemblem8u's:

  src/data/banim/data_banim.s     (`.global Sym` + `.incbin "./graphics/.../x.EXT"`)
  src/data/banim*.c               (`Sym[] = INCBIN_*("graphics/.../x.EXT")`)

For each JP graphics symbol we resolve the US committed source asset BY SYMBOL
NAME, rebuild it through the SAME pipeline the Makefile uses, and require the
bytes to equal the original JP ROM blob (region-SAME proof):

  US .png        --gbagfx-->  .4bpp  [--gbagfx -mindist N-->  .4bpp.lz]
  US .map.bin    (verbatim)          [--gbagfx -mindist N-->  .map.bin.lz]
  US .gbapal/.agbpal  (verbatim, optionally a [off,size] slice of a shared file)

Committed sources are copied into THIS repo under graphics/banim/_us/<rest>,
mirroring the US path (graphics/<rest>) so paths stay inside graphics/banim/ and
never collide. The JP `.incbin "baserom.gba"` is rewritten to `.incbin
"<committed-asset>"` (the Makefile-generated target). Per-object deps and any
non-default `-mindist` pins are appended to graphics/banim/banim.mk.

NON-graphics banim symbols (`AnimSprite_*`, `AnimScr`, `gEkrdragonfx_*`, ...) are
`struct AnimSpriteData` / script tables generated from US `.s` assembler macros,
NOT committed graphics assets -> LEFT as `.incbin "baserom.gba"` (honest). Any
symbol with no US asset, or whose rebuilt bytes don't match the JP ROM
(region-DIFFERENT), is likewise LEFT as incbin and reported.

The only oracle is byte-exactness. The caller then runs `make check`,
`make compare`, and `make clean && make compare`.

Usage:
  graphics/banim/extract_banim_descriptive.py            # dry-run / verify
  graphics/banim/extract_banim_descriptive.py --apply    # commit + rewrite + mk
"""
import glob
import os
import re
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
GBAGFX = os.path.join(ROOT, "tools", "gbagfx", "gbagfx")
US = os.environ.get("FE8U") or "/home/laqieer/fireemblem8u"

JP_GLOBS = [
    "asm/dat_banim_ekrdragonfx_*.s",
    "asm/dat_data_banim_p*.s",
]

INCBIN_BASEROM_RE = re.compile(
    r'^\s*\.incbin\s+"baserom\.gba"\s*,\s*(0x[0-9A-Fa-f]+)\s*,\s*(0x[0-9A-Fa-f]+)'
)
GLOBAL_RE = re.compile(r"^\s*\.global\s+(\S+)")

GFX_PREFIX_RE = re.compile(r"^(Img|Tsa|Pal)")

# committed-source dir in THIS repo (mirrors US `graphics/<rest>` as `_us/<rest>`)
OUT_ROOT_REL = "graphics/banim/_us"


def run(args):
    subprocess.run(args, check=True, capture_output=True)


def png_to_4bpp(png):
    fd, tmp = tempfile.mkstemp(suffix=".4bpp")
    os.close(fd)
    try:
        run([GBAGFX, png, tmp])
        return open(tmp, "rb").read()
    finally:
        os.unlink(tmp)


def pal_to_gbapal(pal):
    fd, tmp = tempfile.mkstemp(suffix=".gbapal")
    os.close(fd)
    try:
        run([GBAGFX, pal, tmp])
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
        run([GBAGFX, src, dst, "-mindist", str(mindist)])
        return open(dst, "rb").read()
    finally:
        os.unlink(src)
        os.unlink(dst)


def build_us_map():
    """symbol -> (us_incbin_relpath, slice_off_or_None, slice_size_or_None).

    us_incbin_relpath is the asset path the US object .incbin's (the Makefile
    *target*, e.g. graphics/banim/assets/img/X.4bpp.lz), normalized to start at
    'graphics/'. The slice applies to verbatim binaries (shared palettes).
    """
    us_map = {}
    sym_re = re.compile(r"^\s*\.global\s+(\S+)")
    inc_re = re.compile(r'^\s*\.incbin\s+"([^"]+)"(?:\s*,\s*(0x[0-9A-Fa-f]+)\s*,\s*(0x[0-9A-Fa-f]+))?')
    s_files = (
        glob.glob(os.path.join(US, "src/data/banim/data_banim.s"))
        + glob.glob(os.path.join(US, "src/data/banim*.s"))
    )
    for f in s_files:
        cur = None
        for ln in open(f).read().splitlines():
            m = sym_re.match(ln)
            if m:
                cur = m.group(1)
                continue
            m2 = inc_re.match(ln)
            if m2 and cur:
                path = m2.group(1).lstrip("./")
                off = int(m2.group(2), 16) if m2.group(2) else None
                size = int(m2.group(3), 16) if m2.group(3) else None
                us_map.setdefault(cur, (path, off, size))
                cur = None
    cinc = re.compile(r'(\w+)\[\]\s*=\s*INCBIN_\w+\("([^"]+)"\)')
    for f in glob.glob(os.path.join(US, "src/data/banim*.c")):
        for m in cinc.finditer(open(f).read()):
            us_map.setdefault(m.group(1), (m.group(2).lstrip("./"), None, None))
    return us_map


def out_relpath(us_path):
    """Map a US 'graphics/<rest>' path to this repo's 'graphics/banim/_us/<rest>'."""
    assert us_path.startswith("graphics/")
    rest = us_path[len("graphics/"):]
    return f"{OUT_ROOT_REL}/{rest}"


def source_for(us_target):
    """Given a US incbin TARGET path, return the committed SOURCE path it builds from.

    .4bpp.lz / .4bpp -> .png ; .map.bin.lz -> .map.bin ; .gbapal/.agbpal -> verbatim.
    Returns (us_source_abspath, kind) where kind in {png, mapbin, palette}.
    """
    if us_target.endswith(".4bpp.lz") or us_target.endswith(".4bpp"):
        stem = us_target[: -len(".4bpp.lz")] if us_target.endswith(".4bpp.lz") else us_target[: -len(".4bpp")]
        return os.path.join(US, stem + ".png"), "png"
    if us_target.endswith(".map.bin.lz"):
        return os.path.join(US, us_target[: -len(".lz")]), "mapbin"
    if us_target.endswith(".map.bin"):
        return os.path.join(US, us_target), "mapbin"
    if us_target.endswith(".gbapal"):
        # committed .gbapal may have a .pal source; prefer rebuilding from .pal
        gba = os.path.join(US, us_target)
        pal = os.path.join(US, us_target[: -len(".gbapal")] + ".pal")
        return (pal if os.path.exists(pal) else gba), ("pal" if os.path.exists(pal) else "palbin")
    if us_target.endswith(".agbpal"):
        return os.path.join(US, us_target), "palbin"
    return None, None


def parse_jp_entries(text):
    entries = []
    pending = []
    for i, line in enumerate(text.splitlines()):
        m = GLOBAL_RE.match(line)
        if m:
            pending.append(m.group(1))
            continue
        m = INCBIN_BASEROM_RE.match(line)
        if m:
            entries.append((pending, int(m.group(1), 16), int(m.group(2), 16), i))
            pending = []
    return entries


def gbapal_to_pal_bytes(gbapal_path):
    """Convert a committed-binary .gbapal to JASC .pal source bytes (gbagfx).

    The .gbapal build intermediate is gitignored in this repo, so a verbatim
    .gbapal cannot be committed as source. Instead we commit a .pal (TRACKED)
    and let the Makefile rebuild .pal -> .gbapal via `%.gbapal: %.pal`. The
    round-trip gbapal -> pal -> gbapal is byte-exact, so the rebuilt palette
    still equals the JP ROM blob.
    """
    fd, tmp = tempfile.mkstemp(suffix=".pal")
    os.close(fd)
    try:
        run([GBAGFX, gbapal_path, tmp])
        return open(tmp, "rb").read()
    finally:
        os.unlink(tmp)


def main():
    apply = "--apply" in sys.argv
    rom = open(os.path.join(ROOT, "baserom.gba"), "rb").read()
    us_map = build_us_map()

    total_ok = total_diff = total_nous = total_nongfx = 0
    bytes_removed = 0
    per_obj_deps = {}
    mindist_pins = {}
    commits = {}  # dst_abspath -> bytes (committed source to stage)

    for pattern in JP_GLOBS:
        for asm_path in sorted(glob.glob(os.path.join(ROOT, pattern))):
            text = open(asm_path).read()
            lines = text.splitlines()
            entries = parse_jp_entries(text)
            obj = "asm/" + os.path.splitext(os.path.basename(asm_path))[0] + ".o"
            per_obj_deps.setdefault(obj, set())

            for names, off, size, ln in entries:
                jp = rom[off: off + size]
                gfx_name = next((n for n in names if GFX_PREFIX_RE.match(n)), None)
                if gfx_name is None:
                    total_nongfx += 1
                    continue
                us_entry = us_map.get(gfx_name)
                if us_entry is None:
                    total_nous += 1
                    continue
                us_target, sl_off, sl_size = us_entry
                if not us_target.startswith("graphics/"):
                    total_nous += 1
                    continue
                src_path, kind = source_for(us_target)
                if src_path is None or not os.path.exists(src_path):
                    total_nous += 1
                    continue

                inc_rel = None
                mindist = None
                # the committed SOURCE that lands in THIS repo: (dst_rel, bytes).
                commit_dst_rel = None
                commit_bytes = None

                def src_out_rel(path):
                    return out_relpath(
                        "graphics/" + os.path.relpath(path, os.path.join(US, "graphics"))
                    )

                if kind == "png":
                    raw = png_to_4bpp(src_path)
                    if us_target.endswith(".4bpp") and raw == jp:
                        inc_rel = out_relpath(us_target)
                    elif us_target.endswith(".4bpp.lz"):
                        for md in (1, 2, 3):
                            if lz_compress(raw, md) == jp:
                                inc_rel = out_relpath(us_target)
                                mindist = md
                                break
                    if inc_rel:
                        commit_dst_rel = src_out_rel(src_path)  # the .png
                        commit_bytes = open(src_path, "rb").read()
                elif kind == "mapbin":
                    raw = open(src_path, "rb").read()
                    if us_target.endswith(".map.bin.lz"):
                        for md in (1, 2, 3):
                            if lz_compress(raw, md) == jp:
                                inc_rel = out_relpath(us_target)
                                mindist = md
                                break
                    elif raw == jp:  # uncompressed .map.bin
                        inc_rel = out_relpath(us_target)
                    if inc_rel:
                        commit_dst_rel = src_out_rel(src_path)  # the .map.bin
                        commit_bytes = raw
                elif kind == "pal":
                    reb = pal_to_gbapal(src_path)
                    if sl_off is not None:
                        reb = reb[sl_off: sl_off + sl_size]
                    if reb == jp:
                        inc_rel = out_relpath(us_target)
                        commit_dst_rel = src_out_rel(src_path)  # the .pal
                        commit_bytes = open(src_path, "rb").read()
                elif kind == "palbin":
                    reb = open(src_path, "rb").read()
                    if sl_off is not None:
                        reb = reb[sl_off: sl_off + sl_size]
                    if reb == jp:
                        inc_rel = out_relpath(us_target)
                        if src_path.endswith(".gbapal"):
                            # .gbapal is a gitignored build intermediate -> commit a
                            # .pal source and let the Makefile rebuild it (round-trip
                            # gbapal->pal->gbapal is byte-exact).
                            pal_src = src_path[: -len(".gbapal")] + ".pal"
                            commit_dst_rel = src_out_rel(pal_src)
                            commit_bytes = gbapal_to_pal_bytes(src_path)
                        else:  # .agbpal -> tracked, commit verbatim
                            commit_dst_rel = src_out_rel(src_path)
                            commit_bytes = reb if sl_off is None else open(src_path, "rb").read()

                if inc_rel is None:
                    total_diff += 1
                    print(f"  REGION_DIFF {gfx_name} @ {off:#x} ({size:#x}) [{kind}] -- left as incbin")
                    continue

                total_ok += 1
                bytes_removed += size
                # preserve slice on the rewritten incbin (shared palette files)
                slice_suffix = f", {sl_off:#x}, {sl_size:#x}" if sl_off is not None else ""
                if apply:
                    commits[os.path.join(ROOT, commit_dst_rel)] = commit_bytes
                    lines[ln] = f'\t.incbin "{inc_rel}"{slice_suffix}'
                    per_obj_deps[obj].add(inc_rel)
                    if mindist is not None and mindist != 2:
                        mindist_pins[inc_rel] = mindist

            if apply:
                with open(asm_path, "w") as f:
                    f.write("\n".join(lines) + "\n")

    print(
        f"\nTOTAL: byte-match OK={total_ok}  region-diff={total_diff}  "
        f"no-US-asset={total_nous}  non-gfx(left-incbin)={total_nongfx}  "
        f"bytes_removed={bytes_removed}"
    )

    if not apply:
        print("(dry-run; pass --apply to commit assets + rewrite .s + update banim.mk)")
        return 0

    # stage committed sources
    for dst, data in commits.items():
        os.makedirs(os.path.dirname(dst), exist_ok=True)
        with open(dst, "wb") as f:
            f.write(data)

    append_banim_mk(per_obj_deps, mindist_pins)
    print(f"updated graphics/banim/banim.mk "
          f"({sum(1 for o in per_obj_deps if per_obj_deps[o])} objects, "
          f"{len(mindist_pins)} non-default mindist pins, {len(commits)} sources staged)")
    return 0


def append_banim_mk(per_obj_deps, mindist_pins):
    mk = os.path.join(ROOT, "graphics", "banim", "banim.mk")
    block = [
        "",
        "# --- descriptive-symbol banim (ekrdragonfx + data_banim_p), region-SAME ---",
        "# Generated by graphics/banim/extract_banim_descriptive.py. Each committed",
        "# source under graphics/banim/_us/ rebuilds (gbagfx png->4bpp[->lz] / .pal->",
        "# gbapal / .map.bin[->lz] / verbatim palette) byte-identical to the JP ROM.",
        "",
    ]
    for obj in sorted(per_obj_deps):
        deps = sorted(per_obj_deps[obj])
        if not deps:
            continue
        block.append(f"{obj}: \\")
        for i, d in enumerate(deps):
            sep = " \\" if i < len(deps) - 1 else ""
            block.append(f"\t{d}{sep}")
        block.append("")
    if mindist_pins:
        block.append("# non-default -mindist pins (default is gbagfx's mindist 2):")
        for inc in sorted(mindist_pins):
            block.append(f"{inc}: LZ_FLAGS := -mindist {mindist_pins[inc]}")
        block.append("")
    with open(mk, "a") as f:
        f.write("\n".join(block) + "\n")


if __name__ == "__main__":
    sys.exit(main())
