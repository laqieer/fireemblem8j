# gbagfx — graphics + LZ77/RL (de)compression for the FE8J asset pipeline

[gbagfx](https://github.com/pret/pokeemerald/tree/master/tools/gbagfx) (pret's
GBA graphics tool, originally YamaArashi's) is **THE critical Phase-0 asset
tool**. It converts the committed editable source (PNG / JASC `.pal`) into the
raw GBA bytes the ROM actually contains, and it does the GBA LZ77 / RL
(run-length) (de)compression that FE8 uses for most graphics. Every graphics
region we extract — i.e. the bulk of the 94%-data front — depends on it.

We vendor the **US decomp's** gbagfx (`../fireemblem8u/tools/gbagfx`), the exact
copy FE8U byte-matches its LZ assets with. The C is identical across pret
projects, but the US copy is the one whose LZ compressor (with the `-mindist`
knob) was proven against the GBA Fire Emblem ROMs.

## Why it matters: baserom out of the build graph

The real definition of "decomp complete" (see
`docs/decomp-completion-standard.md`) is that the ROM rebuilds **byte-for-byte
from committed source with `baserom.gba` removed**. Today ~83% of the ROM is
`.incbin "baserom.gba"`. gbagfx is what lets a graphics region instead build as:

```
graphics/.../foo.png  (committed source)
   --gbagfx-->  foo.4bpp  --gbagfx -mindist N-->  foo.4bpp.lz  --.incbin-->  ROM
```

with `baserom.gba` never in the chain. Proven for the pilot below.

## Setup

```bash
scripts/tools/gbagfx/setup.sh
```

Idempotent. Stages the C source from `../fireemblem8u/tools/gbagfx` (override
with `FE8U=/path`; falls back to cloning pret upstream), builds with
`gcc -O2 -lpng -lz`, and runs an LZ round-trip smoke test. Build dep:
`libpng-dev zlib1g-dev pkg-config`. The built binary lands in the **gitignored**
`tools/gbagfx/gbagfx`; the setup script + this doc are tracked.

## Command reference (the ones we use)

Bit depth is taken from the file extension. gbagfx picks the handler from the
`(input ext, output ext)` pair:

| Direction | Command |
|---|---|
| decode tiles → PNG | `gbagfx x.4bpp x.png -width <tiles>` |
| encode PNG → tiles | `gbagfx x.png x.4bpp` |
| palette JASC `.pal` → `gbapal` | `gbagfx x.pal x.gbapal` |
| palette `gbapal` → JASC `.pal` | `gbagfx x.gbapal x.pal` |
| LZ77 **compress** | `gbagfx x.bin x.lz -mindist <N>` |
| LZ77 **decompress** | `gbagfx x.lz x.bin` |
| RL **compress** / decompress | `gbagfx x.bin x.rl` / `gbagfx x.rl x.bin` |

`-width` on a decode is in **tiles** (8px each): a 16px-wide image is `-width 2`.
On an encode, width is inferred from the PNG.

## `-mindist`: the byte-exactness knob

gbagfx's LZ77 is a greedy matcher. `-mindist` is the **minimum back-reference
distance** it will emit (default **2**, for `LZ77UnCompVram` compatibility).
The original FE8 compressor sometimes used a different minimum, so the rebuilt
`.lz` is byte-identical **only at the right `-mindist`**. You discover it by
trial: decompress the ROM blob, re-encode, recompress at `-mindist 1/2/3`, and
diff against the original blob. Pin the winner in the Makefile per asset:

```make
graphics/misc/Img_MenuScrollBar.4bpp.lz: LZ_FLAGS := -mindist 2
```

## Makefile rules

The generic rules (in the root `Makefile`) drive everything automatically:

```make
%.4bpp: %.png   ; $(GBAGFX) $< $@
%.8bpp: %.png   ; $(GBAGFX) $< $@
%.gbapal: %.pal ; $(PAL2GBAPAL) $< $@
%.lz: %         ; $(GBAGFX) $< $@ $(LZ_FLAGS)
%.rl: %         ; $(GBAGFX) $< $@
```

Build intermediates (`*.4bpp *.8bpp *.gbapal *.lz *.rl`) are **gitignored** and
regenerated; only the PNG/`.pal` source is committed. `make clean` removes them
with `git clean -Xf` (so committed assets like `graphics/debug_font.4bpp.h` are
preserved).

## Extraction recipe (ROM blob → committed source) — the Phase-1 loop

For an LZ-compressed graphic at ROM file offset `OFF`, length `LEN`:

```bash
# 1. carve the original blob out of the ROM (verification copy only)
python3 -c "open('blob.lz','wb').write(open('baserom.gba','rb').read()[OFF:OFF+LEN])"
# 2. decompress -> raw tiles
tools/gbagfx/gbagfx blob.lz blob.4bpp
# 3. tiles -> PNG (choose -width so the image reads correctly), COMMIT the PNG
tools/gbagfx/gbagfx blob.4bpp graphics/.../Name.png -width <tiles>
# 4. prove the round-trip: PNG -> tiles -> lz at each -mindist, diff vs blob.lz
for md in 1 2 3; do
  tools/gbagfx/gbagfx graphics/.../Name.png /tmp/re.4bpp
  tools/gbagfx/gbagfx /tmp/re.4bpp /tmp/re.lz -mindist $md
  cmp -s blob.lz /tmp/re.lz && echo "mindist $md MATCHES"
done
```

Then commit the PNG, point the object's `.incbin` at the **rebuilt**
`Name.4bpp.lz`, pin the matching `-mindist`, and `make compare` must stay `OK`.

## Pilot (proven): `Img_MenuScrollBar`

The first FE8J region reproduced from a committed source asset instead of
`.incbin "baserom.gba"`:

- **Asset:** the menu scroll-bar UI graphic, **16×64, 4bpp**.
- **JP ROM:** file offset `0x00A9645C`, length `0xA0` (160 bytes, LZ77).
- **Source:** `graphics/misc/Img_MenuScrollBar.png` (extracted from the JP ROM).
- **Object:** `asm/dat_worldmap_gmapunit_p1598.s` now does
  `.incbin "graphics/misc/Img_MenuScrollBar.4bpp.lz"` (was baserom).
- **`-mindist`:** **2** (gbagfx default). Decompressed size is 512 B → 160 B LZ.
  Sweep result: `mindist 1` produced 160 B but **different bytes**, `mindist 3`
  produced 164 B, and **`mindist 2` is byte-exact** vs the original ROM blob.
- **Proof:** the object built with `baserom.gba` **moved away** yields the exact
  160 original ROM bytes; `make compare`, `make clean && make compare`, and
  `make check` all pass.

This proves the whole loop — `png → 4bpp → lz → incbin → ROM` reproduces exact
bytes with baserom out of the loop. The same recipe scales to the ~3,400 LZ
graphics still incbin'd from the ROM.

## Phase-1 batch 1 (proven at scale): item icons + unit-icon WAIT sheets

The first scaled extraction, driven by **`scripts/extract_graphics.py`** (point it
at a `dat_*.s` graphics file + the matching US `graphics/` dir; it ports the US
committed source by symbol name, sweeps `-mindist` 1/2/3 per LZ asset, byte-verifies
each entry against the ROM, rewrites the incbins, and prints the per-asset pins).

Both regions are **region-SAME** (JP bytes == US bytes), so the US committed PNG /
`.agbpal` *is* the JP source — no fresh extraction needed.

**`asm/dat_data_item_icon.s` — 224 item icons + 1 palette (region-same, UNCOMPRESSED).**
- 224 × `graphics/item_icon/*.png` → `*.4bpp` (16×16, 4bpp, `0x80` B each), **no LZ,
  no `-mindist`** (the sheet is stored uncompressed in ROM).
- `item_icon_palette.agbpal` (`0x40` B) is a **committed binary**, incbin'd verbatim.
- Removes **28,736 B** of baserom incbin (225 directives).

**`asm/dat_const_data_unit_icon_wait.s` — 107 map-sprite sheets (region-same, LZ77).**
- 107 × `graphics/unit_icon/wait/*.png` → `*.4bpp` → `*.4bpp.lz` (variable size).
- **`-mindist` is per-asset:** **95 sheets use the default 2**; **12 need 1**
  (`Archer`, `Archer_F`, `Sage`, `Pirate`, `Monk`, `Necromancer`, `Bonewalker`,
  `Wight`, `Wight_Bow`, `Peer`, `Prince`, `Unk77` — pinned in
  `graphics/unit_icon/unit_icon.mk`). The default (2) is left implicit; only the 12
  mindist-1 overrides are written out.
- Removes **37,588 B** of baserom incbin (107 directives).

Both pass `make check`, `make compare`, `make clean && make compare`, and the
build-with-`baserom.gba`-moved-away spot check (the `.4bpp`/`.4bpp.lz` regenerate
byte-identical to the ROM from the committed PNGs alone). Self-containment rose
16.96% → 17.35% (−66,324 baserom bytes, −332 incbin directives).

## Parallel-safe `-mindist` pins: per-subsystem `graphics/**/*.mk`

The per-asset `LZ_FLAGS := -mindist N` overrides and the object→generated-asset
dependencies used to live **inline in the root Makefile**, so every graphics
extraction edited that one shared file — guaranteed merge conflicts when several
extraction agents run concurrently. They now live in a **tracked `*.mk` per
graphics subsystem**, auto-collected by the root Makefile:

```make
GRAPHICS_MK := $(shell find graphics -name '*.mk' 2>/dev/null)
-include $(GRAPHICS_MK)
```

(`find`, not `wildcard graphics/**/*.mk` — GNU make does **not** expand the `**`
globstar.) Each `graphics/<subsystem>/<subsystem>.mk` carries, for that subsystem
only: its `graphics/.../x.4bpp.lz: LZ_FLAGS := -mindist N` pins, and its
`asm/<file>.o: <generated assets>` deps (so the `.4bpp[.lz/.fk]` is rebuilt from
the committed PNG/`.pal` before the `.s` that `.incbin`s it is assembled).

**A new extraction batch adds a NEW file under its `graphics/<subsystem>/` dir and
never touches the root Makefile** — so many graphics agents can run in parallel
with zero pin/dep conflicts. Existing pins (pilot `Img_MenuScrollBar`, item icons,
unit-icon WAIT) were migrated into `misc.mk`, `item_icon.mk`, `unit_icon.mk`.

## `.fk` (FE "fake compression") format

Some graphics (notably portrait **tilesets**) are marked compressed in the ROM but
stored **raw** under a 4-byte little-endian header `(len(raw)+4) << 8` (low byte 0 =
comp-type "uncompressed"), then the raw 4bpp bytes verbatim. The Makefile rule
mirrors `../fireemblem8u`'s `%.fk: %`:

```make
%.fk: %
	$(PYTHON) -c "import sys,struct;d=open(sys.argv[1],'rb').read();open(sys.argv[2],'wb').write(struct.pack('<I',(len(d)+4)<<8)+d)" $< $@
```

So a tileset builds `png → 4bpp → 4bpp.fk → .incbin → ROM`. `extract_graphics.py`
tries uncompressed `.4bpp`, then `.4bpp.fk`, then LZ at `-mindist` 1/2/3, and picks
the one that byte-matches the ROM blob. `*.fk` is a gitignored build intermediate.

## Phase-1 batch 2 (proven at scale): portraits + unit-icon MOVE sheets

**`asm/dat_data_portrait.s` — 482 portrait assets, region-SAME (JP 0x08861950 ==
US 0x0880d3f8), wired via `graphics/portrait/portrait.mk`.** Per asset class:
`*_palette` → committed `.agbpal` (159, verbatim); `*_mouth` → `.4bpp` (90,
uncompressed); `*_chibi` → `.4bpp.lz` (86); `*_card` → `.4bpp.lz` (57); `*_tileset`
→ `.4bpp.fk` (90). **All LZ assets use gbagfx's default mindist 2 → zero per-asset
pins.** 482 committed sources (323 PNG + 159 `.agbpal`). Removes **~755 KB** of
baserom incbin (482 directives).

**`asm/dat_const_data_unit_icon_move_p*.s` — 82 MOVE map-sprite sheets across 80
objects (region-SAME, LZ77, all mindist 2), wired via `graphics/unit_icon/unit_icon.mk`.**
The **14 region-DIFFERENT** sheets (`Hero`, `Swordmaster`, `General`, `Bishop`,
`Cyclops`, `Draco_Zombie`, the Master-Lords, `Journeyman_T2`, the F-variants, …) and
the **2** `Bard_motion`/`Dancer_motion` symbols with no matching US asset are LEFT as
`.incbin "baserom.gba"` — honest. Removes **~71 KB** of baserom incbin (82 directives).

Both pass `make check`, `make compare`, and `make clean && make compare` (all assets
regenerate byte-identical from the committed PNGs/`.agbpal` alone). Self-containment
rose **17.35% → 22.28%** (−826,532 baserom bytes, −564 incbin directives).
