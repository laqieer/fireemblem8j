#!/usr/bin/env python3
"""Per-subsystem region-different GRAPHICS carver (the ~2MB frontier).

The recursive code-literal carver (scripts/carve_data_refs.py) reaches every
region-different object that a funcmap-aligned function names with a pointer
literal — but it CANNOT reach the big graphics blobs: their leaf assets are
*unnamed* US symbols, so no code literal points straight at them. They are,
however, indexed by a per-subsystem POINTER TABLE that code *does* reference.
This carver follows that table:

    code literal / baseline_syms  ->  JP table base
    read the JP table from baserom ->  exact JP start of every asset
    sort the starts               ->  per-asset JP boundaries (gapless)
    region = [min start, table)   ->  one byte-perfect incbin under the US name

This is the `data_banim_pal` / `msg_data` template ("find the table ref in code
-> derive the boundary"), generalised to a graphics subsystem.

SUBSYSTEM PROVEN HERE: data_bg (convo/event backgrounds).
  * Index table `gConvoBackgroundData` (US `gfx_set{gfx,tsa,pal}[54]`) lives in
    eventscr2.o(.data); its JP base is pinned in layout/baseline_syms.tsv
    (gConvoBackgroundData = 0x089CD958, derived from the JP symbol map).
  * The JP ROM additionally carries a SECOND, JP-only 78-pointer table at
    0x089CDBE0 (26 extra BG entries) — found by scanning the ROM for a run of
    consecutive words pointing into the region above table-1's coverage. The
    two tables together index 166 distinct assets, gaplessly tiling
    [0x08926B14, 0x089CD958) = the whole data_bg blob.
  * The JP art is region-different (different images, LZ-compressed to different
    sizes) so US boundaries do NOT apply — every boundary here is read live
    from the JP ROM.

PARALLEL-SAFE GAP CARVING: the region is partly carved already — the small
palette/map sub-assets the recursive code-ref carver reached (its rows live in
the SHARED monolith layout/carved_rom.tsv, owned by other tasks). We must not
touch those. So this carver UNIONS every already-carved range (monolith + all
OTHER fragments, exactly like carve_data_refs.py's carved-set) and carves only
the UNCARVED gaps in [region_start, table) — i.e. the big LZ tile/gfx blobs that
no code literal names. Each gap is a byte-perfect incbin under the US symbol that
starts it (collisions disambiguated by address). The per-asset boundaries are
emitted as comments for downstream RE.

Output (isolated file domain — does NOT touch the monolith or any other task's
fragment):
    asm/gfx_data_bg.s                          (one .incbin section per gap)
    layout/carved_rom.d/graphics_data_bg.tsv   (one carved_rom row per gap)

Then:  make layout && make compare   (revert both files on any miss).
"""

import glob
import os
import re
import struct
import sys

BASE = 0x08000000
ROM = "baserom.gba"
US_SRC = "/home/laqieer/fireemblem8u/src/eventscr2.c"

# Subsystem registry. Each entry is enough to follow the index table(s) and tile
# the asset region. `tables` are (jp_base, n_words) pairs read live from the ROM.
SUBSYS = {
    "data_bg": {
        "section": ".data.data_bg",
        "symbol": "data_bg",
        # gConvoBackgroundData (54 gfx_set entries -> 162 words), JP base from
        # baseline_syms.tsv; plus the JP-only second BG table (26 entries).
        "tables": [(0x089CD958, 162), (0x089CDBE0, 78)],
        # region end = the first index table (data_bg blob is immediately
        # followed by eventscr2.o(.data) which begins with that table).
        "region_end": 0x089CD958,
        "us_names_table": US_SRC,  # gConvoBackgroundData order -> US symbol names
    },
}


def rd_word(rom, addr):
    return struct.unpack_from("<I", rom, addr - BASE)[0]


def us_convo_names(path):
    """Flat US symbol order of gConvoBackgroundData[] (gfx,tsa,pal per entry)."""
    if not os.path.exists(path):
        return []
    src = open(path).read()
    m = re.search(r"gConvoBackgroundData\[\]\s*=\s*\{(.*?)\};", src, re.S)
    if not m:
        return []
    return [p.strip() for e in re.findall(r"\{([^}]*)\}", m.group(1)) for p in e.split(",")]


def symjp_bg_names():
    """bg_* address->name annotations from sym_jp.txt (RE side-channel; used only
    to label table-2 assets, never to derive a boundary)."""
    out = {}
    if not os.path.exists("sym_jp.txt"):
        return out
    for line in open("sym_jp.txt"):
        mm = re.match(r"\s*(bg_\w+)\s*=\s*0x([0-9A-Fa-f]+)\s*;", line)
        if mm:
            out[int(mm.group(2), 16)] = mm.group(1)
    return out


def carved_ranges(exclude_basename):
    """Every [start, end) already carved in carved_rom — the shared monolith plus
    every per-task fragment EXCEPT our own (named *exclude_basename*). Mirrors
    carve_data_refs.py's carved-set union so concurrent carves never collide."""
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
                # carved_rom rows store 24-bit ROM FILE OFFSETS (addr - 0x08000000);
                # lift back to full addresses so they compare with our region bounds.
                out.append((int(f[0], 16) + BASE, int(f[1], 16) + BASE))
            except ValueError:
                pass
    return out


def carve(name):
    cfg = SUBSYS[name]
    rom = open(ROM, "rb").read()

    # --- read every index table from the JP ROM -> asset start addresses -------
    starts_in_order = []  # (addr, table_index, slot_index)
    for ti, (tbase, nwords) in enumerate(cfg["tables"]):
        for w in range(nwords):
            a = rd_word(rom, tbase + 4 * w)
            if not (BASE <= a < BASE + len(rom)):
                sys.exit(f"table {ti} word {w} = {a:#010x} is not a ROM pointer")
            starts_in_order.append((a, ti, w))

    region_end = cfg["region_end"]
    starts = sorted(set(a for a, _, _ in starts_in_order))
    if any(a >= region_end for a in starts):
        sys.exit("an asset start is at/after region_end — table coverage wrong")
    region_start = starts[0]

    # --- name each asset (cosmetic; the carve is one opaque section) -----------
    us1 = us_convo_names(cfg["us_names_table"])
    symjp = symjp_bg_names()
    p1 = [rd_word(rom, cfg["tables"][0][0] + 4 * i) for i in range(cfg["tables"][0][1])]
    addr_name = {}
    for nm, a in zip(us1, p1):                       # table-1: authoritative US names
        addr_name.setdefault(a, nm)
    for a, ti, slot in starts_in_order:              # table-2: sym_jp or synthesised
        if a in addr_name:
            continue
        if a in symjp:
            addr_name[a] = symjp[a]
        else:
            kind = ["tiles", "map", "palette"][slot % 3]
            addr_name[a] = f"bg_convo2_{slot // 3:02d}_{kind}"

    # --- per-asset boundaries (must tile the region gaplessly) -----------------
    assets = []
    for i, a in enumerate(starts):
        end = starts[i + 1] if i + 1 < len(starts) else region_end
        if end <= a:
            sys.exit(f"non-positive asset size at {a:#010x}")
        assets.append((a, end, addr_name.get(a, f"bg_{a:08X}")))
    if not all(assets[i][1] == assets[i + 1][0] for i in range(len(assets) - 1)):
        sys.exit("region is NOT gapless — refusing to carve (would risk padding)")
    if any(a % 4 for a, _, _ in assets):
        sys.exit("an asset start is not 4-aligned — would force a pad and grow the ROM")

    # --- subtract already-carved ranges (shared monolith + other fragments) ----
    sec = cfg["section"]
    sym = cfg["symbol"]
    frag_base = f"graphics_{name}.tsv"
    carved = sorted(
        (max(s, region_start), min(e, region_end))
        for s, e in carved_ranges(frag_base)
        if not (e <= region_start or s >= region_end)
    )
    # merge carved intervals, then walk the asset boundaries emitting only the
    # UNCARVED sub-spans (snapping each sub-span to whole-asset edges so a row is
    # always a clean asset-aligned blob, never a partial split of one carved row).
    merged = []
    for s, e in carved:
        if merged and s <= merged[-1][1]:
            merged[-1] = (merged[-1][0], max(merged[-1][1], e))
        else:
            merged.append((s, e))

    def is_carved(lo, hi):
        return any(not (hi <= s or lo >= e) for s, e in merged)

    rows = []      # (start, end, secname, asset_name)
    bodies = []    # asm section text
    gap_i = 0
    for a, e, nm in assets:
        if is_carved(a, e):
            # this asset (palette/map) is already a carved row elsewhere — skip,
            # but assert it is FULLY carved so we never leave a sliver behind.
            if not all(is_carved(x, x + 1) for x in (a, e - 1)):
                sys.exit(f"asset {nm} {a:#010x}..{e:#010x} only PARTIALLY carved")
            continue
        secname = f"{sec}.gap{gap_i}"
        safe = re.sub(r"\W", "_", nm)
        label = f"gfx_{name}_{gap_i:03d}_{safe}"
        bodies.append(
            f'\t.section {secname}, "a", %progbits\n'
            f"@ {name} asset {nm}: region-different graphics, JP {a:#010x}..{e:#010x} "
            f"({e - a} B); not code-named, table-pinned; byte-perfect incbin.\n"
            f"\t.global {label}\n{label}:\n"
            f'\t.incbin "{ROM}", 0x{a - BASE:X}, 0x{e - a:X}\n'
        )
        rows.append((a, e, secname, nm))
        gap_i += 1

    if not rows:
        print(f"{name}: nothing left to carve (region fully covered already)")
        return

    hdr = (
        f"@ {name}: region-different graphics blobs not reachable by the code-literal\n"
        f"@ carver (leaf assets are unnamed US symbols). Boundaries read live from the\n"
        f"@ JP index table(s) "
        + ", ".join(f"{tb:#010x}[{nw}]" for tb, nw in cfg["tables"])
        + f" in baserom.\n"
        f"@ Region [{region_start:#010x}, {region_end:#010x}); the small palette/map\n"
        f"@ sub-assets are already carved in the shared monolith, so only the big\n"
        f"@ LZ tile/gfx gaps are emitted here.\n\n"
    )
    open(f"asm/gfx_{name}.s", "w").write(hdr + "\n".join(bodies))

    frag = os.path.join("layout", "carved_rom.d", frag_base)
    os.makedirs(os.path.dirname(frag), exist_ok=True)
    with open(frag, "w") as f:
        f.write("# carve_graphics_subsys.py per-subsystem region-different graphics (parallel-safe fragment)\n")
        for s, e, secname, nm in sorted(rows):
            f.write(
                f"{s & 0xFFFFFF:06X}\t{e & 0xFFFFFF:06X}\tasm/gfx_{name}.o({secname})\t"
                f"{name} {nm} region-diff graphics ({e - s} B, table-pinned)\n"
            )

    tot = sum(e - s for s, e, _, _ in rows)
    print(
        f"carved {name}: {len(rows)} uncarved graphics gaps in "
        f"[{region_start:#010x}, {region_end:#010x}), {tot} B ({tot // 1024} KB)"
    )
    print(f"  -> asm/gfx_{name}.s, {frag}")


def main():
    targets = sys.argv[1:] or ["data_bg"]
    for t in targets:
        if t not in SUBSYS:
            sys.exit(f"unknown subsystem {t!r}; known: {sorted(SUBSYS)}")
        carve(t)


if __name__ == "__main__":
    main()
