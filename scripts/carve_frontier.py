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
# and the asset region window. The table base + region bounds are DERIVED FROM THE
# JP ROM (IDA-decompiled indexing code / live table reads), never assumed from US
# addresses.
#   region_start: optional. If omitted, the lowest table pointer below region_end
#                 is used (chap_title case: the table is dedicated and its lowest
#                 pointer IS the region start). Set explicitly when the table is
#                 SHARED across the whole ROM and only a windowed slice of its
#                 pointers tiles this frontier block (gChapterDataAssetTable case).
#   region_end:   exclusive. The next named object / next table pointer after the
#                 asset blob. Only table pointers in [region_start, region_end) are
#                 used as boundaries; the region is tiled gaplessly between them.
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
    # Map tilesets (const_data_chapter_maps.c / data_8B363C.c::gChapterDataAssetTable).
    #   gChapterDataAssetTable (JP base 0x08907BC8 from layout/addr_map.tsv: US
    #   0x088B363C -> JP 0x08907BC8; the table itself is already carved as
    #   dat_gChapterDataAssetTable_ref) is a FLAT 236-word pointer array indexing
    #   every chapter map asset (ObjectType* tile gfx, MapPalette*, TileConfiguration*,
    #   map layouts, events) scattered across the ROM. bmmap.c/bmio.c index it by
    #   GetROMChapterStruct(...)->map.{obj1Id,tileConfigId,...}. The ObjectType tile-gfx
    #   frontier block [0x0817B398, 0x08190010) is tiled by exactly 3 of its pointers
    #   (0x0817B398, 0x08181610, 0x08188888) and ends at the next pointer
    #   0x08190010 (= TowerOfValniTileConfiguration). region-different LZ tilesets.
    "map_objtype": {
        "tables": [(0x08907BC8, 236, 4, 1)],
        "region_start": 0x0817B398,
        "region_end": 0x08190010,
    },
    # Ch9 (Eirika rt.) event data — gChapterDataAssetTable[Ch9Events] @ 0x08159850.
    #   The recursive code-literal carver only reached the 80-byte head (dat_Ch9Events_ref);
    #   the asset body runs to the next table pointer 0x081608A4 (= dat_const_data_
    #   chapter_maps_p1 start). The 28,676-byte tail [0x081598A0, 0x081608A4) is the
    #   uncarved frontier gap (region-different compressed event data). One table ptr
    #   in the window; the carved head is gap-subtracted.
    "map_ch9events": {
        "tables": [(0x08907BC8, 236, 4, 1)],
        "region_start": 0x08159850,
        "region_end": 0x081608A4,
    },
    # AuraBg3 battle-animation effect sprites (banim-efxmagic-aura.c, NOT ported in JP).
    #   The per-symbol-shifted data_banim carve (region-same) broke off at the AuraBg3
    #   block because its JP art is region-different. The block [0x0876E98C, 0x0877ABF4)
    #   sits between two carved data_banim objects (dat_data_banim_p232 ends at the
    #   start = Img_AuraBg3_7; dat_data_banim_p234 = Pal_EfxChillEffectBG begins at the
    #   end). Boundaries are read LIVE from the JP frame pointer arrays:
    #     ImgArray_AuraBg3 @ 0x08601930 (12 Img frame ptrs, JP-located by scan),
    #     TsaArray_AuraBg3 @ 0x08601900 (12 Tsa frame ptrs), plus the secondary
    #     OBJ/TSA frame arrays at 0x08601990+ and 0x0877AB34+ (the block's own trailing
    #   TSA pointer table). `frame_arrays` mode discovers every clean run (>=3 consecutive
    #   4-aligned words all pointing into the window) and uses those targets as the
    #   gapless tile boundaries. 2% 0xFF, max FF-run 4 (no padding); whole window
    #   uncarved. Covers two gap-analysis frontier blocks (0x0876E98C-0x0877ABF4 plus
    #   the small worldmap objects between are separately carved).
    "banim_aurabg3": {
        "frame_arrays": True,
        # window the discovery to the AuraBg3 art block + the array bases that target it
        "array_scan": (0x08600000, 0x0877B000),
        "region_start": 0x0876E98C,
        "region_end": 0x0877ABF4,
    },
    # EkrDracoZombie + related dragon/effect battle-animation sprites (region-different,
    # banim, not ported in JP). Block [0x0877BBB8, 0x087961E8) sits between two carved
    # objects (dat_worldmap_gmapunit_p1032 end / dat_data_banim_p238 start = gEkrDraco
    # ZombiTsaSetLut region) and is fully uncarved. Boundaries are read live from the
    # JP frame pointer arrays anywhere in the ROM that target the window (frame_arrays
    # discovery, scanning the whole ROM); the leading header before frame 0 and any
    # single large LZ blob become their own gapless tiles. 2.3% 0xFF, max FF-run 4
    # (no padding). 95KB real of 105KB.
    "banim_dracozombie": {
        "frame_arrays": True,
        "array_scan": (0x08000000, 0x09000000),
        "region_start": 0x0877BBB8,
        "region_end": 0x087961E8,
    },
    # Ending-credits CG blob (ending_credits.c; code ported, gEndingCredits_0[] data
    # still in baseline). The region [0x08B27970, 0x08B3B3D4) holds the compressed CG
    # images + TSA + palettes that EndingCredits_LoadCG Decompress()es; they are
    # indexed by CreditsCG structs that live OUTSIDE the region (in the gEndingCredits_0
    # table), so no pointer array sits in the window for per-asset tiling. It is bounded
    # exactly by two named/carved objects: dat_anim_worldmap_skirmish ends at the start
    # and ProcScr_EndingCredits_BlendCGMaybe (0x08B3B3D4) begins at the end. 1.1% 0xFF
    # (max FF-run 6 = no padding) — a single byte-perfect blob under one descriptive
    # symbol. `blob` mode: one incbin for the whole uncarved window.
    "ending_cg": {
        "blob": True,
        "region_start": 0x08B27970,
        "region_end": 0x08B3B3D4,
    },
    # JP font-group / UI graphics block (fontgrp.c region; region-different — the JP
    # font system carries extra glyph/UI data the US color-lookup-table layout lacks).
    #   [0x0859D4FC, 0x085B8CDC) is fully uncarved, bounded by dat_gFontgrp_233_ref (end)
    #   and gObject_64x64 (0x085B8CF4-ish, the next named object). The data is sparse
    #   4bpp-style graphics (45% transparent 0x00 pixels, max same-byte run 66 = NOT a
    #   zero-fill gap; 0xFF only 4.7%, max FF-run 2). No internal pointer array sits in
    #   the window for per-asset tiling (only a single forward header word), so it is one
    #   byte-perfect blob under one descriptive symbol.
    "fontgrp_ui": {
        "blob": True,
        "region_start": 0x0859D4FC,
        "region_end": 0x085B8CDC,
    },
    # ----------------------------------------------------------------------------
    # data-frontier-3 batch: the next tier of region-different DATA long-tail blocks.
    # Each entry is a WIDE subsystem window whose two extreme boundaries land EXACTLY
    # on already-carved object edges (verified: lo == some carved row's end, hi ==
    # some carved row's start). blob mode gap-subtracts every interior already-carved
    # region-same object, so only the UNCARVED frontier sub-spans are emitted — one
    # byte-perfect incbin per gap. Every window was screened to contain ZERO
    # region-different CODE gaps (no thumb-prologue head bytes between carved .text
    # objects), so nothing here steps on RE's src/*.c domain. `frag_prefix` routes the
    # output to the isolated data_frontier3_* / frontier_df3_* namespace so this batch
    # never collides with data-frontier-2's committed fragments. Padding red line:
    # the whole-ROM FF/zero gap analysis already excluded any window that is >50% 0xFF
    # or <10% real, and no .align/pad is ever emitted — `make compare` is the oracle.

    # gFontgrp + sound-effect (se) region. JP font-group entries are region-different
    # (extra glyph/UI tables) and the interleaved se/song clips differ between BE8E/BE8J;
    # the block also holds the 56KB se617-class sample blob. 10 uncarved data gaps.
    "df3_fontgrp_se":    {"blob": True, "frag_prefix": "data_frontier3",
                          "region_start": 0x0857E884, "region_end": 0x085912EC},
    # gFontgrp low region (122..77) — 4 small region-different font/UI data gaps.
    "df3_gfontgrp_lo":   {"blob": True, "frag_prefix": "data_frontier3",
                          "region_start": 0x0857FF94, "region_end": 0x08582A0C},
    # m4a sound driver tables + voicegroup samples (region-different instrument banks).
    "df3_voicegroup":    {"blob": True, "frag_prefix": "data_frontier3",
                          "region_start": 0x081F70E8, "region_end": 0x0820FEE8},
    # voicegroup019..031 sample bank — one large region-different blob.
    "df3_voicegroup2":   {"blob": True, "frag_prefix": "data_frontier3",
                          "region_start": 0x081FE320, "region_end": 0x0820189C},
    # Opening-animation gfx (opanim_gfx p6..p22) — region-different LZ image data.
    "df3_opanim_gfx":    {"blob": True, "frag_prefix": "data_frontier3",
                          "region_start": 0x08B75860, "region_end": 0x08B89AF8},
    # Battle-animation (AuraBg3 .. dragon) image/TSA region between data_banim p213..p229.
    "df3_banim_aura":    {"blob": True, "frag_prefix": "data_frontier3",
                          "region_start": 0x087463DC, "region_end": 0x08763B10},
    # Battle-animation mid region (data_banim p86..p97) — 10 small region-diff gaps.
    "df3_banim_mid":     {"blob": True, "frag_prefix": "data_frontier3",
                          "region_start": 0x0864D2B4, "region_end": 0x08659804},
    # Battle backgrounds (data_btl_bg p1..p13) — region-different compressed BG art.
    "df3_btl_bg":        {"blob": True, "frag_prefix": "data_frontier3",
                          "region_start": 0x087B40A8, "region_end": 0x087B9F98},
    # const_data unit-icon region (region-different unit class icon data).
    "df3_const_unit_ic": {"blob": True, "frag_prefix": "data_frontier3",
                          "region_start": 0x081C0D80, "region_end": 0x081C4A04},
    # data_5AA96C region (sio post-battle ProcScr + 5AA96C sprite data) — 10 small gaps.
    "df3_data_5aa96c":   {"blob": True, "frag_prefix": "data_frontier3",
                          "region_start": 0x085D367C, "region_end": 0x085D92D0},
    # Title-screen gfx region (data_titlescreen p*) — region-different title art.
    "df3_titlescreen":   {"blob": True, "frag_prefix": "data_frontier3",
                          "region_start": 0x08B44B40, "region_end": 0x08B4BBA0},
    # Ending details/fin gfx region — region-different ending-sequence art.
    "df3_ending":        {"blob": True, "frag_prefix": "data_frontier3",
                          "region_start": 0x08AC1BC0, "region_end": 0x08AC6C98},
    # Chapter UnitDef tables + interleaved worldmap gmapunit sprites (region-different:
    # JP chapter unit lists differ). 74 uncarved data gaps, ~62KB — the single richest
    # window in this batch. hi snapped to dat_worldmap_gmapunit_p1412 start.
    "df3_unitdef_b":     {"blob": True, "frag_prefix": "data_frontier3",
                          "region_start": 0x0890F678, "region_end": 0x089253B0},
    # EventScr chapter event data region (region-different JP event scripts) +
    # interleaved worldmap gmapunit sprites. lo/hi snapped to EventScr/gmapunit edges.
    "df3_eventscr_ch":   {"blob": True, "frag_prefix": "data_frontier3",
                          "region_start": 0x08A69408, "region_end": 0x08A70C88},
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


def frame_array_starts(rom, scan_lo, scan_hi, win_lo, win_hi):
    """Discover asset-start boundaries from FRAME POINTER ARRAYS. Scans [scan_lo,
    scan_hi) for every maximal run of >=3 consecutive 4-aligned words that ALL point
    into [win_lo, win_hi) (a real frame array; isolated coincidental pointer-shaped
    words are ignored), and returns the union of every pointer value in such runs that
    falls in the carve window [win_lo, win_hi). Boundaries are read LIVE from the JP
    ROM — no US addresses assumed."""
    N = len(rom)
    starts = set()
    o = scan_lo - BASE
    end = scan_hi - BASE
    while o + 4 <= min(end, N):
        x = struct.unpack_from("<I", rom, o)[0]
        if win_lo <= x < win_hi:
            run = []
            p = o
            while p + 4 <= N:
                v = struct.unpack_from("<I", rom, p)[0]
                if win_lo <= v < win_hi:
                    run.append(v)
                    p += 4
                else:
                    break
            if len(run) >= 3:
                starts.update(run)
            o = p
        else:
            o += 4
    return starts


def carve(name):
    cfg = SUBSYS[name]
    rom = open(ROM, "rb").read()

    region_end = cfg["region_end"]

    # --- derive asset start addresses ------------------------------------------
    starts = set()
    if cfg.get("blob"):
        # one identified-but-not-finely-tileable region bounded by carved/named objects:
        # the single window start is the only boundary; the body is one byte-perfect blob.
        starts = {cfg["region_start"]}
    elif cfg.get("frame_arrays"):
        slo, shi = cfg["array_scan"]
        starts = frame_array_starts(rom, slo, shi, cfg["region_start"], region_end)
    else:
        # read every index table from the JP ROM -> asset start addresses
        for tbase, nent, stride, nfld in cfg["tables"]:
            for e in range(nent):
                for f in range(nfld):
                    a = rd_word(rom, tbase + e * stride + f * 4)
                    if a == 0:
                        continue
                    if not (BASE <= a < BASE + len(rom)):
                        sys.exit(f"table {tbase:#x} entry {e} field {f} = {a:#010x} not a ROM ptr")
                    starts.add(a)

    # When region_start is set (shared/whole-ROM table), keep only the pointers
    # that fall inside the window [region_start, region_end); these are the asset
    # boundaries for THIS frontier block. When omitted (dedicated table), the
    # lowest pointer below region_end is the region start.
    region_start = cfg.get("region_start")
    if region_start is not None:
        starts = sorted(s for s in starts if region_start <= s < region_end)
        # frame_arrays: the region abuts a carved object on the low side, so the bytes
        # before the first discovered frame (a header/palette preceding frame 0) are a
        # valid blob in their own right — inject region_start as a boundary so the whole
        # window is tiled gaplessly. (Table mode keeps the strict "pointer AT start"
        # invariant: there the boundary must be a real table target.)
        if cfg.get("frame_arrays"):
            if region_start not in starts:
                starts = [region_start] + starts
        elif not starts or starts[0] != region_start:
            sys.exit("table has no pointer at region_start — window/region wrong")
    else:
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
    # The region_start must be 4-aligned (it abuts a carved object / is a real asset
    # start, so a misalignment there would force a pad and grow the ROM). Interior
    # boundaries in frame_arrays mode may be 2-aligned (TSA u16 data); they carry no
    # .align directive and are emitted contiguously, so no pad is inserted — and
    # `make compare` is the hard oracle that catches any byte drift regardless.
    if cfg.get("frame_arrays"):
        if region_start % 4:
            sys.exit("region_start is not 4-aligned — would force a pad and grow the ROM")
    elif any(a % 4 for a, _ in assets):
        sys.exit("an asset start is not 4-aligned — would force a pad and grow the ROM")
    if assets[-1][1] != region_end:
        sys.exit("last asset does not reach region_end")

    # --- subtract already-carved ranges (shared monolith + other fragments) ----
    # Fragment prefix is per-config so a later parallel agent's batch lands in its
    # OWN isolated fragment/asm namespace (data_frontier3_*) and never collides with
    # data-frontier-2's already-committed fragments. carved_ranges() still UNIONS
    # every other fragment (incl. data_frontier2) so cross-batch overlaps are
    # gap-subtracted, not double-emitted.
    prefix = cfg.get("frag_prefix", "data_frontier2")
    frag_base = f"{prefix}_{name}.tsv"
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

    if cfg.get("blob"):
        src = ("the bracketing carved/named objects (single identified blob; per-asset\n"
               "@ tiling N/A - the index structs live outside the window)")
    elif cfg.get("frame_arrays"):
        src = (f"the JP frame pointer arrays scanned in "
               f"[{cfg['array_scan'][0]:#010x}, {cfg['array_scan'][1]:#010x})")
    else:
        src = ("the JP index table(s) "
               + ", ".join(f"{tb:#010x}[{ne}]" for tb, ne, _, _ in cfg["tables"]))
    hdr = (
        f"@ {name}: region-different data not reachable by the code-literal carver\n"
        f"@ (leaf assets are unnamed US symbols). Boundaries read live from {src}\n"
        f"@ in baserom.\n"
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
