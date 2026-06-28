# Asset extraction forms (axis #6 editability) — the fe8u-parity standard

> **Why this exists (D309 correction):** "extracting" a binary blob by copying the
> `.bin` into `graphics/` and `INCBIN`-ing it there is **NOT** making the asset
> editable — the data is still opaque binary. That is cheating the editability axis.
> An asset is editable only when its committed **source** is in the form a human can
> edit (an image, a palette, a macro list, a typed struct). The expected source form
> per type is defined by **fe8u's build rules** (`../fireemblem8u/Makefile`) and its
> committed-source extensions (`git ls-files`). Match fe8u. Verified 2026-06-28.

## The form table (committed SOURCE per asset type)

| Asset type | Editable SOURCE (commit this) | Built artifact (gitignored, INCBIN'd) | fe8u rule / proof |
|---|---|---|---|
| **Pixel graphics** (1/4/8bpp tiles) | **`.png`** (open in any image editor) | `.4bpp` / `.4bpp.lz` | `%.4bpp: %.png` ; `%.lz: %` |
| **Palette** (no bit-15) | **`.pal`** (JASC text) or `.png` | `.gbapal` (gitignored) | `%.gbapal: %.pal` ; `%.gbapal: %.png` |
| **Palette** (RGB555 bit-15 set) | **`.agbpal`** (raw RGB555, committed; INCBIN'd directly) | — | JASC `.pal` is RGB888 → loses bit 15; `.agbpal` preserves it (fe8u `portrait_*.agbpal`) |
| **TSA tilemap** | **`.tsa.bin`** (binary — fe8u keeps it binary too) | `.tsa.bin.lz` | committed source in fe8u (no build rule) |
| **BG/anim tilemap** | **`.map.bin`** (binary — fe8u keeps it binary) | `.map.bin.lz` | committed source in fe8u |
| **Chapter map** | **`.S` + `tile_config.inc`** or `.mar` | `.bin` | `graphics/map/%.bin: %.S` ; `%.bin: %.mar` |
| **Event script** | **`EVENT_*` macros in `.c`** (`EAstdlib.h`) | — | `src/events/*.c` |
| **Proc script** | **`PROC_*` macros in `.c`** (`proc.h`) | — | typed `struct ProcCmd[]` |
| **Battle-anim script** | **`animscr_*.s`** macros | `.bin` | fe8u `banim/` |
| **Anim-sprite (OAM)** | **`struct AnimSpriteData[]`** / `ANIM_SPRITE` macros | — | typed C |
| **Struct table** (units/classes/…) | **typed C `struct X[]` initializer** | — | fe8u `events_udefs.c`, `data_*.c` |
| **Music** | **`.s` song assembly** / `.mid` / `.aif` | `.bin` / `.pcm` | fe8u `audio/` |
| **Text** | **`texts/*.txt` charmap** | generated `msg_data.c` | `scripts/texttools/` |

## Rules

1. **Pixel graphics → `.png`.** `tools/gbagfx X.4bpp X.png` then `X.png X.4bpp` is
   byte-exact (pixel indices round-trip regardless of the png's display palette).
   Requires a whole number of tiles (`size % 32 == 0` for 4bpp). The INCBIN points at
   the built `.4bpp`/`.4bpp.lz`, never the `.png` and never a raw `.bin`.
2. **Reuse fe8u's source.** If a JP graphics blob is byte-identical (when built) to a
   fe8u asset, commit **fe8u's `.png`/`.tsa.bin`/`.gbapal` SOURCE** and build from it —
   guarantees the same editable form fe8u ships. (`scripts/find_fe8u_reusable.py` finds
   byte-matches; pull the *source*, not the built `.bin`.)
3. **TSA/tilemap/palette `.bin` is acceptable ONLY because fe8u itself keeps them
   binary** (no more-editable source exists upstream). It is NOT a license to dump
   arbitrary data as `graphics/*.bin`.
4. **Do not fake-extract.** A blob that is not tile-aligned, has no fe8u counterpart,
   and is not a recognizable asset type is **floor** — leave it as a documented opaque
   `data/residual/*.bin` (honest) rather than renaming it into `graphics/` to dodge the
   metric. (D309: `data_08BB8ED0` was a non-tile-aligned malloc-region blob wrongly
   labeled `.4bpp`; reverted to floor.)
5. **The `make compare` byte-exact gate is necessary but not sufficient** — a `.bin`
   wrapper passes it too. Editability is judged by the SOURCE form, not the build output.

## Anti-pattern (the D309 cheat, do not repeat)

```c
// WRONG: data still binary, just moved. INCBIN of a .bin = a ".include .bin wrapper".
u8 Img_X[] = INCBIN_U8("graphics/misc/Img_X.4bpp.bin");   // committed a raw .bin
```
```
// RIGHT: commit graphics/misc/Img_X.png (editable); build produces Img_X.4bpp.
u8 Img_X[] = INCBIN_U8("graphics/misc/Img_X.4bpp");        // .4bpp built from .png
```
