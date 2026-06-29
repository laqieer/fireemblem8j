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
| **MISS** | 3251 | 66.3% |
| **FLOOR** | 1071 | 21.9% |
| **UNCERTAIN** | 579 | 11.8% |
| **TOTAL** | 4901 | 100.0% |

## Category breakdown (epic plan's audit findings vs. this run)

| Category | Verdict | Count (this run) | fe8u editable form |
|---|---|---:|---|
| battle-anim | MISS | 1225 | fe8u 202 editable banim/*.s (compressing linker) |
| pixel-gfx | MISS | 607 | fe8u graphics/**/*.png |
| sound-m4a-tables | MISS | 494 | fe8u sound/music_player_table.s etc. |
| voicegroup-tail | MISS | 8 | fe8u sound/voicegroups/*.s (documented ceiling) |
| menu-strings | MISS | 171 | fe8u C literals (src/menu_def.c) |
| unitdef-residuals | MISS | 706 | fe8u src/events_udefs.c typed C |
| map-tilemaps | MISS | 40 | fe8u graphics/map/*.S / *.png (MARTOMAP) |
| TSA/.map.bin | FLOOR | 922 | fe8u keeps TSA/tilemaps binary too |
| PCM/.aif | FLOOR | 0 | fe8u direct_sound PCM binary (floor here) |
| opanim-tilemaps | FLOOR | 116 | fe8u op_anim/opanim tilemaps binary |
| efx-effect-bins | FLOOR | 33 | fe8u graphics/banim/efx* binary |
| ApConf/opaque | UNCERTAIN | 579 | fe8u form unclear — DEFERRED, needs RE |

## Spot checks (hand-verified)

Five+ MISS and five+ FLOOR entries verified by hand so the classification is
trustworthy (the prior research over-flagged `frontier_chap_title` images and
`frontier_df4_misc_lo` strings as floor — both are MISSES; this audit lists them
under MISS, asserted by the self-test guards below).

**MISS spot checks** (fe8u ships an editable source):

- `data/banim/AnimSprite_DemoKingTunkFace_1.bin` → **MISS** (battle-anim) — proof: fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s)
- `data/residual/Ch10EphraimMapChanges.bin` → **MISS** (map-tilemaps) — proof: fe8u src/data/map/change/Ch10EphraimMapChanges.json
- `data/residual/EventListScr_Ch10a_Character.bin` → **MISS** (unitdef-residuals) — proof: fe8u src/events/*.c (EVENT_* / PROC_* macros)
- `data/residual/MenuItems_SioMenudef_0.bin` → **MISS** (menu-strings) — proof: fe8u C string literals (src/menu_def.c parity)
- `data/residual/gBattleForecast_0.bin` → **MISS** (pixel-gfx) — proof: fe8u preview/tsa/misc/gBattleForecast_0.png
- `data/residual/rom_header_080000C0.bin` → **MISS** (sound-m4a-tables) — proof: fe8u src/rom_header.s

**FLOOR spot checks** (fe8u also keeps binary):

- `data/banim/Tsa_DemonLightBg_Close_1.bin` → **FLOOR** (TSA/.map.bin) — proof: fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin)
- `graphics/banim/efxbattle/TsaConf_BanimTmA1.map.bin` → **FLOOR** (efx-effect-bins) — proof: fe8u keeps .map.bin binary (TSA/tilemap)
- `graphics/opanim/OpAnimCharacterBG.map.bin` → **FLOOR** (opanim-tilemaps) — proof: fe8u keeps .map.bin binary (TSA/tilemap)
- `data/banim/Tsa_DemonLightBg_Close_10.bin` → **FLOOR** (TSA/.map.bin) — proof: fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin)
- `data/banim/Tsa_DemonLightBg_Close_11.bin` → **FLOOR** (TSA/.map.bin) — proof: fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin)
- `data/banim/Tsa_DemonLightBg_Close_12.bin` → **FLOOR** (TSA/.map.bin) — proof: fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin)

**Self-test guards** (the script exits non-zero if any fail):

- `frontier_chap_title_*` is classified **MISS** (chapter-title gfx → fe8u `.png`), not FLOOR.
- `frontier_df4_misc_lo_*` is classified **MISS** (string pools → fe8u C literals), not FLOOR.
- `*.tsa.bin` and `*.map.bin` are classified **FLOOR** (fe8u keeps them binary).
- `graphics/banim/efx*` effect bins are classified **FLOOR**.
- `data/sound/gMPlayTable.bin` is classified **MISS** (→ fe8u `sound/music_player_table.s`).

## MISS (3251) — fe8u builds these from editable source — fix (extract to the fe8u form).

<details><summary>3251 entries</summary>

| `.bin` (fe8j) | category | fe8u-source proof |
|---|---|---|
| `data/banim/AnimSprite_DemoKingTunkFace_1.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_DemoKingTunkFace_2.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_DemoKingTunkFace_3.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_DemoKingTunkFace_4.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_1.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_10.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_11.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_12.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_13.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_14.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_15.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_16.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_17.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_18.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_19.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_2.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_20.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_21.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_22.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_23.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_24.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_25.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_26.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_27.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_28.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_29.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_3.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_30.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_31.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_4.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_5.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_6.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_7.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_8.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxClasschgObjDrop_9.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire1Obj_1.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire1Obj_10.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire1Obj_11.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire1Obj_12.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire1Obj_2.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire1Obj_3.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire1Obj_4.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire1Obj_5.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire1Obj_6.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire1Obj_7.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire1Obj_8.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire1Obj_9.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire2Obj1_1.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire2Obj1_10.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire2Obj1_11.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire2Obj1_12.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire2Obj1_2.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire2Obj1_3.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire2Obj1_4.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire2Obj1_5.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire2Obj1_6.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire2Obj1_7.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire2Obj1_8.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEyeFire2Obj1_9.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEye_1.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEye_10.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEye_11.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEye_12.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEye_13.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEye_2.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEye_3.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEye_4.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEye_5.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEye_6.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEye_7.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEye_8.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashEye_9.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashThunderObj_1.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashThunderObj_10.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashThunderObj_11.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashThunderObj_12.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashThunderObj_13.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashThunderObj_2.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashThunderObj_3.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashThunderObj_4.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashThunderObj_5.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashThunderObj_6.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashThunderObj_7.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashThunderObj_8.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_EfxMaohFlashThunderObj_9.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_Ekrdragonfx0_0.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_Ekrdragonfx0_1.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_Ekrdragonfx0_2.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_Ekrdragonfx0_3.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_Ekrdragonfx0_4.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_Ekrdragonfx0_5.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_Ekrdragonfx0_6.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_Ekrdragonfx0_7.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_Ekrdragonfx1_0.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_Ekrdragonfx1_1.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_Ekrdragonfx1_2.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_Ekrdragonfx1_3.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_Ekrdragonfx1_4.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_Ekrdragonfx1_5.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_Ekrdragonfx1_6.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/AnimSprite_Ekrdragonfx1_7.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_1.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_10.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_11.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_12.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_13.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_14.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_15.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_16.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_17.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_18.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_19.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_2.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_20.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_21.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_22.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_23.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_24.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_25.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_26.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_27.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_28.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_29.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_3.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_30.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_31.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_32.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_4.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_5.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_6.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_7.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_8.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Close_9.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_1.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_10.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_11.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_12.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_13.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_14.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_15.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_16.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_17.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_18.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_19.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_2.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_20.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_21.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_22.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_23.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_24.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_25.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_26.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_27.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_28.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_29.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_3.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_30.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_31.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_32.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_4.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_5.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_6.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_7.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_8.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_DemonLightBg_Far_9.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_EfxSkill1.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_EfxSkill10.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_EfxSkill2.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_EfxSkill3.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_EfxSkill4.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_EfxSkill5.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_EfxSkill6.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_EfxSkill7.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_EfxSkill8.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_EfxSkill9.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_EfxSkillA.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_EfxSkillB.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_EfxSkillC.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_EfxSkillD.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_EfxSkillE.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Img_EfxSkillF.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Pal_EfxSkill1.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Pal_EfxSkill10.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Pal_EfxSkill2.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Pal_EfxSkill3.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Pal_EfxSkill4.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Pal_EfxSkill5.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Pal_EfxSkill6.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Pal_EfxSkill7.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Pal_EfxSkill8.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Pal_EfxSkill9.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Pal_EfxSkillA.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Pal_EfxSkillB.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Pal_EfxSkillC.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Pal_EfxSkillD.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Pal_EfxSkillE.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/Pal_EfxSkillF.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_arcf_ar1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_arcf_ar1_2_motion_o.bin` | battle-anim | fe8u banim/banim_arcf_ar1_2_motion.s |
| `data/banim/banim_arcf_ar1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_arcf_ar1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_arcf_ar1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_arcf_ar1_motion_o.bin` | battle-anim | fe8u banim/banim_arcf_ar1_motion.s |
| `data/banim/banim_arcf_ar1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_arcf_ar1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_arcm_ar1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_arcm_ar1_2_motion_o.bin` | battle-anim | fe8u banim/banim_arcm_ar1_2_motion.s |
| `data/banim/banim_arcm_ar1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_arcm_ar1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_arcm_ar1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_arcm_ar1_motion_o.bin` | battle-anim | fe8u banim/banim_arcm_ar1_motion.s |
| `data/banim/banim_arcm_ar1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_arcm_ar1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_armm_sp1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_armm_sp1_2_motion_o.bin` | battle-anim | fe8u banim/banim_armm_sp1_2_motion.s |
| `data/banim/banim_armm_sp1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_armm_sp1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_armm_sp1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_armm_sp1_3_motion_o.bin` | battle-anim | fe8u banim/banim_armm_sp1_3_motion.s |
| `data/banim/banim_armm_sp1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_armm_sp1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_armm_sp1_4_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_armm_sp1_4_motion_o.bin` | battle-anim | fe8u banim/banim_armm_sp1_4_motion.s |
| `data/banim/banim_armm_sp1_4_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_armm_sp1_4_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_armm_sp1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_armm_sp1_motion_o.bin` | battle-anim | fe8u banim/banim_armm_sp1_motion.s |
| `data/banim/banim_armm_sp1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_armm_sp1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_asnm_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_asnm_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_asnm_sw1_2_motion.s |
| `data/banim/banim_asnm_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_asnm_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_asnm_sw1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_asnm_sw1_3_motion_o.bin` | battle-anim | fe8u banim/banim_asnm_sw1_3_motion.s |
| `data/banim/banim_asnm_sw1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_asnm_sw1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_asnm_sw1_4_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_asnm_sw1_4_motion_o.bin` | battle-anim | fe8u banim/banim_asnm_sw1_4_motion.s |
| `data/banim/banim_asnm_sw1_4_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_asnm_sw1_4_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_asnm_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_asnm_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_asnm_sw1_motion.s |
| `data/banim/banim_asnm_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_asnm_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bae_at1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bae_at1_2_motion_o.bin` | battle-anim | fe8u banim/banim_bae_at1_2_motion.s |
| `data/banim/banim_bae_at1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bae_at1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bae_at1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bae_at1_motion_o.bin` | battle-anim | fe8u banim/banim_bae_at1_motion.s |
| `data/banim/banim_bae_at1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bae_at1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_banm_ax1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_banm_ax1_2_motion_o.bin` | battle-anim | fe8u banim/banim_banm_ax1_2_motion.s |
| `data/banim/banim_banm_ax1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_banm_ax1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_banm_ax1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_banm_ax1_3_motion_o.bin` | battle-anim | fe8u banim/banim_banm_ax1_3_motion.s |
| `data/banim/banim_banm_ax1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_banm_ax1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_banm_ax1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_banm_ax1_motion_o.bin` | battle-anim | fe8u banim/banim_banm_ax1_motion.s |
| `data/banim/banim_banm_ax1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_banm_ax1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bgl_mg1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bgl_mg1_2_motion_o.bin` | battle-anim | fe8u banim/banim_bgl_mg1_2_motion.s |
| `data/banim/banim_bgl_mg1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bgl_mg1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bgl_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bgl_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_bgl_mg1_motion.s |
| `data/banim/banim_bgl_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bgl_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bisf_mg1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bisf_mg1_2_motion_o.bin` | battle-anim | fe8u banim/banim_bisf_mg1_2_motion.s |
| `data/banim/banim_bisf_mg1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bisf_mg1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bisf_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bisf_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_bisf_mg1_motion.s |
| `data/banim/banim_bisf_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bisf_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bism_mg1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bism_mg1_2_motion_o.bin` | battle-anim | fe8u banim/banim_bism_mg1_2_motion.s |
| `data/banim/banim_bism_mg1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bism_mg1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bism_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bism_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_bism_mg1_motion.s |
| `data/banim/banim_bism_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bism_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bos_at1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bos_at1_2_motion_o.bin` | battle-anim | fe8u banim/banim_bos_at1_2_motion.s |
| `data/banim/banim_bos_at1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bos_at1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bos_at1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bos_at1_motion_o.bin` | battle-anim | fe8u banim/banim_bos_at1_motion.s |
| `data/banim/banim_bos_at1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bos_at1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bram_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bram_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_bram_sw1_2_motion.s |
| `data/banim/banim_bram_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bram_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bram_sw1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bram_sw1_3_motion_o.bin` | battle-anim | fe8u banim/banim_bram_sw1_3_motion.s |
| `data/banim/banim_bram_sw1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bram_sw1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bram_sw1_4_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bram_sw1_4_motion_o.bin` | battle-anim | fe8u banim/banim_bram_sw1_4_motion.s |
| `data/banim/banim_bram_sw1_4_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bram_sw1_4_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bram_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bram_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_bram_sw1_motion.s |
| `data/banim/banim_bram_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_bram_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_brsm_ax1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_brsm_ax1_2_motion_o.bin` | battle-anim | fe8u banim/banim_brsm_ax1_2_motion.s |
| `data/banim/banim_brsm_ax1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_brsm_ax1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_brsm_ax1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_brsm_ax1_3_motion_o.bin` | battle-anim | fe8u banim/banim_brsm_ax1_3_motion.s |
| `data/banim/banim_brsm_ax1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_brsm_ax1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_brsm_ax1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_brsm_ax1_motion_o.bin` | battle-anim | fe8u banim/banim_brsm_ax1_motion.s |
| `data/banim/banim_brsm_ax1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_brsm_ax1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_cer_at1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_cer_at1_motion_o.bin` | battle-anim | fe8u banim/banim_cer_at1_motion.s |
| `data/banim/banim_cer_at1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_cer_at1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_cyc_ax1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_cyc_ax1_2_motion_o.bin` | battle-anim | fe8u banim/banim_cyc_ax1_2_motion.s |
| `data/banim/banim_cyc_ax1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_cyc_ax1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_cyc_ax1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_cyc_ax1_3_motion_o.bin` | battle-anim | fe8u banim/banim_cyc_ax1_3_motion.s |
| `data/banim/banim_cyc_ax1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_cyc_ax1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_cyc_ax1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_cyc_ax1_motion_o.bin` | battle-anim | fe8u banim/banim_cyc_ax1_motion.s |
| `data/banim/banim_cyc_ax1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_cyc_ax1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_danf_da1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_danf_da1_motion_o.bin` | battle-anim | fe8u banim/banim_danf_da1_motion.s |
| `data/banim/banim_danf_da1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_danf_da1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drkm_sp1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drkm_sp1_2_motion_o.bin` | battle-anim | fe8u banim/banim_drkm_sp1_2_motion.s |
| `data/banim/banim_drkm_sp1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drkm_sp1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drkm_sp1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drkm_sp1_3_motion_o.bin` | battle-anim | fe8u banim/banim_drkm_sp1_3_motion.s |
| `data/banim/banim_drkm_sp1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drkm_sp1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drkm_sp1_4_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drkm_sp1_4_motion_o.bin` | battle-anim | fe8u banim/banim_drkm_sp1_4_motion.s |
| `data/banim/banim_drkm_sp1_4_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drkm_sp1_4_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drkm_sp1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drkm_sp1_motion_o.bin` | battle-anim | fe8u banim/banim_drkm_sp1_motion.s |
| `data/banim/banim_drkm_sp1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drkm_sp1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_2_motion_o.bin` | battle-anim | fe8u banim/banim_drmm_sp1_2_motion.s |
| `data/banim/banim_drmm_sp1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_3_motion_o.bin` | battle-anim | fe8u banim/banim_drmm_sp1_3_motion.s |
| `data/banim/banim_drmm_sp1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_4_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_4_motion_o.bin` | battle-anim | fe8u banim/banim_drmm_sp1_4_motion.s |
| `data/banim/banim_drmm_sp1_4_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_4_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_5_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_5_motion_o.bin` | battle-anim | fe8u banim/banim_drmm_sp1_5_motion.s |
| `data/banim/banim_drmm_sp1_5_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_5_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_6_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_6_motion_o.bin` | battle-anim | fe8u banim/banim_drmm_sp1_6_motion.s |
| `data/banim/banim_drmm_sp1_6_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_6_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_motion_o.bin` | battle-anim | fe8u banim/banim_drmm_sp1_motion.s |
| `data/banim/banim_drmm_sp1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drmm_sp1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_druf_mg1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_druf_mg1_2_motion_o.bin` | battle-anim | fe8u banim/banim_druf_mg1_2_motion.s |
| `data/banim/banim_druf_mg1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_druf_mg1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_druf_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_druf_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_druf_mg1_motion.s |
| `data/banim/banim_druf_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_druf_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drum_mg1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drum_mg1_2_motion_o.bin` | battle-anim | fe8u banim/banim_drum_mg1_2_motion.s |
| `data/banim/banim_drum_mg1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drum_mg1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drum_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drum_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_drum_mg1_motion.s |
| `data/banim/banim_drum_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drum_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drz_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drz_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_drz_mg1_motion.s |
| `data/banim/banim_drz_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_drz_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fakf_sp1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fakf_sp1_2_motion_o.bin` | battle-anim | fe8u banim/banim_fakf_sp1_2_motion.s |
| `data/banim/banim_fakf_sp1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fakf_sp1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fakf_sp1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fakf_sp1_3_motion_o.bin` | battle-anim | fe8u banim/banim_fakf_sp1_3_motion.s |
| `data/banim/banim_fakf_sp1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fakf_sp1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fakf_sp1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fakf_sp1_motion_o.bin` | battle-anim | fe8u banim/banim_fakf_sp1_motion.s |
| `data/banim/banim_fakf_sp1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fakf_sp1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fifd_he1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fifd_he1_motion_o.bin` | battle-anim | fe8u banim/banim_fifd_he1_motion.s |
| `data/banim/banim_fifd_he1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fifd_he1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fifd_hk1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fifd_hk1_motion_o.bin` | battle-anim | fe8u banim/banim_fifd_hk1_motion.s |
| `data/banim/banim_fifd_hk1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fifd_hk1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fifd_mg1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fifd_mg1_2_motion_o.bin` | battle-anim | fe8u banim/banim_fifd_mg1_2_motion.s |
| `data/banim/banim_fifd_mg1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fifd_mg1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fifd_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fifd_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_fifd_mg1_motion.s |
| `data/banim/banim_fifd_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_fifd_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_figm_ax1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_figm_ax1_2_motion_o.bin` | battle-anim | fe8u banim/banim_figm_ax1_2_motion.s |
| `data/banim/banim_figm_ax1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_figm_ax1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_figm_ax1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_figm_ax1_3_motion_o.bin` | battle-anim | fe8u banim/banim_figm_ax1_3_motion.s |
| `data/banim/banim_figm_ax1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_figm_ax1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_figm_ax1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_figm_ax1_motion_o.bin` | battle-anim | fe8u banim/banim_figm_ax1_motion.s |
| `data/banim/banim_figm_ax1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_figm_ax1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_forf_ar1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_forf_ar1_motion_o.bin` | battle-anim | fe8u banim/banim_forf_ar1_motion.s |
| `data/banim/banim_forf_ar1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_forf_ar1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_forf_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_forf_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_forf_sw1_2_motion.s |
| `data/banim/banim_forf_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_forf_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_forf_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_forf_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_forf_sw1_motion.s |
| `data/banim/banim_forf_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_forf_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_form_ar1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_form_ar1_motion_o.bin` | battle-anim | fe8u banim/banim_form_ar1_motion.s |
| `data/banim/banim_form_ar1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_form_ar1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_form_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_form_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_form_sw1_2_motion.s |
| `data/banim/banim_form_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_form_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_form_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_form_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_form_sw1_motion.s |
| `data/banim/banim_form_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_form_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_gar_sp1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_gar_sp1_2_motion_o.bin` | battle-anim | fe8u banim/banim_gar_sp1_2_motion.s |
| `data/banim/banim_gar_sp1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_gar_sp1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_gar_sp1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_gar_sp1_3_motion_o.bin` | battle-anim | fe8u banim/banim_gar_sp1_3_motion.s |
| `data/banim/banim_gar_sp1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_gar_sp1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_gar_sp1_4_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_gar_sp1_4_motion_o.bin` | battle-anim | fe8u banim/banim_gar_sp1_4_motion.s |
| `data/banim/banim_gar_sp1_4_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_gar_sp1_4_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_gar_sp1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_gar_sp1_motion_o.bin` | battle-anim | fe8u banim/banim_gar_sp1_motion.s |
| `data/banim/banim_gar_sp1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_gar_sp1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_2_motion_o.bin` | battle-anim | fe8u banim/banim_genm_al1_2_motion.s |
| `data/banim/banim_genm_al1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_3_motion_o.bin` | battle-anim | fe8u banim/banim_genm_al1_3_motion.s |
| `data/banim/banim_genm_al1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_4_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_4_motion_o.bin` | battle-anim | fe8u banim/banim_genm_al1_4_motion.s |
| `data/banim/banim_genm_al1_4_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_4_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_5_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_5_motion_o.bin` | battle-anim | fe8u banim/banim_genm_al1_5_motion.s |
| `data/banim/banim_genm_al1_5_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_5_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_6_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_6_motion_o.bin` | battle-anim | fe8u banim/banim_genm_al1_6_motion.s |
| `data/banim/banim_genm_al1_6_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_6_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_7_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_7_motion_o.bin` | battle-anim | fe8u banim/banim_genm_al1_7_motion.s |
| `data/banim/banim_genm_al1_7_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_7_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_8_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_8_motion_o.bin` | battle-anim | fe8u banim/banim_genm_al1_8_motion.s |
| `data/banim/banim_genm_al1_8_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_8_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_motion_o.bin` | battle-anim | fe8u banim/banim_genm_al1_motion.s |
| `data/banim/banim_genm_al1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_al1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_genm_sw1_2_motion.s |
| `data/banim/banim_genm_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_genm_sw1_motion.s |
| `data/banim/banim_genm_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_genm_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_gog_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_gog_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_gog_mg1_motion.s |
| `data/banim/banim_gog_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_gog_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_ax1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_ax1_2_motion_o.bin` | battle-anim | fe8u banim/banim_grkm_ax1_2_motion.s |
| `data/banim/banim_grkm_ax1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_ax1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_ax1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_ax1_3_motion_o.bin` | battle-anim | fe8u banim/banim_grkm_ax1_3_motion.s |
| `data/banim/banim_grkm_ax1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_ax1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_ax1_4_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_ax1_4_motion_o.bin` | battle-anim | fe8u banim/banim_grkm_ax1_4_motion.s |
| `data/banim/banim_grkm_ax1_4_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_ax1_4_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_ax1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_ax1_motion_o.bin` | battle-anim | fe8u banim/banim_grkm_ax1_motion.s |
| `data/banim/banim_grkm_ax1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_ax1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sp1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sp1_2_motion_o.bin` | battle-anim | fe8u banim/banim_grkm_sp1_2_motion.s |
| `data/banim/banim_grkm_sp1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sp1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sp1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sp1_motion_o.bin` | battle-anim | fe8u banim/banim_grkm_sp1_motion.s |
| `data/banim/banim_grkm_sp1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sp1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_grkm_sw1_2_motion.s |
| `data/banim/banim_grkm_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sw1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sw1_3_motion_o.bin` | battle-anim | fe8u banim/banim_grkm_sw1_3_motion.s |
| `data/banim/banim_grkm_sw1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sw1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sw1_4_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sw1_4_motion_o.bin` | battle-anim | fe8u banim/banim_grkm_sw1_4_motion.s |
| `data/banim/banim_grkm_sw1_4_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sw1_4_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_grkm_sw1_motion.s |
| `data/banim/banim_grkm_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_grkm_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lomf_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lomf_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_lomf_sw1_2_motion.s |
| `data/banim/banim_lomf_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lomf_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lomf_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lomf_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_lomf_sw1_motion.s |
| `data/banim/banim_lomf_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lomf_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lomm_sp1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lomm_sp1_2_motion_o.bin` | battle-anim | fe8u banim/banim_lomm_sp1_2_motion.s |
| `data/banim/banim_lomm_sp1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lomm_sp1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lomm_sp1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lomm_sp1_motion_o.bin` | battle-anim | fe8u banim/banim_lomm_sp1_motion.s |
| `data/banim/banim_lomm_sp1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lomm_sp1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorf_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorf_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_lorf_sw1_2_motion.s |
| `data/banim/banim_lorf_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorf_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorf_sw1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorf_sw1_3_motion_o.bin` | battle-anim | fe8u banim/banim_lorf_sw1_3_motion.s |
| `data/banim/banim_lorf_sw1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorf_sw1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorf_sw1_4_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorf_sw1_4_motion_o.bin` | battle-anim | fe8u banim/banim_lorf_sw1_4_motion.s |
| `data/banim/banim_lorf_sw1_4_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorf_sw1_4_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorf_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorf_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_lorf_sw1_motion.s |
| `data/banim/banim_lorf_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorf_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorm_sp1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorm_sp1_2_motion_o.bin` | battle-anim | fe8u banim/banim_lorm_sp1_2_motion.s |
| `data/banim/banim_lorm_sp1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorm_sp1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorm_sp1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorm_sp1_motion_o.bin` | battle-anim | fe8u banim/banim_lorm_sp1_motion.s |
| `data/banim/banim_lorm_sp1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_lorm_sp1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_magf_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_magf_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_magf_mg1_motion.s |
| `data/banim/banim_magf_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_magf_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_magm_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_magm_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_magm_mg1_motion.s |
| `data/banim/banim_magm_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_magm_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ar1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ar1_motion_o.bin` | battle-anim | fe8u banim/banim_mcd_ar1_motion.s |
| `data/banim/banim_mcd_ar1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ar1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_2_motion_o.bin` | battle-anim | fe8u banim/banim_mcd_ax1_2_motion.s |
| `data/banim/banim_mcd_ax1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_3_motion_o.bin` | battle-anim | fe8u banim/banim_mcd_ax1_3_motion.s |
| `data/banim/banim_mcd_ax1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_4_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_4_motion_o.bin` | battle-anim | fe8u banim/banim_mcd_ax1_4_motion.s |
| `data/banim/banim_mcd_ax1_4_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_4_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_5_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_5_motion_o.bin` | battle-anim | fe8u banim/banim_mcd_ax1_5_motion.s |
| `data/banim/banim_mcd_ax1_5_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_5_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_6_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_6_motion_o.bin` | battle-anim | fe8u banim/banim_mcd_ax1_6_motion.s |
| `data/banim/banim_mcd_ax1_6_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_6_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_motion_o.bin` | battle-anim | fe8u banim/banim_mcd_ax1_motion.s |
| `data/banim/banim_mcd_ax1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mcd_ax1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mdg_at1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mdg_at1_motion_o.bin` | battle-anim | fe8u banim/banim_mdg_at1_motion.s |
| `data/banim/banim_mdg_at1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mdg_at1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_merm_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_merm_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_merm_sw1_2_motion.s |
| `data/banim/banim_merm_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_merm_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_merm_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_merm_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_merm_sw1_motion.s |
| `data/banim/banim_merm_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_merm_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mf_mi1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mf_mi1_motion_o.bin` | battle-anim | fe8u banim/banim_mf_mi1_motion.s |
| `data/banim/banim_mf_mi1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mf_mi1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mgkf_mg1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mgkf_mg1_2_motion_o.bin` | battle-anim | fe8u banim/banim_mgkf_mg1_2_motion.s |
| `data/banim/banim_mgkf_mg1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mgkf_mg1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mgkf_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mgkf_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_mgkf_mg1_motion.s |
| `data/banim/banim_mgkf_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mgkf_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mgkm_mg1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mgkm_mg1_2_motion_o.bin` | battle-anim | fe8u banim/banim_mgkm_mg1_2_motion.s |
| `data/banim/banim_mgkm_mg1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mgkm_mg1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mgkm_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mgkm_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_mgkm_mg1_motion.s |
| `data/banim/banim_mgkm_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_mgkm_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_monm_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_monm_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_monm_mg1_motion.s |
| `data/banim/banim_monm_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_monm_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_myrf_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_myrf_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_myrf_sw1_2_motion.s |
| `data/banim/banim_myrf_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_myrf_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_myrf_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_myrf_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_myrf_sw1_motion.s |
| `data/banim/banim_myrf_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_myrf_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_myrm_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_myrm_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_myrm_sw1_2_motion.s |
| `data/banim/banim_myrm_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_myrm_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_myrm_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_myrm_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_myrm_sw1_motion.s |
| `data/banim/banim_myrm_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_myrm_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_necm_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_necm_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_necm_mg1_motion.s |
| `data/banim/banim_necm_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_necm_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_necm_ro1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_necm_ro1_motion_o.bin` | battle-anim | fe8u banim/banim_necm_ro1_motion.s |
| `data/banim/banim_necm_ro1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_necm_ro1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_paif_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_paif_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_paif_sw1_2_motion.s |
| `data/banim/banim_paif_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_paif_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_paif_sw1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_paif_sw1_3_motion_o.bin` | battle-anim | fe8u banim/banim_paif_sw1_3_motion.s |
| `data/banim/banim_paif_sw1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_paif_sw1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_paif_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_paif_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_paif_sw1_motion.s |
| `data/banim/banim_paif_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_paif_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pakm_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pakm_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_pakm_sw1_2_motion.s |
| `data/banim/banim_pakm_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pakm_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pakm_sw1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pakm_sw1_3_motion_o.bin` | battle-anim | fe8u banim/banim_pakm_sw1_3_motion.s |
| `data/banim/banim_pakm_sw1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pakm_sw1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pakm_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pakm_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_pakm_sw1_motion.s |
| `data/banim/banim_pakm_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pakm_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbfm_ax1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbfm_ax1_2_motion_o.bin` | battle-anim | fe8u banim/banim_pbfm_ax1_2_motion.s |
| `data/banim/banim_pbfm_ax1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbfm_ax1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbfm_ax1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbfm_ax1_3_motion_o.bin` | battle-anim | fe8u banim/banim_pbfm_ax1_3_motion.s |
| `data/banim/banim_pbfm_ax1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbfm_ax1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbfm_ax1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbfm_ax1_motion_o.bin` | battle-anim | fe8u banim/banim_pbfm_ax1_motion.s |
| `data/banim/banim_pbfm_ax1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbfm_ax1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbmm_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbmm_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_pbmm_mg1_motion.s |
| `data/banim/banim_pbmm_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbmm_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbrf_sp1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbrf_sp1_2_motion_o.bin` | battle-anim | fe8u banim/banim_pbrf_sp1_2_motion.s |
| `data/banim/banim_pbrf_sp1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbrf_sp1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbrf_sp1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbrf_sp1_motion_o.bin` | battle-anim | fe8u banim/banim_pbrf_sp1_motion.s |
| `data/banim/banim_pbrf_sp1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pbrf_sp1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pekf_sp1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pekf_sp1_2_motion_o.bin` | battle-anim | fe8u banim/banim_pekf_sp1_2_motion.s |
| `data/banim/banim_pekf_sp1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pekf_sp1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pekf_sp1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pekf_sp1_motion_o.bin` | battle-anim | fe8u banim/banim_pekf_sp1_motion.s |
| `data/banim/banim_pekf_sp1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pekf_sp1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pirm_ax1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pirm_ax1_2_motion_o.bin` | battle-anim | fe8u banim/banim_pirm_ax1_2_motion.s |
| `data/banim/banim_pirm_ax1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pirm_ax1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pirm_ax1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pirm_ax1_3_motion_o.bin` | battle-anim | fe8u banim/banim_pirm_ax1_3_motion.s |
| `data/banim/banim_pirm_ax1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pirm_ax1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pirm_ax1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pirm_ax1_motion_o.bin` | battle-anim | fe8u banim/banim_pirm_ax1_motion.s |
| `data/banim/banim_pirm_ax1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_pirm_ax1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_prif_ro1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_prif_ro1_2_motion_o.bin` | battle-anim | fe8u banim/banim_prif_ro1_2_motion.s |
| `data/banim/banim_prif_ro1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_prif_ro1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_prif_ro1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_prif_ro1_motion_o.bin` | battle-anim | fe8u banim/banim_prif_ro1_motion.s |
| `data/banim/banim_prif_ro1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_prif_ro1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_prim_ro1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_prim_ro1_2_motion_o.bin` | battle-anim | fe8u banim/banim_prim_ro1_2_motion.s |
| `data/banim/banim_prim_ro1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_prim_ro1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_prim_ro1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_prim_ro1_motion_o.bin` | battle-anim | fe8u banim/banim_prim_ro1_motion.s |
| `data/banim/banim_prim_ro1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_prim_ro1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_rogm_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_rogm_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_rogm_sw1_2_motion.s |
| `data/banim/banim_rogm_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_rogm_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_rogm_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_rogm_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_rogm_sw1_motion.s |
| `data/banim/banim_rogm_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_rogm_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sagf_mg1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sagf_mg1_2_motion_o.bin` | battle-anim | fe8u banim/banim_sagf_mg1_2_motion.s |
| `data/banim/banim_sagf_mg1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sagf_mg1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sagf_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sagf_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_sagf_mg1_motion.s |
| `data/banim/banim_sagf_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sagf_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sagm_mg1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sagm_mg1_2_motion_o.bin` | battle-anim | fe8u banim/banim_sagm_mg1_2_motion.s |
| `data/banim/banim_sagm_mg1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sagm_mg1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sagm_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sagm_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_sagm_mg1_motion.s |
| `data/banim/banim_sagm_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sagm_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_shaf_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_shaf_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_shaf_mg1_motion.s |
| `data/banim/banim_shaf_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_shaf_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sham_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sham_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_sham_mg1_motion.s |
| `data/banim/banim_sham_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sham_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_ska_ar1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_ska_ar1_2_motion_o.bin` | battle-anim | fe8u banim/banim_ska_ar1_2_motion.s |
| `data/banim/banim_ska_ar1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_ska_ar1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_ska_ar1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_ska_ar1_motion_o.bin` | battle-anim | fe8u banim/banim_ska_ar1_motion.s |
| `data/banim/banim_ska_ar1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_ska_ar1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sp1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sp1_2_motion_o.bin` | battle-anim | fe8u banim/banim_sks_sp1_2_motion.s |
| `data/banim/banim_sks_sp1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sp1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sp1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sp1_motion_o.bin` | battle-anim | fe8u banim/banim_sks_sp1_motion.s |
| `data/banim/banim_sks_sp1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sp1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_sks_sw1_2_motion.s |
| `data/banim/banim_sks_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_3_motion_o.bin` | battle-anim | fe8u banim/banim_sks_sw1_3_motion.s |
| `data/banim/banim_sks_sw1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_4_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_4_motion_o.bin` | battle-anim | fe8u banim/banim_sks_sw1_4_motion.s |
| `data/banim/banim_sks_sw1_4_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_4_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_5_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_5_motion_o.bin` | battle-anim | fe8u banim/banim_sks_sw1_5_motion.s |
| `data/banim/banim_sks_sw1_5_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_5_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_6_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_6_motion_o.bin` | battle-anim | fe8u banim/banim_sks_sw1_6_motion.s |
| `data/banim/banim_sks_sw1_6_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_6_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_sks_sw1_motion.s |
| `data/banim/banim_sks_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sks_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_smnm_ro1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_smnm_ro1_2_motion_o.bin` | battle-anim | fe8u banim/banim_smnm_ro1_2_motion.s |
| `data/banim/banim_smnm_ro1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_smnm_ro1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_smnm_ro1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_smnm_ro1_motion_o.bin` | battle-anim | fe8u banim/banim_smnm_ro1_motion.s |
| `data/banim/banim_smnm_ro1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_smnm_ro1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_snif_ar1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_snif_ar1_2_motion_o.bin` | battle-anim | fe8u banim/banim_snif_ar1_2_motion.s |
| `data/banim/banim_snif_ar1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_snif_ar1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_snif_ar1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_snif_ar1_motion_o.bin` | battle-anim | fe8u banim/banim_snif_ar1_motion.s |
| `data/banim/banim_snif_ar1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_snif_ar1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_snim_ar1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_snim_ar1_2_motion_o.bin` | battle-anim | fe8u banim/banim_snim_ar1_2_motion.s |
| `data/banim/banim_snim_ar1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_snim_ar1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_snim_ar1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_snim_ar1_motion_o.bin` | battle-anim | fe8u banim/banim_snim_ar1_motion.s |
| `data/banim/banim_snim_ar1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_snim_ar1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokf_sp1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokf_sp1_2_motion_o.bin` | battle-anim | fe8u banim/banim_sokf_sp1_2_motion.s |
| `data/banim/banim_sokf_sp1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokf_sp1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokf_sp1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokf_sp1_3_motion_o.bin` | battle-anim | fe8u banim/banim_sokf_sp1_3_motion.s |
| `data/banim/banim_sokf_sp1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokf_sp1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokf_sp1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokf_sp1_motion_o.bin` | battle-anim | fe8u banim/banim_sokf_sp1_motion.s |
| `data/banim/banim_sokf_sp1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokf_sp1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokm_sp1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokm_sp1_2_motion_o.bin` | battle-anim | fe8u banim/banim_sokm_sp1_2_motion.s |
| `data/banim/banim_sokm_sp1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokm_sp1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokm_sp1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokm_sp1_3_motion_o.bin` | battle-anim | fe8u banim/banim_sokm_sp1_3_motion.s |
| `data/banim/banim_sokm_sp1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokm_sp1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokm_sp1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokm_sp1_motion_o.bin` | battle-anim | fe8u banim/banim_sokm_sp1_motion.s |
| `data/banim/banim_sokm_sp1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_sokm_sp1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_solm_sp1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_solm_sp1_2_motion_o.bin` | battle-anim | fe8u banim/banim_solm_sp1_2_motion.s |
| `data/banim/banim_solm_sp1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_solm_sp1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_solm_sp1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_solm_sp1_motion_o.bin` | battle-anim | fe8u banim/banim_solm_sp1_motion.s |
| `data/banim/banim_solm_sp1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_solm_sp1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_stam_ar1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_stam_ar1_motion_o.bin` | battle-anim | fe8u banim/banim_stam_ar1_motion.s |
| `data/banim/banim_stam_ar1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_stam_ar1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_swmf_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_swmf_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_swmf_sw1_2_motion.s |
| `data/banim/banim_swmf_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_swmf_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_swmf_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_swmf_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_swmf_sw1_motion.s |
| `data/banim/banim_swmf_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_swmf_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_swmm_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_swmm_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_swmm_sw1_2_motion.s |
| `data/banim/banim_swmm_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_swmm_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_swmm_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_swmm_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_swmm_sw1_motion.s |
| `data/banim/banim_swmm_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_swmm_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_thim_sw1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_thim_sw1_2_motion_o.bin` | battle-anim | fe8u banim/banim_thim_sw1_2_motion.s |
| `data/banim/banim_thim_sw1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_thim_sw1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_thim_sw1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_thim_sw1_motion_o.bin` | battle-anim | fe8u banim/banim_thim_sw1_motion.s |
| `data/banim/banim_thim_sw1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_thim_sw1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_trof_ro1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_trof_ro1_2_motion_o.bin` | battle-anim | fe8u banim/banim_trof_ro1_2_motion.s |
| `data/banim/banim_trof_ro1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_trof_ro1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_trof_ro1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_trof_ro1_motion_o.bin` | battle-anim | fe8u banim/banim_trof_ro1_motion.s |
| `data/banim/banim_trof_ro1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_trof_ro1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_valf_mg1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_valf_mg1_2_motion_o.bin` | battle-anim | fe8u banim/banim_valf_mg1_2_motion.s |
| `data/banim/banim_valf_mg1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_valf_mg1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_valf_mg1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_valf_mg1_motion_o.bin` | battle-anim | fe8u banim/banim_valf_mg1_motion.s |
| `data/banim/banim_valf_mg1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_valf_mg1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_warm_ar1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_warm_ar1_motion_o.bin` | battle-anim | fe8u banim/banim_warm_ar1_motion.s |
| `data/banim/banim_warm_ar1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_warm_ar1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_warm_ax1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_warm_ax1_2_motion_o.bin` | battle-anim | fe8u banim/banim_warm_ax1_2_motion.s |
| `data/banim/banim_warm_ax1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_warm_ax1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_warm_ax1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_warm_ax1_3_motion_o.bin` | battle-anim | fe8u banim/banim_warm_ax1_3_motion.s |
| `data/banim/banim_warm_ax1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_warm_ax1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_warm_ax1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_warm_ax1_motion_o.bin` | battle-anim | fe8u banim/banim_warm_ax1_motion.s |
| `data/banim/banim_warm_ax1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_warm_ax1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_wykm_sp1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_wykm_sp1_2_motion_o.bin` | battle-anim | fe8u banim/banim_wykm_sp1_2_motion.s |
| `data/banim/banim_wykm_sp1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_wykm_sp1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_wykm_sp1_3_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_wykm_sp1_3_motion_o.bin` | battle-anim | fe8u banim/banim_wykm_sp1_3_motion.s |
| `data/banim/banim_wykm_sp1_3_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_wykm_sp1_3_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_wykm_sp1_4_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_wykm_sp1_4_motion_o.bin` | battle-anim | fe8u banim/banim_wykm_sp1_4_motion.s |
| `data/banim/banim_wykm_sp1_4_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_wykm_sp1_4_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_wykm_sp1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_wykm_sp1_motion_o.bin` | battle-anim | fe8u banim/banim_wykm_sp1_motion.s |
| `data/banim/banim_wykm_sp1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_wykm_sp1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_zom_at1_2_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_zom_at1_2_motion_o.bin` | battle-anim | fe8u banim/banim_zom_at1_2_motion.s |
| `data/banim/banim_zom_at1_2_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_zom_at1_2_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_zom_at1_modes_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_zom_at1_motion_o.bin` | battle-anim | fe8u banim/banim_zom_at1_motion.s |
| `data/banim/banim_zom_at1_oam_l_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/banim/banim_zom_at1_oam_r_bin.bin` | battle-anim | fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s) |
| `data/residual/AnimScr_NaglfarBG4.bin` | battle-anim | fe8u banim/animscr_*.s (battle-anim script macros) |
| `data/residual/Ch10EphraimMapChanges.bin` | map-tilemaps | fe8u src/data/map/change/Ch10EphraimMapChanges.json |
| `data/residual/Ch11EirikaMapChanges.bin` | map-tilemaps | fe8u src/data/map/change/Ch11EirikaMapChanges.json |
| `data/residual/Ch11EphraimMapChanges.bin` | map-tilemaps | fe8u src/data/map/change/Ch11EphraimMapChanges.json |
| `data/residual/Ch12EirikaMapChanges.bin` | map-tilemaps | fe8u src/data/map/change/Ch12EirikaMapChanges.json |
| `data/residual/Ch12EphraimMapChanges.bin` | map-tilemaps | fe8u src/data/map/change/Ch12EphraimMapChanges.json |
| `data/residual/Ch13EirikaMapChanges.bin` | map-tilemaps | fe8u src/data/map/change/Ch13EirikaMapChanges.json |
| `data/residual/Ch13EphraimMapChanges.bin` | map-tilemaps | fe8u src/data/map/change/Ch13EphraimMapChanges.json |
| `data/residual/Ch14EirikaMapChanges.bin` | map-tilemaps | fe8u src/data/map/change/Ch14EirikaMapChanges.json |
| `data/residual/Ch14EphraimMapChanges.bin` | map-tilemaps | fe8u src/data/map/change/Ch14EphraimMapChanges.json |
| `data/residual/Ch15MapChanges.bin` | map-tilemaps | fe8u src/data/map/change/Ch15MapChanges.json |
| `data/residual/Ch16MapChanges.bin` | map-tilemaps | fe8u src/data/map/change/Ch16MapChanges.json |
| `data/residual/Ch18MapChanges.bin` | map-tilemaps | fe8u src/data/map/change/Ch18MapChanges.json |
| `data/residual/Ch19MapChanges.bin` | map-tilemaps | fe8u src/data/map/change/Ch19MapChanges.json |
| `data/residual/Ch20MapChanges.bin` | map-tilemaps | fe8u src/data/map/change/Ch20MapChanges.json |
| `data/residual/Ch9EphMapChanges.bin` | map-tilemaps | fe8u src/data/map/change/Ch9EphMapChanges.json |
| `data/residual/EventListScr_Ch10a_Character.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Ch10a_Location.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Ch14b_Location.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Ch15b_Location.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Ch15b_Misc.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Ch16b_Location.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Ch17b_Turn.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Ch18b_Misc.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Ch18b_Turn.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Ch19b_Turn.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Ch1_Character.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Ch20b_Turn.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Ch2_Location.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Ch2_Tutorial.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Ch5_Location.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Ch8_Character.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Ch9a_Location.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Ch9a_Turn.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventListScr_Prologue_Tutorial.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch10A_0.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch10A_13.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch10A_8.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch10B_0.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch10a_BeginningScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch10a_EndingScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch11B_0.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch11B_2.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch11B_6.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch11a_EndingScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch12A_0.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch12A_5.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch12B_1.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch13A_3.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch13A_4.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch13B_0.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch13B_1.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch13a_EndingScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch13b_EndingScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch14A_0.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch14A_1.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch14A_8.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch14B_12.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch14B_2.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch14b_BeginningScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch14b_EndingScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15A_0.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15A_17.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15A_18.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15A_19.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15A_20.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15A_21.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15A_22.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15A_23.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15A_24.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15A_25.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15A_26.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15B_14.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15B_15.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15B_16.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15B_17.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15B_18.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15B_19.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15B_20.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15B_21.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch15B_22.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch16A_11.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch16A_12.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch16A_9.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch16B_3.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch16B_5.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch16b_BeginningScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch18A_11.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch18b_BeginningScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch19A_11.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch1Tut_BeforeSethMoveToEnemy.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch1Tut_ChooseSethTurn1.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch1Tut_EirikaVisitHouseIdle1.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch1Tut_EirikaVisitHouseIdle2.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch1Tut_EirikaVisitHouseInit.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch1Tut_SethMoveToEnemy.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch1Tut_TradeSelectGalliamIdle1.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch1Tut_TradeSelectGalliamIdle2.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch1_BeginningScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch1_EndingScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch1_Turn_AllyReinforceArrive.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch20B_1.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch20B_2.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch20b_BeginningScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch21A_0.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch21A_8.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch21A_9.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch21b_BeginningScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch21b_EndingScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2Tutorial11.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2Tutorial12.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2Tutorial14.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2Tutorial15.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2Tutorial18.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2Tutorial2.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2Tutorial21.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2Tutorial22.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2Tutorial23.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2Tutorial24.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2Tutorial27.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2Tutorial28.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2Tutorial4.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2Tutorial5.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2Tutorial8.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2Tutorial9.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2_BeginningScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2_EndingScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch2_Village1.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch3_0.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch3_BeginningScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch3_EndingScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch3_Turn1Npc.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch4_0.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch4_1.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch4_2.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch4_BeginningScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch5_0.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch5_5.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch5_BeginningScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch5_EndingScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch5x_BeginningScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch5x_EndingScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch6_0.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch6_1.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch6_2.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch6_BeginningScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch6_EndingScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch7_BeginningScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch7_EndingScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch8_0.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch8_10.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch8_11.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch8_BeginningScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch9A_2.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch9A_4.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch9B_9.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch9a_BeginningScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ch9a_EndingScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_FloorClearInTower.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_GiveTreasureToLuckyDog.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Prologue_BeginningScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Prologue_EndingScene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Prologue_GiveRapier.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Prologue_RenaisThroneCutscene.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Prologue_TutEirikaAttack.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Prologue_TutMessageTurn2.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Prologue_Tutorial0.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Prologue_Tutorial1.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Prologue_Tutorial4.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Prologue_TutorialA.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Prologue_TutorialB.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ruin_60.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ruin_62.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ruin_64.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ruin_66.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ruin_68.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ruin_70.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ruin_72.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ruin_74.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Ruin_76.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_SkirmishRetreat.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_SuspendPrompt.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/EventScr_Tutorial_Exec1.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/FinalChapterMap2Changes.bin` | map-tilemaps | fe8u src/data/map/change/FinalChapterMap2Changes.json |
| `data/residual/LagdouRuins2MapChanges.bin` | map-tilemaps | fe8u src/data/map/change/LagdouRuins2MapChanges.json |
| `data/residual/LagdouRuins3MapChanges.bin` | map-tilemaps | fe8u src/data/map/change/LagdouRuins3MapChanges.json |
| `data/residual/LagdouRuins5MapChanges.bin` | map-tilemaps | fe8u src/data/map/change/LagdouRuins5MapChanges.json |
| `data/residual/LagdouRuins6MapChanges.bin` | map-tilemaps | fe8u src/data/map/change/LagdouRuins6MapChanges.json |
| `data/residual/LagdouRuins7MapChanges.bin` | map-tilemaps | fe8u src/data/map/change/LagdouRuins7MapChanges.json |
| `data/residual/LagdouRuins8MapChanges.bin` | map-tilemaps | fe8u src/data/map/change/LagdouRuins8MapChanges.json |
| `data/residual/MelkaenCoastMapChanges.bin` | map-tilemaps | fe8u src/data/map/change/MelkaenCoastMapChanges.json |
| `data/residual/MenuItems_SioMenudef_0.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) |
| `data/residual/MenuItems_SioMenudef_1.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) |
| `data/residual/MuSoundScr_Dog.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/MuSoundScr_Gorgon.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/MuSoundScr_Mogall.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/MuSoundScr_Skeleton.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/MuSoundScr_Spider.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/MuSoundScr_Unused2.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/MuSoundScr_Zombie.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/Obj_EfxArrowOBJ.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_EventShinningCursor.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_MapAnimMISS_anim_0.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_MapAnimMISS_anim_list.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_MapAnimMISS_frame_0.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_MapAnimMISS_frame_1.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_MapAnimMISS_frame_10.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_MapAnimMISS_frame_11.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_MapAnimMISS_frame_12.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_MapAnimMISS_frame_2.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_MapAnimMISS_frame_3.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_MapAnimMISS_frame_4.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_MapAnimMISS_frame_5.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_MapAnimMISS_frame_6.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_MapAnimMISS_frame_7.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_MapAnimMISS_frame_8.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_MapAnimMISS_frame_9.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_MapAnimMISS_frame_list.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_MapAnimMISS_motion.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_PoisonAnim_anim_0.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_PoisonAnim_anim_list.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_PoisonAnim_frame_0.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_PoisonAnim_frame_1.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_PoisonAnim_frame_2.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_PoisonAnim_frame_3.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_PoisonAnim_frame_4.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_PoisonAnim_frame_5.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_PoisonAnim_frame_6.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_PoisonAnim_frame_7.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_PoisonAnim_frame_8.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_PoisonAnim_frame_list.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_PoisonAnim_motion.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_SmallBrownNameBoxe1.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_SmallBrownNameBoxe2.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_SmallBrownNameBoxe3.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_SmallBrownNameBoxe4.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_SmallBrownNameBoxe5.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_SmallBrownNameBoxe6.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_anim_0.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_anim_1.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_anim_list.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_0.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_1.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_10.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_11.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_12.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_13.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_14.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_15.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_16.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_17.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_18.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_19.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_2.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_20.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_21.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_22.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_23.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_24.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_25.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_26.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_27.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_28.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_29.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_3.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_30.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_31.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_32.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_33.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_34.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_35.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_36.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_37.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_38.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_39.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_4.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_40.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_41.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_42.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_43.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_44.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_45.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_46.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_47.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_48.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_49.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_5.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_6.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_7.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_8.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_9.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_frame_list.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_2_motion.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_anim_0.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_anim_1.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_anim_list.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_0.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_1.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_10.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_11.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_12.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_13.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_14.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_15.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_16.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_17.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_18.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_19.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_2.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_20.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_21.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_22.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_23.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_24.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_25.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_26.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_27.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_28.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_29.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_3.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_30.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_31.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_32.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_33.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_34.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_35.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_36.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_37.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_38.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_39.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_4.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_40.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_41.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_42.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_43.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_44.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_45.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_46.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_47.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_48.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_49.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_5.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_6.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_7.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_8.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_9.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_frame_list.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/Obj_WallBreakAnim_motion.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/ObjectType9.bin` | map-tilemaps | fe8u graphics/map/ObjectType9.png |
| `data/residual/PopupScr_GotGold.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/PopupScr_GotItem.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/PopupScr_ItemStolen.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/PopupScr_ItemWasPilfered.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/PopupScr_StoleItem.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/PopupScr_WpnBroken.bin` | unitdef-residuals | fe8u src/events/*.c (EVENT_* / PROC_* macros) |
| `data/residual/SpritAnim_MineFx_anim_0.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpritAnim_MineFx_anim_list.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpritAnim_MineFx_frame_0.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpritAnim_MineFx_frame_1.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpritAnim_MineFx_frame_2.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpritAnim_MineFx_frame_3.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpritAnim_MineFx_frame_4.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpritAnim_MineFx_frame_5.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpritAnim_MineFx_frame_6.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpritAnim_MineFx_frame_7.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpritAnim_MineFx_frame_8.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpritAnim_MineFx_frame_list.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpritAnim_MineFx_motion.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_anim_0.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_anim_list.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_0.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_1.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_10.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_11.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_12.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_13.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_14.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_15.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_16.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_17.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_18.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_2.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_3.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_4.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_5.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_6.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_7.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_8.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_9.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_frame_list.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ArrowTrap_motion.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_FireTrap.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_GasTrapHorizontal.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_GasTrapVertical.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_ManimStatGain.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_PikeTrap.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_PlayerRankFog.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_anim_0.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_anim_list.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_0.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_1.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_10.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_11.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_12.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_13.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_14.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_15.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_16.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_17.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_18.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_19.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_2.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_20.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_21.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_22.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_23.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_3.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_4.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_5.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_6.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_7.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_8.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_9.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_frame_list.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/SpriteAnim_WorldmapSkirmish_motion.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/TileAnimations1.bin` | map-tilemaps | fe8u src/data/map/obj_anim/TileAnimations1.json |
| `data/residual/TileAnimations2.bin` | map-tilemaps | fe8u src/data/map/obj_anim/TileAnimations2.json |
| `data/residual/TileAnimations3.bin` | map-tilemaps | fe8u src/data/map/obj_anim/TileAnimations3.json |
| `data/residual/TowerOfValni6MapChanges.bin` | map-tilemaps | fe8u src/data/map/change/TowerOfValni6MapChanges.json |
| `data/residual/TowerOfValni7MapChanges.bin` | map-tilemaps | fe8u src/data/map/change/TowerOfValni7MapChanges.json |
| `data/residual/UnitDef_Ch10AAlly_1.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch10AEnemy_3.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch10AEnemy_4.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch10AEnemy_5.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch10AEnemy_6.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch10BEnemy_7.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch10BMixed_0.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch11AEnemy_2.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch11AEnemy_3.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch11AEnemy_4.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch11AEnemy_5.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch11AMixed.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch11BEnemy_4.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch12AEnemy_2.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch12AEnemy_3.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch12AEnemy_5.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch12BEnemy_1.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch12BEnemy_2.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch12BEnemy_4.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch13AEnemy_3.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch13AEnemy_9.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch13ANPC.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch14AEnemy_2.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch14AEnemy_4.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch14AEnemy_6.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch14BAlly_7.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch14BEnemy_8.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch14BEnemy_9.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch15AAlly_1.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch15AEnemy_6.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch15BEnemy_4.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch15BEnemy_5.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch16AAlly_0.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch16AAlly_1.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch16AAlly_13.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch16AAlly_15.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch16AAlly_3.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch16AAlly_4.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch16AAlly_5.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch16AAlly_8.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch16AEnemy_2.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch16AEnemy_3.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch16AEnemy_4.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch16AMixed_1.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch16BEnemy_2.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch16BEnemy_4.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch17AAlly_2.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch18AMixed.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch18BAlly_2.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch19AAlly_5.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch19ANPC_3.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch19BEnemy_8.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch21AAlly_1.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch21AMixed.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch21BEnemy_1.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch21BMixed.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch2Enemy_0.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch3Enemy_0.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch3Enemy_2.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch4Ally_0.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch4Enemy_1.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch4Enemy_2.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch4NPC_0.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch4NPC_1.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch5Enemy_0.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch5Enemy_1.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch5xAlly_0.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch5xAlly_2.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch5xAlly_3.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch5xEnemy_3.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch6Enemy_0.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch8Ally_0.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch8Ally_1.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch8Enemy_0.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch8Enemy_1.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch8Enemy_2.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch8Enemy_3.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch8Enemy_4.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch8Enemy_8.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch9AAlly_0.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch9AEnemy_0.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch9AEnemy_8.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch9AMixed_0.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch9AMixed_1.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Ch9BEnemy_3.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Event_Ch1Enemy.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Event_Ch1EnemyReinforce.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Event_Ch2Ally.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Event_Ch3Ally.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Event_Ch5Ally.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Event_Ch5xAlly.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Event_Ch7Ally.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Event_Ch8Ally.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Event_PrologueEnemy.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Event_PrologueEscapees.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Event_PrologueGradoCavalry.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Event_PrologueGradoShamans.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/UnitDef_Event_PrologueValterGroup.bin` | unitdef-residuals | fe8u src/events_udefs.c (typed struct UnitDefinition[]) |
| `data/residual/gBattleForecast_0.bin` | pixel-gfx | fe8u preview/tsa/misc/gBattleForecast_0.png |
| `data/residual/gBattleForecast_1.bin` | pixel-gfx | fe8u preview/tsa/misc/gBattleForecast_1.png |
| `data/residual/gBattleForecast_2.bin` | pixel-gfx | fe8u preview/tsa/misc/gBattleForecast_2.png |
| `data/residual/gBattleparse_0.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gBattleparse_1.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gBattleparse_2.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gBattleparse_3.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gBattleparse_4.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gBattleparse_5.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gBattleparse_6.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gBattleparse_7.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gBattleparse_8.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gBattleparse_9.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEfxSelfThunderBGFrames.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEfxlvupfx_0.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEfxmagicCrimsoneye_0.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEfxmagicCrimsoneye_1.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEfxmagicGleipnir_0.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEfxmagicGleipnir_1.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEfxmagicGleipnir_2.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEfxmagicGleipnir_3.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEfxmagicGleipnir_4.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEfxmagicGleipnir_5.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEfxmagicGleipnir_6.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEfxmisc_0.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEkrdragonDemonkingobj_array1.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEkrdragonDemonkingobj_array1_1.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEkrdragonDemonkingobj_array2.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEkrdragonDemonkingobj_array2_1.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEkrdragonDemonkingobj_array3.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEkrdragonDemonkingobj_array4.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEkrgauge_10.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEkrgauge_11.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEkrgauge_2.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEkrgauge_3.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEkrgauge_4.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEkrgauge_6.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEkrgauge_7.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEkrgauge_8.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEkrgauge_9.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gEndingDetails_0.bin` | pixel-gfx | fe8u preview/tsa/misc/gEndingDetails_0.png |
| `data/residual/gFontgrp_103.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_116.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_17.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_18.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_19.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_20.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_21.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_218.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_22.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_222.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_225.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_23.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_24.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_25.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_257.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_269.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_32.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_33.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_335.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_337.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_338.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_340.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_346.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_35.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_36.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_360.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_362.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_363.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_364.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_44.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_45.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_50.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_64.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_68.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_71.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gFontgrp_89.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gGenericIcon_5.bin` | pixel-gfx | fe8u graphics/**/*.png (named gfx) |
| `data/residual/gGenericIcon_6.bin` | pixel-gfx | fe8u graphics/**/*.png (named gfx) |
| `data/residual/gMapanimLevelup_0.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_anim_0.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_anim_1.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_anim_2.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_anim_3.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_anim_list.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_0.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_1.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_10.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_11.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_12.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_13.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_14.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_15.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_16.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_17.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_18.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_19.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_2.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_20.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_21.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_22.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_23.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_24.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_25.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_26.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_27.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_28.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_29.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_3.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_30.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_31.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_32.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_33.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_34.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_35.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_36.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_37.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_38.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_39.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_4.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_40.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_41.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_42.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_43.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_44.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_45.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_46.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_47.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_48.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_49.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_5.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_6.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_7.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_8.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_9.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_frame_list.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMapanimTorchfx_motion.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gMenuSoundroom_1.bin` | pixel-gfx | fe8u preview/tsa/misc/gMenuSoundroom_1.png |
| `data/residual/gMenuSoundroom_2.bin` | pixel-gfx | fe8u preview/tsa/misc/gMenuSoundroom_2.png |
| `data/residual/gMenuSoundroom_4.bin` | pixel-gfx | fe8u preview/tsa/misc/gMenuSoundroom_4.png |
| `data/residual/gSprite_Face64x96.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/gSprite_Face64x96_Flipped.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/gSprite_Face80x72.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/gSprite_Face80x72_Flipped.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/gSprite_Face96x72.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/gSprite_Face96x72_Flipped.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/gSprite_Face96x96.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/gSprite_Face96x96_Flipped.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/gSprite_SavemenuData_17.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/gSprite_SavemenuData_18.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/gSprite_SavemenuData_19.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/gSprite_SavemenuData_20.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/gSprite_SavemenuData_21.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/gSprite_SavemenuData_22.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/gSprite_TalkTextBack.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/gSprite_TalkTextFront.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/gTitlescreen_0.bin` | pixel-gfx | fe8u graphics/**/*.png (named gfx) |
| `data/residual/gTitlescreen_1.bin` | pixel-gfx | fe8u graphics/**/*.png (named gfx) |
| `data/residual/gUnkData_15.bin` | pixel-gfx | fe8u preview/tsa/misc/gUnkData_15.png |
| `data/residual/gUnkData_67.bin` | pixel-gfx | fe8u preview/tsa/misc/gUnkData_67.png |
| `data/residual/gUnkData_68.bin` | pixel-gfx | fe8u preview/tsa/misc/gUnkData_68.png |
| `data/residual/gUnkData_70.bin` | pixel-gfx | fe8u preview/tsa/misc/gUnkData_70.png |
| `data/residual/gUnkData_71.bin` | pixel-gfx | fe8u preview/tsa/misc/gUnkData_71.png |
| `data/residual/gUnkData_72.bin` | pixel-gfx | fe8u preview/tsa/misc/gUnkData_72.png |
| `data/residual/gUnkData_73.bin` | pixel-gfx | fe8u preview/tsa/misc/gUnkData_73.png |
| `data/residual/gUnkData_80.bin` | pixel-gfx | fe8u preview/tsa/misc/gUnkData_80.png |
| `data/residual/gUnkData_89.bin` | pixel-gfx | fe8u preview/tsa/misc/gUnkData_89.png |
| `data/residual/gUnkData_92.bin` | pixel-gfx | fe8u preview/tsa/misc/gUnkData_92.png |
| `data/residual/gWorldmapMinimap_1.bin` | pixel-gfx | fe8u preview/tsa/misc/gWorldmapMinimap_1.png |
| `data/residual/gWorldmapMinimap_2.bin` | pixel-gfx | fe8u preview/tsa/misc/gWorldmapMinimap_2.png |
| `data/residual/gWorldmapSprite_0.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_11.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_12.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_14.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_15.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_16.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_17.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_19.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_2.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_20.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_21.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_22.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_23.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_24.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_25.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_26.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_27.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_28.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_29.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_3.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_30.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_32.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_33.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_4.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_5.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_6.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_7.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_8.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/gWorldmapSprite_9.bin` | unitdef-residuals | fe8u typed C table / gfx (worldmap/mapanim/menu data) |
| `data/residual/obj_MapAnimNODAMAGE_anim_0.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/obj_MapAnimNODAMAGE_anim_list.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/obj_MapAnimNODAMAGE_frame_0.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/obj_MapAnimNODAMAGE_frame_1.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/obj_MapAnimNODAMAGE_frame_10.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/obj_MapAnimNODAMAGE_frame_11.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/obj_MapAnimNODAMAGE_frame_2.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/obj_MapAnimNODAMAGE_frame_3.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/obj_MapAnimNODAMAGE_frame_4.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/obj_MapAnimNODAMAGE_frame_5.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/obj_MapAnimNODAMAGE_frame_6.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/obj_MapAnimNODAMAGE_frame_7.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/obj_MapAnimNODAMAGE_frame_8.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/obj_MapAnimNODAMAGE_frame_9.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/obj_MapAnimNODAMAGE_frame_list.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/obj_MapAnimNODAMAGE_motion.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/rom_header_080000C0.bin` | sound-m4a-tables | fe8u src/rom_header.s |
| `data/residual/sSprite_ClassDisplay_B.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/sSprite_ClassDisplay_C.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/sSprite_ClassDisplay_D.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/sSprite_ClassDisplay_E.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/sSprite_ClassDisplay_F.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/sSprite_ClassDisplay_G.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/sSprite_ClassDisplay_H.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/sSprite_ClassDisplay_I.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/sSprite_ClassDisplay_L.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/sSprite_ClassDisplay_M.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/sSprite_ClassDisplay_N.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/sSprite_ClassDisplay_P.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/sSprite_ClassDisplay_R.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/sSprite_ClassDisplay_S.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/sSprite_ClassDisplay_T.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/sSprite_ClassDisplay_V.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/sSprite_ClassDisplay_W.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/sSprite_ClassDisplay_Z.bin` | unitdef-residuals | fe8u typed struct AnimSpriteData[] / sprite anim C |
| `data/residual/song002_agbfe3_bgm_op_theme_i_6.bin` | sound-m4a-tables | fe8u sound/songs/midi/song002_agbfe3_bgm_op_theme_i.mid |
| `data/residual/song003_agbfe3_bgm_pro_first_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song003_agbfe3_bgm_pro_first.mid |
| `data/residual/song003_agbfe3_bgm_pro_first_4_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song008_agbfe3_bgm_wmap_05_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song008_agbfe3_bgm_wmap_05.mid |
| `data/residual/song008_agbfe3_bgm_wmap_05_1_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song008_agbfe3_bgm_wmap_05_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song008_agbfe3_bgm_wmap_05.mid |
| `data/residual/song009_agbfe3_bgm_map_pl2_3_018.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song009_agbfe3_bgm_map_pl2_3_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song011_agbfe3_bgm_map_pl4_1_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song012_agbfe3_bgm_map_pl11_5_024.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song012_agbfe3_bgm_map_pl11_5_025.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song012_agbfe3_bgm_map_pl11_5_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song013_agbfe3_bgm_map_pl12_1_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song013_agbfe3_bgm_map_pl12_3_008.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song013_agbfe3_bgm_map_pl12_3_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song015_agbfe3_bgm_map_pl9_3_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song015_agbfe3_bgm_map_pl9_6_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song017_agbfe3_bgm_map_pl6_3_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song020_agbfe3_bgm_map_cp2_2_012.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song020_agbfe3_bgm_map_cp2_2_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song021_agbfe3_bgm_map_cp3_5_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song022_agbfe3_bgm_map_cp5_2_001.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song022_agbfe3_bgm_map_cp5_2_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song027_agbfe3_bgm_btl_boss1_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song027_agbfe3_bgm_btl_boss1.mid |
| `data/residual/song027_agbfe3_bgm_btl_boss1_3_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song030_agbfe3_bgm_btl_boss5_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song030_agbfe3_bgm_btl_boss5.mid |
| `data/residual/song030_agbfe3_bgm_btl_boss5_1_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song034_agbfe3_bgm_btl_staff_b_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song034_agbfe3_bgm_btl_staff_b.mid |
| `data/residual/song036_agbfe3_bgm_evt_advance_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song036_agbfe3_bgm_evt_advance.mid |
| `data/residual/song036_agbfe3_bgm_evt_advance_3_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song039_agbfe3_bgm_evt_yorokobi_4_008.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song039_agbfe3_bgm_evt_yorokobi_4_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song040_agbfe3_bgm_evt_04_3_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song047_agbfe3_bgm_evt_05_6_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song049_agbfe3_bgm_evt_win_good_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song049_agbfe3_bgm_evt_win_good.mid |
| `data/residual/song049_agbfe3_bgm_evt_win_good_3_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song049_agbfe3_bgm_evt_win_good_6.bin` | sound-m4a-tables | fe8u sound/songs/midi/song049_agbfe3_bgm_evt_win_good.mid |
| `data/residual/song049_agbfe3_bgm_evt_win_good_6_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song051_agbfe3_bgm_theme_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song051_agbfe3_bgm_theme.mid |
| `data/residual/song051_agbfe3_bgm_theme_1_005.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song051_agbfe3_bgm_theme_1_006.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song051_agbfe3_bgm_theme_1_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song051_agbfe3_bgm_theme_5_004.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song051_agbfe3_bgm_theme_5_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song065_agbfe3_bgm_ed_epilogue_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song065_agbfe3_bgm_ed_epilogue.mid |
| `data/residual/song065_agbfe3_bgm_ed_epilogue_7.bin` | sound-m4a-tables | fe8u sound/songs/midi/song065_agbfe3_bgm_ed_epilogue.mid |
| `data/residual/song065_agbfe3_bgm_ed_epilogue_7_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song066_agbfe3_bgm_ed_staff_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song066_agbfe3_bgm_ed_staff.mid |
| `data/residual/song066_agbfe3_bgm_ed_staff_1_003.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song069_agbfe3_bgm_evt_last_5.bin` | sound-m4a-tables | fe8u sound/songs/midi/song069_agbfe3_bgm_evt_last.mid |
| `data/residual/song069_agbfe3_bgm_evt_last_5_015.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song069_agbfe3_bgm_evt_last_5_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song069_agbfe3_bgm_evt_last_7.bin` | sound-m4a-tables | fe8u sound/songs/midi/song069_agbfe3_bgm_evt_last.mid |
| `data/residual/song069_agbfe3_bgm_evt_last_7_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song070_agbfe3_bgm_ed_after_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song070_agbfe3_bgm_ed_after.mid |
| `data/residual/song070_agbfe3_bgm_ed_after_4_038.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song070_agbfe3_bgm_ed_after_4_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song071_y_wind_3_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song071_y_wind_3.mid |
| `data/residual/song071_y_wind_3_1_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song072_y_jounai_2_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song072_y_jounai_2.mid |
| `data/residual/song072_y_jounai_2_1_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song074_y_yoru_3_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song074_y_yoru_3.mid |
| `data/residual/song075_y_boat_03_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song075_y_boat_03.mid |
| `data/residual/song079_h_evt_sabaku_s_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song079_h_evt_sabaku_s.mid |
| `data/residual/song081_h_sinden_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song081_h_sinden.mid |
| `data/residual/song085_agbfe3_bgm_btl_boss5_2_1_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song085_agbfe3_bgm_btl_boss5_2_2_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s + songs/midi/*.mid |
| `data/residual/song092_se_ff_item_lost1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song092_se_ff_item_lost1.mid |
| `data/residual/song092_se_ff_item_lost1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song092_se_ff_item_lost1.mid |
| `data/residual/song092_se_ff_item_lost1_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song092_se_ff_item_lost1.mid |
| `data/residual/song092_se_ff_item_lost1_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song092_se_ff_item_lost1.mid |
| `data/residual/song109_se_sys_game_start4_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song109_se_sys_game_start4.mid |
| `data/residual/song109_se_sys_game_start4_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song109_se_sys_game_start4.mid |
| `data/residual/song109_se_sys_game_start4_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song109_se_sys_game_start4.mid |
| `data/residual/song140_se_bmp_reserve2_1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song140_se_bmp_reserve2_1.mid |
| `data/residual/song141_se_bmp_unlock1_1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song141_se_bmp_unlock1_1.mid |
| `data/residual/song141_se_bmp_unlock1_1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song141_se_bmp_unlock1_1.mid |
| `data/residual/song143_se_bmp_colosseum1_2_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song143_se_bmp_colosseum1_2.mid |
| `data/residual/song144_se_sys_chapter_start1_1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song144_se_sys_chapter_start1_1.mid |
| `data/residual/song144_se_sys_chapter_start1_1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song144_se_sys_chapter_start1_1.mid |
| `data/residual/song179_se_bmp_item_torch1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song179_se_bmp_item_torch1.mid |
| `data/residual/song179_se_bmp_item_torch1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song179_se_bmp_item_torch1.mid |
| `data/residual/song184_se_bmp_area_open1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song184_se_bmp_area_open1.mid |
| `data/residual/song184_se_bmp_area_open1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song184_se_bmp_area_open1.mid |
| `data/residual/song216_se_btl_special_hit1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song216_se_btl_special_hit1.mid |
| `data/residual/song249_se_btl_berserk2_1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song249_se_btl_berserk2_1.mid |
| `data/residual/song256_se_btl_purge2_2_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song256_se_btl_purge2_2.mid |
| `data/residual/song259_se_btl_hammerne2_1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song259_se_btl_hammerne2_1.mid |
| `data/residual/song276_se_btl_reserve2_1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song276_se_btl_reserve2_1.mid |
| `data/residual/song312_se_btl_eclipse1_1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song312_se_btl_eclipse1_1.mid |
| `data/residual/song317_se_btl_class_light_body1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song317_se_btl_class_light_body1.mid |
| `data/residual/song737_h_misty_af_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song737_h_misty_af.mid |
| `data/residual/song740_btl_sam_magic1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song740_btl_sam_magic1.mid |
| `data/residual/song740_btl_sam_magic1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song740_btl_sam_magic1.mid |
| `data/residual/song890_mon_mao_attack2_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song890_mon_mao_attack2.mid |
| `data/residual/song890_mon_mao_attack2_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song890_mon_mao_attack2.mid |
| `data/residual/song894_mon_mao_attack3_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song894_mon_mao_attack3.mid |
| `data/residual/song894_mon_mao_attack3_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song894_mon_mao_attack3.mid |
| `data/residual/song941_btl_bgl_attack7_2_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song941_btl_bgl_attack7_2.mid |
| `data/residual/song941_btl_bgl_attack7_2_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song941_btl_bgl_attack7_2.mid |
| `data/residual/song941_btl_bgl_attack7_2_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song941_btl_bgl_attack7_2.mid |
| `data/residual/song953_mon_gog_attack5_2_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song953_mon_gog_attack5_2.mid |
| `data/residual/song953_mon_gog_attack5_2_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song953_mon_gog_attack5_2.mid |
| `data/residual/song954_bmp_gog_attack5_2_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song954_bmp_gog_attack5_2.mid |
| `data/residual/song954_bmp_gog_attack5_2_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song954_bmp_gog_attack5_2.mid |
| `data/residual/song963_mon_bgl_attack4_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song963_mon_bgl_attack4.mid |
| `data/residual/song964_mon_bgl_attack5_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song964_mon_bgl_attack5.mid |
| `data/residual/song964_mon_bgl_attack5_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song964_mon_bgl_attack5.mid |
| `data/residual/song976_btl_critical_dmg2_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song976_btl_critical_dmg2.mid |
| `data/residual/song976_btl_critical_dmg2_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song976_btl_critical_dmg2.mid |
| `data/residual/song979_btl_evl_magic1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song979_btl_evl_magic1.mid |
| `data/residual/song979_btl_evl_magic1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song979_btl_evl_magic1.mid |
| `data/sound/CgbModVol.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/CgbOscOff.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/CheckEfxSoundSeExist.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ChnVolSetAsm.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/FadeOutBody.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/GetCurrentBgmSong.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/IsBgmPlaying.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/MPlayContinue.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/MPlayFadeOut.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/MPlayJumpTableCopy.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/MPlayMain.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/MPlayStart.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/RealClearChain.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/RegisterEfxSoundSeExist.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/SoundMain.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/SoundMainBTM.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/SoundMainRAM.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/Sound_ForceChangeBgm.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/Sound_SetDefaultMaxNumChannels.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/TrackStop.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/TrkVolPitSet.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/UnregisterEfxSoundSeExist.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/clear_modM.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/frontier_df3_voicegroup_000_1F70E8.bin` | voicegroup-tail | fe8u sound/voicegroups/*.s (voicegroup tail; documented ceiling) |
| `data/sound/frontier_df3_voicegroup_001_202C07.bin` | voicegroup-tail | fe8u sound/voicegroups/*.s (voicegroup tail; documented ceiling) |
| `data/sound/frontier_df4_voice_000_1F578C.bin` | voicegroup-tail | fe8u sound/voicegroups/*.s / direct_sound_data.s |
| `data/sound/frontier_df4_voice_001_1F67BC.bin` | voicegroup-tail | fe8u sound/voicegroups/*.s / direct_sound_data.s |
| `data/sound/frontier_df4_voice_002_211988.bin` | voicegroup-tail | fe8u sound/voicegroups/*.s / direct_sound_data.s |
| `data/sound/frontier_df4_voice_003_214120.bin` | voicegroup-tail | fe8u sound/voicegroups/*.s / direct_sound_data.s |
| `data/sound/gBanimSongIDs1.bin` | sound-m4a-tables | fe8u sound/*.s (named m4a/sound table) |
| `data/sound/gBanimSongIDs2.bin` | sound-m4a-tables | fe8u sound/*.s (named m4a/sound table) |
| `data/sound/gBanimSongIDs3.bin` | sound-m4a-tables | fe8u sound/*.s (named m4a/sound table) |
| `data/sound/gBanimSongIDs4.bin` | sound-m4a-tables | fe8u sound/*.s (named m4a/sound table) |
| `data/sound/gMPlayJumpTableTemplate.bin` | sound-m4a-tables | fe8u sound/*.s (named m4a/sound table) |
| `data/sound/gMPlayTable.bin` | sound-m4a-tables | fe8u sound/music_player_table.s |
| `data/sound/gSoundRoomTable.bin` | sound-m4a-tables | fe8u sound/*.s (named m4a/sound table) |
| `data/sound/ply_bend.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_bendr.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_endtie.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_fine.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_goto.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_keysh.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_lfodl.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_lfos.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_mod.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_modt.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_note.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_pan.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_patt.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_pend.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_port.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_prio.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_rept.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_tempo.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_tune.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_voice.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_vol.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_xiecl.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_xiecv.bin` | sound-m4a-tables | fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis) |
| `data/sound/ply_xwave.bin` | sound-m4a-tables | fe8u sound/programmable_wave_data.s |
| `data/sound/song001_agbfe3_bgm_opening_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song001_agbfe3_bgm_opening.mid |
| `data/sound/song001_agbfe3_bgm_opening_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song001_agbfe3_bgm_opening.mid |
| `data/sound/song001_agbfe3_bgm_opening_2_003.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song001_agbfe3_bgm_opening_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song001_agbfe3_bgm_opening.mid |
| `data/sound/song001_agbfe3_bgm_opening_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song001_agbfe3_bgm_opening.mid |
| `data/sound/song001_agbfe3_bgm_opening_4_003.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song001_agbfe3_bgm_opening_4_004.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song001_agbfe3_bgm_opening_5.bin` | sound-m4a-tables | fe8u sound/songs/midi/song001_agbfe3_bgm_opening.mid |
| `data/sound/song001_agbfe3_bgm_opening_6.bin` | sound-m4a-tables | fe8u sound/songs/midi/song001_agbfe3_bgm_opening.mid |
| `data/sound/song001_agbfe3_bgm_opening_7.bin` | sound-m4a-tables | fe8u sound/songs/midi/song001_agbfe3_bgm_opening.mid |
| `data/sound/song001_agbfe3_bgm_opening_7_004.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song001_agbfe3_bgm_opening_7_005.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song002_agbfe3_bgm_op_theme_i_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song002_agbfe3_bgm_op_theme_i.mid |
| `data/sound/song002_agbfe3_bgm_op_theme_i_2_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song002_agbfe3_bgm_op_theme_i_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song002_agbfe3_bgm_op_theme_i.mid |
| `data/sound/song002_agbfe3_bgm_op_theme_i_4_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song002_agbfe3_bgm_op_theme_i_5.bin` | sound-m4a-tables | fe8u sound/songs/midi/song002_agbfe3_bgm_op_theme_i.mid |
| `data/sound/song002_agbfe3_bgm_op_theme_i_7_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song002_agbfe3_bgm_op_theme_i_8.bin` | sound-m4a-tables | fe8u sound/songs/midi/song002_agbfe3_bgm_op_theme_i.mid |
| `data/sound/song002_agbfe3_bgm_op_theme_i_8_011.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song002_agbfe3_bgm_op_theme_i_8_012.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song002_agbfe3_bgm_op_theme_i_8_013.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song002_agbfe3_bgm_op_theme_i_8_014.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song002_agbfe3_bgm_op_theme_i_8_015.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song002_agbfe3_bgm_op_theme_i_8_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song006_agbfe3_bgm_wmap_03_2_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song006_agbfe3_bgm_wmap_03_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song006_agbfe3_bgm_wmap_03.mid |
| `data/sound/song006_agbfe3_bgm_wmap_03_3_000.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song006_agbfe3_bgm_wmap_03_3_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song007_agbfe3_bgm_wmap_04_4_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song007_agbfe3_bgm_wmap_04_5.bin` | sound-m4a-tables | fe8u sound/songs/midi/song007_agbfe3_bgm_wmap_04.mid |
| `data/sound/song007_agbfe3_bgm_wmap_04_5_022.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song007_agbfe3_bgm_wmap_04_5_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song009_agbfe3_bgm_map_pl2_6_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song009_agbfe3_bgm_map_pl2_7.bin` | sound-m4a-tables | fe8u sound/songs/midi/song009_agbfe3_bgm_map_pl2.mid |
| `data/sound/song009_agbfe3_bgm_map_pl2_7_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song010_agbfe3_bgm_map_pl3_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song010_agbfe3_bgm_map_pl3.mid |
| `data/sound/song010_agbfe3_bgm_map_pl3_1_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song010_agbfe3_bgm_map_pl3_2_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song010_agbfe3_bgm_map_pl3_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song010_agbfe3_bgm_map_pl3.mid |
| `data/sound/song010_agbfe3_bgm_map_pl3_3_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song010_agbfe3_bgm_map_pl3_3_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song010_agbfe3_bgm_map_pl3_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song010_agbfe3_bgm_map_pl3.mid |
| `data/sound/song010_agbfe3_bgm_map_pl3_4_042.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song010_agbfe3_bgm_map_pl3_4_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song011_agbfe3_bgm_map_pl4_6_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song011_agbfe3_bgm_map_pl4_7.bin` | sound-m4a-tables | fe8u sound/songs/midi/song011_agbfe3_bgm_map_pl4.mid |
| `data/sound/song011_agbfe3_bgm_map_pl4_7_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song012_agbfe3_bgm_map_pl11_5_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song012_agbfe3_bgm_map_pl11_6.bin` | sound-m4a-tables | fe8u sound/songs/midi/song012_agbfe3_bgm_map_pl11.mid |
| `data/sound/song012_agbfe3_bgm_map_pl11_6_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song013_agbfe3_bgm_map_pl12_3_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song013_agbfe3_bgm_map_pl12_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song013_agbfe3_bgm_map_pl12.mid |
| `data/sound/song013_agbfe3_bgm_map_pl12_4_036.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song013_agbfe3_bgm_map_pl12_4_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song013_agbfe3_bgm_map_pl12_6_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song013_agbfe3_bgm_map_pl12_7.bin` | sound-m4a-tables | fe8u sound/songs/midi/song013_agbfe3_bgm_map_pl12.mid |
| `data/sound/song013_agbfe3_bgm_map_pl12_7_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song014_agbfe3_bgm_map_pl5_3_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song014_agbfe3_bgm_map_pl5_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song014_agbfe3_bgm_map_pl5.mid |
| `data/sound/song014_agbfe3_bgm_map_pl5_4_010.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song014_agbfe3_bgm_map_pl5_4_011.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song014_agbfe3_bgm_map_pl5_4_012.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song014_agbfe3_bgm_map_pl5_4_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song015_agbfe3_bgm_map_pl9_3_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song015_agbfe3_bgm_map_pl9_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song015_agbfe3_bgm_map_pl9.mid |
| `data/sound/song015_agbfe3_bgm_map_pl9_4_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song017_agbfe3_bgm_map_pl6_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song017_agbfe3_bgm_map_pl6.mid |
| `data/sound/song017_agbfe3_bgm_map_pl6_1_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song017_agbfe3_bgm_map_pl6_3_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song017_agbfe3_bgm_map_pl6_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song017_agbfe3_bgm_map_pl6.mid |
| `data/sound/song017_agbfe3_bgm_map_pl6_4_009.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song017_agbfe3_bgm_map_pl6_4_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song019_agbfe3_bgm_map_cp1_3_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song019_agbfe3_bgm_map_cp1_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song019_agbfe3_bgm_map_cp1.mid |
| `data/sound/song019_agbfe3_bgm_map_cp1_4_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song020_agbfe3_bgm_map_cp2_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song020_agbfe3_bgm_map_cp2.mid |
| `data/sound/song020_agbfe3_bgm_map_cp2_1_013.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song020_agbfe3_bgm_map_cp2_1_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song020_agbfe3_bgm_map_cp2_4_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song020_agbfe3_bgm_map_cp2_5.bin` | sound-m4a-tables | fe8u sound/songs/midi/song020_agbfe3_bgm_map_cp2.mid |
| `data/sound/song020_agbfe3_bgm_map_cp2_5_001.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song020_agbfe3_bgm_map_cp2_5_002.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song020_agbfe3_bgm_map_cp2_5_003.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song020_agbfe3_bgm_map_cp2_5_004.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song020_agbfe3_bgm_map_cp2_5_005.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song020_agbfe3_bgm_map_cp2_5_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song020_agbfe3_bgm_map_cp2_5_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song020_agbfe3_bgm_map_cp2_6.bin` | sound-m4a-tables | fe8u sound/songs/midi/song020_agbfe3_bgm_map_cp2.mid |
| `data/sound/song020_agbfe3_bgm_map_cp2_6_000.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song020_agbfe3_bgm_map_cp2_6_004.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song020_agbfe3_bgm_map_cp2_6_005.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song020_agbfe3_bgm_map_cp2_6_013.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song020_agbfe3_bgm_map_cp2_6_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song021_agbfe3_bgm_map_cp3_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song021_agbfe3_bgm_map_cp3.mid |
| `data/sound/song021_agbfe3_bgm_map_cp3_1_012.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song021_agbfe3_bgm_map_cp3_1_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song021_agbfe3_bgm_map_cp3_3_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song021_agbfe3_bgm_map_cp3_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song021_agbfe3_bgm_map_cp3.mid |
| `data/sound/song021_agbfe3_bgm_map_cp3_4_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song022_agbfe3_bgm_map_cp5_4_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song022_agbfe3_bgm_map_cp5_5.bin` | sound-m4a-tables | fe8u sound/songs/midi/song022_agbfe3_bgm_map_cp5.mid |
| `data/sound/song022_agbfe3_bgm_map_cp5_5_013.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song022_agbfe3_bgm_map_cp5_5_014.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song022_agbfe3_bgm_map_cp5_5_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song023_agbfe3_bgm_map_cp4_2_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song023_agbfe3_bgm_map_cp4_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song023_agbfe3_bgm_map_cp4.mid |
| `data/sound/song023_agbfe3_bgm_map_cp4_3_008.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song023_agbfe3_bgm_map_cp4_3_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song024_agbfe3_bgm_map_cp8_3_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song024_agbfe3_bgm_map_cp8_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song024_agbfe3_bgm_map_cp8.mid |
| `data/sound/song024_agbfe3_bgm_map_cp8_4_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song024_agbfe3_bgm_map_cp8_4_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song024_agbfe3_bgm_map_cp8_5.bin` | sound-m4a-tables | fe8u sound/songs/midi/song024_agbfe3_bgm_map_cp8.mid |
| `data/sound/song024_agbfe3_bgm_map_cp8_5_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song027_agbfe3_bgm_btl_boss1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song027_agbfe3_bgm_btl_boss1.mid |
| `data/sound/song027_agbfe3_bgm_btl_boss1_1_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song029_agbfe3_bgm_btl_boss4_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song029_agbfe3_bgm_btl_boss4.mid |
| `data/sound/song029_agbfe3_bgm_btl_boss4_1_008.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song029_agbfe3_bgm_btl_boss4_1_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song029_agbfe3_bgm_btl_boss4_2_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song029_agbfe3_bgm_btl_boss4_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song029_agbfe3_bgm_btl_boss4.mid |
| `data/sound/song029_agbfe3_bgm_btl_boss4_3_010.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song029_agbfe3_bgm_btl_boss4_3_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song030_agbfe3_bgm_btl_boss5_3_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song030_agbfe3_bgm_btl_boss5_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song030_agbfe3_bgm_btl_boss5.mid |
| `data/sound/song030_agbfe3_bgm_btl_boss5_4_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song034_agbfe3_bgm_btl_staff_b_1_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song034_agbfe3_bgm_btl_staff_b_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song034_agbfe3_bgm_btl_staff_b.mid |
| `data/sound/song035_agbfe3_bgm_btl_class_chg_2_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song035_agbfe3_bgm_btl_class_chg_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song035_agbfe3_bgm_btl_class_chg.mid |
| `data/sound/song035_agbfe3_bgm_btl_class_chg_4_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song035_agbfe3_bgm_btl_class_chg_5.bin` | sound-m4a-tables | fe8u sound/songs/midi/song035_agbfe3_bgm_btl_class_chg.mid |
| `data/sound/song035_agbfe3_bgm_btl_class_chg_5_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song035_agbfe3_bgm_btl_class_chg_5_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song035_agbfe3_bgm_btl_class_chg_6.bin` | sound-m4a-tables | fe8u sound/songs/midi/song035_agbfe3_bgm_btl_class_chg.mid |
| `data/sound/song035_agbfe3_bgm_btl_class_chg_6_007.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song035_agbfe3_bgm_btl_class_chg_6_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song037_agbfe3_bgm_evt_start_5_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song037_agbfe3_bgm_evt_start_6.bin` | sound-m4a-tables | fe8u sound/songs/midi/song037_agbfe3_bgm_evt_start.mid |
| `data/sound/song037_agbfe3_bgm_evt_start_6_014.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song037_agbfe3_bgm_evt_start_6_015.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song037_agbfe3_bgm_evt_start_6_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song038_agbfe3_bgm_evt_enemy_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song038_agbfe3_bgm_evt_enemy.mid |
| `data/sound/song038_agbfe3_bgm_evt_enemy_1_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song038_agbfe3_bgm_evt_enemy_2_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song038_agbfe3_bgm_evt_enemy_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song038_agbfe3_bgm_evt_enemy.mid |
| `data/sound/song038_agbfe3_bgm_evt_enemy_3_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song038_agbfe3_bgm_evt_enemy_3_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song038_agbfe3_bgm_evt_enemy_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song038_agbfe3_bgm_evt_enemy.mid |
| `data/sound/song038_agbfe3_bgm_evt_enemy_4_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song038_agbfe3_bgm_evt_enemy_5_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song038_agbfe3_bgm_evt_enemy_6.bin` | sound-m4a-tables | fe8u sound/songs/midi/song038_agbfe3_bgm_evt_enemy.mid |
| `data/sound/song038_agbfe3_bgm_evt_enemy_6_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song039_agbfe3_bgm_evt_yorokobi_6_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song039_agbfe3_bgm_evt_yorokobi_7.bin` | sound-m4a-tables | fe8u sound/songs/midi/song039_agbfe3_bgm_evt_yorokobi.mid |
| `data/sound/song039_agbfe3_bgm_evt_yorokobi_7_012.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song039_agbfe3_bgm_evt_yorokobi_7_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song044_agbfe3_bgm_evt_lyon_3_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song044_agbfe3_bgm_evt_lyon_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song044_agbfe3_bgm_evt_lyon.mid |
| `data/sound/song044_agbfe3_bgm_evt_lyon_4_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song044_agbfe3_bgm_evt_lyon_4_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song044_agbfe3_bgm_evt_lyon_5.bin` | sound-m4a-tables | fe8u sound/songs/midi/song044_agbfe3_bgm_evt_lyon.mid |
| `data/sound/song044_agbfe3_bgm_evt_lyon_5_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song045_agbfe3_bgm_evt_lyon2_4_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song045_agbfe3_bgm_evt_lyon2_5.bin` | sound-m4a-tables | fe8u sound/songs/midi/song045_agbfe3_bgm_evt_lyon2.mid |
| `data/sound/song045_agbfe3_bgm_evt_lyon2_5_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song046_agbfe3_bgm_evt_enemy2_2_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song046_agbfe3_bgm_evt_enemy2_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song046_agbfe3_bgm_evt_enemy2.mid |
| `data/sound/song046_agbfe3_bgm_evt_enemy2_3_001.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song046_agbfe3_bgm_evt_enemy2_3_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song053_agbfe3_bgm_shop_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song053_agbfe3_bgm_shop.mid |
| `data/sound/song053_agbfe3_bgm_shop_1_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song056_agbfe3_bgm_togijyo_info_3_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song056_agbfe3_bgm_togijyo_info_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song056_agbfe3_bgm_togijyo_info.mid |
| `data/sound/song056_agbfe3_bgm_togijyo_info_4_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song058_agbfe3_bgm_ff_togijyo_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song058_agbfe3_bgm_ff_togijyo.mid |
| `data/sound/song058_agbfe3_bgm_ff_togijyo_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song058_agbfe3_bgm_ff_togijyo.mid |
| `data/sound/song058_agbfe3_bgm_ff_togijyo_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song058_agbfe3_bgm_ff_togijyo.mid |
| `data/sound/song058_agbfe3_bgm_ff_togijyo_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song058_agbfe3_bgm_ff_togijyo.mid |
| `data/sound/song059_agbfe3_bgm_ff_loop_5_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song059_agbfe3_bgm_ff_loop_6.bin` | sound-m4a-tables | fe8u sound/songs/midi/song059_agbfe3_bgm_ff_loop.mid |
| `data/sound/song059_agbfe3_bgm_ff_loop_6_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song060_bgm_sys_fase_pl_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song060_bgm_sys_fase_pl.mid |
| `data/sound/song060_bgm_sys_fase_pl_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song060_bgm_sys_fase_pl.mid |
| `data/sound/song060_bgm_sys_fase_pl_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song060_bgm_sys_fase_pl.mid |
| `data/sound/song060_bgm_sys_fase_pl_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song060_bgm_sys_fase_pl.mid |
| `data/sound/song060_bgm_sys_fase_pl_5.bin` | sound-m4a-tables | fe8u sound/songs/midi/song060_bgm_sys_fase_pl.mid |
| `data/sound/song060_bgm_sys_fase_pl_6.bin` | sound-m4a-tables | fe8u sound/songs/midi/song060_bgm_sys_fase_pl.mid |
| `data/sound/song061_bgm_sys_fase_cp_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song061_bgm_sys_fase_cp.mid |
| `data/sound/song061_bgm_sys_fase_cp_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song061_bgm_sys_fase_cp.mid |
| `data/sound/song061_bgm_sys_fase_cp_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song061_bgm_sys_fase_cp.mid |
| `data/sound/song061_bgm_sys_fase_cp_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song061_bgm_sys_fase_cp.mid |
| `data/sound/song061_bgm_sys_fase_cp_5.bin` | sound-m4a-tables | fe8u sound/songs/midi/song061_bgm_sys_fase_cp.mid |
| `data/sound/song061_bgm_sys_fase_cp_6.bin` | sound-m4a-tables | fe8u sound/songs/midi/song061_bgm_sys_fase_cp.mid |
| `data/sound/song061_bgm_sys_fase_cp_7.bin` | sound-m4a-tables | fe8u sound/songs/midi/song061_bgm_sys_fase_cp.mid |
| `data/sound/song062_agbfe3_bgm_gameover_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song062_agbfe3_bgm_gameover.mid |
| `data/sound/song062_agbfe3_bgm_gameover_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song062_agbfe3_bgm_gameover.mid |
| `data/sound/song062_agbfe3_bgm_gameover_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song062_agbfe3_bgm_gameover.mid |
| `data/sound/song062_agbfe3_bgm_gameover_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song062_agbfe3_bgm_gameover.mid |
| `data/sound/song062_agbfe3_bgm_gameover_5.bin` | sound-m4a-tables | fe8u sound/songs/midi/song062_agbfe3_bgm_gameover.mid |
| `data/sound/song066_agbfe3_bgm_ed_staff_5_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song066_agbfe3_bgm_ed_staff_6.bin` | sound-m4a-tables | fe8u sound/songs/midi/song066_agbfe3_bgm_ed_staff.mid |
| `data/sound/song066_agbfe3_bgm_ed_staff_6_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song067_agbfe3_bgm_op_theme_7_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song067_agbfe3_bgm_op_theme_8.bin` | sound-m4a-tables | fe8u sound/songs/midi/song067_agbfe3_bgm_op_theme.mid |
| `data/sound/song067_agbfe3_bgm_op_theme_8_002.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song067_agbfe3_bgm_op_theme_8_003.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song067_agbfe3_bgm_op_theme_8_004.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song067_agbfe3_bgm_op_theme_8_005.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song067_agbfe3_bgm_op_theme_8_006.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song067_agbfe3_bgm_op_theme_8_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song069_agbfe3_bgm_evt_last_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song069_agbfe3_bgm_evt_last.mid |
| `data/sound/song069_agbfe3_bgm_evt_last_1_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song069_agbfe3_bgm_evt_last_2_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song069_agbfe3_bgm_evt_last_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song069_agbfe3_bgm_evt_last.mid |
| `data/sound/song069_agbfe3_bgm_evt_last_3_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song070_agbfe3_bgm_ed_after_2_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song070_agbfe3_bgm_ed_after_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song070_agbfe3_bgm_ed_after.mid |
| `data/sound/song070_agbfe3_bgm_ed_after_3_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song070_agbfe3_bgm_ed_after_4_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song070_agbfe3_bgm_ed_after_5.bin` | sound-m4a-tables | fe8u sound/songs/midi/song070_agbfe3_bgm_ed_after.mid |
| `data/sound/song070_agbfe3_bgm_ed_after_5_054.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song070_agbfe3_bgm_ed_after_5_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song070_agbfe3_bgm_ed_after_5_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song070_agbfe3_bgm_ed_after_6.bin` | sound-m4a-tables | fe8u sound/songs/midi/song070_agbfe3_bgm_ed_after.mid |
| `data/sound/song070_agbfe3_bgm_ed_after_6_038.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song070_agbfe3_bgm_ed_after_6_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song073_y_doukutu_4_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song073_y_doukutu_4.mid |
| `data/sound/song073_y_doukutu_4_1_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song073_y_doukutu_4_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song073_y_doukutu_4.mid |
| `data/sound/song076_h_se_bird_3_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song080_h_evt_hubuki_s_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song080_h_evt_hubuki_s.mid |
| `data/sound/song085_agbfe3_bgm_btl_boss5_2_3_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song085_agbfe3_bgm_btl_boss5_2_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song085_agbfe3_bgm_btl_boss5_2.mid |
| `data/sound/song085_agbfe3_bgm_btl_boss5_2_4_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song086_agbfe3_bgm_ed_staff_2_5_B2.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song086_agbfe3_bgm_ed_staff_2_6.bin` | sound-m4a-tables | fe8u sound/songs/midi/song086_agbfe3_bgm_ed_staff_2.mid |
| `data/sound/song086_agbfe3_bgm_ed_staff_2_6_B1.bin` | sound-m4a-tables | fe8u sound/songs/mml/*.s (built from .mid) |
| `data/sound/song145_se_sys_chapter_start1_2_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song145_se_sys_chapter_start1_2.mid |
| `data/sound/song145_se_sys_chapter_start1_2_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song145_se_sys_chapter_start1_2.mid |
| `data/sound/song145_se_sys_chapter_start1_2_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song145_se_sys_chapter_start1_2.mid |
| `data/sound/song290_se_btl_fimbul1_1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song290_se_btl_fimbul1_1.mid |
| `data/sound/song319_bmp_evt_15_1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song319_bmp_evt_15_1.mid |
| `data/sound/song319_bmp_evt_15_1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song319_bmp_evt_15_1.mid |
| `data/sound/song319_bmp_evt_15_1_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song319_bmp_evt_15_1.mid |
| `data/sound/song319_bmp_evt_15_1_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song319_bmp_evt_15_1.mid |
| `data/sound/song320_bmp_evt_20b_1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song320_bmp_evt_20b_1.mid |
| `data/sound/song320_bmp_evt_20b_1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song320_bmp_evt_20b_1.mid |
| `data/sound/song320_bmp_evt_20b_1_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song320_bmp_evt_20b_1.mid |
| `data/sound/song320_bmp_evt_20b_1_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song320_bmp_evt_20b_1.mid |
| `data/sound/song320_bmp_evt_20b_1_5.bin` | sound-m4a-tables | fe8u sound/songs/midi/song320_bmp_evt_20b_1.mid |
| `data/sound/song320_bmp_evt_20b_1_6.bin` | sound-m4a-tables | fe8u sound/songs/midi/song320_bmp_evt_20b_1.mid |
| `data/sound/song321_bmp_evt_20b_2_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song321_bmp_evt_20b_2.mid |
| `data/sound/song321_bmp_evt_20b_2_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song321_bmp_evt_20b_2.mid |
| `data/sound/song321_bmp_evt_20b_2_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song321_bmp_evt_20b_2.mid |
| `data/sound/song321_bmp_evt_20b_2_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song321_bmp_evt_20b_2.mid |
| `data/sound/song321_bmp_evt_20b_2_5.bin` | sound-m4a-tables | fe8u sound/songs/midi/song321_bmp_evt_20b_2.mid |
| `data/sound/song322_mon_mao_die1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song322_mon_mao_die1.mid |
| `data/sound/song322_mon_mao_die1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song322_mon_mao_die1.mid |
| `data/sound/song322_mon_mao_die1_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song322_mon_mao_die1.mid |
| `data/sound/song322_mon_mao_die1_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song322_mon_mao_die1.mid |
| `data/sound/song322_mon_mao_die1_5.bin` | sound-m4a-tables | fe8u sound/songs/midi/song322_mon_mao_die1.mid |
| `data/sound/song322_mon_mao_die1_6.bin` | sound-m4a-tables | fe8u sound/songs/midi/song322_mon_mao_die1.mid |
| `data/sound/song617_se_bmp_map25_saint_light1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song617_se_bmp_map25_saint_light1.mid |
| `data/sound/song617_se_bmp_map25_saint_light1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song617_se_bmp_map25_saint_light1.mid |
| `data/sound/song723_btl_dance2_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song723_btl_dance2.mid |
| `data/sound/song723_btl_dance2_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song723_btl_dance2.mid |
| `data/sound/song725_bmp_dance2_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song725_bmp_dance2.mid |
| `data/sound/song725_bmp_dance2_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song725_bmp_dance2.mid |
| `data/sound/song752_h_btl_dragon_shake_01_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song752_h_btl_dragon_shake_01.mid |
| `data/sound/song753_h_btl_dragon_scream_01_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song753_h_btl_dragon_scream_01.mid |
| `data/sound/song753_h_btl_dragon_scream_01_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song753_h_btl_dragon_scream_01.mid |
| `data/sound/song754_h_btl_dragon_bress_01_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song754_h_btl_dragon_bress_01.mid |
| `data/sound/song754_h_btl_dragon_bress_01_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song754_h_btl_dragon_bress_01.mid |
| `data/sound/song754_h_btl_dragon_bress_01_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song754_h_btl_dragon_bress_01.mid |
| `data/sound/song755_h_btl_dragon_out_01_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song755_h_btl_dragon_out_01.mid |
| `data/sound/song755_h_btl_dragon_out_01_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song755_h_btl_dragon_out_01.mid |
| `data/sound/song755_h_btl_dragon_out_01_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song755_h_btl_dragon_out_01.mid |
| `data/sound/song790_sys_chapter_start_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song790_sys_chapter_start.mid |
| `data/sound/song790_sys_chapter_start_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song790_sys_chapter_start.mid |
| `data/sound/song790_sys_chapter_start_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song790_sys_chapter_start.mid |
| `data/sound/song790_sys_chapter_start_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song790_sys_chapter_start.mid |
| `data/sound/song896_mon_mao_appear1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song896_mon_mao_appear1.mid |
| `data/sound/song896_mon_mao_appear1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song896_mon_mao_appear1.mid |
| `data/sound/song896_mon_mao_appear1_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song896_mon_mao_appear1.mid |
| `data/sound/song900_bmp_bos_nightmare1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song900_bmp_bos_nightmare1.mid |
| `data/sound/song900_bmp_bos_nightmare1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song900_bmp_bos_nightmare1.mid |
| `data/sound/song900_bmp_bos_nightmare1_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song900_bmp_bos_nightmare1.mid |
| `data/sound/song940_btl_bgl_attack7_1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song940_btl_bgl_attack7_1.mid |
| `data/sound/song940_btl_bgl_attack7_1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song940_btl_bgl_attack7_1.mid |
| `data/sound/song940_btl_bgl_attack7_1_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song940_btl_bgl_attack7_1.mid |
| `data/sound/song943_btl_snr_magic2_1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song943_btl_snr_magic2_1.mid |
| `data/sound/song943_btl_snr_magic2_1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song943_btl_snr_magic2_1.mid |
| `data/sound/song943_btl_snr_magic2_1_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song943_btl_snr_magic2_1.mid |
| `data/sound/song943_btl_snr_magic2_1_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song943_btl_snr_magic2_1.mid |
| `data/sound/song944_btl_snr_magic2_2_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song944_btl_snr_magic2_2.mid |
| `data/sound/song944_btl_snr_magic2_2_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song944_btl_snr_magic2_2.mid |
| `data/sound/song944_btl_snr_magic2_2_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song944_btl_snr_magic2_2.mid |
| `data/sound/song944_btl_snr_magic2_2_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song944_btl_snr_magic2_2.mid |
| `data/sound/song946_mon_mao_magic1_1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song946_mon_mao_magic1_1.mid |
| `data/sound/song946_mon_mao_magic1_1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song946_mon_mao_magic1_1.mid |
| `data/sound/song946_mon_mao_magic1_1_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song946_mon_mao_magic1_1.mid |
| `data/sound/song946_mon_mao_magic1_1_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song946_mon_mao_magic1_1.mid |
| `data/sound/song947_mon_mao_magic1_2_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song947_mon_mao_magic1_2.mid |
| `data/sound/song947_mon_mao_magic1_2_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song947_mon_mao_magic1_2.mid |
| `data/sound/song947_mon_mao_magic1_2_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song947_mon_mao_magic1_2.mid |
| `data/sound/song947_mon_mao_magic1_2_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song947_mon_mao_magic1_2.mid |
| `data/sound/song950_mon_gog_magic1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song950_mon_gog_magic1.mid |
| `data/sound/song950_mon_gog_magic1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song950_mon_gog_magic1.mid |
| `data/sound/song950_mon_gog_magic1_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song950_mon_gog_magic1.mid |
| `data/sound/song950_mon_gog_magic1_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song950_mon_gog_magic1.mid |
| `data/sound/song951_mon_gog_attack1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song951_mon_gog_attack1.mid |
| `data/sound/song951_mon_gog_attack1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song951_mon_gog_attack1.mid |
| `data/sound/song959_btl_mon_call1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song959_btl_mon_call1.mid |
| `data/sound/song959_btl_mon_call1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song959_btl_mon_call1.mid |
| `data/sound/song967_mon_bgl_attack7_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song967_mon_bgl_attack7.mid |
| `data/sound/song967_mon_bgl_attack7_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song967_mon_bgl_attack7.mid |
| `data/sound/song967_mon_bgl_attack7_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song967_mon_bgl_attack7.mid |
| `data/sound/song980_btl_evl_magic2_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song980_btl_evl_magic2.mid |
| `data/sound/song980_btl_evl_magic2_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song980_btl_evl_magic2.mid |
| `data/sound/song980_btl_evl_magic2_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song980_btl_evl_magic2.mid |
| `data/sound/song980_btl_evl_magic2_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song980_btl_evl_magic2.mid |
| `data/sound/song981_btl_mon_magic1_1.bin` | sound-m4a-tables | fe8u sound/songs/midi/song981_btl_mon_magic1.mid |
| `data/sound/song981_btl_mon_magic1_2.bin` | sound-m4a-tables | fe8u sound/songs/midi/song981_btl_mon_magic1.mid |
| `data/sound/song981_btl_mon_magic1_3.bin` | sound-m4a-tables | fe8u sound/songs/midi/song981_btl_mon_magic1.mid |
| `data/sound/song981_btl_mon_magic1_4.bin` | sound-m4a-tables | fe8u sound/songs/midi/song981_btl_mon_magic1.mid |
| `data/sound/voicegroup035.bin` | voicegroup-tail | fe8u sound/voicegroups/voicegroup035.s |
| `data/sound/voicegroup092.bin` | voicegroup-tail | fe8u sound/voicegroups/voicegroup092.s |
| `graphics/btl_bg/btl_bg_14.feimg3.bin` | pixel-gfx | fe8u graphics/btl_bg/btl_bg_14.png |
| `graphics/btl_bg/btl_bg_27.feimg3.bin` | pixel-gfx | fe8u graphics/btl_bg/btl_bg_27.png |
| `graphics/btl_bg/btl_bg_33.feimg3.bin` | pixel-gfx | fe8u graphics/btl_bg/btl_bg_33.png |
| `graphics/btl_bg/btl_bg_55.feimg3.bin` | pixel-gfx | fe8u graphics/btl_bg/btl_bg_55.png |
| `graphics/btl_bg/btl_bg_58.feimg3.bin` | pixel-gfx | fe8u graphics/btl_bg/btl_bg_58.png |
| `graphics/btl_bg/btl_bg_59.feimg3.bin` | pixel-gfx | fe8u graphics/btl_bg/btl_bg_59.png |
| `graphics/btl_bg/btl_bg_60.feimg3.bin` | pixel-gfx | fe8u graphics/btl_bg/btl_bg_60.png |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_000_76E98C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_001_76FE78.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_002_771224.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_003_7725D4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_004_7738F0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_005_774CB8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_006_774F30.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_007_7751A8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_008_775420.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_009_775698.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_010_775908.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_011_775B64.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_012_775DDC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_013_776054.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_014_7762CC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_015_776544.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_016_7767BC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_017_777118.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_018_7771B8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_019_777264.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_020_777308.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_021_7773B4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_022_777468.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_023_777520.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_024_7775CC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_025_777674.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_026_77771C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_027_7777BC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
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
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_000_77BBB8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_001_77BC6C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_002_77CA18.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_003_77DBCC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_004_77EAB4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_005_77F654.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_006_77F710.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_007_77F7E8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_008_77F8E8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_009_77FA14.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_010_77FB6C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_011_77FCE8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_012_77FE64.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_013_77FFC4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_014_780114.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_015_780250.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_016_780378.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_017_78048C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_018_781CBC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_019_7832B4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_020_7844F0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_021_785C08.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_022_7875A0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_023_788CC4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_024_78A0D0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_025_78AF74.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_026_78BE1C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_027_78CEA8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_028_78D004.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_029_78D354.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_030_78D6A4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_031_78DAB4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_032_78DF08.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_033_78E33C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_034_78E750.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_035_78EAE0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_036_78EE00.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_037_794964.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_038_794D78.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_039_795198.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_040_7955B8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_chap_title/frontier_chap_title_000_A7E188.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_001_A7E504.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_002_A7E800.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_003_A7EB7C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_004_A7EF88.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_005_A7F360.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_006_A7F754.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_007_A7FAA4.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_008_A7FE84.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_009_A8021C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_010_A80584.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_011_A808BC.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_012_A80CA0.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_013_A81068.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_014_A813F8.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_015_A81774.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_016_A81B1C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_017_A81F28.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_018_A82294.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_019_A8258C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_020_A829B4.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_021_A82D58.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_022_A8306C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_023_A833D4.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_024_A8383C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_025_A83C0C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_026_A83F64.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_027_A8436C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_028_A84720.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_029_A84BFC.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_030_A84F64.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_031_A852E8.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_032_A85670.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_033_A859E4.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_034_A85D6C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_035_A860F4.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_036_A86460.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_037_A867E4.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_038_A86B60.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_039_A86EF8.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_040_A8729C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_041_A8765C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_042_A87A14.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_043_A87DBC.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_044_A88174.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_045_A88530.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_046_A888D0.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_047_A88C8C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_048_A89048.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_049_A89428.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_050_A89710.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_051_A899E8.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_052_A89CD8.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_053_A89F80.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_054_A8A260.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_055_A8A5A0.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_056_A8A85C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_057_A8AB8C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_058_A8AE74.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_059_A8B168.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_060_A8B39C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_061_A8B5DC.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_062_A8B7F0.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_063_A8BB88.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_064_A8BFB0.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_065_A8C0EC.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_066_A8C1E4.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_067_A8C308.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_068_A8C424.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_069_A8C534.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_070_A8C734.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_071_A8C854.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_072_A8C974.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_073_A8CA74.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_074_A8CB94.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_075_A8CCAC.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_076_A8CDF8.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_077_A8CF14.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_078_A8D064.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_079_A8D1B0.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_080_A8D2F4.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_081_A8D430.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_082_A8D574.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_083_A8D6AC.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_084_A8D7F4.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_085_A8D948.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_086_A8DAB0.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_087_A8DBFC.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_088_A8DE6C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_089_A8E080.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_090_A8E2EC.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_091_A8E600.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_092_A8E8C8.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_093_A8EAF8.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_094_A8ED30.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_095_A8EFFC.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_096_A8F28C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_097_A8F4CC.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_098_A8F6F8.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_099_A8F9C0.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_100_A8FC68.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_101_A8FEC0.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_102_A900FC.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_103_A90378.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_104_A9065C.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_105_A90898.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_106_A90A98.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_107_A90D84.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_108_A90FF0.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_109_A911D0.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_110_A91418.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_111_A91760.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_112_A919F8.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_113_A91C28.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_114_A91F08.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_chap_title/frontier_chap_title_115_A92170.bin` | pixel-gfx | fe8u graphics/chap_title/*.png (chapter-title images) |
| `graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_000_7463DC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_001_74F150.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_002_74FD8C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_003_754840.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_004_7557C4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_005_756454.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_006_756F38.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_007_758E68.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_008_75CEFC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_009_75D570.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_010_75DE94.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_011_761780.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000_64D2B4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_001_6500B0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_002_651204.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_003_651C6C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_004_652948.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_005_6533B0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_006_654DFC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008_657A78.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009_6587E0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df3_btl_bg/frontier_df3_btl_bg_000_7B40A8.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_df3_btl_bg/frontier_df3_btl_bg_001_7B6E50.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_df3_btl_bg/frontier_df3_btl_bg_002_7B83B8.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_df3_const_unit_ic/frontier_df3_const_unit_ic_000_1C0D80.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_df3_const_unit_ic/frontier_df3_const_unit_ic_001_1C2B4C.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_000_5D367C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_001_5D3EA8.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_002_5D4358.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_003_5D48E0.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_004_5D4C5C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_005_5D4DD8.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_006_5D53FC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_007_5D737C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_009_5D8A8C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_ending/frontier_df3_ending_000_AC1BC0.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_ending/frontier_df3_ending_001_AC3AA8.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_ending/frontier_df3_ending_002_AC50A4.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_000_A69464.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_001_A696D4.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_002_A6A06C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_003_A6AA20.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_004_A6AE28.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_005_A6B460.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_006_A6C078.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_007_A6C8CC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_008_A6CD00.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_009_A6D3F8.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_010_A6D524.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_011_A6D850.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_012_A6DE0C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_013_A6E680.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_014_A6EDFC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_015_A6EF04.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_016_A6EFD8.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_017_A6F47C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_019_A6FB48.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_020_A6FB9C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_021_A6FC48.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_000_57E884.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_001_57F604.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_002_57FACC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_003_57FD0C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_004_57FF94.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_005_580B1C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_006_5814AC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_007_581A04.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_008_582A54.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_009_582F1C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df3_opanim_gfx/frontier_df3_opanim_gfx_000_B75860.bin` | pixel-gfx | fe8u graphics/op_anim/*.png (opanim gfx, not the tilemap floor) |
| `graphics/frontier_df3_opanim_gfx/frontier_df3_opanim_gfx_001_B79EBC.bin` | pixel-gfx | fe8u graphics/op_anim/*.png (opanim gfx, not the tilemap floor) |
| `graphics/frontier_df3_opanim_gfx/frontier_df3_opanim_gfx_002_B7F118.bin` | pixel-gfx | fe8u graphics/op_anim/*.png (opanim gfx, not the tilemap floor) |
| `graphics/frontier_df3_opanim_gfx/frontier_df3_opanim_gfx_003_B864A8.bin` | pixel-gfx | fe8u graphics/op_anim/*.png (opanim gfx, not the tilemap floor) |
| `graphics/frontier_df3_titlescreen/frontier_df3_titlescreen_000_B44B40.bin` | pixel-gfx | fe8u graphics/titlescreen/*.png |
| `graphics/frontier_df3_titlescreen/frontier_df3_titlescreen_001_B48D38.bin` | pixel-gfx | fe8u graphics/titlescreen/*.png |
| `graphics/frontier_df3_titlescreen/frontier_df3_titlescreen_002_B4B200.bin` | pixel-gfx | fe8u graphics/titlescreen/*.png |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_000_90F678.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_001_91020C.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_002_9105E0.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_003_91066C.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_004_91075C.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_005_9109A8.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_006_911070.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_007_911200.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_008_9117C8.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_009_91187C.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_010_9119D0.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_011_911AFC.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_012_911C34.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_013_911E38.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_014_911FCC.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_015_91206C.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_016_912198.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_017_912480.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_018_912AD4.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_019_913958.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_020_9148F4.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_021_914BD8.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_022_915038.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_023_91512C.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_024_915E08.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_025_9163BC.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_026_916D14.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_027_917600.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_028_9178F8.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_029_9184F0.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_030_918784.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_031_918C90.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_032_91908C.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_033_9191E0.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_034_919A90.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_035_91A580.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_036_91AB20.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_037_91AC38.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_038_91B948.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_039_91BED4.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_040_91BF9C.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_041_91C104.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_042_91C230.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_043_91D314.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_044_91D878.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_045_91DC24.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_046_91DFD0.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_047_91E280.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_048_91E7A8.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_049_91E988.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_050_91EE14.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_051_91F300.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_052_91F89C.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_053_91FAF4.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_054_91FD38.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_055_91FE20.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_056_920140.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_057_92042C.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_058_920698.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_059_920AD0.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_060_921140.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_061_9212BC.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_062_9218FC.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_063_921E38.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_064_921F00.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_065_922388.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_066_92275C.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_067_922B08.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_068_922FCC.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_069_9233F8.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_070_923510.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_071_92395C.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_072_923AD8.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_073_923F38.bin` | pixel-gfx | fe8u graphics/**/*.png (unitdef portrait gfx) |
| `graphics/frontier_df4_banim_a/frontier_df4_banim_a_000_5E0E94.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_a/frontier_df4_banim_a_001_5E37CC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_a/frontier_df4_banim_a_002_5E3AD4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_a/frontier_df4_banim_a_003_5E4570.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_a/frontier_df4_banim_a_004_5E4E84.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_a/frontier_df4_banim_a_005_5EA510.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_a/frontier_df4_banim_a_006_5EBF04.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_a/frontier_df4_banim_a_007_5F1C3C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_a/frontier_df4_banim_a_008_5FE7D8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_a/frontier_df4_banim_a_009_5FF000.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_a/frontier_df4_banim_a_010_5FF7C8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_a/frontier_df4_banim_a_011_5FFBA0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_a/frontier_df4_banim_a_012_600754.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_a/frontier_df4_banim_a_013_601630.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_a/frontier_df4_banim_a_014_601CD8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_000_602568.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_001_602FB0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_002_603894.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_003_604F7C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_004_60838C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_005_611798.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_006_6123D4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_007_617424.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_008_6186C4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_009_619994.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_010_61AC64.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_011_61BE44.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_012_61EC9C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_013_622E28.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_014_6238B4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_015_62DC84.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_016_62EDD8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_017_63CDD4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_018_63D868.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_019_64C610.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_020_65A7FC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_021_663368.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_022_665FB0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_023_6719A8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_024_67E9B8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_025_67F520.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_026_683C80.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_027_6870D4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_028_69697C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_029_69BBC8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_030_69C34C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_031_69EBD8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_032_6A5EDC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_033_6A819C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_034_6A9534.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_035_6AB184.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_036_6AB520.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_037_6AC820.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_038_6AD478.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_039_6ADB74.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_040_6AF038.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_041_6B0C88.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_042_6B1024.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_043_6B1690.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_044_6B64CC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_045_6BB2EC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_046_6BC4BC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_047_6BCF9C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_048_6CF20C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_049_6D00A8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_050_6D3478.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_051_6E0CF4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_052_6E96D0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_053_7059C4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_054_716918.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_055_7179EC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_056_7657CC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_057_79A108.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_058_79F83C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_059_79FCB0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_060_7A8B10.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_061_7A9254.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_062_7AA39C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_063_7AAC64.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_064_7CD474.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_065_7D3984.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_066_7E13A4.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_067_84886C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_069_8601B1.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_070_901138.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_071_903450.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_072_903A50.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_073_907F78.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_074_909DE8.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_075_90A050.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_076_90B4DC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_077_90DB94.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_078_90E58C.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_079_90EFAC.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_080_9CD958.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_081_9CF318.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_082_A12AC0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_083_A13256.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_084_A13880.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_banim_b/frontier_df4_banim_b_085_A13CD0.bin` | battle-anim | fe8u banim/*.png + banim/*.s |
| `graphics/frontier_df4_ending/frontier_df4_ending_000_AC059C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_001_AC0B90.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_002_AC16C8.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_003_AC718C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_004_ACC378.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_005_ACEB54.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_006_AD02D4.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_007_AD0CFC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_008_AD1444.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_009_B1D954.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_010_B1E5FC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_011_B24D0C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_012_B25A78.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_013_B26374.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_014_B26A6C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_015_B3B3D4.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_016_B3EBE4.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_017_B3F024.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_018_B3F7BC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_019_B8B998.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_020_BAA2E0.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_ending/frontier_df4_ending_021_BAB754.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_font_cc/frontier_df4_font_cc_078_56CAD8.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_df4_font_cc/frontier_df4_font_cc_090_574344.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_df4_menu/frontier_df4_menu_000_A149D4.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_001_A588C0.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_002_A5D648.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_003_A5E6CC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_004_A5F770.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_006_A65504.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_007_A657D4.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_008_A66F88.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_009_A67660.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_010_A67EEC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_011_A71268.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_012_A71CC4.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_013_A72408.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_014_A72BF0.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_015_A73900.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_016_A74CEC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_017_A79E90.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_018_A92B38.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_019_A934EC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_020_A9454C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_022_A96D18.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_023_A99FA8.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_024_A9AC28.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_025_A9C020.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_026_A9CF7C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_028_A9E244.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_029_AA3860.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_030_AA71D4.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_031_AA9F98.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_032_AAAC4C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_033_AAEB40.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_034_AAF9EC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_035_AB0830.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_036_AB0D18.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_000a_0DC3DC.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_000b_0DC41C.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_001_0DC96C.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_002a_0DCDD0.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_002b_0DD358.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_003_0DE85C.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_004_0DEE88.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_005_0DF388.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_006_0DFBEF.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_007_0E1870.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_008_0E2638.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_009_0E37C5.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_010_0E3CD7.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_011_0E4602.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_012_0E6774.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_013_0E7544.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_014_0E8F58.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_015_19E6EC.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_016_1A4C88.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_017_1B1878.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_018_1DEF84.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_019_1E140C.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_020_1EC9E0.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_021_1F4F60.bin` | menu-strings | fe8u C string literals (src/menu_def.c parity) — string pools |
| `graphics/frontier_df4_tail/frontier_df4_tail_000_BABAF8.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_df4_tail/frontier_df4_tail_001_BB08B4.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_000_57A504.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_001_57B23C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_002_57BF74.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_003_57CC64.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_004_57CF7C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_005_57DFCC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_006_57E4DC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_007_59140C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_008_5946F4.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_009_594B2C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_010_595B34.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_011_59662C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_012_596F74.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_013_5987EC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_014_598E64.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_015_599BE4.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_016_59A2EC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_017_59A574.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_018_59B0FC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_019_59BA8C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_020_59BFE4.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_021_59D034.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_022_5B90D8.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_023_5B9454.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_024_5C1D30.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_025_5C2E50.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_026_5C3618.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_027_5C3C9C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_028_5C411C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_029_5C4A94.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_030_5C534C.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_031_5C5DE8.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_032_5C6084.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_033_5C6AD4.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_034_5C6E08.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_035_5CDF84.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_036_5D14D4.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_df4_uistuff/frontier_df4_uistuff_038_5D32D8.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_ending_cg/frontier_ending_cg_000_B27970.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_fontgrp_ui/frontier_fontgrp_ui_000_59D4FC.bin` | menu-strings | fe8u graphics/**/*.png or C literals (frontier UI/gfx) |
| `graphics/frontier_map_ch9events/frontier_map_ch9events_000_1598A0.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_map_objtype/frontier_map_objtype_000_17B398.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_map_objtype/frontier_map_objtype_001_181610.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/frontier_map_objtype/frontier_map_objtype_002_188888.bin` | pixel-gfx | fe8u graphics/**/*.png (frontier image region) |
| `graphics/gfx_data_bg/bg_Cell_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/bg_Fort_Sunset_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/bg_Grass_Plains_2_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/bg_Grass_Plains_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/bg_Normal_Village_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/bg_Plain_1_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/bg_Plain_2_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/bg_Port_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/bg_Stream_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_000_bg_House_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_001_bg_House_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_002_bg_Caer_Pelyn_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_003_bg_Caer_Pelyn_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_004_bg_Normal_Village_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_006_bg_Village_Clear_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_007_bg_Village_Clear_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_011_bg_Fireplace_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_012_bg_Fireplace_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_014_bg_Castle_Interior_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_015_bg_Castle_Interior_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_016_bg_Grado_Chamber_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_017_bg_Grado_Chamber_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_018_bg_Grado_Chamber_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_019_bg_Throne_Normal_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_020_bg_Throne_Normal_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_021_bg_Throne_Normal_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_022_bg_Throne_Normal_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_023_bg_Castle_Bright_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_024_bg_Castle_Bright_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_025_bg_Garden_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_026_bg_Garden_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_027_bg_Manse_Back_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_028_bg_Manse_Back_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_029_bg_Cell_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_030_bg_Cell_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_032_bg_Plain_1_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_033_bg_Plain_1_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_034_bg_Grass_Plains_2_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_035_bg_Grass_Plains_2_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_036_bg_Plain_2_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_037_bg_Plain_2_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_040_bg_Forest_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_041_bg_Town_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_042_bg_Castle_Back_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_044_bg_Passage_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_045_bg_Passage_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_048_bg_Stone_Chamber_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_049_bg_Stone_Chamber_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_050_bg_Stone_Chamber_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_051_bg_Renais_Chamber_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_052_bg_Renais_Chamber_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_053_bg_White_Chamber_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_054_bg_White_Chamber_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_058_bg_Black_Temple_Outside_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_059_bg_Black_Temple_Outside_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_060_bg_Black_Temple_Inside_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_061_bg_Black_Temple_Inside_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_064_bg_convo2_00_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_065_bg_convo2_00_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_069_bg_convo2_03_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_070_bg_convo2_03_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_072_bg_convo2_06_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_074_bg_convo2_08_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_075_bg_convo2_08_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_076_bg_convo2_09_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_077_bg_convo2_09_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_080_bg_convo2_12_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_081_bg_convo2_12_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_082_bg_convo2_13_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_083_bg_convo2_13_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_084_bg_convo2_15_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_085_bg_convo2_15_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_086_bg_convo2_16_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_087_bg_convo2_16_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_090_bg_convo2_19_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_091_bg_convo2_19_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_093_bg_convo2_21_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_094_bg_convo2_21_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_095_bg_convo2_22_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_096_bg_convo2_22_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_097_bg_convo2_23_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_098_bg_convo2_23_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_099_bg_convo2_24_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_100_bg_convo2_24_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_101_bg_convo2_25_tiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gfx_data_bg/gfx_data_bg_102_bg_Blank_map.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/Img_ArenaBattleBg.bin` | battle-anim | fe8u graphics/banim/efxlvupfx/Img_ArenaBattleBg.png |
| `graphics/gmapunit/Img_BanimArcherMBallistaIntro.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/Img_ChapterStatusSelectorSprite.bin` | pixel-gfx | fe8u graphics/misc/Img_ChapterStatusSelectorSprite.png |
| `graphics/gmapunit/Img_ConfigUiIcons.bin` | pixel-gfx | fe8u graphics/misc/Img_ConfigUiIcons.png |
| `graphics/gmapunit/Img_ConfigUiSprites.bin` | pixel-gfx | fe8u graphics/misc/Img_ConfigUiSprites.png |
| `graphics/gmapunit/Img_DanceringFx.bin` | pixel-gfx | fe8u graphics/misc/Img_DanceringFx.png |
| `graphics/gmapunit/Img_EfxArrowOBJ.bin` | pixel-gfx | fe8u graphics/efxmagic/Img_EfxArrowOBJ.png |
| `graphics/gmapunit/Img_EfxLvupBG2.bin` | battle-anim | fe8u graphics/banim/efxlvupfx/Img_EfxLvupBG2.png |
| `graphics/gmapunit/Img_EfxLvupOBJ2.bin` | battle-anim | fe8u graphics/banim/efxlvupfx/Img_EfxLvupOBJ2.png |
| `graphics/gmapunit/Img_EkrLvupNumBig.bin` | pixel-gfx | fe8u graphics/misc/Img_EkrLvupNumBig.png |
| `graphics/gmapunit/Img_EventWarp.bin` | pixel-gfx | fe8u graphics/misc/Img_EventWarp.png |
| `graphics/gmapunit/Img_LvupApfx.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/Img_MenuStatus_0.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/Img_MineFx.bin` | pixel-gfx | fe8u graphics/misc/Img_MineFx.png |
| `graphics/gmapunit/Img_NODAMGEMIS.bin` | battle-anim | fe8u graphics/banim/efxbattle/Img_NODAMGEMIS.png |
| `graphics/gmapunit/Img_PlayStatusSprites.bin` | pixel-gfx | fe8u graphics/misc/Img_PlayStatusSprites.png |
| `graphics/gmapunit/Img_PrepFunds.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/Img_PrepItemUseScreen.bin` | pixel-gfx | fe8u graphics/misc/Img_PrepItemUseScreen.png |
| `graphics/gmapunit/Img_PrepTextShadow.bin` | pixel-gfx | fe8u graphics/misc/Img_PrepTextShadow.png |
| `graphics/gmapunit/Img_PrepWindow.bin` | pixel-gfx | fe8u graphics/misc/Img_PrepWindow.png |
| `graphics/gmapunit/Img_SoundRoomVolumeGraph.bin` | pixel-gfx | fe8u graphics/misc/Img_SoundRoomVolumeGraph.png |
| `graphics/gmapunit/Img_SpinningArrow.bin` | pixel-gfx | fe8u graphics/misc/Img_SpinningArrow.png |
| `graphics/gmapunit/Img_StatscreenBG.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/Img_StatscreenEquipmentText.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/Img_StatscreenHalo.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/Img_StatscreenObjs.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/Img_SysBlackBox.bin` | pixel-gfx | fe8u graphics/misc/Img_SysBlackBox.png |
| `graphics/gmapunit/Img_SysBrownBox.bin` | pixel-gfx | fe8u graphics/sysutils/Img_SysBrownBox.png |
| `graphics/gmapunit/Img_SysGrayBox.bin` | pixel-gfx | fe8u graphics/sysutils/Img_SysGrayBox.png |
| `graphics/gmapunit/Img_TalkBubble.bin` | pixel-gfx | fe8u graphics/misc/Img_TalkBubble.png |
| `graphics/gmapunit/Img_TalkBubbleOpening_A.bin` | pixel-gfx | fe8u graphics/misc/Img_TalkBubbleOpening_A.png |
| `graphics/gmapunit/Img_TalkBubbleOpening_B.bin` | pixel-gfx | fe8u graphics/misc/Img_TalkBubbleOpening_B.png |
| `graphics/gmapunit/Img_TalkBubbleOpening_C.bin` | pixel-gfx | fe8u graphics/misc/Img_TalkBubbleOpening_C.png |
| `graphics/gmapunit/Img_TalkBubbleOpening_D.bin` | pixel-gfx | fe8u graphics/misc/Img_TalkBubbleOpening_D.png |
| `graphics/gmapunit/Img_TalkBubbleOpening_E.bin` | pixel-gfx | fe8u graphics/misc/Img_TalkBubbleOpening_E.png |
| `graphics/gmapunit/Img_UnitListBanner_Animation.bin` | pixel-gfx | fe8u graphics/misc/Img_UnitListBanner_Animation.png |
| `graphics/gmapunit/Img_UnitListBanners.bin` | pixel-gfx | fe8u graphics/misc/Img_UnitListBanners.png |
| `graphics/gmapunit/Img_UnkData_1.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/Tsa_ArenaBattleBg.bin` | battle-anim | fe8u preview/tsa/banim/efxlvupfx/Tsa_ArenaBattleBg.png |
| `graphics/gmapunit/Tsa_ConfigUiFrame.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_ConfigUiFrame.png |
| `graphics/gmapunit/Tsa_DanceringFx.bin` | pixel-gfx | fe8u graphics/misc/Tsa_DanceringFx.png |
| `graphics/gmapunit/Tsa_EventWarp.bin` | pixel-gfx | fe8u graphics/misc/Tsa_EventWarp.png |
| `graphics/gmapunit/Tsa_PlayerRankFog.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_PlayerRankFog.png |
| `graphics/gmapunit/Tsa_PrepItemScreen.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_PrepItemScreen.png |
| `graphics/gmapunit/Tsa_PrepItemUseScreen.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_PrepItemUseScreen.png |
| `graphics/gmapunit/Tsa_SilenceBg_2.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/Tsa_StatscreenBG.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/Tsa_StatscreenEquipedWeaponHighlight.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/Tsa_StatscreenEquipmentBG.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/Tsa_StatscreenHalo.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/Tsa_TerrainMapUi_Labels.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_TerrainMapUi_Labels.png |
| `graphics/gmapunit/Tsa_UnkData_1.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_UnkData_1.png |
| `graphics/gmapunit/Tsa_UnkData_3.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_UnkData_3.png |
| `graphics/gmapunit/Tsa_UnkData_4.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_UnkData_4.png |
| `graphics/gmapunit/gGfx_HelpTextBox.bin` | pixel-gfx | fe8u graphics/misc/gGfx_HelpTextBox.png |
| `graphics/gmapunit/gGfx_HelpTextBox2.bin` | pixel-gfx | fe8u graphics/misc/gGfx_HelpTextBox2.png |
| `graphics/gmapunit/gGfx_HelpTextBox3.bin` | pixel-gfx | fe8u graphics/misc/gGfx_HelpTextBox3.png |
| `graphics/gmapunit/gGfx_HelpTextBox4.bin` | pixel-gfx | fe8u graphics/misc/gGfx_HelpTextBox4.png |
| `graphics/gmapunit/gGfx_HelpTextBox5.bin` | pixel-gfx | fe8u graphics/misc/gGfx_HelpTextBox5.png |
| `graphics/gmapunit/gGfx_MinimapTiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/gGfx_PlayerInterfaceFontTiles.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/gGfx_PlayerInterfaceNumbers.bin` | pixel-gfx | fe8u graphics/**/*.png (BG/unit tile gfx) |
| `graphics/gmapunit/gGfx_YellowTextBox.bin` | pixel-gfx | fe8u graphics/misc/gGfx_YellowTextBox.png |
| `graphics/gmapunit/gGfx_YellowTextBox2.bin` | pixel-gfx | fe8u graphics/misc/gGfx_YellowTextBox2.png |
| `graphics/gmapunit/gGfx_YellowTextBox3.bin` | pixel-gfx | fe8u graphics/misc/gGfx_YellowTextBox3.png |
| `graphics/gmapunit/gGfx_YellowTextBox4.bin` | pixel-gfx | fe8u graphics/misc/gGfx_YellowTextBox4.png |
| `graphics/gmapunit/gGfx_YellowTextBox5.bin` | pixel-gfx | fe8u graphics/misc/gGfx_YellowTextBox5.png |
| `graphics/gmapunit/gImg_UiSpinningArrow_Horizontal.bin` | pixel-gfx | fe8u graphics/misc/gImg_UiSpinningArrow_Horizontal.png |
| `graphics/map/ObjectType10.bin` | map-tilemaps | fe8u graphics/map/ObjectType10.png |
| `graphics/map/ObjectType4.bin` | map-tilemaps | fe8u graphics/map/ObjectType4.png |
| `graphics/map/ObjectType5.bin` | map-tilemaps | fe8u graphics/map/ObjectType5.png |
| `graphics/map/ObjectType6.bin` | map-tilemaps | fe8u graphics/map/ObjectType6.png |
| `graphics/map/ObjectType7.bin` | map-tilemaps | fe8u graphics/map/ObjectType7.png |
| `graphics/map/ObjectType8.bin` | map-tilemaps | fe8u graphics/map/ObjectType8.png |
| `graphics/map/TowerOfValniObjectType.bin` | map-tilemaps | fe8u graphics/map/TowerOfValniObjectType.png |
| `graphics/mapanim/TileAnimationsUnused3_frame_7.pal.bin` | map-tilemaps | fe8u graphics/map/TileAnimationsUnused3_frame_7.pal |
| `graphics/mapanim/TileAnimationsUnused4_frame_11.pal.bin` | map-tilemaps | fe8u graphics/map/TileAnimationsUnused4_frame_11.pal |
| `graphics/mapanim/TileAnimationsUnused4_frame_4.pal.bin` | map-tilemaps | fe8u graphics/map/TileAnimationsUnused4_frame_4.pal |
| `graphics/mapanim/TileAnimationsUnused4_frame_9.pal.bin` | map-tilemaps | fe8u graphics/map/TileAnimationsUnused4_frame_9.pal |
| `graphics/misc_gfx/Img_GmapSoguSprites.bin` | pixel-gfx | fe8u graphics/misc/Img_GmapSoguSprites.png |
| `graphics/misc_gfx/Img_GorgonHatchCloud.bin` | pixel-gfx | fe8u graphics/misc/Img_GorgonHatchCloud.png |
| `graphics/misc_gfx/Img_LinkArenaWarpFx.bin` | pixel-gfx | fe8u graphics/misc/Img_LinkArenaWarpFx.png |
| `graphics/misc_gfx/Img_ManimBarrierBgfx.bin` | pixel-gfx | fe8u graphics/misc/Img_ManimBarrierBgfx.png |
| `graphics/misc_gfx/Img_MapAnimAntitoxinPureWater.bin` | pixel-gfx | fe8u graphics/misc/Img_MapAnimAntitoxinPureWater.png |
| `graphics/misc_gfx/Img_MapAnimBerserkfx.bin` | pixel-gfx | fe8u graphics/misc/Img_MapAnimBerserkfx.png |
| `graphics/misc_gfx/Img_MapAnimBerserkfx_1.bin` | pixel-gfx | fe8u graphics/misc/Img_MapAnimBerserkfx.png |
| `graphics/misc_gfx/Img_MapAnimRepairfx.bin` | pixel-gfx | fe8u graphics/misc/Img_MapAnimRepairfx.png |
| `graphics/misc_gfx/Img_MapAnimTorchfx.bin` | pixel-gfx | fe8u graphics/misc/Img_MapAnimTorchfx.png |
| `graphics/misc_gfx/Img_MapAnimUnlockBgfx.bin` | pixel-gfx | fe8u graphics/misc/Img_MapAnimUnlockBgfx.png |
| `graphics/misc_gfx/Img_MapAnimUnlockObjfx.bin` | pixel-gfx | fe8u graphics/misc/Img_MapAnimUnlockObjfx.png |
| `graphics/misc_gfx/Img_MapBattleInfoBox.bin` | pixel-gfx | fe8u graphics/misc/Img_MapBattleInfoBox.png |
| `graphics/misc_gfx/Img_MapBattleInfoHpBar.bin` | pixel-gfx | fe8u graphics/misc/Img_MapBattleInfoHpBar.png |
| `graphics/misc_gfx/Img_MapBattleInfoNum.bin` | pixel-gfx | fe8u graphics/misc/Img_MapBattleInfoNum.png |
| `graphics/misc_gfx/Img_MonsterStoneMapAnimfx.bin` | pixel-gfx | fe8u graphics/misc/Img_MonsterStoneMapAnimfx.png |
| `graphics/misc_gfx/Img_NightMareMapAnimfx.bin` | pixel-gfx | fe8u graphics/misc/Img_NightMareMapAnimfx.png |
| `graphics/misc_gfx/Img_OpAnimEirikaBlur1.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Img_OpAnimEirikaBlur2.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Img_OpAnimEirikaBlur3.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Img_OpAnimEphraim.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Img_OpAnimEphraimBlur1.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Img_OpAnimWorldMap.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Img_PhaseChangeEnemy.bin` | pixel-gfx | fe8u graphics/misc/Img_PhaseChangeEnemy.png |
| `graphics/misc_gfx/Img_PhaseChangeOther.bin` | pixel-gfx | fe8u graphics/misc/Img_PhaseChangeOther.png |
| `graphics/misc_gfx/Img_PhaseChangePlayer.bin` | pixel-gfx | fe8u graphics/misc/Img_PhaseChangePlayer.png |
| `graphics/misc_gfx/Img_PhaseChangeSquares.bin` | pixel-gfx | fe8u graphics/misc/Img_PhaseChangeSquares.png |
| `graphics/misc_gfx/Img_PhaseChangeUnk.bin` | pixel-gfx | fe8u graphics/misc/Img_PhaseChangeUnk.png |
| `graphics/misc_gfx/Img_PoisonAnim.bin` | pixel-gfx | fe8u graphics/misc/Img_PoisonAnim.png |
| `graphics/misc_gfx/Img_ShopGoldBox.bin` | pixel-gfx | fe8u graphics/misc/Img_ShopGoldBox.png |
| `graphics/misc_gfx/Img_WallBreakAnim.bin` | pixel-gfx | fe8u graphics/misc/Img_WallBreakAnim.png |
| `graphics/misc_gfx/Pal_LinkArenaWarpFx.bin` | pixel-gfx | fe8u graphics/misc/Pal_LinkArenaWarpFx.agbpal |
| `graphics/misc_gfx/Pal_MapAnimAntitoxin.bin` | pixel-gfx | fe8u graphics/misc/Pal_MapAnimAntitoxin.agbpal |
| `graphics/misc_gfx/Pal_MapAnimBerserkfx_0.bin` | pixel-gfx | fe8u graphics/misc/Pal_MapAnimBerserkfx.pal |
| `graphics/misc_gfx/Pal_MapAnimBerserkfx_1.bin` | pixel-gfx | fe8u graphics/misc/Pal_MapAnimBerserkfx.pal |
| `graphics/misc_gfx/Pal_MapAnimPureWater.bin` | pixel-gfx | fe8u graphics/misc/Pal_MapAnimPureWater.agbpal |
| `graphics/misc_gfx/Pal_MapAnimTorchfx.bin` | pixel-gfx | fe8u graphics/misc/Pal_MapAnimTorchfx.agbpal |
| `graphics/misc_gfx/Pal_MapAnimUnlockObjfx.bin` | pixel-gfx | fe8u graphics/misc/Pal_MapAnimUnlockObjfx.agbpal |
| `graphics/misc_gfx/Pal_MapAnimUnlockObjfx_Unk.bin` | pixel-gfx | fe8u graphics/misc/Pal_MapAnimUnlockObjfx_Unk.agbpal |
| `graphics/misc_gfx/Pal_OpAnimEphraimBlur.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Pal_OpAnimWorldMap.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Pal_OpAnimWorldMapFog.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Tsa_GorgonHatchCloud_A.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_GorgonHatchCloud_A.png |
| `graphics/misc_gfx/Tsa_GorgonHatchCloud_B.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_GorgonHatchCloud_B.png |
| `graphics/misc_gfx/Tsa_GorgonHatchCloud_C.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_GorgonHatchCloud_C.png |
| `graphics/misc_gfx/Tsa_GorgonHatchCloud_D.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_GorgonHatchCloud_D.png |
| `graphics/misc_gfx/Tsa_GorgonHatchCloud_E.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_GorgonHatchCloud_E.png |
| `graphics/misc_gfx/Tsa_GorgonHatchCloud_F.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_GorgonHatchCloud_F.png |
| `graphics/misc_gfx/Tsa_GorgonHatchCloud_G.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_GorgonHatchCloud_G.png |
| `graphics/misc_gfx/Tsa_MapAnimUnlockBgfx.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_MapAnimUnlockBgfx.png |
| `graphics/misc_gfx/Tsa_MapAnim_0.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_MapAnim_0.png |
| `graphics/misc_gfx/Tsa_MapAnim_1.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_MapAnim_1.png |
| `graphics/misc_gfx/Tsa_MapBattleBoxGfx1.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_MapBattleBoxGfx1.png |
| `graphics/misc_gfx/Tsa_MapBattleBoxGfx2.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_MapBattleBoxGfx2.png |
| `graphics/misc_gfx/Tsa_MapBattleBoxGfx3.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_MapBattleBoxGfx3.png |
| `graphics/misc_gfx/Tsa_Mapnightmare.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_Mapnightmare.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx1.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx1.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx10.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx10.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx11.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx11.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx12.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx12.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx13.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx13.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx14.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx14.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx15.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx15.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx16.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx16.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx17.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx17.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx18.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx18.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx19.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx19.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx2.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx2.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx20.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx20.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx21.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx21.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx22.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx22.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx23.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx23.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx24.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx24.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx25.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx25.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx26.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx26.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx27.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx27.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx28.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx28.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx29.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx29.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx3.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx3.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx30.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx30.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx31.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx31.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx32.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx32.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx33.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx33.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx4.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx4.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx5.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx5.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx6.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx6.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx7.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx7.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx8.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx8.png |
| `graphics/misc_gfx/Tsa_NightMareMapAnimfx9.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_NightMareMapAnimfx9.png |
| `graphics/misc_gfx/Tsa_OpAnimEirika.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Tsa_OpAnimEirikaBlur1.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Tsa_OpAnimEirikaBlur2.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Tsa_OpAnimEirikaBlur3.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Tsa_OpAnimEphraim.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Tsa_OpAnimEphraimBlur1.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Tsa_OpAnimGenericCharacterBG.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Tsa_OpAnimWorldMap.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Tsa_OpAnimWorldMapFog.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/Tsa_ShopWindows.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_ShopWindows.png |
| `graphics/misc_gfx/gGfx_TitleDemonKing.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/gGfx_TitleDragonForeground.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/gGfx_TitleLargeGlowingOrb.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/gGfx_TitleMainBackground_1.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/gGfx_TitleMainBackground_2.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/gGfx_TitleSmallLightBubbles.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/gGfx_Titlescreen_0.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/gGfx_Titlescreen_1.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/gGfx_Titlescreen_2.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/gImg_UiCursorHandBottom.bin` | pixel-gfx | fe8u graphics/misc/gImg_UiCursorHandBottom.png |
| `graphics/misc_gfx/gImg_UiCursorHandTop.bin` | pixel-gfx | fe8u graphics/misc/gImg_UiCursorHandTop.png |
| `graphics/misc_gfx/gTsa_TitleDemonKing.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/gTsa_TitleDragonForeground.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/gTsa_TitleMainBackground.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/gTsa_Titlescreen_0.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/gTsa_Titlescreen_1.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx/gTsa_Titlescreen_2.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_99E1A4.bin` | pixel-gfx | fe8u graphics/misc/Img_99E1A4.png |
| `graphics/misc_gfx2/Img_99ED44.bin` | pixel-gfx | fe8u graphics/misc/Img_99ED44.png |
| `graphics/misc_gfx2/Img_99F7D4.bin` | pixel-gfx | fe8u graphics/misc/Img_99F7D4.png |
| `graphics/misc_gfx2/Img_9A0154.bin` | pixel-gfx | fe8u graphics/misc/Img_9A0154.png |
| `graphics/misc_gfx2/Img_9A0864.bin` | pixel-gfx | fe8u graphics/misc/Img_9A0864.png |
| `graphics/misc_gfx2/Img_ArrowTrap.bin` | pixel-gfx | fe8u graphics/misc/Img_ArrowTrap.png |
| `graphics/misc_gfx2/Img_ChapterIntroFog.bin` | pixel-gfx | fe8u graphics/misc/Img_ChapterIntroFog.png |
| `graphics/misc_gfx2/Img_CharacterEndingMenu.bin` | pixel-gfx | fe8u graphics/misc/Img_CharacterEndingMenu.png |
| `graphics/misc_gfx2/Img_CommGameBgScreen.bin` | pixel-gfx | fe8u graphics/misc/Img_CommGameBgScreen.png |
| `graphics/misc_gfx2/Img_Congratulations.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_ConstDataDB034_0.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_ConstDataDB034_1.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_ConstDataDB034_2.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_ConstDataDB034_3.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_ConstDataDB034_4.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_EventGmap.bin` | pixel-gfx | fe8u graphics/misc/Img_EventGmap.png |
| `graphics/misc_gfx2/Img_FinScreen.bin` | pixel-gfx | fe8u graphics/misc/Img_FinScreen.png |
| `graphics/misc_gfx2/Img_FireTrap.bin` | pixel-gfx | fe8u graphics/misc/Img_FireTrap.png |
| `graphics/misc_gfx2/Img_GameOverText.bin` | pixel-gfx | fe8u graphics/misc/Img_GameOverText.png |
| `graphics/misc_gfx2/Img_GasTrapHorizontal.bin` | pixel-gfx | fe8u graphics/misc/Img_GasTrapHorizontal.png |
| `graphics/misc_gfx2/Img_GasTrapVertical.bin` | pixel-gfx | fe8u graphics/misc/Img_GasTrapVertical.png |
| `graphics/misc_gfx2/Img_GmapCastleNodes.bin` | pixel-gfx | fe8u graphics/misc/Img_GmapCastleNodes.png |
| `graphics/misc_gfx2/Img_GmapNodes.bin` | pixel-gfx | fe8u graphics/misc/Img_GmapNodes.png |
| `graphics/misc_gfx2/Img_LightRune.bin` | pixel-gfx | fe8u graphics/misc/Img_LightRune.png |
| `graphics/misc_gfx2/Img_LinkArenaActiveBannerFx.bin` | pixel-gfx | fe8u graphics/misc/Img_LinkArenaActiveBannerFx.png |
| `graphics/misc_gfx2/Img_LinkArenaPlayerBanners.bin` | pixel-gfx | fe8u graphics/misc/Img_LinkArenaPlayerBanners.png |
| `graphics/misc_gfx2/Img_LinkArenaPostBattleBg.bin` | pixel-gfx | fe8u graphics/misc/Img_LinkArenaPostBattleBg.png |
| `graphics/misc_gfx2/Img_LinkArenaRankIcons.bin` | pixel-gfx | fe8u graphics/misc/Img_LinkArenaRankIcons.png |
| `graphics/misc_gfx2/Img_LinkArena_FogUnitPlaceholder.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_MainMenuBgFog.bin` | pixel-gfx | fe8u graphics/misc/Img_MainMenuBgFog.png |
| `graphics/misc_gfx2/Img_ManimLevelUpStatGain.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_ManimLevelUpStatGainDigits.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_ManimLevelUpText.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_MapClear.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_PikeTrap.bin` | pixel-gfx | fe8u graphics/misc/Img_PikeTrap.png |
| `graphics/misc_gfx2/Img_PlayerRankFog.bin` | pixel-gfx | fe8u graphics/misc/Img_PlayerRankFog.png |
| `graphics/misc_gfx2/Img_SaveMenuBG.bin` | pixel-gfx | fe8u graphics/misc/Img_SaveMenuBG.png |
| `graphics/misc_gfx2/Img_StaffReelEnt_0.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_StaffReelEnt_1.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_StaffReelEnt_2.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_StaffReelEnt_3.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_StaffReelEnt_4.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_StaffReelEnt_5.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_StaffReelEnt_6.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_StaffReelEnt_8.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_StaffReelEnt_9.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_TriGenerialAxeAtkOBJ.bin` | pixel-gfx | fe8u graphics/efxbattle/Img_TriGenerialAxeAtkOBJ.png |
| `graphics/misc_gfx2/Img_TriGenerialAxeOBJ.bin` | pixel-gfx | fe8u graphics/efxbattle/Img_TriGenerialAxeOBJ.png |
| `graphics/misc_gfx2/Img_TriGenerialHandAxeAtkOBJ.bin` | pixel-gfx | fe8u graphics/efxbattle/Img_TriGenerialHandAxeAtkOBJ.png |
| `graphics/misc_gfx2/Img_TriGenerialHandAxeOBJ.bin` | pixel-gfx | fe8u graphics/efxbattle/Img_TriGenerialHandAxeOBJ.png |
| `graphics/misc_gfx2/Img_TriGenerialLanceAtkOBJ.bin` | pixel-gfx | fe8u graphics/efxbattle/Img_TriGenerialLanceAtkOBJ.png |
| `graphics/misc_gfx2/Img_TriGenerialLanceOBJ.bin` | pixel-gfx | fe8u graphics/efxbattle/Img_TriGenerialLanceOBJ.png |
| `graphics/misc_gfx2/Img_TriKnightAtkOBJ.bin` | pixel-gfx | fe8u graphics/efxbattle/Img_TriKnightAtkOBJ.png |
| `graphics/misc_gfx2/Img_TriKnightOBJ.bin` | pixel-gfx | fe8u graphics/efxbattle/Img_TriKnightOBJ.png |
| `graphics/misc_gfx2/Img_UnkData_0.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_UnkData_2.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/Img_WorldMapPlaceDot.bin` | pixel-gfx | fe8u graphics/misc/Img_WorldMapPlaceDot.png |
| `graphics/misc_gfx2/Tsa_CharacterEnding_BottomBorder.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_CharacterEnding_BottomBorder.png |
| `graphics/misc_gfx2/Tsa_CharacterEnding_TopBorder.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_CharacterEnding_TopBorder.png |
| `graphics/misc_gfx2/Tsa_EndingFin.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_EndingFin.png |
| `graphics/misc_gfx2/Tsa_EventGmap.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_EventGmap.png |
| `graphics/misc_gfx2/Tsa_GameOverFx.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_GameOverFx.png |
| `graphics/misc_gfx2/Tsa_LightRune.bin` | pixel-gfx | fe8u graphics/misc/Tsa_LightRune.png |
| `graphics/misc_gfx2/Tsa_LinkArenaPostBattleBg.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_LinkArenaPostBattleBg.png |
| `graphics/misc_gfx2/Tsa_SaveMenuBG.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_SaveMenuBG.png |
| `graphics/misc_gfx2/Tsa_SioResultRankings.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_SioResultRankings.png |
| `graphics/misc_gfx2/Tsa_StaffReelEnt_0.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_StaffReelEnt_0.png |
| `graphics/misc_gfx2/Tsa_StaffReelEnt_1.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_StaffReelEnt_1.png |
| `graphics/misc_gfx2/Tsa_StaffReelEnt_2.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_StaffReelEnt_2.png |
| `graphics/misc_gfx2/Tsa_StaffReelEnt_3.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_StaffReelEnt_3.png |
| `graphics/misc_gfx2/Tsa_StaffReelEnt_4.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_StaffReelEnt_4.png |
| `graphics/misc_gfx2/Tsa_StaffReelEnt_5.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_StaffReelEnt_5.png |
| `graphics/misc_gfx2/Tsa_StaffReelEnt_8.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_StaffReelEnt_8.png |
| `graphics/misc_gfx2/Tsa_StaffReelEnt_9.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_StaffReelEnt_9.png |
| `graphics/misc_gfx2/Tsa_UnkData_0.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_UnkData_0.png |
| `graphics/misc_gfx2/Tsa_UnkData_5.bin` | pixel-gfx | fe8u preview/tsa/misc/Tsa_UnkData_5.png |
| `graphics/misc_gfx2/gGfx_BrownTextBox.bin` | pixel-gfx | fe8u graphics/misc/gGfx_BrownTextBox.png |
| `graphics/misc_gfx2/gGfx_GMapPI_LevelNums.bin` | pixel-gfx | fe8u graphics/misc/gGfx_GMapPI_LevelNums.png |
| `graphics/misc_gfx2/gGfx_GMapPI_ShopIcons.bin` | pixel-gfx | fe8u graphics/misc/gGfx_GMapPI_ShopIcons.png |
| `graphics/misc_gfx2/gGfx_OpSubtitle_02.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/gGfx_OpSubtitle_03.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/gGfx_OpSubtitle_04.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/gGfx_OpSubtitle_06.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/gGfx_UnkData_0.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/gImg_WorldmapMinimap_0.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/gTsa_OpSubtitle_00.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/gTsa_OpSubtitle_01.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/gTsa_OpSubtitle_04.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx2/gTsa_SupportSubScreen.bin` | pixel-gfx | fe8u preview/tsa/misc/gTsa_SupportSubScreen.png |
| `graphics/misc_gfx2/gTsa_WorldmapMinimap_0.bin` | pixel-gfx | fe8u preview/tsa/misc/gTsa_WorldmapMinimap_0.png |
| `graphics/misc_gfx3/Img_IntelligentSystems.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx3/Img_ManimSilenceBgfx.bin` | pixel-gfx | fe8u graphics/misc/Img_ManimSilenceBgfx.png |
| `graphics/misc_gfx3/Img_ManimSilenceObjfx.bin` | pixel-gfx | fe8u graphics/misc/Img_ManimSilenceObjfx.png |
| `graphics/misc_gfx3/Img_TriPegasusKnightBG.bin` | pixel-gfx | fe8u graphics/efxbattle/Img_TriPegasusKnightBG.png |
| `graphics/misc_gfx3/Img_WmHightLightMap2.bin` | pixel-gfx | fe8u graphics/misc/Img_WmHightLightMap2.png |
| `graphics/misc_gfx3/Img_WmHightLightMap4.bin` | pixel-gfx | fe8u graphics/misc/Img_WmHightLightMap4.png |
| `graphics/misc_gfx3/Img_WmHightLightMap5.bin` | pixel-gfx | fe8u graphics/misc/Img_WmHightLightMap5.png |
| `graphics/misc_gfx3/Img_WmHightLightMap7.bin` | pixel-gfx | fe8u graphics/misc/Img_WmHightLightMap7.png |
| `graphics/misc_gfx3/Img_WmHightLightMapFrecia.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx3/Tsa_IntelligentSystems.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx3/gGfx_OpSubtitle_00.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx3/gGfx_OpSubtitle_01.bin` | pixel-gfx | fe8u graphics/misc/*.png |
| `graphics/misc_gfx3/gImg_StoneShatterAnim.bin` | pixel-gfx | fe8u graphics/misc/gImg_StoneShatterAnim.png |

</details>

## FLOOR (1071) — fe8u also keeps these binary — legitimate; do NOT fake-extract.

<details><summary>1071 entries</summary>

| `.bin` (fe8j) | category | fe8u-source proof |
|---|---|---|
| `data/banim/Tsa_DemonLightBg_Close_1.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_10.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_11.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_12.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_13.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_14.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_15.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_16.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_17.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_18.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_19.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_2.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_20.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_21.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_22.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_23.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_24.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_25.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_26.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_27.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_28.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_29.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_3.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_30.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_31.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_32.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_4.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_5.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_6.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_7.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_8.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Close_9.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_1.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_10.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_11.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_12.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_13.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_14.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_15.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_16.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_17.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_18.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_19.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_2.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_20.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_21.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_22.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_23.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_24.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_25.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_26.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_27.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_28.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_29.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_3.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_30.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_31.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_32.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_4.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_5.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_6.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_7.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_8.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_DemonLightBg_Far_9.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_EfxSkill1.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_EfxSkill10.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_EfxSkill2.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_EfxSkill3.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_EfxSkill4.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_EfxSkill5.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_EfxSkill6.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_EfxSkill7.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_EfxSkill8.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_EfxSkill9.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_EfxSkillA.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_EfxSkillB.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_EfxSkillC.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_EfxSkillD.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_EfxSkillE.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/banim/Tsa_EfxSkillF.bin` | TSA/.map.bin | fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin) |
| `data/residual/gMenuSoundroom_0.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/gMenuSoundroom_0.tsa.bin |
| `data/residual/gTsa_OpSubtitle_03.bin` | TSA/.map.bin | fe8u keeps TSA tilemaps binary (*.tsa.bin / *.map.bin) |
| `data/residual/gTsa_OpSubtitle_05.bin` | TSA/.map.bin | fe8u keeps TSA tilemaps binary (*.tsa.bin / *.map.bin) |
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
| `graphics/banim/_us/banim/dragonfx/Tsa_87932EC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_8793384.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_8793494.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87935B0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87936C0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87937D0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87938EC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_8799818.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_8799ABC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_8799D64.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_879A008.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_879A2A8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_879A444.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_879A6A0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_879A87C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_879A9E8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_879AB10.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A18F0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A19EC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A1B68.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A1D74.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A1F9C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A2134.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A2384.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A2584.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A2748.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A28A8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A29DC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A2AE8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A2BE4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A2CCC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A2DB8.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A4A88.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A4B68.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A4C44.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A4D2C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_87A4E0C.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Close_0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Close_1.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Close_2.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Close_3.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Close_4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Far_0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Far_1.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Far_2.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Far_3.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Far_4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Close_0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Close_1.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Close_2.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Close_3.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Close_4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Close_5.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Close_6.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Close_7.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Far_0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Far_1.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Far_2.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Far_3.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Far_4.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Far_5.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Far_6.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg4_Far_7.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg_0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg_1.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg_2.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/dragonfx/Tsa_87932EC.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
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
| `graphics/banim/misc/Tsa_EkrExpBar.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/misc/Tsa_EkrPopup.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/misc/gBanimmisc_0.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/misc/gBanimmisc_1.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/misc/gBanimmisc_2.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/banim/misc/gBanimmisc_5.map.bin` | TSA/.map.bin | fe8u keeps .map.bin binary (TSA/tilemap) |
| `graphics/battle_forecast/gTSA_BattleForecastExtended.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/battle_forecast/gTSA_BattleForecastStandard.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
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
| `graphics/fontgrp/gFontgrp_10.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/fontgrp/gFontgrp_11.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/fontgrp/gFontgrp_12.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/fontgrp/gFontgrp_13.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/fontgrp/gFontgrp_14.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/fontgrp/gFontgrp_15.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/fontgrp/gFontgrp_3.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/fontgrp/gFontgrp_4.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/fontgrp/gFontgrp_5.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/fontgrp/gFontgrp_6.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/fontgrp/gFontgrp_7.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/fontgrp/gFontgrp_8.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/fontgrp/gFontgrp_9.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/gmapunit/Tsa_UnkData_2.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/misc/Tsa_UnkData_2.tsa.bin |
| `graphics/mapanim/Tsa_Mapeventcall_0.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/Tsa_Mapeventcall_1.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/Tsa_Mapeventcall_10.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/Tsa_Mapeventcall_11.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/Tsa_Mapeventcall_12.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/Tsa_Mapeventcall_13.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/Tsa_Mapeventcall_14.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/Tsa_Mapeventcall_15.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/Tsa_Mapeventcall_16.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/Tsa_Mapeventcall_17.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/Tsa_Mapeventcall_2.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/Tsa_Mapeventcall_3.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/Tsa_Mapeventcall_4.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/Tsa_Mapeventcall_5.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/Tsa_Mapeventcall_6.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/Tsa_Mapeventcall_7.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/Tsa_Mapeventcall_8.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/mapanim/Tsa_Mapeventcall_9.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
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
| `graphics/mapanim/gTsa_ArenaBuildingFront.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
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
| `graphics/misc_gfx2/Tsa_EkrTriPegagusLeftBG1.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/ui/Tsa_EkrTriPegagusLeftBG1.map.bin |
| `graphics/misc_gfx2/Tsa_EkrTriPegagusLeftBG2.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/ui/Tsa_EkrTriPegagusLeftBG2.map.bin |
| `graphics/misc_gfx2/Tsa_EkrTriPegagusLeftBG3.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/ui/Tsa_EkrTriPegagusLeftBG3.map.bin |
| `graphics/misc_gfx2/Tsa_EkrTriPegagusRightBG1.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/ui/Tsa_EkrTriPegagusRightBG1.map.bin |
| `graphics/misc_gfx2/Tsa_EkrTriPegagusRightBG2.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/ui/Tsa_EkrTriPegagusRightBG2.map.bin |
| `graphics/misc_gfx2/Tsa_EkrTriPegagusRightBG3.bin` | TSA/.map.bin | fe8u also keeps binary: graphics/ui/Tsa_EkrTriPegagusRightBG3.map.bin |
| `graphics/misc_gfx2/gTSA_GoalBox_OneLine.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc_gfx2/gTSA_GoalBox_TwoLines.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc_gfx2/gTSA_MinimugBox.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc_gfx2/gTSA_TerrainBox.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc_gfx2/gTSA_UnitInfoWindow.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/misc_gfx2/gTsa_UnkData_0.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
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
| `graphics/player_interface/gTSA_UnitInfoWindow.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/stone_shatter/gTsa_StoneShatter_0.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/stone_shatter/gTsa_StoneShatter_1.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/stone_shatter/gTsa_StoneShatter_10.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/stone_shatter/gTsa_StoneShatter_11.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/stone_shatter/gTsa_StoneShatter_12.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/stone_shatter/gTsa_StoneShatter_13.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/stone_shatter/gTsa_StoneShatter_2.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/stone_shatter/gTsa_StoneShatter_3.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/stone_shatter/gTsa_StoneShatter_4.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/stone_shatter/gTsa_StoneShatter_5.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/stone_shatter/gTsa_StoneShatter_6.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/stone_shatter/gTsa_StoneShatter_7.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/stone_shatter/gTsa_StoneShatter_8.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |
| `graphics/stone_shatter/gTsa_StoneShatter_9.tsa.bin` | TSA/.map.bin | fe8u keeps .tsa.bin binary (TSA/tilemap) |

</details>

## UNCERTAIN (579) — fe8u form unknown — DEFERRED, needs RE; document, don't fake.

<details><summary>579 entries</summary>

| `.bin` (fe8j) | category | fe8u-source proof |
|---|---|---|
| `data/residual/AP_DrawPreparationsBanner.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/ApConf_ManimSilencefx_anim_0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_ManimSilencefx_anim_list.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_ManimSilencefx_frame_0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_ManimSilencefx_frame_1.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_ManimSilencefx_frame_10.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_ManimSilencefx_frame_11.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_ManimSilencefx_frame_12.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_ManimSilencefx_frame_13.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_ManimSilencefx_frame_2.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_ManimSilencefx_frame_3.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_ManimSilencefx_frame_4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_ManimSilencefx_frame_5.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_ManimSilencefx_frame_6.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_ManimSilencefx_frame_7.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_ManimSilencefx_frame_8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_ManimSilencefx_frame_9.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_ManimSilencefx_frame_list.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_ManimSilencefx_motion.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimBerserkfx_anim_0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimBerserkfx_anim_list.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimBerserkfx_frame_0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimBerserkfx_frame_1.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimBerserkfx_frame_2.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimBerserkfx_frame_3.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimBerserkfx_frame_4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimBerserkfx_frame_5.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimBerserkfx_frame_list.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimBerserkfx_motion.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimTorchfx_anim_0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimTorchfx_anim_list.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimTorchfx_frame_0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimTorchfx_frame_1.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimTorchfx_frame_2.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimTorchfx_frame_3.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimTorchfx_frame_list.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapAnimTorchfx_motion.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApConf_MapanimTorchAnim_0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApHandle_GmapSoguSprites_anim_0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApHandle_GmapSoguSprites_anim_list.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApHandle_GmapSoguSprites_frame_0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApHandle_GmapSoguSprites_frame_1.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApHandle_GmapSoguSprites_frame_2.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApHandle_GmapSoguSprites_frame_3.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApHandle_GmapSoguSprites_frame_4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApHandle_GmapSoguSprites_frame_list.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/ApHandle_GmapSoguSprites_motion.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/Ap_WmHightLightMap2_anim_0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/Ap_WmHightLightMap2_anim_1.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/Ap_WmHightLightMap2_anim_list.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/Ap_WmHightLightMap2_frame_0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/Ap_WmHightLightMap2_frame_1.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/Ap_WmHightLightMap2_frame_list.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/Ap_WmHightLightMap2_motion.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/Ap_WmHightLightMap3.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/Ap_WmHightLightMap6.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/Ap_WmHightLightMapFrecia_anim_0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/Ap_WmHightLightMapFrecia_anim_1.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/Ap_WmHightLightMapFrecia_anim_list.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/Ap_WmHightLightMapFrecia_frame_0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/Ap_WmHightLightMapFrecia_frame_1.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/Ap_WmHightLightMapFrecia_frame_list.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/Ap_WmHightLightMapFrecia_motion.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
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
| `data/residual/Sprite_0.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
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
| `data/residual/data_081B3734.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081B4084.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081B4C6C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081B583C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081B62E4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081B6DE0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081B782C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081B8438.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081B8E14.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081B9ADC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081BA3D8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081BAC98.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081BB74C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081BC22C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081BCB74.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081BD510.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081BDEB4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081BE898.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081BF1A0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081BFB18.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081C0434.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081C5810.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081C6724.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081C7680.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081C8020.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081C8A44.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081C9510.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081CA04C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081CAAB0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081CB584.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081CBF48.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081CC8FC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081CD240.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081CDC7C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081CE5F0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081CEF00.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081CF484.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081CFF44.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081D07F8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081D10F4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081D1A40.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081D28EC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081D33A4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081D3CF8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081D485C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081D51E4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081D5C6C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081D67AC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081D6FF0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081D7910.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081D90A8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081D9F94.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081DA858.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081DB354.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081DBEB4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081DD57C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081DDF10.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081DE63C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081E287C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081E314C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081E3958.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081E4370.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081E4E20.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081E5A34.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081E6488.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081E6F28.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081E77E0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081E8124.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081E8A58.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081E8FAC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081E9C6C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081EA8F8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081EB814.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081EE82C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081EEE80.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081EF574.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081EFD00.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F04B4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F0CF0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F153C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F1F10.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F25BC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F2D20.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F3358.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F3844.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F3D80.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F42F8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F4A20.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F5BF4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F64C0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F65C0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F66A4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_081F6D00.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08214004.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
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
| `data/residual/data_085CBE64.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085CBFA4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085D30F8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085E3724.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085F14DC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085F1568.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085F3338.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085FC068.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085FC638.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085FDDAC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085FE358.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085FE490.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085FEC28.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_085FEDD8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08604A8C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08604E24.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086068D0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08606B24.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08606D84.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08606FE4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08607184.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08607220.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08607B7C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0860D254.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0860DEB4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0860E028.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0860E1CC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0860E394.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0860E538.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0860E820.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0860EA7C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0860F5FC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086101B4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08610D90.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086114F8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08612134.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08613A6C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08616558.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0861CCC0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0861E2E8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0861E38C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0861E430.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0861E4D4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0861E578.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0861E61C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
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
| `data/residual/data_086215FC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08622128.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08624C8C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08625014.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08630AD8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086314EC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08631BAC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0863230C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086329CC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08636008.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08636294.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086371AC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08645FC4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0864738C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08647830.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0864CAC8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08659FFC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0865A268.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0865A404.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0865A694.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086724CC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086730D0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0867B54C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0867E3B4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_0867E6BC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_086834CC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08689354.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
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
| `data/residual/data_086B9E8C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
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
| `data/residual/data_087A8668.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_087A89EC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
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
| `data/residual/data_08B1E998.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08B25710.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08B3E1C8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08B3E688.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08B3E86C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08B65D08.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08B6BD34.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08B6EE04.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08B7229C.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08B755D4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08BAB2DC.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08BB8ED0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08C01928.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08EE0AD0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08EF86C8.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/data_08FFF000.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/g085A0EA0_anim_0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/g085A0EA0_anim_1.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/g085A0EA0_anim_list.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/g085A0EA0_frame_0.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/g085A0EA0_frame_1.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/g085A0EA0_frame_2.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/g085A0EA0_frame_3.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/g085A0EA0_frame_4.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/g085A0EA0_frame_5.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/g085A0EA0_frame_6.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
| `data/residual/g085A0EA0_frame_list.bin` | ApConf/opaque | fe8u form unknown — needs RE (DEFERRED; do not fake-extract) |
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
| `data/residual/gMenuStatus_0.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gPromoJidLut.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gSoloEndingBattleDispConf.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gSomeSMSLookupTable_0.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gStealItemMenuItems.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gTacticianTextConf.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/residual/gTalkFaceHPosLut.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
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
| `data/sound/ld_r3_tp_adr_i.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/sound/m4aMPlayFadeIn.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/sound/m4aMPlayFadeOutTemporarily.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/sound/m4aMPlayImmInit.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/sound/m4aMPlayLFOSpeedSet.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/sound/m4aMPlayModDepthSet.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/sound/m4aMPlayStop.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/sound/m4aMPlayTempoControl.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/sound/m4aSoundMode.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/sound/m4aSoundVSync.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/sound/m4aSoundVSyncOff.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/sound/m4aSoundVSyncOn.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `data/sound/umul3232H32.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `graphics/data/data_08576124_576150.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |
| `graphics/data_085772B4/data_085772B4_577378.bin` | ApConf/opaque | no fe8u basename/type match — needs RE |

</details>

---

_Regenerate: `python3 scripts/audit_bin_forms.py`. Oracle: `../../../../fireemblem8u`._
