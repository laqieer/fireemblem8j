# FE8J Data-Axis Target Map (CTO scout — 2026-06-13, loop iter2)

Axis 3 "Extracted data" = **3.51%** (489,492 / 13,938,060 B). The ~13.4 MB un-extracted lives
in committed-but-opaque `data/*.bin` (named `.incbin` is NOT extraction — `calcprogress.py` excludes it).
This map tiers the remainder by **(volume × confidence × risk)** so each P9-Soil wave hits the right target.

`du`: `data/residual` **21 M** (bulk) · `data/banim` **4.5 M** · `data/sound` **1.9 M**.

## Tier 1 — Structured game-data tables → typed C  (CONFIDENCE: high · VOLUME: low ~94 KB · RISK: low)
97 `g*Data`-style tables, **93.7 KB total**. Region-**same** layout (engine struct), fe8u has the typed-C form.
The `m4a_tables.c` / `data_classes.c` pure-const-array lever. **Best as the fastest byte-perfect round-trip PROOF**
(no palette/compression/JP-mismatch risk) + a quality + slight data/named gain. Headline targets:
| asset | KB | fe8u ref |
|---|---|---|
| `gCharacterData.bin` | 13.0 | `CharacterData` struct in `bmunit.c`; table in `data_classes.c` |
| `gClassData.bin` | 10.4 | `ClassData` struct; `data_classes.c` |
| `gTacticianTextConf.bin` | 5.1 | tactician config |
| `gSupportTalkList.bin` | 1.3 | support list |
| `gUnitActionMenuItems.bin` | 1.1 | menu item table |
| `gWMNodeData.bin` | 0.9 | worldmap node table |
| (+91 more `g*` tables) | ~60 | various |
NOTE pointers inside JP tables are JP addresses — the typed C references them; bytes stay identical.

## Tier 2 — Graphics → gbagfx PNG/.pal  (CONFIDENCE: med · VOLUME: HIGH · RISK: med — JP≠US mapping)
**The % mover.** btl_bg tiles (`btl_bg_*_tiles.bin`, ~50 × 9–10 KB), `gWorldmapGmap_0.bin` (75 KB), `gTsa_*`
(TSA maps), `gAnimCharaPal*` / `g*Pal*` (palettes), `gGfx_*`, `gUiFrameImage`. → `tools/gbagfx` (fe8u has it).
**P9-Soil PRIMARY.** Risk: JP font/text/compression/palette ordering may differ from US — byte-perfect pilot required.

## Tier 3 — Sound → m4a/aif  (VOLUME: 1.9 M · RISK: med)
`frontier_df3_voicegroup_*` (voicegroups, 25/13 KB), other `data/sound/*.bin`. `tools/aif2pcm` exists (439 .aif
already extracted per D36). Residual = voicegroup/songtable structure.

## Tier 4 — Opaque address-named  (DEFER — no known structure)
`data_08BB8E94.bin` (42.9 KB), `data_08FE0000.bin` (16 KB), other `data_08*.bin`. Unclassified; classify before extract.

## Tier 5 — banim (battle animation)  (VOLUME: 4.5 M · RISK: high)
`gConstDataBanim*`, banim OAM. `scripts/extract_banim_oam.py` exists. Large, structured-but-gnarly.

## CTO read
- **Volume** is dominated by **Tier 2 (graphics) + Tier 5 (banim)** → Soil's graphics focus is the right %-mover.
- **Tier 1 (tables)** is the **fastest/safest GO proof** + quality; small % but unblocks "can ANY asset round-trip?".
- **P9↔P9 interface:** Tier-1 tables a FAR fn reads (msgid/label/const tables) unblock P9-Grind's data-table-blocked
  matching-C functions → prioritize those tables for double-yield (data axis + matching-C axis).
