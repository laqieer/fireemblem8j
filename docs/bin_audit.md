# `.bin` form audit — FE8J asset-editability epic (U0)

> **Generated** by `scripts/audit_bin_forms.py` — do not edit by hand.
> Re-run `python3 scripts/audit_bin_forms.py` from the repo root to refresh.
> Living **miss-tracker** for the epic ([`docs/epic_asset_editability_shiftability.md`](epic_asset_editability_shiftability.md)).

## Method (reviewable)

For every committed `*.bin` in fe8j (`git ls-files '*.bin'`), classify against
the **fe8u oracle** (`git -C ../fireemblem8u ls-files`):

- **MISS** — fe8u builds the *same* asset from a **more-editable source**
  (`.png` / `.s` / `.mid` / `.aif` / `.pal`/`.agbpal` / typed-C in `src/data`).
  Committing a raw `.bin` here is a regression to fix.
- **FLOOR** — fe8u *also* keeps this asset binary (`*.tsa.bin`, `*.map.bin`, the
  `fe6sio_payload`, `graphics/banim/efx*` effect bins, `op_anim`/`opanim` tilemaps,
  `direct_sound` PCM). Legitimate; **do not fake-extract** floor.
- **UNCERTAIN** — opaque blob (`ApConf_*`/`gUnkData_*`/`gap_*`/`data_<addr>`) whose
  fe8u source form is not yet known. Needs RE; **DEFERRED** — document, don't fake.

Layered rules (first match wins): (1) FLOOR by `.tsa.bin`/`.map.bin`/`.fetsa3.bin`
suffix; (2) FLOOR by `efx*`/`op_anim`/`direct_sound` directory; (3) MISS/FLOOR by a
fe8u file of the same **basename** (address/`_o`/`_bin` suffixes stripped) — an
editable-extension twin ⇒ MISS (that fe8u path is the proof), a `.bin` twin ⇒ FLOOR;
(4) MISS/UNCERTAIN by **content-type name-class** for fe8j ROM-region-named blobs
whose fe8u form is known by *type* even when the basename differs (e.g.
`frontier_chap_title_*` → fe8u `.png`; `frontier_df4_misc_lo_*` → C string literals).

> The fe8u oracle commits exactly **1382** binaries, all `*.tsa.bin` / `*.map.bin` / the `fe6sio_payload` — so any fe8j `.bin` with an editable fe8u twin is a true MISS.

## Summary

| Category | Count | % of .bin |
|---|---:|---:|
| **MISS** | 178 | 9.7% |
| **FLOOR** | 1176 | 64.4% |
| **UNCERTAIN** | 473 | 25.9% |
| **TOTAL** | 1827 | 100.0% |

## Category breakdown (epic plan's audit findings vs. this run)

| Category | Verdict | Count (this run) | fe8u editable form |
|---|---|---:|---|
| battle-anim | MISS | 99 | fe8u 202 editable banim/*.s (compressing linker) |
| pixel-gfx | MISS | 15 | fe8u graphics/**/*.png |
| sound-m4a-tables | MISS | 1 | fe8u sound/music_player_table.s etc. |
| voicegroup-tail | MISS | 4 | fe8u sound/voicegroups/*.s (documented ceiling) |
| menu-strings | MISS | 11 | fe8u C literals (src/menu_def.c) |
| unitdef-residuals | MISS | 47 | fe8u src/events_udefs.c typed C |
| map-tilemaps | MISS | 1 | fe8u graphics/map/*.S / *.png (MARTOMAP) |
| TSA/.map.bin | FLOOR | 1027 | fe8u keeps TSA/tilemaps binary too |
| PCM/.aif | FLOOR | 0 | fe8u direct_sound PCM binary (floor here) |
| opanim-tilemaps | FLOOR | 116 | fe8u op_anim/opanim tilemaps binary |
| efx-effect-bins | FLOOR | 33 | fe8u graphics/banim/efx* binary |
| ApConf/opaque | UNCERTAIN | 473 | fe8u form unclear — DEFERRED, needs RE |

## Spot checks (hand-verified)

Five+ MISS and five+ FLOOR entries verified by hand so the classification is
trustworthy (the prior research over-flagged `frontier_chap_title` images and
`frontier_df4_misc_lo` strings as floor — both are MISSES; this audit lists them
under MISS, asserted by the self-test guards below).

**MISS spot checks** (fe8u ships an editable source):

- `data/residual/ObjectType9.bin` → **MISS** (map-tilemaps) — proof: fe8u graphics/map/ObjectType9.png
- `data/residual/gEfxlvupfx_0.bin` → **MISS** (unitdef-residuals) — proof: fe8u typed C table / gfx (worldmap/mapanim/menu data)
- `data/residual/gTitlescreen_0.bin` → **MISS** (pixel-gfx) — proof: fe8u graphics/**/*.png (named gfx)
- `data/residual/rom_header_080000C0.bin` → **MISS** (sound-m4a-tables) — proof: fe8u src/rom_header.s
- `data/sound/frontier_df3_voicegroup_000_1F70E8.bin` → **MISS** (voicegroup-tail) — proof: fe8u sound/voicegroups/*.s (voicegroup tail; documented ceiling)
- `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_004_7738F0.bin` → **MISS** (battle-anim) — proof: fe8u banim/*.png + banim/*.s

**FLOOR spot checks** (fe8u also keeps binary):

- `data/residual/gBattleForecast_0.bin` → **FLOOR** (TSA/.map.bin) — proof: fe8u also keeps binary: graphics/misc/gBattleForecast_0.tsa.bin
- `graphics/banim/efxbattle/TsaConf_BanimTmA1.map.bin` → **FLOOR** (efx-effect-bins) — proof: fe8u keeps .map.bin binary (TSA/tilemap)
- `graphics/opanim/OpAnimCharacterBG.map.bin` → **FLOOR** (opanim-tilemaps) — proof: fe8u keeps .map.bin binary (TSA/tilemap)
- `data/residual/gBattleForecast_1.bin` → **FLOOR** (TSA/.map.bin) — proof: fe8u also keeps binary: graphics/misc/gBattleForecast_1.tsa.bin
- `data/residual/gBattleForecast_2.bin` → **FLOOR** (TSA/.map.bin) — proof: fe8u also keeps binary: graphics/misc/gBattleForecast_2.tsa.bin
- `data/residual/gEndingDetails_0.bin` → **FLOOR** (TSA/.map.bin) — proof: fe8u also keeps binary: graphics/misc/gEndingDetails_0.tsa.bin

**Self-test guards** (the script exits non-zero if any fail):

- `frontier_chap_title_*` is classified **MISS** (chapter-title gfx → fe8u `.png`), not FLOOR.
- `frontier_df4_misc_lo_*` is classified **MISS** (string pools → fe8u C literals), not FLOOR.
- `*.tsa.bin` and `*.map.bin` are classified **FLOOR** (fe8u keeps them binary).
- `Tsa_`/`gTsa_`-named and `*_map.bin` blobs are classified **FLOOR** (TSA/tilemaps; fe8u keeps them binary even when the fe8j extractor dropped the `.tsa.bin` suffix — bug #1).
- `graphics/gfx_data_bg/*_map.bin` BG tilemaps are classified **FLOOR** (→ fe8u `bg_*.tsa.bin`).
- `graphics/frontier_df4_uistuff/*` is classified **UNCERTAIN** (JP-divergent UI table, no fe8u twin — not a string-pool MISS; bug #2).
- `graphics/banim/efx*` effect bins are classified **FLOOR**.
- `data/sound/gMPlayTable.bin` is classified **MISS** (→ fe8u `sound/music_player_table.s`).
- 30x20 u16 banim/bg **screen tilemaps** (600 entries, valid tile idx, dominant fill) are classified **FLOOR** by content — fe8u keeps banim/bg tilemaps binary (`assets/tsa/*.map.bin`); the fe8j extractor named them generically without the `.tsa.bin` suffix (D326).

## MISS (178) — fe8u builds these from editable source — fix (extract to the fe8u form).

<details><summary>178 entries</summary>

| `.bin` (fe8j) | category | fe8u-source proof |
|---|---|---|
| `data/residual/ObjectType9.bin` | map-tilemaps | fe8u graphics/map/ObjectType9.png |
| `data/residual/gEfxlvupfx_0.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gTitlescreen_0.bin` | pixel-gfx | fe8u graphics/**/*.png (named gfx) |
| `data/residual/gTitlescreen_1.bin` | pixel-gfx | fe8u graphics/**/*.png (named gfx) |
| `data/residual/rom_header_080000C0.bin` | sound-m4a-tables | fe8u src/rom_header.s |
| `data/sound/frontier_df3_voicegroup_000_1F70E8.bin` | voicegroup-tail | fe8u sound/voicegroups/*.s (voicegroup tail; documented ceiling) |
| `data/sound/frontier_df3_voicegroup_001_202C07.bin` | voicegroup-tail | fe8u sound/voicegroups/*.s (voicegroup tail; documented ceiling) |
| `data/sound/frontier_df4_voice_000_1F578C.bin` | voicegroup-tail | fe8u sound/voicegroups/*.s / direct_sound_data.s |
| `data/sound/frontier_df4_voice_001_1F67BC.bin` | voicegroup-tail | fe8u sound/voicegroups/*.s / direct_sound_data.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_004_7738F0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_016_7767BC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_028_777858.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_029_779AB6.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_030_779AFE.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_031_779B76.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_032_779C2A.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_033_779D56.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_034_779ED6.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_035_77A2DE.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_036_77A34A.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_037_77A3B6.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_038_77A422.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_039_77A48E.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_040_77A4FA.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_041_77A566.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_042_77A5D2.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_043_77A63E.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_044_77A6AA.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_045_77A6E6.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_046_77A752.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_047_77A7BE.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_048_77A82A.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_049_77A896.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_050_77A902.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_051_77A91A.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_052_77A986.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_053_77A9F2.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_054_77AA5E.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_055_77AACA.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_004_77EAB4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_017_78048C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_026_78BE1C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_036_78EE00.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_040_7955B8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_chap_title/frontier_chap_title_115_A92170.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_000_7463DC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_003_754840.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_005_756454.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_007_758E68.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_011_761780.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000_64D2B4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_001_6500B0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008_657A78.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009_6587E0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_btl_bg/frontier_df3_btl_bg_002_7B83B8.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_df3_const_unit_ic/frontier_df3_const_unit_ic_000_1C0D80.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_df3_const_unit_ic/frontier_df3_const_unit_ic_001_1C2B4C.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_df3_opanim_gfx/frontier_df3_opanim_gfx_000_B75860.bin` | pixel-gfx | fe8u graphics/op_anim/*.png (opanim gfx, not the tilemap floor) |
| `graphics/frontier_df3_opanim_gfx/frontier_df3_opanim_gfx_002_B7F118.bin` | pixel-gfx | fe8u graphics/op_anim/*.png (opanim gfx, not the tilemap floor) |
| `graphics/frontier_df3_opanim_gfx/frontier_df3_opanim_gfx_003_B864A8.bin` | pixel-gfx | fe8u graphics/op_anim/*.png (opanim gfx, not the tilemap floor) |
| `graphics/frontier_df3_titlescreen/frontier_df3_titlescreen_001_B48D38.bin` | pixel-gfx | fe8u graphics/titlescreen/*.png |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_000_90F678.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_003_91066C.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_004_91075C.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_005_9109A8.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_006_911070.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_007_911200.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_009_91187C.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_012_911C34.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_013_911E38.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_015_91206C.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_016_912198.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_017_912480.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_018_912AD4.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_019_913958.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_021_914BD8.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_022_915038.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_023_91512C.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_024_915E08.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_025_9163BC.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_026_916D14.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_027_917600.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_028_9178F8.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_029_9184F0.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_030_918784.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_031_918C90.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_032_91908C.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_033_9191E0.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_035_91A580.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_036_91AB20.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_037_91AC38.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_038_91B948.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_039_91BED4.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_041_91C104.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_042_91C230.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_043_91D314.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_046_91DFD0.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_047_91E280.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_048_91E7A8.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_049_91E988.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_050_91EE14.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_051_91F300.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_052_91F89C.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_055_91FE20.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_057_92042C.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_060_921140.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_070_923510.bin` | unitdef-residuals | fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx) |
| `graphics/frontier_df4_banim_a/frontier_df4_banim_a_000_5E0E94.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_003_604F7C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_004_60838C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_005_611798.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_006_6123D4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_011_61BE44.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_012_61EC9C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_013_622E28.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_014_6238B4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_015_62DC84.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_016_62EDD8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_017_63CDD4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_018_63D868.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_019_64C610.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_021_663368.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_022_665FB0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_023_6719A8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_024_67E9B8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_026_683C80.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_027_6870D4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_028_69697C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_029_69BBC8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_030_69C34C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_031_69EBD8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_032_6A5EDC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_033_6A819C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_036_6AB520.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_037_6AC820.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_039_6ADB74.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_042_6B1024.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_050_6D3478.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_051_6E0CF4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_052_6E96D0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_053_7059C4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_054_716918.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_055_7179EC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_056_7657CC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_059_79FCB0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_060_7A8B10.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_062_7AA39C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_064_7CD474.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_069_8601B1.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_071_903450.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_072_903A50.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_074_909DE8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_075_90A050.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_076_90B4DC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_077_90DB94.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_078_90E58C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_079_90EFAC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_081_9CF318.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_082_A12AC0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_083_A13256.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_084_A13880.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_085_A13CD0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_font_cc/frontier_df4_font_cc_078_56CAD8.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_df4_font_cc/frontier_df4_font_cc_090_574344.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_000a_0DC3DC.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_000b_0DC41C.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_002a_0DCDD0.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_002b_0DD358.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_003_0DE85C.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_015_19E6EC.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_016_1A4C88.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_018_1DEF84.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_019_1E140C.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_020_1EC9E0.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_021_1F4F60.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_tail/frontier_df4_tail_000_BABAF8.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_df4_tail/frontier_df4_tail_001_BB08B4.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_map_ch9events/frontier_map_ch9events_000_1598A0.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |

</details>

## FLOOR (1176) — fe8u also keeps these binary — legitimate; do NOT fake-extract.

<details><summary>1176 entries</summary>

| `.bin` (fe8j) | category | fe8u-source proof |
|---|---|---|
| `data/residual/gBattleForecast_0.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gBattleForecast_0.tsa.bin |
| `data/residual/gBattleForecast_1.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gBattleForecast_1.tsa.bin |
| `data/residual/gBattleForecast_2.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gBattleForecast_2.tsa.bin |
| `data/residual/gEndingDetails_0.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gEndingDetails_0.tsa.bin |
| `data/residual/gMenuSoundroom_0.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gMenuSoundroom_0.tsa.bin |
| `data/residual/gMenuSoundroom_1.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gMenuSoundroom_1.tsa.bin |
| `data/residual/gMenuSoundroom_2.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gMenuSoundroom_2.tsa.bin |
| `data/residual/gMenuSoundroom_4.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gMenuSoundroom_4.tsa.bin |
| `data/residual/gTsa_OpSubtitle_03.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `data/residual/gTsa_OpSubtitle_05.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `data/residual/gUnkData_15.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gUnkData_15.tsa.bin |
| `data/residual/gUnkData_67.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gUnkData_67.tsa.bin |
| `data/residual/gUnkData_68.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gUnkData_68.tsa.bin |
| `data/residual/gUnkData_70.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gUnkData_70.tsa.bin |
| `data/residual/gUnkData_71.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gUnkData_71.tsa.bin |
| `data/residual/gUnkData_72.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gUnkData_72.tsa.bin |
| `data/residual/gUnkData_73.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gUnkData_73.tsa.bin |
| `data/residual/gUnkData_80.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gUnkData_80.tsa.bin |
| `data/residual/gUnkData_89.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gUnkData_89.tsa.bin |
| `data/residual/gUnkData_92.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gUnkData_92.tsa.bin |
| `data/residual/gWorldmapMinimap_1.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gWorldmapMinimap_1.tsa.bin |
| `data/residual/gWorldmapMinimap_2.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gWorldmapMinimap_2.tsa.bin |
| `graphics/banim/_us/banim/assets/tsa/005DD518_Tsa_BreathBgBase.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005DDAF4_Tsa_085DDAF4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E64D8_Tsa_085E64D8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E65C0_Tsa_085E65C0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E667C_Tsa_085E667C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E6778_Tsa_085E6778.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E6860_Tsa_085E6860.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E6948_Tsa_085E6948.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E6A44_Tsa_085E6A44.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E6B70_Tsa_085E6B70.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E6CA4_Tsa_085E6CA4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E6D68_Tsa_085E6D68.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E8308_Tsa_EfxCriricalEffectBG_L.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E87A8_Tsa_EfxCriricalEffectBG_R.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E8CE4_Tsa_EfxSRankWeaponEffectBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E9170_Tsa1_EfxNormalEffectBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E923C_Tsa2_EfxNormalEffectBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E933C_Tsa3_EfxNormalEffectBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E944C_Tsa4_EfxNormalEffectBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E9558_Tsa5_EfxNormalEffectBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E965C_Tsa6_EfxNormalEffectBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E9748_Tsa7_EfxNormalEffectBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E981C_Tsa8_EfxNormalEffectBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005E98D8_Tsa9_EfxNormalEffectBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005EFE90_Tsa19_EfxMagfcastBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005EFF60_Tsa20_EfxMagfcastBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F0018_Tsa21_EfxMagfcastBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F0E24_Tsa1_EfxMagdhisEffectBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F0F24_Tsa2_EfxMagdhisEffectBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F1018_Tsa3_EfxMagdhisEffectBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F10EC_Tsa4_EfxMagdhisEffectBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F387C_Tsa_EfxThuderBg1.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F3948_Tsa_EfxThuderBg2.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F6520_Tsa_085F6520.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F65F0_Tsa_085F65F0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F66F0_Tsa_085F66F0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F67F8_Tsa_085F67F8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F690C_Tsa_085F690C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F6A44_Tsa_085F6A44.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F6B48_Tsa_085F6B48.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F6C1C_Tsa_085F6C1C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F6FAC_Tsa_085F6FAC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F707C_Tsa_085F707C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F717C_Tsa_085F717C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F7284_Tsa_085F7284.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F7398_Tsa_085F7398.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F74D0_Tsa_085F74D0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F75D4_Tsa_085F75D4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/005F76A8_Tsa_085F76A8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006013BC_Tsa_086013BC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006014B0_Tsa_086014B0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006015C8_Tsa_086015C8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006016F4_Tsa_086016F4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0060182C_Tsa_0860182C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00601970_Tsa_08601970.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00601AC4_Tsa_08601AC4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00601C1C_Tsa_08601C1C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00601D84_Tsa_08601D84.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00601EF0_Tsa_08601EF0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0060206C_Tsa_0860206C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00602A10_Tsa_08602A10.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00603D50_Tsa_EkrElfireBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00608898_Tsa_BoltingBg_A.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00608A2C_Tsa_BoltingBg_B.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00608C34_Tsa_BoltingBg_C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00608D98_Tsa_BoltingBg_D.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00608E78_Tsa_BoltingBg_E.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00608F90_Tsa_BoltingBg_F.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0060913C_Tsa_BoltingBg_G.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0060925C_Tsa_BoltingBg_H.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00609348_Tsa_BoltingBg_I.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006094C8_Tsa_BoltingBg_K.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00610404_Tsa_FimbulvetrBg_D.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006104D8_Tsa_FimbulvetrBg_E.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006105D4_Tsa_FimbulvetrBg_F.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00610714_Tsa_FimbulvetrBg_G.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006108AC_Tsa_FimbulvetrBg_H.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00610A80_Tsa_FimbulvetrBg_I.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00617F24_Tsa_FimbulvetrBg_Tornado_A.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00618110_Tsa_FimbulvetrBg_Tornado_B.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006182E8_Tsa_FimbulvetrBg_Tornado_C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006184B0_Tsa_FimbulvetrBg_Tornado_D.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006186E4_Tsa_FimbulvetrBg_Tornado_E.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0061892C_Tsa_FimbulvetrBg_Tornado_F.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0061F7F4_Tsa_0861F7F4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0061F918_Tsa_0861F918.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0061FC40_Tsa_0861FC40.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0061FD28_Tsa_0861FD28.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0061FE0C_Tsa_0861FE0C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0061FFCC_Tsa_0861FFCC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006200AC_Tsa_086200AC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006201A0_Tsa_086201A0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00620294_Tsa_08620294.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00620398_Tsa_08620398.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006204A0_Tsa_086204A0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006205B8_Tsa_086205B8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006211E4_Tsa_086211E4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00621304_Tsa_08621304.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00621420_Tsa_08621420.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00621534_Tsa_08621534.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062162C_Tsa_0862162C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00621714_Tsa_08621714.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006217E4_Tsa_086217E4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006218A8_Tsa_086218A8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00622FEC_Tsa_AircaliburBg_A.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00623174_Tsa_AircaliburBg_B.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062A310_Tsa_0862A310.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062A40C_Tsa_0862A40C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062A50C_Tsa_0862A50C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062A610_Tsa_0862A610.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062A708_Tsa_0862A708.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062A814_Tsa_0862A814.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062A920_Tsa_0862A920.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062AA40_Tsa_0862AA40.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062AB64_Tsa_0862AB64.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062AC4C_Tsa_0862AC4C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062AD28_Tsa_0862AD28.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062ADE8_Tsa_0862ADE8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062B2AC_Tsa_0862B2AC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062B3A8_Tsa_0862B3A8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062B49C_Tsa_0862B49C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062B594_Tsa_0862B594.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062B680_Tsa_0862B680.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062B764_Tsa_0862B764.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062B83C_Tsa_0862B83C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062B90C_Tsa_0862B90C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062B9D8_Tsa_0862B9D8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062BAA0_Tsa_0862BAA0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0062BB54_Tsa_0862BB54.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00636660_Tsa_08636660.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00636CF8_Tsa_08636CF8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00636E00_Tsa_08636E00.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00636F1C_Tsa_08636F1C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00637058_Tsa_08637058.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006371A8_Tsa_086371A8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00637300_Tsa_08637300.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00637458_Tsa_08637458.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006375AC_Tsa_086375AC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006376FC_Tsa_086376FC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0063784C_Tsa_0863784C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00637984_Tsa_08637984.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00637AB0_Tsa_08637AB0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00637BCC_Tsa_08637BCC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00637CD8_Tsa_08637CD8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00637DD0_Tsa_08637DD0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00637EBC_Tsa_08637EBC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00637F8C_Tsa_08637F8C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00638048_Tsa_08638048.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006380FC_Tsa_086380FC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006381AC_Tsa_086381AC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00638258_Tsa_08638258.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00638300_Tsa_08638300.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006383B4_Tsa_086383B4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00638474_Tsa_08638474.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00638540_Tsa_08638540.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00638608_Tsa_08638608.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006386D0_Tsa_086386D0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006387A4_Tsa_086387A4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00638880_Tsa_08638880.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00638968_Tsa_08638968.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00638A5C_Tsa_08638A5C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00638B64_Tsa_08638B64.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00638C6C_Tsa_08638C6C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00638D90_Tsa_08638D90.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00638EB0_Tsa_08638EB0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00638FCC_Tsa_08638FCC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006390DC_Tsa_086390DC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006391E8_Tsa_086391E8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006392E8_Tsa_086392E8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00641DA4_Tsa_08641DA4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00641F38_Tsa_08641F38.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064213C_Tsa_0864213C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064240C_Tsa_0864240C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006426DC_Tsa_086426DC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064298C_Tsa_0864298C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00642C40_Tsa_08642C40.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00642ECC_Tsa_08642ECC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00643150_Tsa_08643150.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006433C4_Tsa_086433C4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00643658_Tsa_08643658.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006438E0_Tsa_086438E0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00643B7C_Tsa_08643B7C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00643E04_Tsa_08643E04.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00644080_Tsa_08644080.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006442B0_Tsa_086442B0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00644500_Tsa_08644500.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00644730_Tsa_08644730.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00644928_Tsa_08644928.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00644B0C_Tsa_08644B0C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00644CA8_Tsa_08644CA8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00645624_Tsa_08645624.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00645708_Tsa_08645708.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006457BC_Tsa_086457BC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00645858_Tsa_08645858.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00645AC8_Tsa_08645AC8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00645B64_Tsa_08645B64.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00645C00_Tsa_08645C00.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00645C9C_Tsa_08645C9C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00645D38_Tsa_08645D38.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064E7D0_Tsa_EclipseBg_A.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064EAB4_Tsa_EclipseBg_D.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064EB68_Tsa_EclipseBg_E.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064EC1C_Tsa_EclipseBg_F.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064ECD0_Tsa_EclipseBg_G.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064EDAC_Tsa_EclipseBg_H.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064EE88_Tsa_EclipseBg_I.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064EF9C_Tsa_EclipseBg_J.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064F0B0_Tsa_EclipseBg_K.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064F1C4_Tsa_EclipseBg_L.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064F2D8_Tsa_EclipseBg_M.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064F3EC_Tsa_EclipseBg_N.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064F4F8_Tsa_EclipseBg_O.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064F5D0_Tsa_EclipseBg_P.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064F6E0_Tsa_EclipseBg_Q.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064F848_Tsa_EclipseBg_R.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064FA0C_Tsa_EclipseBg_S.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064FBD0_Tsa_EclipseBg_T.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064FD8C_Tsa_EclipseBg_U.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0064FF3C_Tsa_EclipseBg_V.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006500EC_Tsa_EclipseBg_W.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0065029C_Tsa_EclipseBg_X.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00650440_Tsa_EclipseBg_Y.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006505D8_Tsa_EclipseBg_Z.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00650768_Tsa_EclipseBg_AA.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00652734_Tsa_FenrirBg_Sigils.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00656934_Tsa_08656934.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006569F0_Tsa_086569F0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00656AAC_Tsa_08656AAC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00656B68_Tsa_08656B68.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00656C24_Tsa_08656C24.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00656CE0_Tsa_08656CE0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00656D9C_Tsa_08656D9C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00656EA0_Tsa_08656EA0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00656FA4_Tsa_08656FA4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00659FE0_Tsa_08659FE0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0065A194_Tsa_0865A194.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0065A348_Tsa_0865A348.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0065A964_Tsa_0865A964.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0065ABBC_Tsa_0865ABBC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0065ADC4_Tsa_0865ADC4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00667DB0_Tsa_08667DB0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00667ED4_Tsa_08667ED4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00667FF4_Tsa_08667FF4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00668100_Tsa_08668100.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006681FC_Tsa_086681FC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006682E4_Tsa_086682E4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006683CC_Tsa_086683CC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006684AC_Tsa_086684AC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00668588_Tsa_08668588.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00668668_Tsa_08668668.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066875C_Tsa_0866875C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00668850_Tsa_08668850.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00668954_Tsa_08668954.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00668A5C_Tsa_08668A5C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00668B74_Tsa_08668B74.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00668C98_Tsa_08668C98.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00668DAC_Tsa_08668DAC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00668ED0_Tsa_08668ED0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00668FF4_Tsa_08668FF4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00669104_Tsa_08669104.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00669204_Tsa_08669204.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006692EC_Tsa_086692EC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006693CC_Tsa_086693CC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006694A8_Tsa_086694A8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00669584_Tsa_08669584.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00669668_Tsa_08669668.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066975C_Tsa_0866975C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066984C_Tsa_0866984C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00669950_Tsa_08669950.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00669A58_Tsa_08669A58.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00669B6C_Tsa_08669B6C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00669C90_Tsa_08669C90.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066AD9C_Tsa_0866AD9C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066AFB0_Tsa_0866AFB0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066B16C_Tsa_0866B16C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066B348_Tsa_0866B348.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066B54C_Tsa_0866B54C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066B754_Tsa_0866B754.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066B968_Tsa_0866B968.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066BBC8_Tsa_0866BBC8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066BDFC_Tsa_0866BDFC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066C070_Tsa_0866C070.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066C2B8_Tsa_0866C2B8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066C618_Tsa_0866C618.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066C96C_Tsa_0866C96C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066CC7C_Tsa_0866CC7C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066CF60_Tsa_0866CF60.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066D230_Tsa_0866D230.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066D4C8_Tsa_0866D4C8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066D760_Tsa_0866D760.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066D98C_Tsa_0866D98C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066DC40_Tsa_0866DC40.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066DF00_Tsa_0866DF00.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066E230_Tsa_0866E230.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066E580_Tsa_0866E580.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066E8F8_Tsa_0866E8F8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0066EC80_Tsa_0866EC80.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00670D40_Tsa_EfxLiveBG_B_L.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006716A0_Tsa_EfxLiveBG_B_R.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00677E80_Tsa_08677E80.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00677F8C_Tsa_08677F8C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0067808C_Tsa_0867808C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00678198_Tsa_08678198.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006782A4_Tsa_086782A4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00678D20_Tsa_StatusEffectBgBase.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0067BA68_Tsa_0867BA68.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0067BB50_Tsa_0867BB50.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0067BC40_Tsa_0867BC40.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0067BD40_Tsa_0867BD40.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0067BE4C_Tsa_0867BE4C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0067BF6C_Tsa_0867BF6C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0067C09C_Tsa_0867C09C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006806BC_Tsa_086806BC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006807CC_Tsa_086807CC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00681570_Tsa_08681570.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00681658_Tsa_08681658.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00681748_Tsa_08681748.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00681848_Tsa_08681848.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00681954_Tsa_08681954.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00681A74_Tsa_08681A74.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00681BA4_Tsa_08681BA4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006861C4_Tsa_086861C4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006862A0_Tsa_086862A0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0068637C_Tsa_0868637C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00686458_Tsa_08686458.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00686534_Tsa_08686534.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00686610_Tsa_08686610.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006866EC_Tsa_086866EC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006867C8_Tsa_086867C8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006868A4_Tsa_086868A4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00686980_Tsa_08686980.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00686A5C_Tsa_08686A5C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00686B38_Tsa_08686B38.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00686C14_Tsa_08686C14.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00686CF0_Tsa_08686CF0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00686DCC_Tsa_08686DCC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00686EA8_Tsa_08686EA8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0068E118_Tsa_0868E118.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0068E208_Tsa_0868E208.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0068E338_Tsa_0868E338.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006945E4_Tsa_086945E4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006946A0_Tsa_086946A0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006947C4_Tsa_086947C4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0069495C_Tsa_0869495C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00694B58_Tsa_08694B58.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00694DD0_Tsa_08694DD0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00695048_Tsa_08695048.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006952C0_Tsa_086952C0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00695530_Tsa_08695530.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00695744_Tsa_08695744.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006958F0_Tsa_086958F0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00695A34_Tsa_08695A34.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00696860_Tsa_08696860.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006968F8_Tsa_086968F8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00696A8C_Tsa_08696A8C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00696C28_Tsa_08696C28.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00696DC4_Tsa_08696DC4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0069E970_Tsa_0869E970.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0069EBB4_Tsa_0869EBB4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0069EE2C_Tsa_0869EE2C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0069F090_Tsa_0869F090.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0069F304_Tsa_0869F304.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0069F5C0_Tsa_0869F5C0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0069F888_Tsa_0869F888.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0069FB4C_Tsa_0869FB4C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0069FDFC_Tsa_0869FDFC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006A00B0_Tsa_086A00B0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006A0388_Tsa_086A0388.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006A1D00_Tsa_086A1D00.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006A66F8_Tsa_086A66F8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006A6B88_Tsa_086A6B88.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006A6CD0_Tsa_086A6CD0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006A6DDC_Tsa_086A6DDC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006A6EBC_Tsa_086A6EBC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006A6F94_Tsa_086A6F94.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006A7058_Tsa_086A7058.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006A7114_Tsa_086A7114.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006A71B8_Tsa_086A71B8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B2A78_Tsa_086B2A78.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B2B30_Tsa_086B2B30.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B2BF4_Tsa_086B2BF4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B2CCC_Tsa_086B2CCC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B2DB8_Tsa_086B2DB8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B2EBC_Tsa_086B2EBC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B2FD8_Tsa_086B2FD8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B3114_Tsa_086B3114.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B326C_Tsa_086B326C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B33E0_Tsa_086B33E0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B3578_Tsa_086B3578.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B3734_Tsa_086B3734.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B38FC_Tsa_086B38FC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B3AEC_Tsa_086B3AEC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B3CE8_Tsa_086B3CE8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B3F00_Tsa_086B3F00.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B603C_Tsa_086B603C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B6100_Tsa_086B6100.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B61C4_Tsa_086B61C4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B6288_Tsa_086B6288.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B634C_Tsa_086B634C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006B6410_Tsa_086B6410.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006BC884_Tsa_086BC884.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C796C_Tsa_086C796C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C7A2C_Tsa_086C7A2C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C7AF8_Tsa_086C7AF8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C7BD0_Tsa_086C7BD0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C7CBC_Tsa_086C7CBC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C7DC0_Tsa_086C7DC0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C7ED4_Tsa_086C7ED4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C7FFC_Tsa_086C7FFC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C8138_Tsa_086C8138.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C828C_Tsa_086C828C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C8404_Tsa_086C8404.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C8570_Tsa_086C8570.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C86E4_Tsa_086C86E4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C8860_Tsa_086C8860.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C89EC_Tsa_086C89EC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C8B30_Tsa_086C8B30.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C8C84_Tsa_086C8C84.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C8DE8_Tsa_086C8DE8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006C8F4C_Tsa_086C8F4C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D36D4_Tsa_086D36D4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D37B4_Tsa_086D37B4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D3890_Tsa_086D3890.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D3978_Tsa_086D3978.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D3A7C_Tsa_086D3A7C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D3B78_Tsa_086D3B78.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D3C84_Tsa_086D3C84.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D3D8C_Tsa_086D3D8C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D3E94_Tsa_086D3E94.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D3FBC_Tsa_086D3FBC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D40CC_Tsa_086D40CC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D41F4_Tsa_086D41F4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D4318_Tsa_086D4318.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D4428_Tsa_086D4428.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D454C_Tsa_086D454C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D466C_Tsa_086D466C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D4788_Tsa_086D4788.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D489C_Tsa_086D489C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D49D0_Tsa_086D49D0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D4ADC_Tsa_086D4ADC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D8B54_Tsa_086D8B54.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006D8C64_Tsa_086D8C64.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E64E0_Tsa_086E64E0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E65EC_Tsa_086E65EC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E671C_Tsa_086E671C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E6860_Tsa_086E6860.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E69C8_Tsa_086E69C8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E6B38_Tsa_086E6B38.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E6CC4_Tsa_086E6CC4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E6E60_Tsa_086E6E60.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E700C_Tsa_086E700C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E71BC_Tsa_086E71BC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E7380_Tsa_086E7380.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E7550_Tsa_086E7550.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E7730_Tsa_086E7730.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E7914_Tsa_086E7914.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E7AFC_Tsa_086E7AFC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E7CD8_Tsa_086E7CD8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E91D8_Tsa_086E91D8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E927C_Tsa_086E927C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E9358_Tsa_086E9358.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E9474_Tsa_086E9474.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E95D4_Tsa_086E95D4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E9758_Tsa_086E9758.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E98E4_Tsa_086E98E4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E9A64_Tsa_086E9A64.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006E9BD4_Tsa_086E9BD4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006F0344_Tsa_086F0344.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006F03EC_Tsa_086F03EC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006F04B8_Tsa_086F04B8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006F05A0_Tsa_086F05A0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006F069C_Tsa_086F069C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006F079C_Tsa_086F079C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006F08B8_Tsa_086F08B8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006F09E0_Tsa_086F09E0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006F0B2C_Tsa_086F0B2C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006F0C88_Tsa_086F0C88.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006F0DF8_Tsa_086F0DF8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006F4A98_Tsa_086F4A98.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006F4CCC_Tsa_086F4CCC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006F4ED8_Tsa_086F4ED8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006FDA64_Tsa_086FDA64.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006FDB08_Tsa_086FDB08.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006FDCE0_Tsa_086FDCE0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006FDEC4_Tsa_086FDEC4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006FE0D4_Tsa_086FE0D4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006FE320_Tsa_086FE320.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006FE4E0_Tsa_086FE4E0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006FE680_Tsa_086FE680.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/006FE81C_Tsa_086FE81C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007013C0_Tsa_NaglfarBg1_A.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00710FB8_Tsa_08710FB8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007111E0_Tsa_087111E0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00711438_Tsa_08711438.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007116A4_Tsa_087116A4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007118FC_Tsa_087118FC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00711B6C_Tsa_08711B6C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00711DD8_Tsa_08711DD8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0071203C_Tsa_0871203C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007122A4_Tsa_087122A4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0071250C_Tsa_0871250C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0071276C_Tsa_0871276C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007129C0_Tsa_087129C0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00712C14_Tsa_08712C14.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00712E6C_Tsa_08712E6C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007130B4_Tsa_087130B4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00713310_Tsa_08713310.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00725AF0_Tsa_FireBreathBg.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007270B4_Tsa_ShineBg1_Left.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00727510_Tsa_ShineBg1_Right.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0072974C_Tsa_LunaBg1_A.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0072A1BC_Tsa_LunaBg2.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0072E7EC_Tsa_ExcaliburBg1.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0072FA84_Tsa_ExcaliburBg2_Left.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0072FEB8_Tsa_ExcaliburBg2_Right.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00732368_Tsa_GespenstBg4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007331FC_Tsa_087331FC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007332A4_Tsa_087332A4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0073334C_Tsa_0873334C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007333F8_Tsa_087333F8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007334B0_Tsa_087334B0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00733568_Tsa_08733568.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00733618_Tsa_08733618.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007336C4_Tsa_087336C4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0073376C_Tsa_0873376C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0073380C_Tsa_0873380C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00733940_Tsa_08733940.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00733A58_Tsa_08733A58.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00733B94_Tsa_08733B94.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00733CE4_Tsa_08733CE4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00733E20_Tsa_08733E20.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00733F24_Tsa_08733F24.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00733FC8_Tsa_08733FC8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00734064_Tsa_08734064.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00734100_Tsa_08734100.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0073419C_Tsa_0873419C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00734238_Tsa_08734238.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007342D4_Tsa_087342D4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00734390_Tsa_08734390.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007457A8_Tsa1_EfxChillEffectBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00745B74_Tsa2_EfxChillEffectBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00745FD0_Tsa3_EfxChillEffectBG.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00750288_Tsa_08750288.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007503E4_Tsa_087503E4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00750810_Tsa_08750810.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00754910_Tsa_08754910.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007549B8_Tsa_087549B8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00754A64_Tsa_08754A64.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00754B14_Tsa_08754B14.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00754BD8_Tsa_08754BD8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00754CA4_Tsa_08754CA4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00754D7C_Tsa_08754D7C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00754E5C_Tsa_08754E5C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00754F3C_Tsa_08754F3C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00755028_Tsa_08755028.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/0075511C_Tsa_0875511C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00755218_Tsa_08755218.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00755310_Tsa_08755310.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00755410_Tsa_08755410.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00755510_Tsa_08755510.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00755610_Tsa_08755610.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00755714_Tsa_08755714.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00755804_Tsa_08755804.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007558EC_Tsa_087558EC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/007559D0_Tsa_087559D0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00755AB8_Tsa_08755AB8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00755B94_Tsa_08755B94.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00755C64_Tsa_08755C64.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00755D20_Tsa_08755D20.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00755DE0_Tsa_08755DE0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00755E94_Tsa_08755E94.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/assets/tsa/00755F3C_Tsa_08755F3C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87932EC.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_8793384.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_8793494.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87935B0.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87936C0.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87937D0.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87938EC.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_8799818.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_8799ABC.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_8799D64.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_879A008.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_879A2A8.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_879A444.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_879A6A0.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_879A87C.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_879A9E8.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_879AB10.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A18F0.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A19EC.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A1B68.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A1D74.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A1F9C.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A2134.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A2384.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A2584.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A2748.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A28A8.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A29DC.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A2AE8.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A2BE4.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A2CCC.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A2DB8.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A4A88.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A4B68.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A4C44.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A4D2C.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A4E0C.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Close_0.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Close_1.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Close_2.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Close_3.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Close_4.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Far_0.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Far_1.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Far_2.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Far_3.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Far_4.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Close_0.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Close_1.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Close_2.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Close_3.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Close_4.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Close_5.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Close_6.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Close_7.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Far_0.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Far_1.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Far_2.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Far_3.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Far_4.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Far_5.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Far_6.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Far_7.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg_0.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg_1.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg_2.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/dragonfx/Tsa_87932EC.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/efxbattle/TsaConf_BanimTmA1.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxbattle/TsaConf_BanimTmA2.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxbattle/TsaConf_BanimTmA3.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxbattle/TsaConf_BanimTmA4.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxhitobj/Tsa1_EfxPierceNormalEffectBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxhitobj/Tsa2_EfxPierceNormalEffectBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxhitobj/Tsa3_EfxPierceNormalEffectBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxhitobj/Tsa4_EfxPierceNormalEffectBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxhitobj/Tsa5_EfxPierceNormalEffectBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxhitobj/Tsa6_EfxPierceNormalEffectBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxhitobj/Tsa7_EfxPierceNormalEffectBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxhitobj/Tsa8_EfxPierceNormalEffectBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxhitobj/Tsa9_EfxPierceNormalEffectBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxhitobj/TsaL_EfxPierceCriticalEffectBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxhitobj/TsaR_EfxPierceCriticalEffectBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/Tsa10_EfxLvupBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/Tsa11_EfxLvupBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/Tsa1_EfxLvupBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/Tsa1_EfxLvupBG2.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/Tsa2_EfxLvupBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/Tsa2_EfxLvupBG2.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/Tsa3_EfxLvupBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/Tsa3_EfxLvupBG2.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/Tsa4_EfxLvupBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/Tsa4_EfxLvupBG2.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/Tsa5_EfxLvupBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/Tsa5_EfxLvupBG2.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/Tsa6_EfxLvupBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/Tsa6_EfxLvupBG2.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/Tsa7_EfxLvupBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/Tsa8_EfxLvupBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/Tsa9_EfxLvupBG.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/efxlvupfx/gEfxlvupfx_3.map.bin` | efx-effect-bins | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/misc/Tsa_EkrExpBar.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/misc/Tsa_EkrPopup.map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/banim/misc/gBanimmisc_0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/misc/gBanimmisc_1.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/misc/gBanimmisc_2.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/misc/gBanimmisc_5.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/battle_forecast/gTSA_BattleForecastExtended.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/battle_forecast/gTSA_BattleForecastStandard.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/btl_bg/btl_bg_14.fetsa3.bin` | TSA/.map.bin | fe8u keeps .fetsa3.bin binary (TSA/tilemap) |
| `graphics/btl_bg/btl_bg_27.fetsa3.bin` | TSA/.map.bin | fe8u keeps .fetsa3.bin binary (TSA/tilemap) |
| `graphics/btl_bg/btl_bg_33.fetsa3.bin` | TSA/.map.bin | fe8u keeps .fetsa3.bin binary (TSA/tilemap) |
| `graphics/btl_bg/btl_bg_55.fetsa3.bin` | TSA/.map.bin | fe8u keeps .fetsa3.bin binary (TSA/tilemap) |
| `graphics/btl_bg/btl_bg_58.fetsa3.bin` | TSA/.map.bin | fe8u keeps .fetsa3.bin binary (TSA/tilemap) |
| `graphics/btl_bg/btl_bg_60.fetsa3.bin` | TSA/.map.bin | fe8u keeps .fetsa3.bin binary (TSA/tilemap) |
| `graphics/ending_cg/cg_0.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/ending_cg/cg_1.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/ending_cg/cg_2.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/ending_cg/cg_3.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/ending_cg/cg_4.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/ending_cg/cg_5.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/ending_cg/cg_6.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/ending_cg/cg_7.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/ending_cg/cg_8.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/ending_cg/cg_9.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_005_774CB8.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_006_774F30.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_007_7751A8.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_008_775420.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_009_775698.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_010_775908.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_011_775B64.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_012_775DDC.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_013_776054.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_014_7762CC.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_015_776544.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_017_777118.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_018_7771B8.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_019_777264.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_020_777308.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_021_7773B4.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_022_777468.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_023_777520.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_024_7775CC.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_025_777674.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_026_77771C.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_027_7777BC.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_005_77F654.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_006_77F710.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_007_77F7E8.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_008_77F8E8.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_009_77FA14.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_010_77FB6C.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_011_77FCE8.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_012_77FE64.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_013_77FFC4.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_014_780114.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_015_780250.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_016_780378.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_027_78CEA8.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_028_78D004.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_029_78D354.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_030_78D6A4.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_031_78DAB4.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_032_78DF08.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_033_78E33C.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_034_78E750.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_035_78EAE0.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_037_794964.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_038_794D78.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_039_795198.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_058_79F83C.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_065_7D3984.bin` | TSA/.map.bin | fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary (`assets/tsa/*.map.bin`) |
| `graphics/gfx_data_bg/bg_Cell_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/bg_Fort_Sunset_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/bg_Grass_Plains_2_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/bg_Grass_Plains_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/bg_Normal_Village_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/bg_Plain_1_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/bg_Plain_2_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/bg_Port_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/bg_Stream_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_001_bg_House_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_003_bg_Caer_Pelyn_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_007_bg_Village_Clear_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_012_bg_Fireplace_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_015_bg_Castle_Interior_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_018_bg_Grado_Chamber_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_020_bg_Throne_Normal_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_022_bg_Throne_Normal_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_024_bg_Castle_Bright_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_026_bg_Garden_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_028_bg_Manse_Back_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_030_bg_Cell_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_033_bg_Plain_1_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_035_bg_Grass_Plains_2_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_045_bg_Passage_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_050_bg_Stone_Chamber_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_052_bg_Renais_Chamber_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_054_bg_White_Chamber_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_059_bg_Black_Temple_Outside_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_061_bg_Black_Temple_Inside_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_065_bg_convo2_00_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_070_bg_convo2_03_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_075_bg_convo2_08_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_077_bg_convo2_09_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_081_bg_convo2_12_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_083_bg_convo2_13_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_085_bg_convo2_15_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_087_bg_convo2_16_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_091_bg_convo2_19_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_094_bg_convo2_21_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_096_bg_convo2_22_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_098_bg_convo2_23_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_100_bg_convo2_24_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gfx_data_bg/gfx_data_bg_102_bg_Blank_map.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gmapunit/Tsa_ArenaBattleBg.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gmapunit/Tsa_ConfigUiFrame.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gmapunit/Tsa_PlayerRankFog.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gmapunit/Tsa_PrepItemScreen.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gmapunit/Tsa_PrepItemUseScreen.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gmapunit/Tsa_SilenceBg_2.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gmapunit/Tsa_StatscreenEquipedWeaponHighlight.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gmapunit/Tsa_TerrainMapUi_Labels.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gmapunit/Tsa_UnkData_1.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gmapunit/Tsa_UnkData_2.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gmapunit/Tsa_UnkData_3.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/gmapunit/Tsa_UnkData_4.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_0.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_1.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_10.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_11.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_12.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_13.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_14.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_15.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_16.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_17.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_2.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_3.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_4.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_5.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_6.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_7.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_8.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/Tsa_Mapeventcall_9.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/mapanim/gMapanimEventcall_135.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_136.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_137.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_138.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_139.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_140.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_141.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_142.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_143.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_144.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_145.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_146.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_147.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_148.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_149.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_150.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_151.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_152.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_153.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_154.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_155.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_156.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_157.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_158.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_159.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_160.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_161.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_162.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_163.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_164.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_165.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_166.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_167.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_168.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_169.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_170.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_171.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_172.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_173.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_174.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_175.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_176.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_177.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_178.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_179.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_180.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_181.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_182.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_183.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_184.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_185.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_186.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_187.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_188.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_189.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_190.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_207.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_208.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_209.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_210.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_211.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_212.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_213.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_214.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_267.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_268.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_269.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_270.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_271.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_272.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_273.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_274.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_275.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_276.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_277.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_278.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_279.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_280.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_281.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_282.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_283.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_284.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_285.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_286.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_287.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_288.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_289.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_290.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_291.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gMapanimEventcall_292.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/gTsa_ArenaBuildingFront.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc/Tsa10_MonsterStoneMapAnimfx.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/Tsa1_MonsterStoneMapAnimfx.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/Tsa2_MonsterStoneMapAnimfx.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/Tsa3_MonsterStoneMapAnimfx.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/Tsa4_MonsterStoneMapAnimfx.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/Tsa5_MonsterStoneMapAnimfx.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/Tsa6_MonsterStoneMapAnimfx.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/Tsa7_MonsterStoneMapAnimfx.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/Tsa8_MonsterStoneMapAnimfx.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/Tsa9_MonsterStoneMapAnimfx.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/gUnkData_13.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/gUnkData_14.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/gUnkData_26.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/gUnkData_42.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/gUnkData_50.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/gUnkData_51.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/gUnkData_52.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/gUnkData_53.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/gUnkData_54.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/gUnkData_55.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/gUnkData_56.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/gUnkData_57.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/gUnkData_58.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/gUnkData_77.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/gUnkData_84.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc/gUnkData_86.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc_gfx/Tsa_GorgonHatchCloud_A.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_GorgonHatchCloud_B.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_GorgonHatchCloud_C.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_GorgonHatchCloud_D.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_GorgonHatchCloud_E.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_GorgonHatchCloud_F.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_GorgonHatchCloud_G.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_MapAnimUnlockBgfx.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_MapAnim_0.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_MapAnim_1.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_MapBattleBoxGfx1.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_MapBattleBoxGfx2.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_MapBattleBoxGfx3.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_Mapnightmare.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx1.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx10.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx11.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx12.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx13.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx14.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx15.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx16.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx17.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx18.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx19.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx2.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx20.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx21.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx22.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx23.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx24.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx25.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx26.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx27.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx28.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx29.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx3.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx30.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx31.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx32.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx33.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx4.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx5.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx6.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx7.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx8.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx9.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/Tsa_ShopWindows.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/gTsa_TitleDemonKing.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/gTsa_TitleDragonForeground.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/gTsa_TitleMainBackground.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/gTsa_Titlescreen_0.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/gTsa_Titlescreen_1.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx/gTsa_Titlescreen_2.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_CharacterEnding_BottomBorder.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_CharacterEnding_TopBorder.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_EkrTriPegagusLeftBG1.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_EkrTriPegagusLeftBG2.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_EkrTriPegagusLeftBG3.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_EkrTriPegagusRightBG1.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_EkrTriPegagusRightBG2.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_EkrTriPegagusRightBG3.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_EndingFin.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_EventGmap.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_GameOverFx.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_LinkArenaPostBattleBg.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_SaveMenuBG.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_SioResultRankings.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_StaffReelEnt_0.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_StaffReelEnt_1.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_StaffReelEnt_2.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_StaffReelEnt_3.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_StaffReelEnt_4.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_StaffReelEnt_5.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_StaffReelEnt_8.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_StaffReelEnt_9.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_UnkData_0.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/Tsa_UnkData_5.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/gTSA_GoalBox_OneLine.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/gTSA_GoalBox_TwoLines.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/gTSA_MinimugBox.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/gTSA_TerrainBox.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/gTSA_UnitInfoWindow.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/gTsa_OpSubtitle_00.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/gTsa_OpSubtitle_01.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/gTsa_OpSubtitle_04.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/gTsa_SupportSubScreen.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/gTsa_UnkData_0.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/misc_gfx2/gTsa_WorldmapMinimap_0.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/opanim/OpAnimCharacterBG.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/OpAnimEirikaClose1.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/OpAnimEirikaClose2.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/OpAnimEphraimBlur2.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/OpAnimEphraimBlur3.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/OpAnimEphraimClose1.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/OpAnimGenericCharacterBGUnused.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/OpAnimJoshua.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/OpAnimLArachel.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/OpAnimLArachel2.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/OpAnimMyrrh.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/OpAnimSaleh.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/OpAnimSeth.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/OpAnimShiningRing.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/OpAnimShiningRingBlinking.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/OpAnimTethys.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim1.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim10.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim100.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim11.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim12.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim13.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim14.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim15.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim16.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim17.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim18.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim19.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim2.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim20.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim21.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim22.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim23.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim24.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim25.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim26.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim27.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim28.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim29.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim3.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim30.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim31.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim32.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim33.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim34.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim35.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim36.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim37.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim38.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim39.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim4.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim40.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim41.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim42.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim43.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim44.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim45.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim46.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim47.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim48.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim49.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim5.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim50.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim51.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim52.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim53.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim54.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim55.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim56.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim57.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim58.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim59.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim6.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim60.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim61.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim62.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim63.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim64.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim65.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim66.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim67.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim68.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim69.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim7.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim70.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim71.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim72.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim73.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim74.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim75.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim76.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim77.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim78.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim79.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim8.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim80.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim81.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim82.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim83.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim84.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim85.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim86.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim87.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim88.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim89.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim9.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim90.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim91.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim92.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim93.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim94.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim95.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim96.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim97.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim98.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/opanim/opanim99.map.bin` | opanim-tilemaps | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/player_interface/gTSA_UnitInfoWindow.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/stone_shatter/gTsa_StoneShatter_0.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/stone_shatter/gTsa_StoneShatter_1.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/stone_shatter/gTsa_StoneShatter_10.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/stone_shatter/gTsa_StoneShatter_11.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/stone_shatter/gTsa_StoneShatter_12.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/stone_shatter/gTsa_StoneShatter_13.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/stone_shatter/gTsa_StoneShatter_2.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/stone_shatter/gTsa_StoneShatter_3.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/stone_shatter/gTsa_StoneShatter_4.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/stone_shatter/gTsa_StoneShatter_5.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/stone_shatter/gTsa_StoneShatter_6.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/stone_shatter/gTsa_StoneShatter_7.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/stone_shatter/gTsa_StoneShatter_8.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |
| `graphics/stone_shatter/gTsa_StoneShatter_9.tsa.bin` | TSA/.map.bin | fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`) |

</details>

## UNCERTAIN (473) — fe8u form unknown — DEFERRED, needs RE; document, don't fake.

<details><summary>473 entries</summary>

| `.bin` (fe8j) | category | fe8u-source proof |
|---|---|---|
| `data/residual/Ch10EirikaEvents.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/Ch16EphraimEventData.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/Ch19EphraimEventData.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/Ch1Events.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/Ch20EphraimEventData.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/Ch2Events.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/Ch3Events.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/Ch4Events.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/Ch5EventData.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/Ch5XEvents.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/Ch6Events.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/Ch7EventData.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/Ch8EventData.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/Ch9EirikaEvents.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/Ch9Events.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/FinalEphraimEvents1.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/JapaneseTerrainNames.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/MenuItemDef_RouteSplit.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/MenuItemDef_WMGeneralMenu.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/MenuItemDef_WMNodeMenu.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/PrologueEvents.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/REDA_Ch14AMixed_1_CAELLACH.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/REDA_Ch14AMixed_1_ISMAIRE.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/REDA_Ch14AMixed_1_LYON.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/SoftReset.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/TextGlyphs_Special.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/TextGlyphs_System.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/TextGlyphs_Talk.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/TrapData_Event_Ruin9_0.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/WmMonsterGenerateRates_EphraimMode.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/WmMonsterGenerateRates_XmapEphraim.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/bldyLut.10.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/chance_lut.3.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/data_08048798.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_080DC104.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_080DC144.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_080DC684.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_080DC8B0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_080DCCB2.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_080DCDAC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_080DED3A.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_080DEE1A.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_080DFF00.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_080E0008.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_080ED67C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0819EADC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081A00C8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081A6774.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F5BF4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F64C0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F65C0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F66A4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F6D00.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085432BC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085472FA.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0854C2B5.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0854DF1F.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0855133E.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08551DB5.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085520AC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085537F3.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08553F66.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0855439B.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085580A1.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08565768.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08565E77.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08567225.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08576255.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08576361.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0857742E.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085775C9.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08579D4C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0857A114.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0857A354.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0857A42C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0857A864.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0857AE4C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0857AF6C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0857B1AC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0857D36C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0857DA2C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0857DBDC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0857DCB4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0857E32C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0859137C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08594374.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0859497C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08594A54.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08594E8C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0859527C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08595474.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08595594.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085957D4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08595864.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0859848C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085985AC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0859A0AC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085B9E14.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085BA10C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085C4440.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085C6A20.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085D30F8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085E3724.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085F1568.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085F3338.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085FC068.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085FC638.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085FDDAC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085FE358.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085FE490.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085FEC28.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085FEDD8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086068D0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08606B24.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08606D84.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08606FE4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08607B7C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0860E028.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0860E1CC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0860E394.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0860E538.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08610D90.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086114F8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08612134.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08613A6C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08616558.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0861CCC0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0861E7B0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0861E944.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0861EAF0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0861F0CC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0861F1B0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0861F2B8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0861F3BC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0861F580.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0861F7FC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08620BB8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08630AD8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086314EC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0863230C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08636008.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08636294.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086371AC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08645FC4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0864738C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08647830.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0864CAC8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08659FFC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0865A268.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0865A694.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086724CC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086730D0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0867B54C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0869BFF0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0869C14C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086A01E0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086A0C24.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086A1CB0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086A25CC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086A2890.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086A2D64.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086A328C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086A3BCC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086A3E90.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086A4364.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086A488C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086A8F70.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086AAE60.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086AC554.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086AEA74.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086B0964.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086B730C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086B7E10.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086B8608.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086B87AC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086B8D40.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086BA1E4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086BAB74.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086BB064.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086BB154.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086BC90C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086BCCD8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086BDDDC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086BF0FC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086BFC18.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086C0290.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086CF94C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086DF490.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086E24B4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086E2A84.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086EA628.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086F6198.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086F6364.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08718440.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0872C080.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0872C194.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0872C934.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0872CA78.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0872CC70.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0872CDCC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0872CFC4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_087644A8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08764BF4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0877B894.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0877B9B4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_087A2494.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_087A2554.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_087AEA64.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_087E1718.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0885612C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890375C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_089038BC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08908228.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_089084A8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08908590.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08908CA0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08908DBC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_089092B0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890933C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_089095A8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08909814.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08909A80.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890A320.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890A3D4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890A480.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890AAC8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890ADC0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890B0B8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890B3B0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890BC70.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890BD24.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890C0A4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890C6A8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890C914.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890D234.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890D554.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890D874.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0890F2E0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08925BF8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08925CD4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08925DD8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_089263A8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A15984.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A5A6AD.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A5CEDC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A5D0E4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A5DA90.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A607B4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A61264.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A61B60.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A61C70.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A61F60.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A62134.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A62734.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A632C8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A6378C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A63894.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A63D0C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A642F0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A64420.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A64E30.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A64FA0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A66080.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A66768.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A66A00.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A67B00.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A70F34.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A710FC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A71BF0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A71C60.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A71FC0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A72038.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A720E0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A7214C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A721E8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A72258.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A7230C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A7239C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A933E8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A964FC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A97BEC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A9A8D4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08A9CA34.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08AAF6DC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08AB0B48.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08B25710.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08B3E1C8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08B3E688.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08B3E86C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08BAB2DC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08BB8ED0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08C01928.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08EE0AD0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08EF86C8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08FFF000.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gAnimCharaPalConfig.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gAnimCharaPalConfigUnused.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gAnimCharaPalIt.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gBmudisp_0.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gCharacterEndingDefeatLut.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gCharacterEndingTitleLut.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gClassReelData.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gClassReelOrderedLut.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gDebugChuudanMenuItems.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gDebugClearMenuItems.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gDebugContinueMenuItems.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gEventListCmdInfoTable.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gExcaliburBgScrollOffsets.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gGameOptions.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gGfx_OpSubtitle_05.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gItemUseMenuItems.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gLunaBgScrollOffsets.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gMPlayJumpTableTemplate.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gMenuMainObjs_5.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gPromoJidLut.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gSoloEndingBattleDispConf.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gSomeSMSLookupTable_0.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gStealItemMenuItems.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gTacticianTextConf.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gUnitActionMenuItems.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gUnkData_102.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gUnkData_103.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gUnkData_104.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gUnkData_105.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gUnkData_106.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gUnkData_107.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gWMPathData.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gWorldmapPath_20.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gYesNoSelectionMenuItems.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gap_00003080.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_00003240.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_00006274.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_000062C0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_00014818.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_0001BF98.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_00024670.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_00024818.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_000396D8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_0006E4DC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_0006E79C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_0008359C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_0009D634.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_000B0664.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_000B1030.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_000BD054.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_000BD0C8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_000C31D4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_000C532C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_000D2AD0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/gap_001F70E5.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/pilot_F2F580_F2F580.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/pilot_F63820_F63820.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/pilot_F97AC0_F97AC0.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/sMusicProc4Script.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/sProc_BMVSync.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/sSlotToChrLut.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/unit_icon_move_Bard_motion.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/unit_icon_move_Dancer_motion.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/unit_icon_move_table.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `graphics/data/data_08576124_576150.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `graphics/data_085772B4/data_085772B4_577378.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_000_5D367C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_001_5D3EA8.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_002_5D4358.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_003_5D48E0.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_004_5D4C5C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_005_5D4DD8.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_006_5D53FC.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_007_5D737C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_009_5D8A8C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_ending/frontier_df3_ending_000_AC1BC0.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_ending/frontier_df3_ending_001_AC3AA8.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_ending/frontier_df3_ending_002_AC50A4.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_000_57E884.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_001_57F604.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_002_57FACC.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_003_57FD0C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_004_57FF94.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_005_580B1C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_006_5814AC.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_007_581A04.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_008_582A54.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_009_582F1C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_000_AC059C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_001_AC0B90.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_002_AC16C8.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_003_AC718C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_005_ACEB54.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_006_AD02D4.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_007_AD0CFC.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_008_AD1444.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_009_B1D954.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_010_B1E5FC.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_012_B25A78.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_013_B26374.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_014_B26A6C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_015_B3B3D4.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_016_B3EBE4.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_017_B3F024.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_018_B3F7BC.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_ending/frontier_df4_ending_021_BAB754.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_000_A149D4.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_001_A588C0.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_002_A5D648.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_003_A5E6CC.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_004_A5F770.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_013_A72408.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_014_A72BF0.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_015_A73900.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_016_A74CEC.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_017_A79E90.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_018_A92B38.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_019_A934EC.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_020_A9454C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_022_A96D18.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_023_A99FA8.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_024_A9AC28.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_025_A9C020.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_026_A9CF7C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_028_A9E244.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_029_AA3860.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_030_AA71D4.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_031_AA9F98.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_032_AAAC4C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_033_AAEB40.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_034_AAF9EC.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_035_AB0830.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_036_AB0D18.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_000_57A504.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_001_57B23C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_002_57BF74.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_003_57CC64.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_004_57CF7C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_005_57DFCC.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_006_57E4DC.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_007_59140C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_008_5946F4.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_009_594B2C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_010_595B34.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_011_59662C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_012_596F74.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_013_5987EC.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_014_598E64.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_015_599BE4.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_016_59A2EC.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_017_59A574.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_018_59B0FC.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_019_59BA8C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_020_59BFE4.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_021_59D034.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_022_5B90D8.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_023_5B9454.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_024_5C1D30.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_025_5C2E50.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_027_5C3C9C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_028_5C411C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_029_5C4A94.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_030_5C534C.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_031_5C5DE8.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_032_5C6084.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_033_5C6AD4.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_034_5C6E08.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_035_5CDF84.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_036_5D14D4.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_038_5D32D8.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_ending_cg/frontier_ending_cg_000_B27970.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |
| `graphics/frontier_fontgrp_ui/frontier_fontgrp_ui_000_59D4FC.bin` | ApConf/opaque | fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE) |

</details>

---

_Regenerate: `python3 scripts/audit_bin_forms.py`. Oracle: `../fireemblem8u`._
