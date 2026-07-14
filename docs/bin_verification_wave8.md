# `.bin` reducibility verification (wave 8) — the honest split of the 642 heuristic-MISS

> **HISTORICAL/SUPERSEDED WAVE SNAPSHOT (2026-06-30).** This entire document,
> including the approximate 190-item list and its wave assignments, is retained
> only as verification history and must not be used for dispatch. Current
> binary-form status is generated in [`docs/bin_audit.md`](bin_audit.md);
> [`docs/frontier.md`](frontier.md) is the sole source of current work.

**2026-06-30.** Goal: *"no `.bin` kept if it is not `.bin` in fe8u."* After wave 7 (1981
tracked `.bin`), `scripts/audit_bin_forms.py` (a **name-class heuristic**) reported MISS 642 /
FLOOR 978 / UNCERTAIN 361. **642 is an UPPER BOUND, not a work-list** — it flags any blob that
merely *has* an editable fe8u twin, without verifying bit-exact round-trippability. Four
read-only verifiers (one per category) ran the decisive per-blob tests (gbagfx round-trip at
every `-mindist`; "decodes to real tile pixels, not TSA/pointer-tables"; the fe8u-commits-this-
bin-too oracle). Result: the real reducible work is **~190**, not 642 — the rest is classifier
inflation (TSA suffix dropped, loose `frontier_*` regex, `.bin.lz`-at-parity miscounted,
cross-lane double-counting) and genuine floor.

## True split by category

| Heuristic category | MISS | **Reducible** | At-parity | **Floor** | Inflation cause |
|---|---|---|---|---|---|
| pixel-gfx | 231 | 14 (6 `.png` + 8 `.agbpal`) | — | 217 | dropped `.tsa.bin` suffix → 149 TSA mislabeled; 51 unitdef ptr-tables; 8 JP-LZ; 9 non-tile |
| battle-anim | 194 | ~67 (59 `.s` + 8 `.png`) +~20 | 48 `.bin.lz` | 55 (47 JP-LZ + 8 tilemap) | `.bin.lz` rebuilt-source counted MISS; carve-region name ≠ content |
| menu-strings | 137 | 14 strings (+~40–60 typed-C, data lane) | — | ~60 | loose `frontier_*(menu\|uistuff\|ending\|fontgrp)` catch-all regex |
| unitdef-residuals | 47 | 47 typed-C | — | 0 | catch-all misnomer (any unmatched `src/data/*.c`) |
| map-tilemaps | 29 | 0 | — | 29 (28 already-reduced `_ref.c`, 1 `ObjectType9` JP-LZ) | symbol-name collision; de-pointering inputs counted as debt |
| sound (vg+m4a) | 5 | 1 (`rom_header` slice) | — | 4 voicegroup | `rom_header_080000C0` misclassed m4a; voicegroup true ceiling = 2 |

## Historical reducible list (~190, by form) — superseded wave-8 evidence

- **typed-C INCBIN→struct/array swaps (48, byte-neutral, no cascade):** `PopupScr_*`(6, JP popup
  enum per `ParsePopupInstAndGetLen.c`), `MuSoundScr_*`(7, fe8u `mu.c`), `gBattleparse_0..9`(10,
  `banim-battleparse.c`), `gEfx*`(12), `gEkrgauge_*`(9, `data-ekrgauge.c`), `gMapanimLevelup_0`,
  `EventListScr_Ch15b_Location`, + `rom_header_080000C0.bin` → `src/rom_header.s`. **[wave-8 w8-typedc]**
- **pixel-gfx → `.png` (6):** `gGenericIcon_6`, `frontier_df3_btl_bg_000/001`,
  `frontier_map_objtype_000/001/002` (raw-4bpp, JP-only fresh extraction; pin true tile width). **[w8-pixelgfx]**
- **palettes → `.agbpal` (8):** `Pal_LinkArenaWarpFx`, `Pal_MapAnim*` (6 reusable from fe8u `.agbpal`). **[w8-pixelgfx]**
- **menu-strings → C literals (14):** 2 orphan `MenuItems_SioMenudef_*` git-rm, `internalName` pool
  (`misc_lo_017`), 8 efx ProcScr name pools (`misc_lo_005..012`), 2 mixed SJIS (`misc_lo_004/021`). **[w8-strings]**
- **banim → `.s` ANIM_SPRITE (59) + `.png` (8) + ~20 uncertain:** residual `frontier_*banim*/` OAM/
  frame-ptr tables (fe8u keeps these as `.s` macros). Needs the ANIM_SPRITE disassembler. **[wave-9]**
- **unitdef REDA tails (45):** `frontier_df3_unitdef_b.c` `_residue`(26)/`_tail`(14)/`_gap`(5) via
  wave-3-style REDA-extraction (carve embedded `struct REDA[]` → named `REDAs_*[]` → type the
  leading `UnitDefinition[]` at addend-0). A real but doable cascade. **[wave-9]**

## At-parity — reclassify in the audit, NOT work (48)

The 48 banim `.bin.lz` are committed **decompressed** and gbagfx recompresses them byte-exact at
the pinned `-mindist` — they are a *rebuilt editable source*, not a raw kept blob. fe8u keeps the
analogous tilemaps as `.map.bin` anyway, so this is at fe8u form-parity. The audit must move these
from MISS → "rebuilt/at-parity."

## Genuine floor (~330–400) — document, do NOT fake-extract

- **TSA tilemaps ~185** (149 pixel `gTsa_*`/`*_map` + 8 banim + 28 map `_ref.c` pointees): fe8u
  commits every one as `*.tsa.bin`/`*.map.bin` (binary). Project asset-discipline floor; the real
  pixel tiles in these dirs are already `.png`. The fe8j extractor **dropped the `.tsa.bin` suffix**,
  which is why the audit mislabeled them image-like — fix the classifier to detect TSA by content.
- **genuine-JP-LZ ~58** (47 banim + 8 pixel + `ObjectType9` + 2 chap_title): byte0=0x10 GBA LZ77;
  gbagfx decompresses fine but **recompress ≠ ROM at every `-mindist`** — the JP ROM used a
  different LZ encoder. No editable source reproduces them byte-exact. (Honest nuance: fe8u keeps
  the *same sheets* as `.png` — this is an **irreducibility** floor, not a fe8u-also-bin floor.
  Only path to reduce: teach gbagfx the exact JP mindist/match variant. Out of scope.)
- **voicegroup ceiling 4** (true RE ceiling = 2: `frontier_df3_voicegroup_000` 56B keysplit ptr
  array + `_001` 537B misaligned vg035 tail; + 2 `df4_voice` gap-residue). Documented `docs/sound.md`.
- **JP-opaque / Link-Arena ~60+**: `frontier_df4_uistuff/menu/ending` pointer/jump tables, font
  glyph-metric tables, CG images — JP-divergent multiplayer assets with no fe8u twin.

## Classifier bugs to fix in `scripts/audit_bin_forms.py`

1. **TSA detection by content** (16-bit tile-idx+pal structure / `gTsa_*`/`Tsa_*`/`*_map` names),
   not just the `.tsa.bin` suffix the fe8j extractor dropped → reclassifies ~149 pixel-gfx → FLOOR.
2. **Tighten the `frontier_*` catch-all** menu/uistuff/ending/fontgrp regex (it mislabeled 135 as
   menu-strings; real string pools ≈ 12, all in `frontier_df4_misc_lo`).
3. **`.bin.lz`-at-parity class** — a committed-decompressed blob that gbagfx recompresses byte-exact
   is a rebuilt source, not MISS.
4. **Rename the `unitdef-residuals` catch-all** + stop counting de-pointered `_ref.c` inputs
   (`map-tilemaps`) as debt + fix the `voicegroup-tail` over-count (2 not 4) + the `rom_header`
   m4a misclassification.

After these fixes the audit MISS will reflect the real ~190 reducible (then shrinking as waves 8–9
land), and FLOOR will correctly own the TSA/JP-LZ/JP-opaque set.
