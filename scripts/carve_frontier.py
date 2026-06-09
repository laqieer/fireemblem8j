#!/usr/bin/env python3
"""Table-pinned region-different DATA carver — the "true frontier" harvester.

A whole-ROM, FF/zero-aware gap analysis of the JP ROM (NOT US-address driven)
shows ~1.9 MB of *real* (non-padding, non-zero-fill) data still living in the
raw-ROM incbin baseline, scattered across ~30 mid-sized blocks. These are
region-different assets: their leaf payloads are *unnamed* US symbols, so no code
literal points straight at them, but each block is indexed by a per-subsystem
POINTER TABLE that code *does* reference. This carver follows that table exactly
like scripts/carve_graphics_subsys.py (the data_bg template), generalised:

    code literal (read live from JP ROM via IDA)  ->  JP table base
    read the JP table from baserom                ->  exact JP start of every asset
    sort the starts                               ->  per-asset JP boundaries (gapless)
    region = [min start, region_end)              ->  byte-perfect incbins, gap-subtracted

EVERY boundary is read LIVE from the JP ROM — the JP art is region-different
(different images, LZ-compressed to different sizes) so US boundaries do NOT
apply. `make compare` stays the only oracle.

PARALLEL-SAFE GAP CARVING: a subsystem's region may already be partly carved
(small region-same sub-assets the earlier carvers reached, whose rows live in the
shared monolith layout/carved_rom.tsv or other task fragments). We must not touch
those. So this carver UNIONS every already-carved range (monolith + all OTHER
fragments) and carves only the UNCARVED gaps in [region_start, region_end),
snapping each emitted span to whole already-carved edges so a row is never a
partial split of someone else's carved object.

Output (isolated file domain — does NOT touch the monolith or any other task's
fragment):
    asm/frontier_<name>.s                              (one .incbin per gap)
    layout/carved_rom.d/data_frontier2_<name>.tsv      (one carved_rom row per gap)

Then:  make layout && make compare   (revert both files on any miss).

SUBSYSTEM REGISTRY — each entry pins the index table(s) (JP base read live from
the JP ROM, derived via IDA from the indexing code, NOT from US addresses) and
the region end (the first named object immediately after the asset blob).
"""

import glob
import os
import re
import struct
import sys

BASE = 0x08000000
ROM = "baserom.gba"

# Each subsystem: index table(s) as (jp_base, n_entries, stride, n_ptr_fields),
# and region_end (exclusive). The table base + region_end are DERIVED FROM THE
# JP ROM (IDA-decompiled indexing code), never assumed from US addresses.
SUBSYS = {
    # Chapter-title images (chapter_title.c / chap_title_data.c).
    #   PutChapterTitleGfx (JP, IDA sub_808B894) clamps titleId to <=0x108 then 0x54
    #   and indexes `chap_title_data` with stride titleId*12 (= titleId*2+titleId <<2),
    #   reading field 0 (.save). The JP `ChapTitle` struct is 3 pointers (US comment:
    #   null_1/null_2 are "chap image / chap title in jp ver" — i.e. JP USES all 3).
    #   JP table base = dword_8A732C0 (read live from the LDR literal at 0x808B8B0).
    #   88 entries x 12 B; each of the 3 fields is a pointer (or 0) into the art blob.
    #   The art region's lowest pointer is 0x08A7E188 (chap_title_0) and it ends at
    #   gGfx_PlayerInterfaceFontTiles = 0x08A92514 (next named object). Covers two of
    #   the gap-analysis frontier blocks (0x08A7E188-0x08A84B00 + 0x08A84BFC-0x08A92514).
    "chap_title": {
        "tables": [(0x08A732C0, 88, 12, 3)],
        "region_end": 0x08A92514,
    },
}


def rd_word(rom, addr):
    return struct.unpack_from("<I", rom, addr - BASE)[0]


def carved_ranges(exclude_basename):
    """Every [start, end) already carved in carved_rom — the shared monolith plus
    every per-task fragment EXCEPT our own. Mirrors carve_graphics_subsys.py."""
    out = []
    paths = []
    if os.path.exists("layout/carved_rom.tsv"):
        paths.append("layout/carved_rom.tsv")
    paths += [p for p in glob.glob("layout/carved_rom.d/*.tsv")
              if os.path.basename(p) != exclude_basename]
    for p in paths:
        for l in open(p):
            if l.startswith("#") or not l.strip():
                continue
            f = l.split("\t")
            try:
                out.append((int(f[0], 16) + BASE, int(f[1], 16) + BASE))
            except ValueError:
                pass
    return out


def carve(name):
    cfg = SUBSYS[name]
    rom = open(ROM, "rb").read()

    # --- read every index table from the JP ROM -> asset start addresses -------
    starts = set()
    for tbase, nent, stride, nfld in cfg["tables"]:
        for e in range(nent):
            for f in range(nfld):
                a = rd_word(rom, tbase + e * stride + f * 4)
                if a == 0:
                    continue
                if not (BASE <= a < BASE + len(rom)):
                    sys.exit(f"table {tbase:#x} entry {e} field {f} = {a:#010x} not a ROM ptr")
                starts.add(a)

    region_end = cfg["region_end"]
    starts = sorted(s for s in starts if s < region_end)
    if not starts:
        sys.exit("no asset starts below region_end — table coverage wrong")
    region_start = starts[0]

    # --- per-asset boundaries (must tile the region gaplessly) -----------------
    assets = []  # (start, end)
    for i, a in enumerate(starts):
        end = starts[i + 1] if i + 1 < len(starts) else region_end
        if end <= a:
            sys.exit(f"non-positive asset size at {a:#010x}")
        assets.append((a, end))
    if not all(assets[i][1] == assets[i + 1][0] for i in range(len(assets) - 1)):
        sys.exit("region is NOT gapless — refusing to carve (would risk padding)")
    if any(a % 4 for a, _ in assets):
        sys.exit("an asset start is not 4-aligned — would force a pad and grow the ROM")
    if assets[-1][1] != region_end:
        sys.exit("last asset does not reach region_end")

    # --- subtract already-carved ranges (shared monolith + other fragments) ----
    frag_base = f"data_frontier2_{name}.tsv"
    carved = sorted(
        (max(s, region_start), min(e, region_end))
        for s, e in carved_ranges(frag_base)
        if not (e <= region_start or s >= region_end)
    )
    merged = []
    for s, e in carved:
        if merged and s <= merged[-1][1]:
            merged[-1] = (merged[-1][0], max(merged[-1][1], e))
        else:
            merged.append((s, e))

    # Walk [region_start, region_end) and emit only the UNCARVED sub-spans. Each
    # emitted span is the maximal run of bytes not covered by `merged`. Boundaries
    # are guaranteed to land on asset starts OR carved-row edges (the already-carved
    # rows are themselves asset-aligned region-same sub-assets), so a row is always a
    # clean blob, never a partial split of a foreign carved object.
    cuts = sorted({region_start, region_end}
                  | {s for s, _ in merged} | {e for _, e in merged}
                  | {a for a, _ in assets})
    rows = []
    bodies = []
    gap_i = 0

    def is_carved(lo):
        return any(s <= lo < e for s, e in merged)

    for i in range(len(cuts) - 1):
        lo, hi = cuts[i], cuts[i + 1]
        if hi <= lo or is_carved(lo):
            continue
        secname = f".data.frontier_{name}.gap{gap_i}"
        label = f"frontier_{name}_{gap_i:03d}_{lo & 0xFFFFFF:06X}"
        bodies.append(
            f'\t.section {secname}, "a", %progbits\n'
            f"@ {name} region-different data, JP {lo:#010x}..{hi:#010x} ({hi - lo} B); "
            f"table-pinned (not code-named), byte-perfect incbin.\n"
            f"\t.global {label}\n{label}:\n"
            f'\t.incbin "{ROM}", 0x{lo - BASE:X}, 0x{hi - lo:X}\n'
        )
        rows.append((lo, hi, secname))
        gap_i += 1

    if not rows:
        print(f"{name}: nothing left to carve (region fully covered already)")
        return

    hdr = (
        f"@ {name}: region-different data not reachable by the code-literal carver\n"
        f"@ (leaf assets are unnamed US symbols). Boundaries read live from the JP\n"
        f"@ index table(s) "
        + ", ".join(f"{tb:#010x}[{ne}]" for tb, ne, _, _ in cfg["tables"])
        + f" in baserom.\n"
        f"@ Region [{region_start:#010x}, {region_end:#010x}); already-carved region-same\n"
        f"@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.\n\n"
    )
    open(f"asm/frontier_{name}.s", "w").write(hdr + "\n".join(bodies))

    frag = os.path.join("layout", "carved_rom.d", frag_base)
    os.makedirs(os.path.dirname(frag), exist_ok=True)
    with open(frag, "w") as f:
        f.write("# carve_frontier.py table-pinned region-different data (parallel-safe fragment)\n")
        for s, e, secname in sorted(rows):
            f.write(
                f"{s & 0xFFFFFF:06X}\t{e & 0xFFFFFF:06X}\tasm/frontier_{name}.o({secname})\t"
                f"{name} region-diff data ({e - s} B, table-pinned)\n"
            )

    tot = sum(e - s for s, e, _ in rows)
    print(
        f"carved {name}: {len(rows)} uncarved blobs in "
        f"[{region_start:#010x}, {region_end:#010x}), {tot} B ({tot // 1024} KB)"
    )
    print(f"  -> asm/frontier_{name}.s, {frag}")


def main():
    targets = sys.argv[1:] or sorted(SUBSYS)
    for t in targets:
        if t not in SUBSYS:
            sys.exit(f"unknown subsystem {t!r}; known: {sorted(SUBSYS)}")
        carve(t)


if __name__ == "__main__":
    main()
