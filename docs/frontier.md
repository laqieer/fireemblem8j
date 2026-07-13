# FE8J decomp frontier (living doc — update every session)

> **This is the SINGLE SOURCE OF TRUTH for what remains.** All other docs (README,
> CLAUDE.md, strategy/porting/etc.) point here for "the frontier / what's left" and
> must not fork it. Do **not** read `layout/nofuncmap_*.tsv` as the work list — it is
> a stale, grossly ~240× inflated classification cache (see "Pitfall" below).

**Keep this current.** Refresh the numbers from `scripts/calcprogress.py` and the target lists from
ground truth whenever an axis moves. Stale frontier data caused real wasted work (see "Pitfall" below).

## Strict-goal distance — EMPIRICAL reducible/irreducible split of MISS (2026-06-30, D323)

Goal: *"no `.bin` kept unless it is also `.bin` in fe8u"* ≈ audit **MISS → 0**. Post-wave-8 the
corrected classifier reports **MISS 318**. A per-file `tools/gbagfx/gbagfx` `-mindist 1..12`
round-trip + header probe splits those 318 into:

- **58 IRREDUCIBLE — JP-LZ floor (HARD BLOCKER).** byte0=0x10 GBA-LZ77 blobs (battle-anim 47,
  pixel-gfx 8 incl. chap_title, menu-strings 3) where fe8u commits the same sheet as `.png`, but
  **0 of 58 reproduce the JP bytes at ANY `-mindist`** — the JP ROM used a different (less-optimal)
  LZ match-finder than gbagfx's greedy longest-match (e.g. aurabg3_004: JP 5064 B; gbagfx md4=5052,
  md5=5076 — JP size is unreachable). **Reaching MISS=0 for these REQUIRES a bit-exact JP LZ
  recompressor** (reverse-engineer IS/SDK match heuristic) — a separate RE project, not a carve.
- **260 REDUCIBLE via structural carving** (raw, non-LZ): MapChanges 29 (→ typed-C via
  `gen_data_map_change.py` + JP tile fixups), `frontier_df3_unitdef_b` REDA-residue tails 52
  (→ named `struct REDA[]` cascade), battle-anim raw OAM/anim/frame/pointer tables 146 (→ `.s`
  ANIM_SPRITE / typed-C), pixel-gfx 9, menu-strings 19, voicegroup 4 (RE-ceiling), sound 1. These
  are deep but tractable byte-exact carves — multi-wave (the orchestrator's deferred wave-9+).

**So MISS=0 (strict goal) is blocked on BOTH** (a) ~260 deep carves AND (b) a JP-LZ recompressor for
the 58. **Wave 9 (LANDED, −33 `.bin`: 1919 → 1886, MISS 318 → 285):** (1) the "MapChanges" lane was
a misattribution — 28 `data/residual/Ch*MapChanges.bin`/`TileAnimations*.bin` are chapter EVENT DATA
already de-pointered into shiftable `src/data/*_ref/dat_*_ref.c` (`.4byte` symbol refs); the `.bin`
were orphans referenced only by excluded asm stubs → deleted (byte-neutral). (2) `frontier_df3_unitdef_b`
REDA cascade: 31 REDA runs carved into named `struct REDA[]`, 5 `.bin` eliminated; 2 region-different
+ ~38 UnitDefinition-table residues remain (need the recursive unit-table-typing chain — deferred).
**Wave 10 (LANDED, −10 `.bin`: 1886 → 1876, MISS 285 → 275):** 10 raw `frontier_df4_banim_b` OAM tables
→ typed `struct AnimSpriteData[]` (pointer-free, byte-exact). The remaining ~52 raw banim there are
pointer-coupled (need an atomic whole-object relocation — in progress); 29 are JP-LZ floor.
**Wave 11 (LANDED, −9 `.bin`: 1876 → 1867):** atomic whole-object relocation of `frontier_df4_banim_b`
— 588 embedded pointers across 11 coherent OAM/frame-pointer tables expressed as relocatable
`.4byte Sym` refs (all resolving to real named globals, 0 invented symbols), 9 `.bin` deleted. The
object is now relocation-complete for its coherent tables; the residual ~30 are scattered/high-entropy
(gate-ignored) or mixed proc-script/OAM (not fake-carved). Other banim dirs (aurabg3/dracozombie/…)
remain as independent per-object carve lanes.
**Wave 12 (shiftability, −0 `.bin`):** `frontier_banim_aurabg3` relocation-completeness (43 relocs).
KEY FINDING — the banim dirs are HETEROGENEOUS: aurabg3 is graphics/OAM-dominated with **0
gate-coherent tables**, so its `.bin` need a *typed-data OAM* carve (not the pointer-relocation lane).
**Session net (waves 9–12): `.bin` 1919 → 1867 (−52), MISS 318 → 266.**

**JP-LZ blocker DISSOLVED (D325 — corrects the wrong D324 claim):** the 58 byte0=0x10 residual
`.bin` are NOT irreducible — they are **concatenated LZ tile-sheets** (gbagfx reproduces each sheet
byte-exact at `-mindist 1/2`; the earlier "0/58 reproduce" was a flawed full-file cmp — a PREFIX
compare matches, the size gap is over-captured trailing/next-sheet bytes). **No JP LZ recompressor is
needed.** They reduce to `.png` via the standard `png→4bpp→lz` pipeline. **Wave 13 Phase 1 (LANDED,
−6 `.bin`: 1867→1861, MISS 266→260):** `frontier_df4_banim_b_049` (template) + 5 CLEAN_TILES fully
eliminated → PNG. **Remaining strict-goal work (now fully unblocked):** ~50 more JP-LZ blobs (whole-tile
sheets → PNG; non-tile 1200-byte LZ OAM sheets → `.bin.lz` pattern; +trailing) — a split file fully
reduces only when BOTH its image PNG and its OAM tail are carved (else atomic decomposition raises the
path-based MISS count); plus the ~146 raw banim OAM tables, unitdef recursive tables, etc. A
multi-wave carve grind, but NO research-project blocker. Strict goal NOT yet reached; `make compare`
OK + `make shiftcheck` 0 HIGH held on every banked lane. **Wave 14 (LANDED, −20 `.bin`: 1861→1841, MISS 260→240):** 20 raw banim OAM/AnimSprite tables → typed-C `struct AnimSpriteData[]` + `.4byte Sym` (df4_banim_a×10, df3_banim_aura×5, df3_banim_mid×4, dracozombie×1); fixed a Thumb-fn ABS32 off-by-one in `resolve_nm.py` (STT_FUNC pointees non-referenceable). **Wave 16 (audit correction, D326):** 48 banim/bg 30x20 u16 **screen tilemaps** (dracozombie 24, aurabg3 22, df4_banim_b 2) reclassified MISS→FLOOR — fe8u keeps banim/bg tilemaps binary (`assets/tsa/*.map.bin`), so they are fe8u-FORM-parity and satisfy the strict goal as-is. **MISS 240 → 192.** (irreducible-as-editable; MISS=0 requires flooring them, not reducing.) **Wave 15 (LANDED, −5 `.bin`):** 5 more `frontier_df4_banim_b` pointer-table residuals → `.4byte Sym` relocation. **Session cumulative: MISS 318 → 187, `.bin` 1981 → 1836.** Remaining reducible: banim OAM residuals (mostly floor now — tilemaps + 2-aligned small tables), unitdef tables (47), efx name/config pools (misc_lo), pixel-gfx, + 14 frontier menu/ending/UI pointer residuals (next lane). No research blocker. **Wave 18 (LANDED, −6 `.bin`, UNCERTAIN 473→467):** 6 frontier menu/UI pointer-table residuals → `.4byte Sym` relocation (58–100% resolved to named globals). KEY: these were audit-UNCERTAIN (JP-divergent UI), so the strict goal is really **MISS + carveable-UNCERTAIN → 0** (FLOOR=fe8u-parity; the JP-only-opaque UNCERTAIN with unnameable mid-code pointers are de-facto floor). `.bin` 1836→1830. **Wave 19 (LANDED, −9 `.bin`, MISS 187→178):** 9 `frontier_df4_misc_lo` efx name/config pools → editable `.asciz` (~360 effect names) + typed `.byte`/`.4byte` (misc_lo _004-012). `_003` skipped (SJIS glyph char-code table = floor). **Session: MISS 318→178, `.bin` 1981→1821.** **Wave 17 (LANDED, −46 `.bin`, MISS 178→132):** ALL 46 `frontier_df3_unitdef_b` REDA/UnitDefinition residue tails carved to typed `struct REDA[]`/`UnitDefinition[]` (0 residues remain; the entire unitdef_b lane is cleared, incl. 9 external `base+offset` refs rewritten to name sub-arrays for shiftcheck). **Session cumulative: MISS 318→132, `.bin` 1981→1775.** **Wave 20 (LANDED, −40 `.bin`, MISS 132→92):** 40 raw battle-anim AnimSpriteData/anim tables (aurabg3 27 + df4_banim_b 13, 274 relocated pointers) → descriptive `.s` `.short`/`.4byte Sym`. **Session cumulative: MISS 318→92 (71% reduction), `.bin` 1981→1735.** Rule: only relocation-carve when 100% of pointers resolve to named globals (HIGH-neutral). **Wave 22 (LANDED, MISS 92→91):** `gEfxlvupfx_0.bin` (3492B) → typed `struct AnimSpriteData[291]`, region-same with fe8u `banim-efxlvupfx.c`. **Wave 21 (LANDED, −28 blobs, MISS 92→63):** 28 JP-LZ battle-anim blobs fully decomposed into per-sheet fe8u form — image sheets → `.png`+`.pal` (aurabg3/dracozombie/df4_banim_b tile+palette), tilemap sheets → `.map.bin`+build `.map.bin.lz` (FLOOR, fe8u-form parity). Frame-pointer coupling fix: repoint `<blob>+0xoff` → per-sheet symbol (addend 0) to stay HIGH-neutral. FLOOR +173. The remaining 19 JP-LZ blobs have raw non-LZ trailing (need hybrid decompose + typed-C-tail, a follow-up lane). **Session cumulative: MISS 318→63 (80% reduction), `.bin` 1981→1707.** **Wave 23 (LANDED, −12 `.bin`, MISS 63→51):** 12 raw battle-anim df4_banim_b tables carved — 8 relocatable `.4byte Sym`/command tables, _081 class-name pool → `.asciz`, _071 tail + _083 `.short` dumps, _069 orphan dropped; skipped _031 (opaque signed-16 LUT) + _085 (odd-aligned unrelocatable tails) as genuine floor. **Session cumulative: MISS 318→51 (84% reduction), `.bin` 1981→1695.** **Wave 24 (LANDED, −17 blobs, MISS 51→34):** ALL 17 MIXED JP-LZ battle-anim blobs fully eliminated via hybrid decompose — leading LZ image/tilemap sheets → `.png`/`.map.bin`(+`.lz`), raw non-LZ trailing → typed AnimSpriteData/`.short`/`.4byte Sym`. Coupling: external `<blob>+0xoff` frame refs repointed piece-aware (boundary→sheet sym addend 0; mid-trailing→trailing sym+addend). 0 HIGH by construction. FLOOR +31. **Session cumulative: MISS 318→34 (89% reduction), `.bin` 1981→~1670.** **Wave 25 (LANDED, −5, MISS 34→29):** 5 LZ pixel-gfx blobs carved — btl_bg_002 (2 img `.4bpp.lz` + tilemap), opanim_gfx_000/002/003 + df4_tail_001 (img sheets + whole-tile trailing → `.png` uncompressed `.4bpp` + sub-tile `.byte`); chap_title_115 skipped (odd 1202B sheet, no fe8u sink = floor). **Session cumulative: MISS 318→29 (91% reduction).** **Wave 27 (LANDED, MISS 29→28):** rom_header_080000C0 (360B) crt0 boot stub (fe8u src/crt0.s: stack setup + IrqMain dispatcher) carved from raw INCBIN → descriptive annotated .4byte ARM listing, byte-exact, kept in .data.residue. **Session cumulative: MISS 318→28 (91% reduction).** **Wave 26 (LANDED, −10, MISS 28→18):** 10 structured raw tables carved to descriptive `.short`/`.byte` (const_unit_ic 000/001, misc_lo 018/019/020, tail_000, df3_titlescreen_001, misc_lo_000a, gTitlescreen_0/1) keeping base symbol+section for external `&sym+off` refs. **Session cumulative: MISS 318→18 (94% reduction).** **Wave 29 (LANDED, MISS 18→17):** ObjectType9 (320B, region-diff chapter-asset slot 108) = u16 BGR555 color-palette bank → descriptive u16 array. **Session cumulative: MISS 318→17 (95% reduction).** **Wave 28 (LANDED, −6, MISS→11):** 6 misc_lo/font_cc tables carved — misc_lo_021 (5 slices, 28 gMid_*/Pal_PrepWindow relocations), misc_lo_000b/002b (.byte), misc_lo_003 (SJIS u16 → .short), font_cc_090 (.byte); misc_lo_002a was a stale ORPHAN (already produced by real typed C AiScript_Exec funcLut[]) → removed. **Session cumulative: MISS 318→11 (97% reduction).** Remaining 11 = genuine ceilings: voicegroup/voice ×4 (sound-sample-RE), LZ-no-sink ×3 (chap_title_115, misc_lo_015/016), region-diff/opaque ×3 (banim_b_031/_085, ch9events), + 1. Literal MISS=0 needs a dedicated JP sound-sample-naming lane. **Wave 30 (LANDED, MISS 11→10):** voicegroup_000 was misidentified — it is the m4a `gXcmdTable` dispatch table (12 ply_x* Thumb-fn pointers); carved to relocatable `.4byte ply_x*` (byte-exact via ld Thumb-bit OR, now shiftable). **Session cumulative: MISS 318→10 (96.9%).** **Wave 31 (LANDED, MISS 10→7):** the last 3 'sound-ceiling' pointer tables were ALSO extractable — voice_001 (202 ptrs → named worldmap/class-reel syms), voicegroup_001 (41 named DirectSoundData_horse* sample ptrs), voice_000 (records already relocated in typed C; residual slices → .byte/.4byte). Reusable finding: FE8J voice/voicegroup 'ceilings' are not floors — their targets are named. **Session cumulative: MISS 318→7 (97.8%).** Remaining MISS=63: ~31 banim (19 mixed JP-LZ + 12 misc), pixel-gfx 14 (mostly tiny region-diff fragments), menu-strings 11 (SJIS glyph/text ceiling), voicegroup 4 (sound-RE ceiling), rom_header crt0 1, ObjectType9 region-diff 1, +misc.

## Current state (2026-06-30) — asset-editability WAVE 8 landed + the 642-MISS heuristic split (D322)
> [Superseded — see CURRENT STATE 2026-07-03 below] Historical snapshot; the axis line here (matching-C 99.65% / extracted-data 79.91% / named 95.33%) is stale — the live six-axis figures are in the authoritative 2026-07-03 table near the end of this doc.

Wave 8 integrated through one clean `make compare` + `make shiftcheck` gate (byte-exact, sha1
`7da0456…`, **0 HIGH**): **tracked committed `.bin` 1981 → 1919 (−62).**

- **w8-typedc (−45):** 45 `data/residual/*.bin` INCBINs → typed-C inside their existing
  `src/data/**/*.c` (byte-neutral, no layout change): `PopupScr_*`(6, JP popup opcode enum in
  `include/popup.h` — drops US `ITEM_STR_CAP`/`ITEM_STR`, shifts opcodes ≥3 down 2 to match
  `ParsePopupInstAndGetLen.c`), `MuSoundScr_*`(7), `gBattleparse_0..9`(10), `gEfx*`(11),
  `gEkrgauge_*`(9), `gMapanimLevelup_0`, `EventListScr_Ch15b_Location`.
- **w8-pixelgfx (−14):** 6 pixel-gfx → `.png` + 8 palettes → `.agbpal` (PR #81, CI-green).
- **w8-strings (−3):** `frontier_df4_misc_lo` `internalName` pool → `.asciz` + 2 orphan
  `MenuItems_SioMenudef_*` removed (PR #82).

**The wave-7 "open next step" (split the 642-MISS heuristic) is now DONE.** Four read-only
verifiers (`docs/bin_verification_wave8.md`) split the heuristic MISS into **~190 truly reducible**
+ ~48 at-parity (`.bin.lz`-decompressed, gbagfx recompresses byte-exact) + ~330–400 genuine floor
(TSA ~185, JP-LZ ~58, voicegroup 4, JP-opaque/Link-Arena ~60). The four `scripts/audit_bin_forms.py`
classifier bugs that inflated MISS were fixed (D322): **bug #1** — fe8u `preview/**/*.png` are
non-build RENDER previews (not in its Makefile), so they were excluded from the editable index +
a TSA-by-name guard added (`Tsa_`/`gTsa_`/`*_map.bin`), reclassifying ~150 TSA tilemaps MISS→FLOOR
(their real fe8u source is the `*.tsa.bin` floor); **bug #2** — the loose `frontier_*` catch-all
was tightened so JP-divergent UI/font/ending/CG/data tables → UNCERTAIN, not menu-strings MISS
(real string pools are only `frontier_df4_misc_lo`); **bug #4** — `frontier_df3_unitdef_b` relabeled
to the unitdef DATA lane (REDA/typed-C), not "portrait gfx". The regenerated `docs/bin_audit.md`
now reads **MISS 318 / FLOOR 1128 / UNCERTAIN 473** (was the inflated 642). Residual MISS minus the
still-heuristic battle-anim over-count (~126 at-parity+floor, bug #3 — needs per-file gbagfx
round-trip) ≈ the verified **~190 reducible**. Axes (`scripts/calcprogress.py`): self-containment
**100%**, matching-C **99.65%**, extracted-data **79.91%**, named-symbols **95.33%**.

**Strict goal "no `.bin` unless it is `.bin` in fe8u" is NOT yet reached.** Remaining real work ≈
**190** (battle-anim residuals → `banim/*.s` ANIM_SPRITE + `.png`; `frontier_df3_unitdef_b` REDA
tails → named `struct REDA[]` + typed `UnitDefinition[]`) **+ the documented JP-LZ/JP-opaque/TSA
floor** (much of it fe8u-binary-parity). Deferred to wave 9.

## Current state (2026-06-30) — asset-editability waves 6-7 landed; strict goal NOT yet reached (D321)
> [Superseded — see CURRENT STATE 2026-07-03 below] Historical snapshot; the MISS/`.bin` figures here predate waves 8-49 — the live axis figures are in the authoritative 2026-07-03 six-axis table near the end of this doc.

The goal is the strict invariant **"no `.bin` kept if it is not `.bin` in fe8u."** D319's earlier
"reference-parity end-state / ~3088 is the floor" claim was **RETRACTED** (D321): a wave-6
verification pass proved ~981 real fe8u-editable misses still remained (the 176 banim
`Img_*`/`Pal_*`/`Tsa_*` are PNG-derived in fe8u; the `gFontgrp` LUTs were decodable). Two more
waves since: `make compare` OK (sha1 `7da0456…`), `make shiftcheck` 0 HIGH, self-containment 100%.
Tracked committed `.bin`: **4901 → 3088 (waves 1-5) → 2183 (wave 6, PR #75) → 1981 (wave 7, PRs
#76-79 + fix)**.

**Wave 7 converted (byte-verified, one clean `make compare` + `make shiftcheck` gate):** 112
`data/residual/song*.bin` dead pre-D311 cruft deleted (the `.mid` build already reproduces every
byte; fe8u commits no `song*.bin`); 29 frontier event/proc blobs → `EventListScr[]`/`ProcCmd[]`
macros; 35 banim AP-anim/gfx → AP-motion `.s` + typed C OAM + 6 `.png` (gbagfx LZ round-trip); 50
`frontier_df3_unitdef_b` slices → typed `struct UnitDefinition[]` (tails with un-carved REDA stay
byte-identical `_residue` INCBIN) + 3 mislabeled tables decoded as event scripts. **Integration
fix:** 3 shiftcheck `[A] HIGH` (a `SYM + <table_size>` load reaching a `_residue` START) →
direct `_residue` symbol reference (byte-identical).

**HONEST floor accounting — the 642 is an UPPER BOUND, not a work-list.** The regenerated
`scripts/audit_bin_forms.py` (a name-class heuristic) classifies the 1981 `.bin` as **MISS 642 /
FLOOR 978 / UNCERTAIN 361**. The 642 MISS flags any blob that *has* an editable fe8u twin WITHOUT
verifying bit-exact round-trippability — so it over-counts: the wave-7 per-blob triage showed much
of the banim/gfx tail it would flag is **compressed-no-bit-exact-recompressor** floor (gbagfx
decompresses but recompress ≠ ROM bytes — the documented `frontier_chap_title.mk` ceiling). The
careful verified floor is **~159 firm** (≈92 compressed-no-roundtrip + ≈66 JP-opaque-no-fe8u-type
+ 1 code-axis) **plus ~67 soft** struct-pointer cascade (reducible only after the referenced asset
subtree is carved+named first). **NEXT STEP (open):** a verification pass splitting the heuristic's
642 MISS into *bit-exact-reducible* (real remaining work) vs *heuristic-false-positive floor* — only
then is the true distance to the strict goal known. The goal is **not** reached.

**Shiftability (#5):** `make shiftcheck` (the ported fe8u PR-#745 5-layer harness, D317) is the
authoritative validation = **0 HIGH** (held throughout waves 6-7, incl. the residue-pointer fix).
The conservative `audit_pointers.py --true-debt --gate` was restored to **0** at D320/wave5
(495 was a classification gap from the D309 `data_08BB8ED0` blob rename, not real pointer debt).

## Current state (2026-06-29) — D313 asset-editability + shiftability EPIC landed (CI-green on main)
> [Superseded — see CURRENT STATE 2026-07-03 below] Historical snapshot; the live axis figures are in the authoritative 2026-07-03 six-axis table near the end of this doc.

A 12-unit `/batch` epic (D313, full plan `docs/epic_asset_editability_shiftability.md`)
integrated to main (PR #52, `make compare` OK + `make shiftcheck` 0 HIGH + clean CI):
- **Axis #6 editability — major advance.** ~480 misc/bg/chap-title/gmapunit pixel
  images → `.png` (G1-G4); **battle animation → 201 editable `banim/*_motion.s`** via
  the ported fe8u compressing-linker pipeline (`scripts/arm_compressing_linker.py` +
  `linker_script_banim.txt`, full byte-match, replacing 804 opaque `data/banim/*.bin`);
  **all 93 voicegroups → `.s`** (S2); m4a tables (`music_player_table`/`programmable_wave`/
  `keysplit`) → editable `.s` (S1); **menu string pools → `src/menu_def.c` literals** (C1);
  **82 more `UnitDef_Ch*` → typed `struct UnitDefinition[]`** (UD1, now 237 total); FE6 SIO
  payload built **from source via the `mgfembp` submodule** (F1, not a committed blob).
  Reproducible **`.bin`-form miss-tracker**: `scripts/audit_bin_forms.py` → `docs/bin_audit.md`.
- **Axis #5 shiftability — now has shifted-rebuild VALIDATION**, not just the pointer
  auditor: ported fe8u PR #745's `scripts/shiftcheck/` (5-layer: build-addr audit →
  `--emit-relocs` reloc scan → cross-resource offset → differential two-shift), `make
  shiftcheck` wired as a blocking CI step, **0 HIGH**; 8 real cross-resource pointers
  de-pointered (incl. 8 menu-string pool ptrs found during integration).
- **Remaining axis-#6 ceilings (unchanged):** gSongTable (~520 SFX/voice songs), 2
  `frontier_df3_voicegroup` non-voice floor blobs, the fe8u-parity binary floor
  (TSA/`.map.bin`, compressed region-diff gfx, m4a sample data), and the DEFERRED
  ApConf/gUnkData opaque (~180, needs RE — tracked in `docs/bin_audit.md`).

## Current state (2026-06-28)
> [Superseded — see the latest six-axis table near the end of this doc] Historical snapshot; **two** axis lines here are stale: **(1)** MATCHING-C 99.64% / 31 still descriptive asm (live: **99.94% / 5 unmatched**), and **(2)** the SHIFTABILITY (axis #5) gate = 0 ✅ COMPLETE (D309) line just below (live: **gate = 1 (floor)** — the fe8u-confirmed coincidental constant `0x080896ED`).
- BUILD SELF-CONTAINMENT: 100%
- **SHIFTABILITY (axis #5): gate = 0 ✅ COMPLETE (D309, verified).** `scripts/audit_pointers.py --true-debt --gate` = 0 — the user-ratified criterion is met. The last stuck `.4byte 0x0800260C` literal (in `data_0890915C`) was a coincidental `struct UnitDefinition` bitfield word, not a pointer; fixed by typing that blob as `struct UnitDefinition[4]` (= fe8u `UnitDef_Ch4Ally_1`+`_2`, byte-exact). ~14,800 relocated. The 5 remaining "CODE-axis literal pools" are NOT in the gate — they relocate when their Thumb fn is decompiled (a #2/code-axis item). Historical context below.
- _Historical (pre-D309):_ relocated 14,383 (from 7,639); honest gate = 364 + unmeasured compressed (D305 'gate=0' RETRACTED by D306). The literal raw-`0x08xxxxxx` count is the WRONG invariant for completion: it is dominated by The literal raw-`0x08xxxxxx` count (2,861) is the WRONG invariant for completion: it is dominated by **coincidental constants** (2,564 — graphics pixels, packed unit-stat bitfields where byte3=0x08, sine-table values, sound samples) that are NOT pointers and CANNOT be relocated (doing so corrupts the shifted game). Authoritative metric: `scripts/audit_pointers.py --true-debt --gate` (fe8u oracle + positive-evidence structural classification), NOT the literal raw count. **Gate = confirmed-real + unclassified DATA-pointer debt = 9**, all sparse words (0.5-1% density) in 18-21KB undecompiled `gUnkData_*` data blobs pointing to scattered/deep (60-130KB) interiors = coincidental, conservatively left unclassified (proving them airtight needs decompiling the blobs = the EDITABILITY axis, not shiftability). D304 fixed 6 real converter/auditor bugs (hex-offset slice regex, per-word gate convergence, slice-base address, auditor `incbin_ranges` hex+ERE, `RESID` crash, `func+1` thumb-fn-ptr mis-classified as coincidental) and de-pointered 6 real-pointer clusters: `impure_data` newlib `_reent` self-pointers (+3), **gFontgrp Shift-JIS `sjisNext` glyph linked-list (+234)** via `--glyphs`, `EventScr_Ch16A_1` event-script command-0x0A40 operands (+2), and `lut.29` ProcScr SubtitleHelp callbacks + data refs (+7). `gap_000B1030`'s "pointers" are a Thumb function's literal pool → code-decompilation axis, not data debt.
- **ASSET EDITABILITY (axis #6) — REALIGNED to fe8u SOURCE forms (D310/D311, user-directed).** Editability is judged by the committed SOURCE FORM, not the raw-incbin byte count (a .bin moved into graphics/ passes make compare but isn't editable). DONE in editable fe8u form: 166/166 EventScr -> EVENT_* macros, all ProcScr -> PROC_*, 155 UnitDef -> typed struct, 21 btl_bg -> .png (FETSATOOL), 122 palettes -> .pal/.agbpal (109 bit-15->.agbpal), 74 chapter maps -> .mar/.json/.S, 439 PCM samples -> .aif, pixel gfx -> .png. Standard = docs/asset_forms.md. MUSIC DONE (D311): 72/72 songs -> editable .mid (self-contained, mid2agb from fe8u .mid + remnant re-carve) + ALL 93 voicegroups (000-092) -> editable .s (S2 converted the last 7: vg035/036/076/077/078/086/092, incl. 3 split out of frontier_* blobs + 1 from a data_* __asm__ literal block; 0 unresolved pointers). Remaining music CEILINGS: gSongTable (needs ~520 SFX/voice songs decompiled); 2 frontier_df3_voicegroup floor blobs that are NOT voice tables (56 B pointer/keysplit array @0x1F70E8 + 537 B misaligned vg035-region tail @0x202C07) -- self-contained .bin. fe8u-parity binary floor: TSA/.map.bin tilemaps, compressed region-diff gfx.
- **ASSET EDITABILITY (axis #6): ~120 KB opaque structured raw-incbin (struct_b), down from 550 KB at D309 start (D306-measured 678 KB earlier).** D309 levers: (1) removed 842 dead/orphan `.bin` referenced only by excluded asm (already typed-C or already-extracted, −318 KB); (2) extracted 78 graphics/TSA blobs to typed `graphics/` assets; (3) typed 155 `UnitDef_*` tables → `struct UnitDefinition[]` (−35.6 KB, fe8u parity). **Remainder is the fe8u-parity binary floor** (what fe8u also keeps as INCBIN): ~86 KB region-different compressed graphics / index-coord tables / pointer-arrays / zero-padding under `data_08XXXXXX` (JP addrs resolve to fe8u `*fill*` or no symbol), ~12.5 KB m4a sound, ~9 KB compressed battle-anim. The structured-logic target is essentially cleared; `scripts/calcprogress.py` reports the live struct_b.
- **MATCHING-C: 99.64%** (8649/8680 JP funcs; **31 still descriptive asm**). **2026-06-26 stale-triage sweep (+2, honest-metric fix):** the "34" included two stale miscounts the prior triage missed. (1) **`asm/rom_header.s` → `src/rom_header.s`** (fe8u parity, D281 SRC_S_FILES): the ROM cartridge header was the last hand-written real-source asm still under `asm/`; its `Init` (`b crt0`) entry stub is now matching-C. calcprogress was *also* miscounting the 11 `RomHeader*` cartridge-header DATA labels (`.byte`/`.ascii`/`.space` — Nintendo logo, title, game-code, checksum) as "functions" on the src side (the asm side counted only the 2 globals), so the move would have inflated the total by 10 — fixed by excluding `RomHeader*` from the function census (denominator now move-invariant, 8680). (2) **`GetUnitItemSlot` (sub_8016DD4)** — the last stranded-`bmitem` residual, a region-same (US-shifted) Thumb function lazily left as a descriptive incbin; hand-decomp'd from fe8u `bmitem.c` (3-line item-slot scan + GetItemIndex extern-inline), byte-perfect. **GOTCHA (re-confirmed):** the `// FLAGS: ... EXACT` annotations in `src/nonmatching/*.c` headers are NOT reliable — `sub_800A34C` claimed `-fno-gcse = EXACT` but a real carve measured **534/584 bytes differing** (right size, totally different codegen). make compare is the ONLY oracle. The remaining 31 are genuine reg-coloring NEARs (permuter fleet of ~10 running, machine CPU-SATURATED at load 17.9/16) + big region-different reconstructions (`sub_8057F80`/PrepareBattleGraphicsMaybe = 2936B). **The entire newlib/libgcc subsystem is now real library source — VERIFIED 2026-06-26: the code region 0x0D6000..0x0DC134 has 0 raw-incbin gap bytes (every code byte there is src/ or lib-linked).** There is NO remaining non-permuter deterministic lever; further progress on the 31 is permuter-compute-bound + deep-reconstruction. Three frontier "close NEAR" claims were measured and ALL were stale (sub_800A34C "EXACT"→534/584B, RegisterTsaWithOffset "6B"→91/96B, EfxAdvanceFrameLut "2-insn"→87/132B): the annotations conflate structural closeness (insn count) with byte-closeness (which needs matching reg-allocation = the permuter's job). Do NOT trust them; re-measure with make compare. **D289 newlib lib-link cluster (+8 beyond D288):** the "region-different newlib" verdict was wrong for the locale + malloc clusters — they are STOCK newlib, lib-linkable with multi-section placement (the apparent "size mismatch" was comparing a whole archive member to a single function; the `.data` "diff" was unresolved self-referential relocations, byte-identical once linked at the JP address). Lib-linked **locale.o** (setlocale/localeconv/_setlocale_r/_localeconv_r; .text@0x0D91C8 + .rodata@0x0857744 lconv+strings + .data@0x0BB8A78) and the **malloc core** mallocr.o + freer.o (_malloc_r/malloc_extend_top/_free_r/_malloc_trim_r; .text@0x0D9310/0x0D8CDC + mallocr.o(.data)@0x0BB8A8C = __malloc_av_ bins + globals). Method: place every section at its JP addr, split/shrink the overlapping residue-data carves (data_0857742E, data_08BB8E94), drop the now-duplicate placeholder data objects (__malloc_av__ref) + baseline aliases (__mb_cur_max), alias the JP-named lock stubs (__malloc_lock=nullsub_7). PROBE: a member lib-links iff every byte-diff (after linking at the JP addr) is 0 — test by linking the member standalone at the target addresses, not by comparing the unlinked .o. **newlib `_dtoa_r` — DONE (CORRECTED 2026-06-26, was wrongly listed "REMAINING").** `_dtoa_r` is already lib-linked: `layout/carved_rom.d/libarchive_dtoa.tsv` places `*libc.a:dtoa.o(.text)` @0x0D7C98..0x0D8AEC (quorem + _dtoa_r); `libarchive_mprec.tsv` byte-verifies mprec.o whole; the soft-float + `call_via` veneers (`call_via_consolidated.tsv`) are real source. VERIFIED there are 0 raw-incbin gap bytes in 0x0D6000..0x0DC134, so the mprec/soft-float/dtoa subsystem is fully real library source — nothing remains to lib-link here.
- **Prior: MATCHING-C 99.52%** (8641/8683; 42 still asm). **D288 real-source + lib-link sweep (+9)** by re-applying the D287-CORRECTION mindset (re-verify every "confirmed-hard" verdict, don't trust it). +2 beyond the list below: **`SetSramFastFunc`** (funcmap "masked" — region-different but carveable: ported into src/agb_sram.o at -O1 with SetSramFastFunc defined BEFORE WriteAndVerifySramFast so the shared .text lays out as the ROM; static readSramFast_Work[64] added and agb_sram.o(.bss) pinned to 0x03002A10 via carved_ram; GOTCHA: agbcc emits a dead duplicate const-pool .rodata for the 8+ symbol-address loads — GAS re-inlines them in .text, so /DISCARD/ the orphaned .rodata or it pushes the ROM 44B past 16MB) and **`j_ClearOam`** (thumb→arm veneer `bx pc; nop; b ClearOam`, reproduced as src/j_ClearOam.s like src/arm_call.s). **NO "exact" (region-same) functions remain** — VerifySramFast_Core was the last; the 42 are all "masked"/region-different. Sub-vein detail:
  - **newlib lib-links (+4):** `strcmp` (libc.a:strcmp.o, pure leaf — exact), `__swsetup`/`__smakebuf`/`__sfvwrite` (wsetup.o/makebuf.o/fvwrite.o) — SAME-SIZE as the JP bytes, differing ONLY at R_ARM_THM_CALL/ABS32 relocation sites which the linker resolves to the JP callee addrs (defined via jp_syms.s + the still-asm malloc cluster). Standalone-`.o` byte-diff is reloc NOISE; gate on the LINKED make compare. Probe: extract member, compare .text size to the gbadisasm-frag size; same size + diffs all at `objdump -r` offsets ⇒ lib-linkable.
  - **empty-fn return idioms as committed `src/*.s` (+2):** `nullsub_111` = `bx lr; nop` (a C `void f(void){}` emits only `bx lr`; the build's `.align 2, 0` zero-pads the trailing halfword to `0000`, but the ROM has the `c046` thumb nop) and `nullsub_3` = the non-interwork `mov pc, lr` return (a C body emits `bx lr` under -mthumb-interwork). Reproduced via the SRC_S mechanism (like src/call_via.s); count toward matching-C (funcs counts T-syms in any src/ object).
  - **region-same C carve (+1):** `VerifySramFast_Core` (funcmap "exact" with US) ported from fe8u agb_sram.c at -O1.
  - **EfxAdvanceFrameLut (sub_8056890) was WRONGLY tagged "fe8u-own nonmatching = impossible"** — fe8u matches it with a `register u32 r6 asm("r6")` pin; the JP build colors differently (count→r6, time→r1, iframe unified to one sign-extended `int`). Reduced to a 2-insn residual (the `iframe==-4` branch-polarity duplicated-return + a load-coloring swap), STAGED as src/nonmatching/sub_8056890.c for the permuter. Likewise `RegisterTsaWithOffset` was claimed a 6-byte NEAR — CORRECTED 2026-06-26: a real carve from fe8u classchg-sel.c measured 91/96 bytes differing (same algorithm, but the JP build colors with r8+ip register pressure the fe8u-shaped C doesn't induce). Staged as src/nonmatching/RegisterTsaWithOffset.c for the permuter; it is a reg-coloring NEAR, not a deterministic carve.
  - **Remaining 44:** newlib malloc/dtoa/locale cluster (`_malloc_r`/`_free_r`/`_dtoa_r`/`setlocale`/`localeconv`/`_setlocale_r`/`malloc_extend_top`/`_malloc_trim_r` — JP-custom region-different, size-mismatch, NOT lib-linkable), `SetSramFastFunc` (RAM-buffer static BSS placement), `j_ClearOam` (thumb→arm veneer), and ~30 game `sub_*` register-coloring NEARs (the permuter fleet's domain).

### Prior state (2026-06-25)
- **MATCHING-C: 99.45%** (8632/8680 JP funcs; **48 still descriptive asm**). The DETERMINISTIC all-levers tier is now EXHAUSTED: every carveable still-asm sub_ has been re-examined with the full lever set (incl the session-new -fno-gcse/-fno-strength-reduce/-Os from the agbcc-source dig). +9 this segment by finding wrong "ceiling" verdicts (UnitList_PutRow/HandleTurnRecord msgid+text-layout; 801FAA0 -fno-strength-reduce; 80A447C/462C augury DCE if/else-same idiom; 8048FC0 comma-operator; 80A6C60 -Os). The remaining 48 = genuine agbcc reg-coloring/spill ceilings (~38, permuter fleet of 8 running + decomp.me 6 posted) + region-diff newlib malloc/dtoa/locale (~9) + ~5 fe8u-own/newlib-version non-matching. Path to 100% from here = permuter compute-time + community, NOT more deterministic levers.
- **99.89% (8519)** was the pre-all-levers mark. HONEST DUAL FRAMING: the function-count metric reads 99.89% because its denominator is the US function count (8528) while JP has ~53 more functions; by CODE BYTES, **95.43% of code is in src (4.57% = 41,224 bytes across 62 functions still descriptive asm)**. So the real remaining work = **62 functions**, not 9. The register-pin campaign matched 4 and proved ~1/3 of prior "reg-coloring ceiling" verdicts WRONG (a -mjp-promote win efxLunaSCR_Loop, a spurious null-check sub_80B8AA8, wrong bitfield form sub_80A421C). An ALL-LEVERS re-examination campaign (re-derive identity + -mjp-promote + named bitfields + DCE idiom + register pins) over the 62's largest fe8u-port reconstructs is running. Earlier: campaign #5 +9, sub_80D5244 +1. Permuter campaign #5 cracked 9/14 augury/divination NEARs (the shared "dead gPlaySt+0x2B masked read + 0x7B1/0x7B7 const" DCE idiom: `if(flag) x=V; else x=V;` keeps the flag-read alive while folding the branch). +sub_80D5244 (lone svc 0x2A hand-asm). A REGISTER-PIN campaign is now testing an unexploited lever on the clean-permutation NEARs: `register int x asm("rN")` (docs/agbcc_codegen_levers.md §3) directly forces agbcc's register choice — distinct from the permuter (which mutates source structure, not register annotations). The 13 remaining = clean-permutation NEARs (register-pin candidates) + ~5 confirmed-hard (PutFaceOnBackGround 800663C, Event0F_CounterOps 800DE3C cross-jump, RegisterTsaWithOffset 80D19DC = fe8u-own non-matching, EfxAdvanceFrameLut 8056890 = fe8u-own non-matching, __sfvwrite 80D8F5C = newlib-version). Earlier this session: **The veneer "floor" is fully dissolved**: after libagbsyscall (+21), the `_call_via` thumb veneers (0x080D65BC..0x080D65F4) were ALSO reconstructed as hand-asm `src/call_via.s` (+12) — they are NOT lib-linkable (JP region 0x38 vs stock libgcc 0x3c) but the `bx rN;nop` bodies reproduce exactly as real source. CORRECTION to the earlier note: `_call_via` IS recoverable (via hand-asm, not lib-link). Only `sub_80D5244` (svc 0x2A) + ~13-18 Class-3 reg-coloring NEARs + ~4 confirmed-hard remain. Earlier: Unknowns carve +4 (NewShinningStonefx, PathContainsNoCycle, PrintDebugStringFmtAsOBJ, sub_800B88C); reconstruct carve +2 (Event0A_Call, AgbMain). A 26-fn RECONSTRUCT carve workflow (the D280 workers' un-reached fe8u-port targets: GmapScreen2_Loop, Guide_MainLoop, ClassIntro_Init, PutUnitSpriteIconsOam, Tactician_InitScreen, AgbMain…) is running. The carve pipeline still has fuel: the D280 8-worker batch only reached ~33 of its 55 assigned, leaving ~26 un-attempted carveable reconstructs. **The BIOS/libgcc veneer bucket was NOT a floor.** Recovered +21: consolidated the ~20 BIOS svc wrappers (ArcTan2..VBlankIntrWait + SoftReset + JP-only sub_80D6384) into one real-source `src/libagbsyscall.s` like fe8u (added a Makefile rule to assemble committed `src/*.s` via `git ls-files` + a `.gitignore` exception), and lib-linked `vsprintf` from libc.a. `_call_via_rX` is NOT recoverable (JP region is 0x38 vs the stock libgcc object's 0x3c — 4-byte divergence, would shift everything). GOTCHA that cost 3 gates: a hand-asm `.section .text.libagbsyscall` must be referenced in carved_rom.d as `src/X.o(.text.libagbsyscall)` NOT `(.text)` — the empty default `.text` (0 bytes) silently lets the real bytes fall to a catch-all and grow the ROM 256B. Earlier this session:
- **MATCHING-C: 99.19%** (8459/8528) was the pre-veneer mark (+122 net). The 55-fn CARVE workflow landed **+13** (12 fns + the sub_80A6A1C sibling): `_calloc_r`/`_fwalk` newlib LIB-LINKS (carved_rom.d → `*libc.a:callocr.o`/`fwalk.o`, no C), Spline_SetupSegment4, sub_80A705C link-arena serializer, augury screen-inits (sub_80A2D48/3118), StartLinkArenaShowPointsAnimated, efx-magic timeline (sub_8065E44), JP-only leaves. The other ~21 turned out to be reg-coloring/scheduling NEARs — saved as decodes (/tmp/near_decodes/) and fed to PERMUTER CAMPAIGN #4 (running). Earlier: PERMUTER CAMPAIGNS keep cracking the reg-coloring/scheduling NEAR tail at ~71% (campaign #1 9/12, #2 10/14, #3 10/14). A 6-agent TRIAGE of the 73 un-decoded medium still-asm fns found **55 MORE carveable** (22 fe8u-port reconstructs + 29 leaf-binds + 4 clean + the `_calloc_r` newlib lib-link) — a CARVE workflow over them is running now. Several campaign-#3 "NEARs" were actually MISLABELED reconstructs (800E574 omitted-else-block, 8021C28 JP-only ProcScr slot) — re-verify the decode, don't trust the NEAR tag. True residual NEARs found: 800E5CC (cross-jump tail-merge, fe8u-own asm() nonmatching), 801FAA0 (loop-direction + 1-reg prologue floor), plus campaign #1/#2 carries. — the residual IS crackable via permuter best-output + creative source forms (do{}while(0) wrap, ternary-flag, compound-expr inline, decl-order, region-diff). The reg-coloring tail is NOT a hard ceiling; it is a permuter grind. Campaign #3 (14 fresh NEARs) running. Of the 92: ~30 NEARs still have ready decodes (campaign fuel) + ~13 staged non-matching-C + a few genuinely-hard (PutFaceOnBackGround 800663C tried 60+ forms, Event0F_CounterOps 800DE3C, RegisterTsaWithOffset 80D19DC = fe8u-own non-matching todo, 80A6FF0 basic-block-ordering ceiling).
  - CAMPAIGN #2 (+10, one batch, byte-perfect combined): BlitU8TileMapData (8001508, decl-order+s8 6-byte fix), SlotQueuePop (800D808, read-head-before-decrement), StartEventWarpAnim (8021A2C, free -mjp-promote), sub_80356C8 (sprite-strip, decl-order+pre-load temp+shifted-domain), sub_8085DDC=EvCheck0B_AREA (free -mjp-promote), sub_80A3018 (prep-item text, &i<=4 loop-reversal block), sub_80A34F0 (BG2 row-fill), sub_80A3DC8, sub_80A6AFC (bit-packing leaf), sub_80A4428 (divination text starter). LESSON re-confirmed: re-measure flagged reg-pressure NEARs with -mjp-promote BEFORE the permuter — several are free exact matches.
  - +8 RECOVERED from stranded worktree branches: 3D rotation-matrix cluster (sub_8015188/D0/18), ekrBattleEnding
    pair (sub_805601C/8056078), worldmap event handlers EventB6/C4/BC (sub_800CC7C/CF5C/CDB0).
  - 🚨 **INTEGRATOR PROCESS LESSON (cost ~+8 nearly-missed): scan ALL `worktree-*` branches for committed-but-unpushed
    carves, not just `origin/feat/*`.** Workers commit incrementally to their OWN worktree branch and only push at
    batch-end (or not at all) — `git worktree list` + `git log origin/main..<branch>` finds the stranded carves.
    Filter REAL recoveries (the branch's dropped `asm/sub_*.s` is STILL on main) from DUPS (already deleted on main =
    already carved via another route; ~25 stale leftover worktrees were dups). Re-scan periodically as the fleet carves.
  - +sub_8048AC4 + sub_8048BAC (JP-only SIO start/teardown leaves, from-scratch). The JP-only LEAF veins
    (SIO/efx/augury helpers — NOT proc functions, which are all carved) are the productive +matching-C now.
  - ⚠️ stale-base merge note: workers branched before a prior merge produce a feat branch whose diff-vs-main
    shows the intervening carves as "deleted" — the 3-WAY MERGE keeps both sides' independent additions
    (verified: ColorFade preserved + SIO added). Safe for independent new-TU carves; VERIFY no regression on merge.
  - +ColorFadeSetup×4 (sub_80017EC/8001870/80018F0/8001974, +4 from one recipe).
  - 💡 **`short`-PARAM-PROMOTION + PROTO-HIDE technique (colorfade-worker, reusable):** for a u8/s8-param func whose
    residual is the base-load-vs-arg-extension SCHEDULING order (JP loads the loop-invariant global base BEFORE
    zero-extending the param; agbcc zexts first) — declare the param `short` (not u8/s8) so PROMOTE_FUNCTION_ARGS
    (-mjp-promote) reorders the base load ahead of the arg extension → JP prologue. The shared-header proto is u8,
    so HIDE it for this TU via the rename-macro idiom (`#define Fn Fn_u8_proto_hidden` around the includes, `#undef`
    — same as StartEventBattle, NO header edit) + split the store through a temp. (u8-cast/register-pin/plain-reorder
    all FAIL — confirmed.) The permuter finds it embedded in a noisy best-output; extract the deterministic fix.
  - 🔬 **TWO-CLASS spill distinction (seb-worker): PRESSURE vs SLOT-ORDER.** carve BIGGER than JP (extra push) =
    spill-PRESSURE → the split-the-final-write lever REMOVES a register and matches (efxLuce). carve EXACT-size with a
    rotated `[sp,#N]` slot assignment = spill-SLOT-ORDER (agbcc assign_stack_local numbering, INVARIANT to C source,
    default permuter plateaus, NO C-level fix exists) → transmuter-only. ClassStatsDisplay_Loop is SLOT-ORDER (6B 3-slot
    rotation). Diagnostic: bigger=pressure(try split lever), exact-size-rotated-[sp,#N]=slot-order(transmuter batch).
    > [SUPERSEDED 2026-07-03] ClassStatsDisplay_Loop (sub_80B8B28) is now MATCHED byte-exact in-repo and banked — this SLOT-ORDER / "NO C-level fix exists" / transmuter-only verdict is STALE. This retracts every wall/NEAR/"genuine-residual" mention of the function throughout this log (the REG-COLORING NEAR backlog, the SPILL-SLOT / REG-ROTATION backlog, and the permuter-backlog list mentions below). It is one of the session's 6 byte-exact axis-2 wins (see the authoritative 2026-07-03 block near the end).
  - +LinkArenaTeamBuild_Init (sub_8046924, verbatim fe8u sio_term.c, msgid -0x75 shift; "Str→StrEx" was a
    gbadisasm naming artifact). +sub_8048F78 (JP-only SIO text-draw leaf, from-scratch, 26/26 identical).
  - 🟢 **PRODUCTIVE VEIN: JP-only small wrappers/leaves** (the size-match harness EXCLUDES these — no fe8u row to
    match — but they byte-match from a faithful from-scratch decode). Cheap carve fuel. The **0x08048xxx SIO band**
    (sub_8048AC4/CD8/BAC/D74/C08/C7C — Proc_Start/teardown/cursor/help-popup handlers, mostly all-named) is queued
    to sio-worker. msgid-shift (-0x75) is the consistent JP link-arena/sio const pattern.
  - 🟢 **AUGURY/占い JP-only leaf vein (0x080A2xxx–0x080A4xxx, IsDivinationPortrait*/CgText*):** productive, like the
    SIO text-draws. ⭐ **sub_80A462C** (28 instr, ALL named, ZERO struct ambiguity — near-certain byte-match, recon-worker
    on it): proc->unk_2c=0x7B1 msgid; StartCgText(...,VRAM 0x06011000,...); GetCgTextFlags|0x0004004E→SetCgTextFlags.
    DEFER-band next-most-tractable (need a few binds/struct trace): sub_80490C8 (SIO score time-display, 2 digit-extractor
    binds sub_80D637C/74 + 2 sprite-table aliases), sub_80491B8 (score-display loop, carve after 80490C8). AVOID (deep
    IDA struct): sub_80487D8 (multiboot, MultiBootParam@0x03004EB0 + ~25 syms), sub_8048DC0 (digit renderer).
  - 🟥 **REG-COLORING NEAR backlog = LIKELY GENUINE RESIDUAL (transmuter INFEASIBLE — do NOT re-try it).** Region-same
    PORTS hit a 1-2 register-coloring / spill-slot-order ceiling: agbcc colors a scratch reg / numbers a stack slot
    differently than the JP build, and NO C-source form flips it (source-invariant; default permuter scores byte-exact
    but plateaus, levers/pins tried). Members: AiAttemptStealActionWithinMovement (sub_803DAF0, ~50 diffs incl. s8 rankTmp
    rep), Event0F_CounterOps (r4↔r5), ClassStatsDisplay_Loop (3-slot rotation), AdjustNewUnitPosition (3-reg rotation),
    OpAnimFaceMontageBegin (JP's redundant adds), HandleTurnRecordText, GmapScreen2_Loop, Event18_ColorFade.
    **TRANSMUTER PROVEN INFEASIBLE (task #15):** its objdiff scorer is REGISTER-BLIND BY DESIGN (`movs r3`==`movs r4`,
    no byte-exact mode) → false-greens every reg-coloring case (score 0 while bytes differ). These stay on byte-exact
    decomp-permuter + agbcc-codegen-levers (exhausted) — treat as the likely-permanent residual. **DO NOT hand-grind
    region-same ports; DECODE-but-don't-grind (save for a future deeper agbcc-reg-alloc-config attempt), carve JP-only
    leaves + JP-divergent reconstructs instead — that's where ALL the remaining +matching-C is.**
    > [SUPERSEDED 2026-07-03] ClassStatsDisplay_Loop (sub_80B8B28) has since MATCHED byte-exact in-repo and was banked/removed from the nonmatching set — so for it this "LIKELY GENUINE RESIDUAL / source-invariant / not source-fixable / likely-permanent" wall claim is FALSE. (The block's OTHER members remain in `src/nonmatching/*.c` — see the authoritative 16-function frontier list near the end.)
  - +efxLuceBGCOL spawner+loop pair (sub_8067040/8067160, JP-only efx; `int terminator` not s16; 6 data binds).
  - 💡 **KEY TECHNIQUE (seb-worker, efxLuceBGCOL): the default permuter FINDS the unlocking source mutation even when
    its SCORE never reaches 0.** The score-N best-output's source diff often contains the mutation (e.g. splitting
    `x=(v&m)|b` into two statements to drop a spill) that, applied to clean source, byte-matches. So **extract the
    permuter best-output MUTATION, apply to clean source, byte-diff is the oracle** — don't require the permuter to
    self-reach 0. This REOPENS the spill-slot NEAR backlog (seb-worker testing it on ClassStatsDisplay best-5).
  - +StrInsertTact (sub_800A118, Shift-JIS reconstruct: JP copies 2-byte SJIS chars where fe8u copies 1 byte;
    the natural `*dst++=*src++` pointer idiom colors source→r5/dest→r4 to match JP — a PRODUCTIVE new text vein).
  - +EfxDrsmmoyaMain (sub_80705E8, JP-only efx reconstruct, hand-closed no permuter: if/else timer order +
    per-branch PlaySFX duplication + state3@0x10 load-schedule). +SioBat_SetupLoop (sub_8045EEC, fe8u sio_bat.c +
    JP msgids 0x6D3/4/5 + JP hoists EndLinkArenaButtonSpriteDraw to the Proc_Find==NULL path = the no-r7 frame).
  - +StartEventBattle (sub_8012038, local-prototype-shadow fix for isBallista s8 — NO shared-header edit;
    re-land of the earlier CI-breaking attempt) +ply_memacc (sub_80D60E8, verbatim fe8u m4a under old_agbcc;
    the 41B "residual" was 100% standalone reloc/veneer noise, byte-identical in-tree).
  - +ekrGaugeMain (int-local-widen `s32 r4` cracked the asrs-cascade extra-mov NEAR — a SUBSET of the
    "config-ceiling" NEARs are int-widen-fixable, NOT permuter-only; cfbind zfix) +LoadUnit
    (reconstruct: JP earlier build omits the Shadowshot/Stone secondary-weapon block).
  - +BattleAIS_ExecCommands (JP sub_80599F8 reconstruct; gbadisasm-split 3 stubs→1; JP earlier build:
    C03 clears debuff on `anim` only not the 4× gAnims loop, C07 Pierce omits the FROZEN-unfreeze block).
  - +BattleAIS_ExecCommands (JP sub_80599F8 reconstruct; gbadisasm-split 3 stubs→1).
  - 🗺 **EMPIRICAL FRONTIER MAP (D2026-06-25, validated full-TU compile+byte-diff harness over the 33 named
    still-asm funcs that have a fe8u source).** HONEST bucket counts — **the lever veins are EXHAUSTED for the
    named set; remaining yield is reconstruct + permuter + the unnamed-sub harvest:**
    - **free-carve (0-real-diff) = 0.** int-widen = **0** (the re-truncation-count heuristic gave 9 FALSE
      positives; BYTE-DIFF is the only oracle; int-widen only helps a TIGHT near-match where truncation is the
      SOLE residual — ekrGaugeMain was the one historical win and was already tight). cast-signedness = 0.
    - **permuter ≈ 11** (reg-renumber/schedule): AddAttr2dBitMap (historical; MATCHED 2026-07-10 via zero-instruction BB separator), PutFaceOnBackGround,
      Event0E_STAL, Event0F_CounterOps, AdjustNewUnitPosition, GMapScreen_UpdateScroll, 4× ColorFadeSetupFrom*
      (r0↔r2 pool-reg, likely ONE shared fix), **ply_memacc (m4a → try `CC1 := old_agbcc` FIRST: drops 100→41B)**.
    - **reconstruct ≈ 22** (the bulk of named yield): StrInsertTact, EventA8_WmUnitMoveFree, PutUnitSpriteIconsOam,
      UnitList_PutRow, HandleTurnRecordText, OpAnimFaceMontageBegin, Event1B_TEXTSHOW, StartEventBattle (re-land
      LOCAL-prototype, NOT shared-header), Tactician_InitScreen, ClassIntro_Init, Guide_MainLoop, GmapScreen2_Loop,
      WriteNewGameSave, PrepareBattleGraphicsMaybe (+266B, huge), AgbMain, SioBat_SetupLoop, ClassStatsDisplay_Loop, …
    - **+~169 UNNAMED sub_** (no fe8u name): TRIAGED (D2026-06-25) — **≈0 clean-carve yield.** 66 leaf (un-fingerprintable),
      34 weak (1 callee), 69 fingerprintable but dominated by COLLISIONS (high-Jaccard match names a fe8u func ALREADY
      carved in JP at another addr; the sub_ is a region-different sibling sharing generic helpers) + non-distinctive
      callees (BG_EnableSyncByMask/SetBlendConfig/PutText) + size-mismatch (JP 1.5-2.3× larger = divergent). ONE recon
      lead: sub_8046924 (LinkArenaTeamBuild_Init family, DrawChapterTitleStr→StrEx swap). callee-fingerprint IDs the
      SUBSYSTEM, not portable identity. → reconstruct-dominated, NOT a harvest.
  - 🏁 **STRATEGIC MILESTONE (D2026-06-25): the matching-C frontier is at its FLOOR for ports + levers.** Empirically
    floored, ALL = 0 new carves: free-carve, int-widen, cast-signedness, cross-jump knob, reg-order knob, unnamed-sub
    fingerprint. **The ONLY remaining path to 100% is RECONSTRUCT (hand-decompile the JP-divergent/JP-only source shape)
    + PERMUTER (reg-alloc/schedule residuals).** Do NOT run more identification/lever sweeps. Highest-confidence
    reconstruct vein = PROC-NAME-STRING self-identifying JP-only procs (efx spawners proved this; link-arena/name-entry/
    augury subsystems next) + the decoded medium reconstructs. The remaining ~185 is a reconstruct backlog (multi-session).
    - **cross-jump/reg-save-order/reg-pressure knobs = ALL empirically ZERO yield (D277), do NOT pursue.**
    Harness: /tmp/cjtest/ (bucket.sh, classify2.py, retrunc.sh) — byte-diff is the oracle, re-trunc count is not.
  - ⚡ **CRITICAL RULE (D2026-06-25, verified): re-measure every NEAR with `-mjp-promote` BEFORE classifying.**
    The frontier's per-function byte-gaps were measured against PLAIN agbcc and are STALE — `-mjp-promote`
    collapses the asr/lsr/s8-s16 sign-extension cascade, routinely turning a "30-40-byte reg-alloc ceiling" into
    a 0-6-instr permuter residual. PROVEN: **AdjustNewUnitPosition (sub_807C8DC)** plain=161 instr →
    -mjp-promote=**139 = EXACT JP length**. GMapScreen_UpdateScroll plain=295→260 (6 over). So promote collapses
    the STALE plain-agbcc gaps — but ⚠️ EXACT-LENGTH ≠ tractable: the residual is often a reg-COLORING ceiling, not
    a small schedule fix. **AdjustNewUnitPosition (sub_807C8DC) = CONFIRMED reg-coloring CEILING** (anup-worker): exact
    139-instr length but the 49B residual is a 3-register loop rotation (body callee-saved reg-SWAP, the genuine-ceiling
    class) — source reorders ZERO effect, permuter plateau 485/825, register-pins make body swaps WORSE. Needs a
    stronger reg-alloc permuter profile (transmuter). So "permuter ≈ 11" splits into tractable-schedule (ColorFade×4
    style) vs reg-COLORING-ceiling (AdjustNewUnitPosition style) — re-measure tells you length, not winnability.
    (int-widen+cast add nothing beyond promote — promote already does the signedness work; that's why those buckets are 0.)
  - 🟥 **CONFIRMED reg-PRESSURE (Class-3) ceilings — do NOT retry as reconstructs** (recon-worker verified: after
    the s8/s16 signedness fix + -mjp-promote they reach EXACT JP size + 99% structural match, but the residual is
    an agbcc spill/high-reg-count tiebreak the permuter can't reach): **Event18_ColorFade (sub_800E1FC)** (JP s8
    start/size, 204B exact, JP spills r+g to a 4-word frame; permuter plateau 980@8k), **EventA8_WmUnitMoveFree
    (sub_800C994)** (JP s16 args, 8B delta = one extra callee-saved high reg kept live across Proc_Find/GmMu_SetPosition).
  - 🟧 **SPILL-SLOT / REG-ROTATION NEAR backlog (STRATEGIC: needs a stronger reg-alloc tool, NOT more default permuter).**
    A growing class of reconstructs that are **100% structurally correct** (exact size + all-but-N-bytes byte-0) but blocked
    by an agbcc frame-layout/stack-slot/register-rotation tiebreak the **default decomp-permuter randomizer plateaus on**
    (never reaches 0). VALIDATED, worktrees PRESERVED for a future pass:
    • **ClassStatsDisplay_Loop (sub_80B8B28)** — reconstruct done (drop GetClassReelName + 32B buf, inline classReelEnt
      deref, (u8*) cast, drop null-guard; frame 0x30→0x10); residual = 6B cyclic rotation of 3 spill slots
      ([sp,#4]/[sp,#8]/[sp,#0xc]); 14 source variants + 15k permuter @ plateau 5. Worktree /home/laqieer/fe8j-wt-class.
      > [SUPERSEDED 2026-07-11] ClassStatsDisplay_Loop and AdjustNewUnitPosition are both MATCHED byte-exact in-repo; the preserved-worktree/transmuter plan above is historical.
    • **AdjustNewUnitPosition (sub_807C8DC)** — exact 139-instr; 3-register loop-counter rotation; plateau 485/825.
      Worktree /home/laqieer/fe8j-wt-anup (+ _permwork/AdjustNewUnitPosition.best485.c).
    **UNLOCK = the transmuter** (agbcc+Thumb+Claude-Code-in-the-loop permuter rewrite, github.com/macabeus/transmuter,
    flagged in memory for EXACTLY this reg-alloc NEAR backlog) OR a PERM-macro register-hint profile OR a 100k+
    differently-seeded run. Register pins make BODY swaps WORSE (don't). When N such NEARs accumulate, deploy the
    transmuter as a batch — it's the highest-leverage move for the spill/rotation tail. Do NOT keep throwing 15k
    default-permuter runs at individual ones (proven to plateau).
  - ⚠️ **cfbind BUG to fix before carving EventA8: `cfbind_eventscr_gmap.tsv:21` binds `StartGmapAutoMu_Type1` to
    GARBAGE 0x07E72DA4 — correct = 0x080C818C** (Type0@0x080C8130 +0x5C; matches asm `.set sub_80C818C`). Latent
    (no carved code refs it yet) but WILL link-fail/mis-bind the EventA8 carve. Fix via additive zfix last-wins.
  - 🔸 **Genuine LARGE reconstructs (JP earlier-build SMALLER, need a dedicated session + unnamed-callee binds):**
    WriteNewGameSave (sub_80A98B4, JP 44B smaller — likely omits the Sacred-Stones dungeon[2]/bonus/worldmap save
    blocks; binds sub_8000CE4/8030C44/80D6370/80A9778/80A9784), AgbMain, PrepareBattleGraphicsMaybe (+266B).
  - 📋 **DECODED reconstruct recipes ready (researcher, in /tmp + relayed to workers):** 3× efx JP-ONLY spawners
    (StartSubSpell_efxLuceBGCOL sub_8067040, efxLuceBGCOL_Loop sub_8067160, EfxDrsmmoyaMain sub_80705E8 — identity
    PROVEN via proc-name strings, all callees named, cheapest reconstructs in the tail); SioBat_SetupLoop (JP
    msgids 0x6D3/4/5 vs US 0x748/9/A); ClassStatsDisplay_Loop (JP drops GetClassReelName, 0x30→0x10 frame);
    StrInsertTact (recon-worker); StartEventBattle (seb-worker, LOCAL-prototype). **WRONG-ID:** sub_80CAEF4 is
    NOT Nop_Titlescreen_0 (that's a 2-byte bx lr) — it's a 101-instr JP-only tile-blit; do NOT name it Nop_*.
- 🛠 **SCALING METHOD (this session, +44): parallel carve-researchers → serial integration.**
  Dispatch 3-5 `carve-researcher` agents (read-only) in ONE message, each producing a complete
  build-ready recipe (verbatim fe8u C, all `#include`s grepped from JP `include/`, callee/data
  resolution + bind lines for JP-unnamed `sub_` callees, asm range, the `-mjp-promote` lever).
  The main thread (sole oracle) integrates each serially: apply → full `make compare` → commit on
  match / revert on NEAR. Hit rate ~60% (clean flag wins land first try; reg-alloc NEARs revert).
  Carved this session: FilterBattleAnimCharacterPalette, PointInCameraBounds, AiIsWithinRectDistance,
  MoveUnitExt, InitPlayConfig, GmMuPrim_TrackMovementDelta (+s16), GmMuPrim_GetMovementFacing,
  ColorFadeTickThumb, EventA7_WmUnitSetPosition, MuCtr_StartMoveTowards, MuCtr_InitDefinedMove,
  EventSetFogVisionExt, ForEachPosAtSinglePosition, Event88_WmScrollCameraOntoUnit,
  MoveUnit_, ChangeAiForPositions, Event3F_ScriptBattle.
- 🟢🟢 **PERMUTER PHASE IS LIVE & FAST — the flag-saturation reg-alloc NEARs are NOT a wall.** When a
  faithful port + `-mjp-promote` leaves a small reg-alloc/scheduling NEAR, decomp-permuter cracks it in
  SECONDS-to-MINUTES. Proven: **ComputeBattleUnitAttack** (base 15 → 0 @ iter 30) and **CheckCanSummon**
  (base 35 → 0 @ iter 149). **REPRODUCIBLE RECIPE (the critical detail is the flag):**
  1. near-match `_permwork/<Fn>.c` (the faithful flag near-match) + glabel'd `_permwork/<Fn>.s`
     (`.syntax unified` + `glabel <Fn>` + the asm body after `<Fn>:`, DROP the `.set`/`.section`/`.global`
     preamble so callees stay external relocs).
  2. `scripts/permuter/permute.sh import _permwork/<Fn>.c _permwork/<Fn>.s` (run from repo root; inputs
     must be INSIDE the repo or import.py errors "Can't find root dir").
  3. **CRITICAL: `sed -i 's#agbcc -mthumb-interwork#agbcc -mthumb-interwork -mjp-promote#' nonmatchings/<Fn>/compile.sh`**
     — without the flag the permuter searches stock-agbcc space and the base score is huge/unwinnable; WITH
     it the base score is the small flag-NEAR.
  4. `scripts/permuter/permute.sh bg nonmatchings/<Fn> -j 4 --stop-on-zero` (detached, survives turns; cap
     ~1 concurrent run, -j4 ≈ 4 workers — more OOM-starve).
  5. Extract the MUTATION from `nonmatchings/<Fn>/output-0-*/source.c` (it's the preprocessed source —
     diff vs the near-match to find the load-bearing change), apply it to a CLEAN `#include` version, carve.
     Mutations seen: split `x = a*3` → `x=a; x=x*3` (reg-alloc); wrap `return X` in `do{ }while(0)` (reg-alloc).
- ⚠️ Remaining decomp-permuter queue (faithful flag near-match known; same recipe). PRIME targets:
  - ✅ ComputeBattleUnitAttack (DONE — permuter) · ✅ CheckCanSummon (DONE — permuter)
  - **Event0E_STAL** (sub_800DD9C, 10B — proc r3↔r4)
  - **Event1B_TEXTSHOW** (sub_800E5CC, 6B — `ea` u16-narrow r0-temp vs in-place r1; + bind
    EventText_StartBoxDialogueMsg=0x0800E574)
  - **PutFaceOnBackGround** (sub_800663C, 16B — r4↔r6 loop-temps; + face.h:155 `int c`→`s8 c`)
  - **Event35_UnitClassChanging** (sub_801060C, 61B — larger, switch/class-data codegen; lower priority)
  - **GetPathFromMovementScript** (sub_8032AB8 — eval-order; faithful+split layout-shifted, reconstruct)
- 🟢 **PROVEN PLAYBOOK — the `-mjp-promote` flag-carve (D276c).** The pre-flag verification run
  (`/tmp/verify_results.json`, 42 PARTIAL near-misses) diagnosed many functions as
  "param-extension ORDER / decl-order / sign-vs-zero-extend" — i.e. unfixable by any C lever because
  it is *compiler behavior*. The `-mjp-promote` flag IS that behavior. Carve recipe (5-10 min each):
  port the faithful fe8u C verbatim → `src/<Fn>.c`, `git rm asm/sub_<addr>.s` + its gbadisasm tsv,
  add `layout/carved_rom.d/handdecomp_<Fn>.tsv` (`<start>\t<end>\tsrc/<Fn>.o(.text)\thanddecomp: <Fn>`)
  and `layout/baseline_syms_drop.d/handdecomp_<Fn>.tsv` (just the name), add
  `src/<Fn>.o: CC1FLAGS += -mjp-promote` to the Makefile per-TU block, `gen_layout.py` + full
  `make compare`. Carved this way this session: FilterBattleAnimCharacterPalette, PointInCameraBounds,
  AiIsWithinRectDistance, MoveUnitExt, InitPlayConfig (+ GetEventTriggerId). **Best targets = the
  remaining PARTIALs whose note says param-order / decl-order / extension scheduling.** Skip the
  ones noted "decomp-permuter target / intractable reg-alloc" (ColorFadeSetup*, Event0E_STAL,
  StartSubSpell_efxIvaldi*, ShopTryMoveHand r6/r7 cascade) — those are genuine reg-alloc, not flag.
  Traps: callees that are JP-unnamed sub_ (need a bind, e.g. PutFaceChibi) cost more; missing
  prototypes are -Werror compile fails (add the header, e.g. MoveUnitExt needed bmmap.h+bmudisp.h).
- 🔑🔑 **TWO major ceiling subclasses RECLASSIFIED from "unreachable" to "fixable" (D276/D276b)**, now served
  by a SINGLE agbcc with a **`-mjp-promote` CC flag** (D276c — built by `scripts/build_jp_agbcc.sh`, applied
  **PER-TU** via Makefile `CC1FLAGS += -mjp-promote`, like m4a `CC1_OLD` / Sram `-O1`). Default-off it is
  byte-identical to stock agbcc (the ~8077 normal TUs are unchanged). The flag gates two thumb-config knobs:
  (1) `PROMOTE_MODE` preserve sub-word signedness → **s8/s16-hold form** (TsaModifyFirstPalReverse,
  DrawNumberText_WithReset, UpdateLinkArenaMenuScrollBar); (2) `PROMOTE_FUNCTION_ARGS` → **arg-extension ORDER**
  (AddGorgonEggTrap — D275's flagship "impossible" fn). It ALSO dissolves downstream reg-alloc tiebreaks
  (UpdateLinkArenaMenuScrollBar's r4↔r7), LICM/IV-strength-reduction (GetEventTriggerId), and scheduling
  residuals (Sio_RasterRotatedBoxToWinBuf). **Campaign all promotion/extension/reg-alloc/LICM/scheduling
  ceilings this way**, each gated by full COLD `make compare`.
- The WINNABLE remainder also = **JP-divergent reconstruction** (rebuild from gbadisasm when the fe8u port is
  a structural mismatch — often a first-compile match) + localized signedness/int-widen/empty-if-hoist/
  scheduling levers + saturation-killed permuter NEARs re-run solo on a quiet machine.
- ⚠️ Still-open ceiling classes (test whether they too are agbcc thumb-config/flag knobs, D276): arg-extension
  ORDER, eager-vs-deferred, LICM hoist, cross-jump/tail-merge, reg-coalescing+DSE. Investigate the config,
  don't blind-grind.
- EXTRACTED DATA: 100% of the measured set (but data is ~94% of ROM; see Data frontier)
- NAMED SYMBOLS: 85.36% (13175/15435; capped by ~1611 asset labels fe8u itself doesn't name — structurally < 100%)
- **Batch + CI-incident (2026-06-24):** carved DisplayPage0/1, NewPopup2_PlanD, Loop6C_efxMagicQUAKE,
  UnitKakudaiMain, UnitKakudaiPrepareAnimScript, ParseBattleHitToBanimCmd (all `-mjp-promote` where noted;
  fixed 2 corrupt cfbind addrs: gBanimForceUnitChgDebug→0x0203E1A0, gBanimPositionIsEnemy→0x0203E104,
  gBanimMaxHP still TODO). ⚠️ **CI INCIDENT + LESSON:** StartEventBattle's `include/functions.h` isBallista
  u8→s8 SHARED-HEADER edit passed the warm `rm rom/elf` gate but CLEAN-BUILD-BROKE the ROM (12.7M-byte
  cascade) → CI red twice → REVERTED (restored 0-diff). **RULE:** any shared-header
  (functions.h/variables.h/struct header) or cfbind/data-bind commit MUST be gated with
  `make clean && make compare` (NOT warm `rm rom/elf`) + a `gh run list` CI check. Re-land such carves
  with LOCAL prototypes/structs, never a shared-header edit. The clean-recipe vein is now ~EXHAUSTED —
  even the 'self-cert leaves' EfxAdvanceFrameLut + AddAttr2dBitMap match the fe8u ELF but NOT JP
  (compiler-config PROMOTE/CSE/reg-pressure divergence). **[SUPERSEDED for AddAttr2dBitMap 2026-07-10: byte-exact via a zero-instruction BB separator.]** The tail is now: `-mjp-promote`/jp_agbcc
  config-NEARs, permuter-running reg-alloc NEARs (Tactician_InitScreen 320→125, SelectSummonPos,
  ClassIntro_Init, AdjustNewUnitPosition, StrInsertTact, SioBat_SetupLoop, EfxAdvanceFrameLut,
  AddAttr2dBitMap **[MATCHED 2026-07-10]**, ColorFadeSetup×4), reconstructs (Menu_OnIdle, SaveMenuExtrasMenuLoop, LoadUnit,
  BattleAIS_ExecCommands, PrepareBattleGraphicsMaybe), and corrupt-cfbind blockers (NewEfxHitQuake
  gEfxTerrainPalette→0x02016828, ekrGauge gBanimMaxHP).

#### Group A/B clean-fuel batch (2026-06-24, +5)
Carved **PutFaceChibi** (-mjp-promote s8 isFlipped + `gFace_1` bind @0x085B8F5C),
**HbMoveCtrl_OnIdle** (s8 boxMoved + -mjp-promote), **Sio_ReadPacket** (-mjp-promote s8 playerId,
extern sio_core statics), **GenerateBestMovementScript** (-mjp-promote), **DrawUiFrame2**
(-mjp-promote s8-spill collapse). Clean-port yield has dropped to ~45% — the tail is filling with
reg-alloc NEARs. NEW NEARs added to backlog (mostly PERMUTER-RESISTANT body reg-swaps, NOT
register-pin-fixable): **SioBat_SetupLoop** (+48B, r5-base-cache vs extra callee-saved r7),
**WriteNewGameSave** (+44B, agbcc won't OVERLAY GameSavePackedUnit+Dungeon[2] onto one stack slot —
frame 0x54 vs JP 0x38), **StrInsertTact** (r4↔r5 src/dst, permuter 375→125 no-zero),
**AiAttemptStealActionWithinMovement** (r4↔r5 gBmMapSize.y index reg), **Menu_OnIdle** (region-diff:
JP INLINED ClearMenuBgs — reconstruct, not a NEAR). Two NEEDS-SERIAL-INTEGRATION items (1-step each,
integrator-only): **StartEventBattle** (sub_8012038 — ONE instruction: needs
include/functions.h:79 isBallista u8->s8 + -mjp-promote, but that regresses the committed caller
Event3F_ScriptBattle which must be re-matched in the SAME commit; ZERO binds otherwise, recipe was at
/tmp/StartEventBattle.c.recipe) and **PutUnitSpriteIconsOam** (data_080DC8B0 residue split at 0DC940).

#### 0x80B opinfo/difficulty/bonus/ending cluster (2026-06-24, +5)
Carved **ClassIntro_LoopOut** (LOCAL OpInfoEnterProcJ struct — JP opinfo procs use local workaround
structs, NEVER edit shared `include/opinfo.h`; iconProc@0x5C/parentProc@0x60/classReelEnt@0x64,
letterProcs[10] inline@0x34, mod/div const 6, bound classReelEnt->unk_0C),
**DifficultySelect_Loop_KeyHandler** (UP-path goto restructure), **InitDifficultySelectScreen** (JP
applies TSA via `CallARM_FillTileRect` directly, no Decompress staging — a recurring JP-uncompressed-asset
pattern, also in ChapterStatus_Init/SoloEndingBattleDisp_Init), **BonusClaim_StartSelectTargetSubMenu**
(5 JP deltas: DrawUiFrame2 dims, win0_left, cursor coords, tm+16, PutNumber col, msgid 0x308->0x28F),
**SoloEndingBattleDisp_Init** (drops 2x Decompress + msgids 0x4CC-0x4CE + fixed-col PutNumber).
ADDED to the permuter backlog (codegen-shape NEARs, NOT const fixes): **HandleTurnRecordText**
(sub_80BC2A4, 44B short, y/textIndex r4/r8-vs-r6/r9 + tilemap-col factoring), **ClassStatsDisplay_Loop**
(sub_80B8B28, JP REVERSES the gauge-pip loop + spills i+1/&unk_34/&unk_35 each outer iter, ~121 opcodes
diff, permuter base 3885->1450). INTEGRATOR gotcha: do NOT rm+rebuild data objects
`menu_save_main_bg` / `worldmap_gmapunit_p1634` in a worktree — regenerating their `.s` shifts
`frontier_df4_menu` gap-packed `.rodata` by 8 bytes (breaks savemenu/difficulty palette literals); the
forced-clean gate must `rm` only `fireemblem8.gba`/`.elf`, never the `.o` cache.

### PIVOT: permuter campaign is now the highest-leverage move (2026-06-24)
The clean-recipe engine drove matching-C 8150→8298 (+148 over the session); yield has dropped to ~50%
as remaining functions hit agbcc CSE/reg-alloc divergences that `-mjp-promote` does NOT fix. The next
leverage is a PERMUTER CAMPAIGN on the ~17-function NEAR backlog (many byte-close). BLOCKER to fix
first: the decomp-permuter `compile.sh` (a) resolves its root to the shared MAIN repo not the worker's
worktree, (b) uses bare agbcc WITHOUT `-mjp-promote` (wrong codegen space — base score huge), (c) its
`run` deletes `src/F.c` from the MAIN tree (not parallel-safe). FIX: make `permute.sh` import/run
operate relative to an explicit root (worktree), and always `sed`-patch `compile.sh` to
`agbcc -mthumb-interwork -mjp-promote`. Then run `permute.sh bg <dir> -j4 --stop-on-zero` per NEAR.
CLOSEST NEARs first (best permuter ROI):
- **EkrLvup_InitStatusText** — 1 instruction (`adds r1,r0,#0` move agbcc won't emit; near-match
  preserved `/tmp/banim-ekrlvup_08075A08.NEAR.c`).
- **EkrDragonBodyAnimeMain** — 4-byte literal-pool flush/pad.
- **Event26_CameraControl** — 3B sc2-first scheduling.
- **Event1B_TEXTSHOW** — 9B.
- **Event0E_STAL** — 10B.

Heavier: ChapterStatus_Init (gGenericBuffer-CSE-into-r4, +16B), EkrDragonQuakeMain (r6↔r7 + CSE),
AdjustNewUnitPosition (39B), SallyCir_Loop, GmapScreen2_Loop, GMapScreen_UpdateScroll, GmapEffect_0,
Event18/35/A8, OpAnimFaceMontageBegin, Event0F.

**Permuter campaign round 1 (2026-06-24): +8 cracked** — EkrLvup_InitStatusText (135), EkrDragonBodyAnimeMain
(35, the 'pool-flush' premise was a DCE'd dead-copy), Event26_CameraControl (manual `register int asm("r0/r1/r2")`
arg-order pin — permuter alone plateaued 105), EkrDragonQuakeMain (r6↔r7 via do-while removal),
Event35_UnitClassChanging (2000→0), ChapterStatus_Init (permuter-as-diagnostic found a REGION-DIFF: JP
CallARM_FillTileRect directly, skips Decompress staging), SallyCir_Loop + GmapEffect_0 (deterministic
-mjp-promote, NOT actually permuter). PLATEAUED (genuine reg-alloc ceiling, need a stronger profile next
session; WIPs in _permwork/*.wip): Event0E_STAL (10B proc/subcode r3↔r4), Event1B_TEXTSHOW (6B evArgument
widen-scratch), AdjustNewUnitPosition (base810→185, 4-way reg perm). LEVER TRIAGE: arg-MOVE-order residual →
manual `register int asm("rN")` pins (permuter can't); BODY callee-saved reg-SWAP → pins make it WORSE; always
retry `-mjp-promote` before importing (cracks sign-domain NEARs deterministically). The worktree permuter is
parallel-safe (3 workers -j4, no OOM) with the documented import.py-direct + compile.sh -mjp-promote two-step
plumbing.

### Vein status (2026-06-24) — battle-anim efx
Verified vein-exhaustion + technique notes so future sessions don't re-dispatch teams at dead veins.
- **The two clean efx fingerprints are EXHAUSTED in still-asm** (verified by a full `asm/` sweep):
  (a) the **"BG-scroll shake loop"** (`GetAnimPosition` + `gLCDControlBuffer.bgoffset[N].x` ± delta +
  timer/terminator/`Proc_Break`), and (b) the **"frame-LUT BG-loop"** (`EfxAdvanceFrameLut` + conditional
  `SpellFx_RegisterBgGfx` + `WriteBgMap` / `ClearBG1`). The 4 carved members were `sub_80661EC`,
  `sub_8066E40`, `sub_806166C`, `sub_8070724`. **No clean instances remain.**
- **The `StartSubSpell_efx*` proc-spawner class is ~EXHAUSTED: 171/172 bodies carved.** Only THREE remain,
  all **FIELD-WRITERS** (lower confidence — need `-mjp-promote` + the `make compare` oracle):
  - `StartSubSpell_efxIvaldiOBJ1` (JP `0x08068600`)
  - `StartSubSpell_efxIvaldiOBJ2` (JP `0x08068738`, GNU computed-goto = high codegen risk)
  - `StartSubSpell_efxMaohFlashThunderOBJ2` (US `0x08067400`; JP addr needs an IDA pin via an
    `EfxCreateFrontAnim` xref)
- **Carved this session via the researcher→worker→serial-integrate engine: +13** — the 4 fingerprint fns,
  5 demonlight Eye spawners, `EfxTriangleQUAKEMain`, `sub_805DE74` + `sub_8055F90` reconstructs, and
  `StartSubSpell_efxNaglfarOBJ2`.
- **Techniques worth keeping:**
  (i) function-local `u32* tbl[N]` AnimScr arrays in JP spawners are **JP-specific addresses** — read the
  rodata blob straight from `baserom.gba` at the pool literal as a **3rd ID signal**, and bind/extern them
  (split the carved data-gap TU, e.g. `frontier_df4_misc_lo`, if the rodata lands wrong);
  (ii) **alias-by-name spawners** (the name is a `baseline_syms_drop` rename alias, and carved callers
  already `bl` it) need **NO caller rewire** — just drop the alias + add the C TU;
  (iii) **ALWAYS re-verify callee names against `layout/baseline_syms.tsv`**, not behavioral guesses —
  e.g. `sub_8001EE4` = `EnablePaletteSync`, NOT `EnableKeyComboResetEN`; a misID fabricates a false
  region-diff;
  (iv) **`fe6j/src/banim_efxmagic.c` is the reconstruction byte-shape source** for fe8u-absent efx idioms;
  mind fe6j `s16`/`s8` → JP `ldrh`+`lsrs` (unsigned read) to avoid `asr`.
- **Next veins (not yet swept):** the secondary larger **region-diff efx dispatchers** (`sub_80705E8`,
  `sub_8067040`, `sub_8067160`, `sub_8070A4C`, `EkrDragonBodyAnimeMain`/`sub_807949C`, `sub_806A41C`)
  and the **worldmap `Gm*` / AI `Ai*` helper families**.

### Vein status (2026-06-24) — worldmap Gm*/opanim/savedraw/SIO
Carved this session: GmapLineFade_0, GMScreenVSync_Loop, GmFindPath cluster (3, incl. permuter on
GmFindPath + gUnk_12 alias fix 0xF7FF9A04→0x0201B100), GmapRmUpdateExt_ScrollPosition,
OpAnimFaceMontageBlendOut, SaveDrawCursor_Loop (lut bound from baserom @0x081F57F1, NOT re-emitted),
DrawGMapPIPanelAtHeight (width 13→12), SioHandleIrq_Serial (0x1288→0x1286), SioTeamList_1/2
(gSioMain2_1 alias fix 0x20013144→0x080DED3D).
- **Vein depth remaining:** worldmap band ~14 still-asm (now fewer), SIO band ~7, save band 1;
  **name-entry/kana has NO fe8u twin** (reconstruct-only).
- **Reusable technique — stale EWRAM-alias detection:** a `jp_syms`/baseline `.set NAME,0x20xxxxxx`
  whose function pool literal is `.4byte 0x08xxxxxx` AND funcmap says ROM-exact = STALE alias; fix it
  before carving any data-reader (hit on `gUnk_12` and `gSioMain2_1`).

### Vein status (2026-06-24) — eventscr Event-dispatch
- **eventscr.c Event-dispatch vein (2026-06-24):** of ~10 still-asm Event handlers, CARVED this session:
  Event25_ChangeMap, Event27_MapChange, Event2C_LoadUnits, Event01_End, LoadUnit_0,
  EventLoadUnitSliently (+ earlier Spline_SetupChannels). The eventscr clean-port vein is now nearly
  exhausted. REMAINING are reg-alloc/scheduling NEARs (need a permuter campaign or an agbcc tie-break
  lever, NOT clean-port workers): Event0E_STAL (sub_800DD9C, r3↔r4 swap, ~10B), Event18_ColorFade
  (sub_800E1FC, spill-pattern/frame-size), Event26_CameraControl (sub_800F41C, **3-byte** arg-scheduling
  sc2-first — CLOSEST), Event35_UnitClassChanging (sub_801060C, argv-read reorder/reg-perm),
  Event1B_TEXTSHOW (sub_800E5CC, **9-byte** ea-zero-extend-via-scratch + zeroFlag re-materialize; KEEP
  the case-3 inline-asm trick), EventA8_WmUnitMoveFree (sub_800C994, sl/r8-vs-ip/r7 cascade — and it OWNS
  the poisoned-alias fix below), Event0F_CounterOps (sub_800DE3C, r4↔r5). Best permuter targets first:
  Event26 (3B), Event1B (9B), Event0E (10B).
> [SUPERSEDED 2026-07-03 — Bravo] **Event1B_TEXTSHOW (sub_800E5CC) is MATCHED byte-exact and banked
> to main** — this RETRACTS every "9B/6B NEAR / KEEP / non-matchable" call for it throughout this log
> (incl. the earlier "Event1B_TEXTSHOW — 9B", "6B evArgument", and "9-byte ea-zero-extend ... KEEP"
> mentions). Fix: `int evArgument` (not `short`) makes stock agbcc hold the sign-extension ->
> reproduces the JP `ldrsh`, residual -> 0. decomp.me OqAJ4 = SOLVED@0. Companion wall-break:
> **Event2F_MoveUnit (sub_800FF08)** matched byte-exact w/ `-mjp-promote` (scratch jeBp5 documented
> CARVED-IN-REPO / non-SOLVED — decomp.me stock agbcc lacks the flag).

### Vein status (2026-06-24) — 0x800–0x808 clean vein
- **0x800–0x808 clean vein (2026-06-24, +14 more):** carved ApplySepiaToPaletteBuffer,
  NewPopup_VerySimple (JP popup-opcode enum SOUND=0xA/COLOR=6/MSG=4 ≠ US), AiFindTargetInReachByFunc,
  AiFindTargetInReachNeglectWallByFunc, AiRandomMove (cp_utility AI map-scan idiom = reliable clean
  vein), MuCtr_StartDefinedMove, MuCtr_GenMoveScript (JP terrain-guard ==1 not !=0), MoveActiveUnit
  (extern-inline GetUnitCurrentHp/GetUnitMaxHp lever CRACKED the long-standing 99B NEAR), SortMus,
  AutoGenerateUnitdef+SetupAutoGeneratedUnitdefs (the −8 divergence is BSS-base-only — struct field
  offsets are US-identical), AutolevelSecondaryLord, Text_DrawNumberOrSpace (JP SJIS fullwidth-zero
  0x4F82), SioWeaponSelectMenu_Draw. Per-band still-asm depth (clean fuel remains): 0x801=19,
  0x807=~20, 0x803=~12, 0x808=~6. Technique: masked-layer / graduated-accessor / handdecomp TUs
  already supply many callees (CopyEventMoveREDAs, GetItemHpBonus, GetStringFromIndex, etc.) —
  re-check `git ls-files src/` before flagging NEEDS_ALIAS (collapses phantom binds to zero).
- **0x801–0x807 clean vein (+8 more):** carved GenerateSummonUnitDef (gSummonConfig JP=0x089CFD18; the
  'suspect' addr was just the US funcmap column), RefreshUnitStealInventoryInfoWindow, AiTryMoveTowards +
  AiTryMoveTowardsNeglectWall (cp_utility.h `unk` param u8->s8, byte-neutral across callers),
  AiBallistaRideExit, GetPathFromMovementScript, EkrPalModifyUnused, RegisterEkrDragonStatusType (JP omits
  7 fe8u guards in the MANAKETE_MYRRH arm — region-different reconstruct). IMPORTANT LESSON: three prior
  'dead-end' flags were DEBUNKED this round — GetPathFromMovementScript ('eval-order reconstruct'),
  EkrPalModifyUnused ('193B structural fail'), AdjustNewUnitPosition ('structural fail') were all
  -mjp-promote / loop-invariant-cast-hoist / stack-spill issues, NOT structural. Treat ALL
  'structural/dead-end' flags as PROVISIONAL — re-attempt with -mjp-promote + cast-hoist before deferring.

### Vein status (2026-06-24) — 0x801–0x80B clean vein
- **0x801-0x80B clean vein (+9 more):** carved the bmidoten range-gen cluster
  (GenerateUnitCompleteAttackRange/StandingReachRange/CompleteStaffRange via `static inline`
  MapAddInBoundedRange+SetWorkingBmMap), ShopTryMoveHand ('r6/r7 cascade' flag DEBUNKED — just
  -mjp-promote), WmMain_MoveCursor (do-while→if reg-alloc fix), BallistaRangeMenu_Draw (load-bearing
  missing return), GenerateSummonUnitDef, RefreshUnitStealInventoryInfoWindow. NEW INTEGRATION TRAP:
  when a carve `static inline`s a helper that is ALSO committed out-of-line
  (MapAddInBoundedRange@0x0801B674, SetWorkingBmMap@0x0801B668), a botched inline emits a SECOND
  out-of-line copy → CATASTROPHIC full-ROM layout shift (12.6M diff bytes), and an incremental worktree
  build can stale-OK-mask it. SAFEGUARDS: (a) `nm src/<fn>.o` must show the helper as `U` not `T`;
  (b) integrator gate = FORCED-CLEAN `rm -f fireemblem8.gba fireemblem8.elf && make compare`; (c) workers
  must stay in their worktree (never cd to the shared main checkout). The D99 integrator
  full-make-compare caught it; reverted + re-dispatched cleanly.

### Vein status (2026-06-24) — 0x802/0x807/0x80B batch
- **0x802/0x807/0x80B batch (2026-06-24, +7):** carved **DrawPrepScreenItemUseDesc** (data-alias a shared
  rodata thlut instead of splitting the gap), **GenerateMonsterLevel** (`-mjp-promote` + `gMonsterLevelWeights`
  bind), **EkrHenseiEnd_FadeOutLoop**, **EfxSkillType01BGMain** (dropped a loop + a call = 0x2C shrink),
  **EkrDragonSetBgAndFrontPos** + **BanimUpdateSpriteRotScale** (`-mjp-promote` s16 x/y),
  **ClassInfoDisplay_Init** (opinfo LOCAL ClassReelEntJ struct + `gOpinfo_0` extern-bind @0x081F5900 + several
  committed syms sit +4 past the asm literal because the gfx skip a 4-byte LZ77 header — bind distinct aliases
  at the TRUE asm addrs; `gUnk_4`@0x0200A2D8). **BLOCKED** (needs SERIAL integration, not parallel-safe):
  **PutUnitSpriteIconsOam** (sub_802758C) — C is correct + compiles + .o has the right `rescuePalLut` .rodata,
  but those 6 bytes must land at 0x080DC940 which is inside the committed shared data residue TU
  `data_080DC8B0` (range 0DC8B0–0DC948); splitting it shifts the .rom packing (+0x10 VMA). The integrator
  must split `data_080DC8B0` at 0DC940 and re-verify .rom packing in a single serial step.

### Cross-cutting facts (corrections discovered 2026-06-24)
- **ChangeUnitSpritePalette (0x0800BFC8) and RestartBattleMap (0x08030E94) are ALREADY committed C globals**
  (src/ChangeUnitSpritePalette.c, src/bmio_08030E94.c) — bind them ZERO times; adding a bind = multiple-
  definition link error.
- **Poisoned alias StartGmapAutoMu_Type1:** layout/baseline_syms.d/cfbind_eventscr_gmap.tsv line 21 has an
  impossible 0x07E72DA4 → real target 0x080C818C; this fix only lands WITH a future EventA8_WmUnitMoveFree
  carve (it owns that bind).

#### Deferred reg-alloc NEARs (need a lever find or fresh permuter seed — NOT clean-recipe targets)
Do NOT spend a clean-port worker on these — a faithful fe8u port + `-mjp-promote` lands a small NEAR
that current levers don't close. They need a register-allocation lever discovery or a fresh permuter
seed, not another port attempt.
- **GmapScreen2_Loop** @0x080C05C8 — JP allocator spills `chr` to a 0x14 stack frame + keeps `proc`
  in r9; agbcc uses a 0x10 frame + registers. permuter (jp-promote, ~46k iters) plateaued at 1745
  (best 536/544 bytes). Needs a lever forcing the `chr` stack-spill.
- **GMapScreen_UpdateScroll** @0x080BF73C — 3-way reg permutation (r9/r5/r7 vs sl/r7/r5) + one
  `str [sp,#8]` reorder; permuter plateaued 245.
- **GmapEffect_0** @0x080C5F68 — clean reg permutation (JP i=r6/ptr=r4 vs agbcc r7/r5); permuter
  1315/1650. Needs `gWorldmapEffect_0` data bind + baseline alias drop when solved.
- **OpAnimFaceMontageBegin** @0x080CDCCC — blocked by a shared opanim `.text` +8-byte region shift
  (`OpAnimEphraimExit.o`/`OpAnimDarken*` land 8 high); needs a SERIAL fix of the shared opanim region
  + `cfbind_opanim-main.tsv` garbage Face rows, not a parallel carve.
- **AdjustNewUnitPosition** @0x0807C8DC (sub_807C8DC) — 39-byte reg-alloc NEAR (body VERIFIED correct,
  prior "structural fail" flag DEBUNKED; JP allocates iy→r2/ix→r4/yCur→r5 vs agbcc r5/r3/r4); reaches
  correct 308B length under `-mjp-promote` + explicit s8 x/y locals; permuter target (patch compile.sh
  with `-mjp-promote`).

Also in the 0x080C band remaining: **Nop_Titlescreen_0** @0x080CAEF4 + **Title_Loop_LightExplosionFx**
@0x080CB114 are hard RECONSTRUCTs (US is a no-op stub / JP adds a banner ladder) — likely permuter.

### How the remaining ~193 are carved (D275 — the current playbook)
Every *named* game function is already carved; the frontier is the ~426 `asm/sub_*.s`, region-different
in **codegen** (JP built from a different compiler/source than fe8u, so a verbatim fe8u-C port reproduces
the logic but not the bytes). They are cracked **per function** with the agbcc lever kit, verified in
isolated worktrees by carve-workers and integrated serially through the single `make compare` oracle:
- **signedness cast** at the shift/load site (`(s16)/(s8)/(int)` ⇄ `(u16)/(u8)`) — flips `asr↔lsr`,
  `ldrh↔ldrsh`. Caveat: a cast whose result only feeds `!=0`/a narrow store collapses back to `lsr`.
- **int + `(s16)` cast** — `int v; v = (s16)(...)` keeps field loads `ldrh` while sign-extending in-reg
  (use when the signed value is reused). [SetCRSpellBgPosition]
- **int-local-widen** — `int v = (s8)field;` hoists a loop-invariant sign-extend to one entry op.
  [PrepItemScreen_DrawVisibleUnitNames]
- **empty-if hoist** — `if (param){}` (one per arg, in order) forces arg-evaluation ORDER.
  [GmMu_SetBlendEnabled, GmapRmBorder1_PutSpriteAll]
- **TU-local macro-shadow prototype** — give a callee an `int` arg in ONE TU without touching the shared
  header or the callee's own s8 body (parallel-safe).
- **decomp-permuter** for genuine reg-alloc/scheduling residual.
- **~~CEILING~~ → SOLVED by `-mjp-promote` (D276b):** the arg-extension REORDER once thought
  "agbcc-impossible" (params extended in declaration order in-place) is exactly what the
  `-mjp-promote` flag now produces. **AddGorgonEggTrap — D275's flagship "impossible" example —
  byte-matches under the flag.** The only remaining genuine ceiling is *free* reg-alloc tiebreaks
  (not promotion-driven) and instruction scheduling that the flag doesn't touch → decomp-permuter,
  not a structural wall. 100% matching-C is NOT believed unreachable anymore.

> ⚠️ **KNOWN TOOLING BUG — `layout_frag.py write`.** The `layout_frag.py write <task> <manifest> <row>`
> CLI deletes that task's fragments in the OTHER manifests (`write()` iterates all MANIFESTS, removing
> rowless ones). When a carve needs BOTH a `carved_rom` AND a `baseline_syms` fragment, write them in a
> **single `layout_frag.write()` python call**, NOT two CLI calls (the 2nd wipes the 1st → 16MB-overflow build).

## Code frontier — priority order (USER-DEFINED, JP-area-first)
The remaining matching-C work is JP-only / JP-divergent code that **cannot be ported from fe8u** and
needs real reconstruction (asm → behavior → idiomatic C → byte-match). Work these areas first:
1. **sio / link-arena** — link/multiplayer arena (`sio_battlemap`, `sio_uiutils`, `LinkArena*`)
2. **name-entry / kana** — JP kana name-input screen (JP-exclusive UI)
3. **debug / augury** — `bmdebug` + the 占い/augury fortune feature
4. **worldmap** — `worldmap_*`
5. **save / 周回** — save menu + New Game+/周回 (`savemenu`, `savedraw`)

## How to find REAL targets (ground truth — NOT the stale tsv lists)
The unmatched frontier = functions whose `.text` still comes from `asm/` (what calcprogress counts):
- **16 `asm/sub_*.s` stubs** — the current permuter-bound frontier (see "Code frontier — the 16 permuter-bound functions" later in this doc).
- plus any named region-diff `.s` and functions still inside the `asm/baserom.s` incbin.

A target is REAL **iff** it is still in `asm/` (a `sub_<H>.s` exists, or still in the baserom incbin)
and is **not** already a `src/*.c` (including carved-as `src/<module>_<addr>.c`). Before dispatching a
team, **spot-check a sample** — if they're already carved, the list is stale; fix it first.

### Ground-truth reality check (2026-06-22) — the remainder is HARD, not a sweep
The 432 `sub_*.s` stubs (2026-06-22 snapshot; the frontier is now **16** — see the authoritative 2026-07-03 six-axis table below) are **scattered across all ROM regions** (0x080Axxxx:65, 0x0800xxxx:55,
0x080Dxxxx:44, …), **mostly UNNAMED** `sub_<hex>`, and **region-different**. The JP "areas" above
(sio, name-entry, augury, save) are **already largely carved** under `sub_<addr>`/`module_addr` names
— so they are a *priority lens*, not a pool of easy named ports. The fe8u-module subsystem-sweep
approach is EXHAUSTED (a 6-team sweep this session produced ~0 net-new matching-C). The remaining work
is **function-by-function reconstruction** (IDA/Ghidra decompile → idiomatic C → byte-match, playbook §9)
plus **decomp-permuter-agbcc** for the reg-alloc/instruction-order near-misses. Dispatch SMALL bounded
batches of specific `sub_<H>` addresses, not module names. The big parallel lever left is the **data
frontier** (data is ~94% of ROM; port fe8u `scripts/gfxtools/`).

### ⚠️ Pitfall (do not repeat)
`layout/nofuncmap_region_*.tsv` is a **stale, un-pruned classification cache**: it lists ~3,926
entries but only 16 are truly unmatched (≈240× inflated; addresses for region-different entries are
also stale/wrong). **Never define a work frontier from it.** Reconcile any scope discrepancy against
calcprogress (16) before spending team effort. Regenerate via `scripts/classify_nofuncmap.py` if the
canonical lists are needed, but the `asm/sub_*.s` set is the authoritative remainder.

## Data frontier (future — data is ~94% of the ROM)
- Port fe8u `scripts/gfxtools/` (tsa_generator.py) — FE8J Makefile feimg/fetsa rules are already wired
  → unblocks btl_bg + worldmap graphics (bulk of graphics volume).
- JP Huffman **text tree differs from US** → re-encode or named-incbin; biggest data target.
- Port the `dump_*.py` family + `scripts/texttools/`. See `docs/fe8u_decomp_history.md` for the order
  fe8u extracted data and the pitfalls (palette bit-15 0x7FFF, gbagfx flags, mid2agb caveats).

## Genuine exclusions (not winnable as C)
Hand-written asm (`arm.s`, `arm_call.s`, m4a `m4a_1.s`, Sram fast funcs) + ARM-mode funcs + libc/libgcc.
These stay as asm by design; do not grind them.


## Extractable-.bin sweep (D329, waves 32-37) — user "still many extractable .bin in data/"
The audit MISS metric under-counts extractable .bin (only fe8u-basename matches). nm ENCLOSING-symbol scan found ~150 more: ~105 pointer/mixed tables carved to `.4byte Sym+off` + ~78 orphan .bin removed (repoint_table leftovers, byte-neutral). **audit UNCERTAIN 467→347** (MISS 7, FLOOR 1381). Final scan: 0 raw pure-pointer tables, 0 data/residual orphans remain — mechanically-extractable frontier exhausted. Remaining ~347 UNCERTAIN = opaque data_*/gap_ residues (legit incbin), fontgrp font data (font domain), .map.bin tilemaps (FLOOR), JP-frontier blobs (JP-unique), ~9 hard even-into-code tables. Also fixed main-CI btl_bg parallel-race (#110, &: grouped targets) + completed stale PR #79.


## Extractable sweep COMPLETE (D330, waves 38-39)
fontgrp SJIS fonts (2616 glyphs → typed `struct Glyph[]`, largest extractable) + 6 straggler blobs (palette configs/AP motion/menu) carved. **audit UNCERTAIN 467→330** across waves 32-39. Final scan: 0 structured tables, 0 orphans remain — mechanically-extractable frontier exhausted. Remaining ~330 = JP-unique opaque residues (no fe8u twin, legit incbin), broken-LZ, hard ceilings. Every .bin with a clear fe8u editable form is extracted.


## Frontier VERIFIED exhausted (D331, wave 40)
wave40: 17 fe8u-typed-twin blobs carved (LUTs/REDA/terrain/SoftReset). **audit UNCERTAIN 467->313 across waves 32-40.** Exhaustion verified 3 ways: 0 structured tables, 0 orphans, 0 fe8u-typed-twins (2 remaining named = broken-LZ + region-diff floor). Every .bin with a fe8u editable form is extracted; remaining ~313 = JP-unique opaque/frontier (no fe8u twin, legit incbin) + floor.

## D331 was INCOMPLETE — two categories the 3-angle scan missed (waves 41-42)
The wave-40 "exhaustion" checked pointer-density, orphans, and fe8u-typed-twins but NOT (a) compressed
blobs or (b) pointer tables misfiled under `graphics/frontier_df*/`. Both yielded real extractions:
- **wave41 (PR#122, D332): 19 concatenated JP-LZ (byte0=0x10) frontier blobs → 13 .png + 2 .pal + 18 .map.bin.**
  UNCERTAIN 313→294. 22 byte0=0x10 skipped genuine (13 trailing-raw non-reducing tails, 7 no-sink sheet sizes,
  2 invalid-LZ). Compression-header sweep: byte0=0x20 (×11) are INVALID Huffman (low-nibble 0, gbagfx rejects)
  = opaque structured data floor; 0x02 mostly non-tile data. LESSON: extractability MUST scan compression
  headers (0x10 LZ, 0x24/0x28 Huff, 0x30 RLE), not just pointer density / symbol twins.
- **wave42 (PR#12x, D332): 9 mixed data+pointer frontier tables (misfiled in graphics/frontier_df*/) →
  relocatable `.4byte Sym` word-streams.** menu_020/003/004, uistuff_024/031/032, df3_data_5aa96c_003,
  df3_ending_000, ending_001. UNCERTAIN 294→285. menu_018 skipped (0 ROM pointers = pure data floor).
  Fixed an ABS-symbol shiftcheck edge: a reloc `S+addend` is HIGH iff its VALUE equals any symbol start
  (base irrelevant); ABS/sym_jp globals shadowing a real blob symbol must stay raw literals.
- **wave43 (DONE, PR#12x): 11 coherent small data/residual pointer tables → relocatable `.4byte`.**
  UNCERTAIN 285→274. 11/11 carved (2 had over-captured tails living only in dead excluded-asm → byte-neutral
  head-only carve). This was the LAST mechanically-carveable batch (files/wave43_candidates.txt).
- **Honest remaining floor:** coordinate/affine data, byte0=0x00 opaque (85), invalid-Huffman structured (11),
  JP-unique frontier data with NO fe8u twin → fe8u would also incbin → satisfies "unless also .bin in fe8u".

## wave44 (DONE, D334): truncated/split JP-LZ mis-carves fixed — the D331/D332 "exhaustion" missed these
User asked why Ch9Events.bin (and similar) remained. They were split fragments of larger JP-LZ compressed
graphics streams (Ch9Events = first 80 B of a 28753 B map-gfx stream), misfiled as "invalid-LZ floor" because
the sweep only gbagfx'd the truncated first fragment. Fixed 4 (gGfx_OpSubtitle_05, gTsa_OpSubtitle_03/05,
Ch9Events) → merged to .png/.4bpp.lz/.bin.lz (3 recompress byte-exact; gTsa_05 pinned). 8 raw .bin removed,
MISS 7→6, UNCERTAIN 274→270. Detection rule now: decode the FULL ROM LZ stream, compare consumed len vs .bin size.

## waves 45-49 (DONE): drained the remaining reducible .bin; .lz now BUILT from source
- **wave45 (PR#126):** multi-signal extractability re-scan (pointer-density + fe8u-twin + compression-header)
  drained MISS 6→2 (font_cc_078, banim_b_031/085, chap_title_115, misc_lo_015). The 2 residual MISS are
  content-verified TSA tilemaps mislabeled by the audit's 1200-byte-locked detector = genuine FLOOR.
- **wave46 (PR#127):** 27 data/residual pointer tables → `.4byte Sym+off`. UNCERTAIN 270→243.
- **wave47 (PR#128):** decomposed 4 LZ-hybrid blobs; 11 heterogeneous opaque tails skipped (audit-neutral).
  UNCERTAIN 243→239.
- **wave48 (PR#129):** 9 string-pool/u16-table residuals → `.asciz`/`.short`; 3 Thumb-code gaps deferred to disasm.
  UNCERTAIN 239→234.
- **wave49 (folded into #129): `.lz` must be BUILT from source, never committed.** gbagfx reproduces the JP
  compressed bytes except a trailing 4-byte-alignment pad (`tools/gbagfx/lz.c:136-143`); the 4 pinned `.lz` were
  replaced by decompressed sources + build rules that gbagfx-compress then `truncate -s <JP_len>`. 0 committed `.lz`.

## Session PRs #130-#138 (DONE): pointer + code frontier, not .bin count
The .bin count held (these carve real code/pointers out of source-form data, not raw blobs):
- **#130** decomp.me stale-scratch prevention (D335). **#131** 606 pure-`__asm__`-wrapper `.c` → real `.s` (D336).
  **#132** removed redundant `_permwork/`. **#133** honest data metric (`EXTRACTED DATA (C/PNG-SCOPED)` 79.91%
  kept + new `SOURCE-FORM DATA` 99.26%).
- **#134 hardptr:** ~1809 hardcoded `0x08XXXXXX` ROM pointers → relocatable `Sym+off` across 28 files;
  **`audit_pointers.py --true-debt --gate` 100 → 1** (residual 1 = fe8u-confirmed coincidental constant
  `0x080896ED`, correctly NOT force-relocated).
- **#135 gap-disasm:** 6 residual `data/residual/gap_*.bin` were real Thumb CODE → disassembled AND decompiled
  to byte-exact C (`ProcCmd_CALL_ROUTINE_ARG`, `StartSqMask`, `DrawDifficultySprites_Loop`, `PutTmSized`,
  bmmenu handlers). 6 code-as-data `.bin` eliminated. UNCERTAIN 232→226.
- **#137 forkinteg:** 8 community-matched decomp.me forks (TsilaAllaoui) → byte-exact C; documented 11 named
  agbcc match levers **P1-P11** + escalation checklist in `docs/agbcc_codegen_levers.md §12`.
- **#138 frontier-procscr:** 54 Shop/Arena ProcScr function pointers embedded as raw `.byte` in
  `frontier_df4_menu_037/038` → relocatable `.4byte Sym+0x1` (coincidental constants + the 038 descriptor
  table's 72 mostly-coincidental words correctly SKIPPED for a future typed data-extraction task).

## CURRENT STATE (authoritative, 2026-07-13, main 5b35c7635a847b70cca70f4bff77418801a209b6 — exact-SHA CI/Pages + secret scan GREEN)
- **`.bin` frontier: MISS=3 / FLOOR=1401 / UNCERTAIN=226** (`FE8U=../fireemblem8u python3 scripts/audit_bin_forms.py`).
  The 3 MISS are documented TSA-tilemap/string-pool floor (audit basename false-positives).
  **[refreshed 2026-07-10, D360: live `docs/bin_audit.md` now reads MISS=0 / FLOOR=1407 / UNCERTAIN=34. The 3
  false-MISS (`frontier_chap_title_115b`, `frontier_df4_misc_lo_015`/`_016`) are now correctly FLOOR via audit
  rules 0c/0d (MISS 3→0); the ~7 PNG asset-editability extractions (WmHightLightMap6/8, menu 016/018/035/036/001)
  removed their raw `.bin`; `frontier_ending_cg_000_B27970` is RE-complete → resolved verbatim-`.bin` ceiling
  (stays UNCERTAIN — JP-exclusive, no fe8u twin). `bin_audit.md` is the live miss-tracker.]**
  **[refreshed 2026-07-10, D361: live `docs/bin_audit.md` now reads MISS=0 / FLOOR=1407 / UNCERTAIN=33 /
  TOTAL=1440. A second PNG-extraction wave reopened 7 sheets (`ending_009`/`014`, `menu_017`/`024`/`032`/`033`,
  `uistuff_034`) + 2 multi-stream containers (`menu_023`×3, `menu_037`×93 incl. 92 JP class-name kanji glyphs)
  = **103 PNGs**; only `uistuff_034` fully left the `.bin` set (UNCERTAIN 34→33 / TOTAL 1441→1440), the rest
  keep a verbatim tail/container `.bin`. CORRECTION: the "non-reproducible JP-LZ floor / research-grade
  recompressor" framing (D323/D324, first dissolved D325) is retired — an off-by-4-byte padding **measurement
  artifact**, NOT a real ceiling; an empirical `gbagfx -mindist` sweep returned 10/10 single-stream 4bpp + both
  multi-stream containers byte-exact at the pinned `-mindist 2`, no custom recompressor exists or is needed.]**
  **[refreshed 2026-07-10, D362: live `docs/bin_audit.md` UNCHANGED at MISS=0 / FLOOR=1407 / UNCERTAIN=33 /
  TOTAL=1440 — the two merges **re-form** `.bin`, they do not remove any. CORRECTIONS to the record (a skeptical
  re-derivation of prior "structural floor/ceiling" claims): (1) D360's "`frontier_ending_cg_000` unsplittable →
  verbatim-`.bin` ceiling" was **PARTLY WRONG** — the blob is **uncompressed**, so a tile-aligned split is
  byte-exact: its palette `[0x00:0x80]` + 1024 clean tiles `[0x80:0x8080]` (**~40%**) are now editable
  `.gbapal`+`.png`, and only the interspersed **47,588 B** tiles+tilemap tail (`frontier_ending_cg_tail_B2F9F0.bin`)
  is the genuine verbatim floor. (2) `frontier_df3_ending_001`/`_002` are **NOT compressed** (both start `0x131d`
  = a TSA width/height header, not a `0x10` LZ header) — raw TSA (001 has a clean 4-way TSA split, deferred
  JP-only/no fe8u names; 002's "palette" is 39% bit15-set, NOT a clean palette); `frontier_df4_menu_005` is a
  proc-script **leaf** (the "MapChanges" label was refuted); `frontier_df4_ending_008` is **pointer-free OAM**
  (shift-safe). All four moved off the "compressed / needs-RE" wording.]**
- **Historical snapshot (superseded by D368 below): pointer-debt COMPLETION GATE = 1**
  (`audit_pointers.py --true-debt --gate`) — the floor; the single residual is
  the fe8u-confirmed coincidental constant above. No real code remains stored as binary data; no function pointers missed. Both the CODE and DATA sides are confirmed at floor (genuine dereferenceable pointer debt = 0) — see decisions.md **D344**. **[CORRECTED by D345, 2026-07-03: this gate is a FALSE FLOOR for shiftability — `audit_pointers.py`/`shiftcheck` cannot see raw un-relocatable fn-pointers *inside* opaque `.incbin` proc-script/bmlib tables. #143 proved `gProcScr_TitleScreen` (27 ptrs) + `gBmlib_0` (16 ptrs) blocked the shifted title→menu path; both now typed to relocations. gba-kit A/B (D346) finds only **11 opaque `.data.residue` tables** truly block a shifted ROM (75/86 already relocate; 73 remain for typed-C decomp completeness, a separate axis).]** **[EXTENDED by D362, 2026-07-10: the false-floor class is broader than opaque proc-script/bmlib tables — a **raw `INCBIN_U8(".bin")`** blob can also BAKE absolute self-pointers **inside its `.bin` interior**, which `audit_pointers.py`/`shiftcheck` do not decode. The re-derivation's "shiftability 0-debt" claim was thus INCOMPLETE: `frontier_df4_ending_000_AC059C` baked **2** self-pointers (JP `0x08AC05A0`/`0x08AC07C0`) in a raw `.bin`; now de-pointered into `frontier_df4_ending_asm.s` as `.4byte <label>` → **2× `R_ARM_ABS32`** relocations (`readelf -r` proof), byte-identical (`make compare` OK + `make shiftcheck` 0 HIGH). A **broad sweep confirmed `ending_000` was the ONLY** raw-INCBIN baked-self-pointer case. Follow-up hardening (deferred): `scripts/audit_pointers.py` should decode raw-INCBIN `.bin` interiors for baked pointers — it currently does not, so `ending_000` slipped through.]** **[HARDENED + EXTENDED by D363, 2026-07-10: the deferred follow-up is DONE and revealed a *second*, fixable blind class. `audit_pointers.py` gained `scan_macro_raw_ptr_debt()` (MACRO-form operands `CALL/LOAD/SVAL(0x08xxxxxx)` in typed event/unit carves — invisible to both the `.bin` word loop AND the `.4byte`-literal scan) and `scan_opaque_selfref_suspects()` (decode every opaque symbol's built-ROM bytes for self-refs, ANY dir incl. `graphics/`). Finding 1 (FIXED): **15** baked macro-pointers across 8 `EventScr_*_ref`/`UnitDef_*_ref` carves, symbolized to `SYM + off` → `R_ARM_ABS32`, byte-identical; the completion gate now counts this class (still **0** after fix). Finding 2 (SURFACED then RESOLVED): 12 opaque self-ref suspects — all resolve to embedded data. 9 are obvious floors (`gUnkData_108`, `.4bpp.lz` gfx, sound PCM, `sBanimEkrPopupProcNames` 0.006%-density coincidental); the 3 `AnimSprite_*` battle-anim tables *looked* like flag-tagged frame-pointer tables (`0x0861Fxxx` + `0x1861F7FC` = base|`0x10000000`) but the deref path is decisive — they feed `struct AnimSpriteData` (12-byte OAM), which `src/animedrv.c` copies into the OAM buffer and NEVER dereferences, so those words are coincidental OAM header/coord data [REFINED by D365: the OAM *prefix* is data, but these 3 are OAM/AnimScr **hybrids** — the typing wave (166 pure-OAM tables typed clean; these 4 could NOT) proved their **AnimScr tails carry real frame pointers**, so the self-refs are genuine baked AnimScr pointers of the D345/D346 banim frontier, NOT coincidental OAM] (relocating them would corrupt a shifted ROM). A self-ref is only a *candidate*; only the consumer settles it (empirically re-derived, per the standing lesson). Net: shiftability's residual is UNCHANGED — the already-bounded D346 gba-kit A/B result (11 real blockers; 73 for typed-C completeness) — the self-ref scan found **0** new pointer debt; the real win is Finding 1. See decisions.md **D363**.]**

### Banim/AnimScr beyond-gate residual — CLOSED (issue #166, D368, 2026-07-11)

The D345/D346/D363/D365 banim/AnimScr residual is no longer live work. A fresh
`+0x40000` ROM-shift A/B at integrated `origin/main`
`2a49c9b8dcfefd8bec51cb66f425ebdee564fce5` verified all four known OAM/AnimScr
hybrids (**172** relocated frame-pointer words) plus an empirical rescope of
**27 live sections / 85 words**: **257 tagged words total**, **zero stale
targets**. All **28/28** static battle-animation consumer checks passed; the
14 intentionally unchanged non-pointer checks and all unrelated documented
floors remain unchanged. `audit_pointers.py --true-debt --gate` remains **0**:
this closes a beyond-gate blind spot, so no numbered scorecard axis moves.
Do not redispatch the historical 11-table/73-table estimates as a frontier.
Exact partitions, hashes, and reproduction evidence are recorded in D368.

### Six-axis scorecard refresh (axis-2 refreshed 2026-07-13; axis-3/6 refreshed 2026-07-09; verbatim source = `python3 scripts/calcprogress.py`)
| # | Axis | Value | Detail |
|---|---|---|---|
| 1 | Build self-containment | **100.00%** | 0 `.incbin "baserom.gba"`; `make` builds the byte-identical ROM with `baserom.gba` absent. The only ungameable number — met. |
| 2 | Matching-C | **99.95% (8688/8692)** | 8561 `src/*.c` + 127 libc/libgcc real source; **4 still descriptive asm**. The five-function D369 harvest, D370 `DecodeAndVerifyArenaRecord`, the serialized `DecodeLinkArenaRecordHeader` P14 promotion, and the `sub_800FAD0` P23 promotion move the 22-function cohort to **4**. |
| 3 | Extracted data | **source-form 100.00%** (13,937,336 / 13,937,336) | bytes built from committed *editable* source in ANY form (C/PNG + `banim` compressing-linker from `banim/*_motion.s` + `graphics/banim` PNG/AGBPAL, `sound` mid2agb from `.mid`, voicegroup macro `.s`, m4a tables, mgfembp FE6 payload). **0 residual opaque bytes — axis target 100% REACHED** (refreshed 2026-07-09, **D358→D359**: the data-extraction wave took the live opaque frontier 74,311 → 43,824 → **0**; **D359** inlined the last 43,824 B blob `data_08BB8ED0` as `gUnkData_108[0xAB30]`; the prior 96,804 predated intervening waves). Supplemental strict C/PNG-under-`src/` subset = **79.91%** (11,137,425 / 13,937,336) — a narrow decomp.dev-style counter that path-filters out the ~20% legit banim/sound source; kept as a sub-line, **NOT** the gate. |
| 4 | Named symbols | **100.00% (12,688/12,688)** | **0** genuinely-cryptic `sub_<hex>/data_<hex>/nullsub_` placeholders; DATA-residue-split waves named catch-all `data_` blobs into fe8u-validated sub-objects (EventListScr/AnimScr/AnimSprite/REDA/UnitDefinition/EventScr). **(axis-4 metric-calibration 2026-07-09: the 136 descriptive asset labels `banim_pal_<key>`/`gfx_data_bg_<n>_<name>` are correct names identifying the ROM asset — fe8u's own `calcrom.pl` counts these identical labels as documented — so they are now credited as NAMED, not placeholders. Previously mis-flagged as "fe8u-auto-named → structurally < 100%".)** **(residue-typing wave 2026-07-09: +32 `data_<hex>`→typed names — `gProcScr_SALLYCURSOR_pool`, `AnimSprite_*`×23, `sBanimEkrPopupProcNames`/`sGmapRouteMenuText`/`sCcramifyProcData`/`sCpProcData`, `ProcScr_TalkPutSpriteText`, `PopupScr_GoldWasStole_body`, `gEfxlvupfx_0_script`, `Pal_EfxCrimsonEyeBGFinishIntro` — byte-neutral (`make compare` OK + `make shiftcheck` clean); **5 skipped** for name-collision/mis-ID (integrity: a wrong name is worse than the placeholder). Commits `63eb1a341`/`cf41a56b2`/`0165110b6`/`4ae977687`. **98.84% → 99.10%.** Denominator 12,809 → 12,724 also absorbs the interim −85 stale-mirror removal (`f6e4053a9`) not previously doc-refreshed. See decisions.md **D351**.)** **(residue-typing wave 2 — Batch C 2026-07-09: +27 more `data_<hex>`→typed names across AnimScr/AnimSprite/ProcScr/UnitDef/EventListScr/EventScr/Tsa (region-different JP 0x08A5–0x08A9 included), byte-neutral (`make compare` OK + `make shiftcheck` 0 HIGH), **0 skipped** — the collision + already-split + content-sanity triage cleared all 27. Commits `35b95910c`/`33e75a27b`/`1c7d165a7`. **99.10% → 99.31%.** See decisions.md **D352**.)** **(residue-typing wave 3 — structural/region-diff 2026-07-09: +26 more `data_<hex>`→typed names — 15 `SjisGlyphs_<addr>` + 10 `dat_gFontgrp_<addr>_ref` (72-byte `struct Glyph` runs, nm spans all %72==0, fe8u "partial" type-tag convention) + `gDebugMenuItems`; byte-neutral (`make compare` OK + `make shiftcheck` 0 HIGH). **3 MapChanges skipped** — `TowerOfValni7/LagdouRuins6/LagdouRuins4MapChanges` names already defined at *different* addresses (collision + off-by-one-table mis-ID). Commits `0965df88f`/`8966ef9a5`. **99.31% → 99.51%.** See decisions.md **D353**.)** **(residue-typing wave 4 — Group-4 mixed AnimSprite+AnimScr 2026-07-09: +17 more `data_<hex>`→typed names — each residue START is an AnimSprite frame (OAM) whose inner AnimScr scripts are already ABSOLUTE aliases, so the 3-way triage (rename/mirror-delete/split) resolved all 17 to a single byte-neutral START relabel; byte-neutral (`make compare` OK + `make shiftcheck` 0 HIGH), **0 skipped**. Commits `f0d9291ae`/`0a8ac11ea`. **99.51% → 99.65%.** See decisions.md **D354**. Remaining 45 = structural floor: multiboot image, padding, zero-pad tails, region-diff MapChanges/EventList.)** **(residue-typing wave 5 — FINAL region-diff/anim 2026-07-09: +3 more `data_<hex>`→typed names — `AnimScr_EfxMaohFlashEyeROBJ2` + `AnimScr_EfxMaohFlashThunderObjROBJ2` (valid AnimScr cells, `0x81000000`-terminated, pointers land exactly on the matching `AnimSprite_EfxMaohFlash{Eye,ThunderObj}` frames per `sym_jp.txt`) + `Tsa_EkrElfireBG_map2` (LZ77 tilemap, header `10 b0 04 00`, same decompressed size as `Tsa_EkrElfireBG`); byte-neutral (`make compare` OK + `make shiftcheck` 0 HIGH). **5 skipped** on rigorous per-row triage — 3 EventList region-diff mis-IDs (`data_08A5CC68`/`08A5D1E8`/`08A5D360` are EphraimEventData header pointer-tables / off-by-table position, NOT the proposed `EventListScr_Ch14b_Misc`/`Ch17b_Character`/`Ch18b_SelectUnit`), 1 mixed REDA+UnitDef blob (`data_08926134`, unverifiable `_6_EIRIKA` suffix, split candidate), 1 redundant mirror (`data_085C6A20` spans the already-decompiled `palAnimLut.3`+`offsetLut.3` static locals). Commit `e4a3d0a8d`. **99.65% → 99.67%.** See decisions.md **D355**. **Structural floor reached** — remaining 42 = multiboot image, padding, zero-pad tails, already-split blobs, and region-diff MapChanges/EventList to be re-typed with JP-distinct names.)** **(residue-typing wave 6 — FINAL FLOOR 2026-07-09: +39 `data_<hex>`→typed structural-documentation names (build-date/config strings `gDebugBuildDateTimeStrings_080DC104`/`sDebugMenuStrings_080DC68C`, `dat_gFontgrp_<addr>_ref`, `dat_AnimSprite/AnimScr_<addr>_ref`, `Lz77Gfx/Lz77Tsa_<addr>`, `gPadding_<addr>`, `MultiBootImage_08FE0000`, `gRomTailPadding_08FFF000`, `dat_MapChanges/EventListScr/gChDAsset_<addr>_ref`, `InitGUnk_02000C04` Thumb-fn relabel) + 1 stale-mirror delete (`asm/data_085BA09C.s`, covered by `ProcScr_GotItem`); byte-neutral (`make compare` OK + `make shiftcheck` 0 HIGH + **self-contained YES**). **2 integrity skips** — `data_08576124`/`data_085772B4` (D311 straddled-song ABSOLUTE-address baseline aliases; proposed `SongTrackData_*` names mismatch the alias address AND mis-describe content [song headers / SRAM lib code], not track data). **1 delete attempted then REVERTED** — `data_085C6A20`: the D355/floor-namer "redundant mirror, folds into palAnimLut.3/offsetLut.3" premise was WRONG; the residue IS the self-contained provider of its 36 bytes, and the delete only matched because `baserom.gba` back-filled the gap (false-OK). The **no-baserom self-contained CI gate** caught it (`asm/baserom.s: file not found: baserom.gba`); reverted `2497ee003`→`67fd92256`, self-containment restored (0 baserom incbins). Commits `c10c882b6`/`20d60a270`/`f4c184333`. **99.67% → 99.98%.** See decisions.md **D356**. The residual **2** = the integrity-blocked D311 SongTrackData aliases — the honest ceiling until a proper D311-anchor refactor supplies correct names.)** **(FINAL-2 2026-07-09 — axis-4 **100.00%** reached: the 2 residual placeholders eliminated by BYTE-NEUTRAL alias renames — `data_08576124`→`dat_StraddledSongData_08576124_ref`, `data_085772B4`→`dat_StraddledSramData_085772B4_ref`. Correcting D356's "non-byte-neutral" framing: these are baseline `.set name,addr` ALIASES (zero bytes emitted, generated into `asm/jp_syms.s` from `layout/baseline_syms.d/d311-music.tsv:61-62`), so renaming the absolute alias + its ONE real ref (`dat_impure_data_ref.s:21 .4byte +0xFC`) is byte-identical — address unchanged, no byte-provider removed → self-containment preserved (`make layout`+`make compare` OK, no-baserom clean rebuild OK, `check_selfcontained.py` YES 0 incbins, `make shiftcheck` 0 HIGH). Commit `9260f78d9`. **99.98% → 100.00% (12,723/12,723, 0 placeholders).** See decisions.md **D357**.)** |
| 5 | Shiftability | **gate 0; issue #166 banim residual closed** | A fresh `+0x40000` A/B at `2a49c9b8d` verified the four known hybrids (**172 words**) and the empirical **27-section / 85-word** rescope: **257 tagged words**, zero stale targets, **28/28** consumer checks. The 14 intentional non-pointer exclusions are unchanged. This closes the opaque banim/AnimScr beyond-gate residual; it does not fabricate a new axis value because the audited gate was already 0. See **D368**. |
| 6 | Asset editability | **0 bytes** opaque raw-incbin — **axis target 0 REACHED** | the `.bin` frontier remaining (**2026-07-09 D358→D359 data-extraction wave**: 30 residual regions extracted/relocated to source form + the final big blob inlined, `classify_residual_assets.py` worklist **31 → 1 → 0 regions** — the lone remainder `data_08BB8ED0` 43,824 B was inlined as `gUnkData_108[0xAB30]` in **D359** (`feat/extract-big-blob`); prior: was ~101,980 last session; −5,176 via the opanim palette fix + 39 asset-QA reshapes). |

> **Code-byte companion (frogress/decomp.dev `code` measure, source-form):** **99.78%** (899,408 / 901,428 bytes); **0.22% = 2,020 bytes** remains descriptive asm. Verbatim from `python3 scripts/calcprogress.py`; see D343/D369/D370/D371.

### Code frontier — the 4 remaining functions (11 byte-matched this session; final seeds integrated)

> **Final 2026-07-13 nonmatching-seed landings (no axis movement):**
> `sub_800A594` local score-369 seed landed as
> `42a562774ce82b52ee20bcf19235c0543f4ef2e8`; `sub_80C05C8` hosted
> score-480/local-score-230 seed landed as
> `5b35c7635a847b70cca70f4bff77418801a209b6`. Both exact-SHA CI/Pages and
> secret scans are green. They improve the authoritative `src/nonmatching`
> reconstructions but **do not replace the asm byte providers**, so matching-C
> remains **8688/8692 with 4 still-asm**.
>
> This session's **11 byte matches** are `AddAttr2dBitMap`,
> `Augury_InitResultScreen`, `DivinationRankSpriteUpdate`,
> `PutDivinationRankSprite`, `Event18_ColorFade`, `AdjustNewUnitPosition`,
> `DrawAuguryResultPanel`, `EncodeLinkArenaRecord`,
> `DecodeAndVerifyArenaRecord`, `DecodeLinkArenaRecordHeader`, and
> `GetUnitDefinitionFormEventScr`.

> **2026-07-13 `sub_800FAD0` deterministic match:** `GetUnitDefinitionFormEventScr`
> (464 B) now compiles byte-exact under its existing per-TU `-mjp-promote`
> requirement. The decisive P23 shape keeps arg2 direct, widens the stacked
> fifth argument to ABI `int` and delays its `(s8)` re-narrow, preserves the
> target `[sp,#0x40]/[sp,#0x44]` homes, and reads the build flag back through
> r5. Linked-range and whole-ROM comparisons are exact; CBMC closes 0/374 and
> differential testing is EQUIV over 200 trials. Owned `eZzgG` exposes effective
> score 0 through supported `match_override`, and its registry row is retired.

> **2026-07-13 deterministic cross-version match:** `DecodeLinkArenaRecordHeader`
> (`sub_80A6D34`, 280 B) now compiles byte-exact from source. FE6J
> `func_fe6_08083180`, FE7J `sub_809E4D0`, and FE7U `sub_809DAB8` establish
> the same 13-block password decoder. Phase-local register roles plus P14
> two-address accumulators reproduce the final commutative operand order, while
> an r1 struct alias preserves immediate header-field offsets. Owned scratch
> `9myLi` compiles at raw score 0 with no match override; its canonical function
> payload matches the promoted project source and its registry row is retired.
>
> **2026-07-12 DecodeAndVerify serial landing (D370):**
> `DecodeAndVerifyArenaRecord` (`sub_80A6F1C`, 212 B) now compiles byte-exact from
> source via the preserved feature history `6aa5f35fa` → `132c17537`. The match uses
> paired `u16 tags[2]` stack homes, phase-local r6/r9/r8/r4 aliases, int helper
> returns with one explicit checksum narrow, and a fenced r1-to-r2 mask copy.
> `make compare` is OK; `make shiftcheck` reports 0 HIGH; ARM SMT reports
> `PROVEN-BOUNDED(3)`, differential testing is EQUIV for 60/60 trials, and bounded
> shared-oracle CBMC is 0/409 with both adversarial mutations refuted. Owned
> h2W8F reports raw score 0 and its exact registry row is absent.

> **2026-07-11 five-function release candidate (D369):**
> `PutDivinationRankSprite` (`sub_80A3300`), `Event18_ColorFade`
> (`sub_800E1FC`), `AdjustNewUnitPosition` (`sub_807C8DC`),
> `DrawAuguryResultPanel` (`sub_80A3528`), and `EncodeLinkArenaRecord`
> (`sub_80A6E4C`) now compile byte-exact from the Br4VJ/uVVvN/gdTId/vdXu7/XOT5k
> score-0 forks. Their owned ENay1/nlJVc/taZrH/MaiDT/g7FXU families all expose
> raw score 0 upstream, and only those five registry rows were retired. The
> combined source reuses main's single `gUnk_08A95478` alias; the encoder keeps
> its real callback and lets agbcc emit `_call_via_r3` rather than scripting a
> raw branch. The included shiftcheck fix filters only relocations whose source
> section is `.rom`, so genuine `.rom` ABS32 talk-table checks remain strict
> while path-length-sensitive `.debug_*` relocations are excluded. Candidate
> branch CI remains the publication gate.
>
> Current `origin/main` already contains the D367 `DivinationRankSpriteUpdate`
> harvest. This branch adds the five matches above without squashing their
> history and also includes issue #166 final-docs commit
> `2946f61e492b26ec047c4d272aebe047b0d063eb`; the D368
> `+0x40000`/257-word/27-section/28-of-28 closure remains intact above.

> **2026-07-10 release candidate (D366):** `AddAttr2dBitMap` (`sub_8001570`, 224 B) and
> `Augury_InitResultScreen` (`sub_80A390C`, 612 B) now compile byte-exact from `src/`.
> The first uses a zero-instruction `do { } while (0);` basic-block separator to flip
> agbcc's two callee-save copies into JP order; the second reads `GetOverallRank` arguments
> back from the just-stored destination fields, then uses equivalent `index == 0` branch
> polarity to reproduce JP pointer live ranges and block order. Their owned decomp.me
> families `ABitG` / `xYHce` expose effective score 0 via the platform's supported
> `match_override` (“matched elsewhere”) semantics, and their registry rows were retired
> only after that upstream verification. Integrator/main CI remains pending.
>
> Earlier banked wins in this 22-function cohort: `PrepareBattleGraphicsMaybe`
> (`sub_8057F80`, community fork rtMN6, 2026-07-07), plus the six 2026-07-03 matches
> `Event2F_MoveUnit`, `Event1B_TEXTSHOW`, `ClassStatsDisplay_Loop`,
> `LoadClassNameInClassReelFont`, `sub_80A73D4`, and `sub_80A730C`.

**Authoritative set:** `find src/nonmatching -maxdepth 1 -name '*.c'` returns **4**.
The AddAttr win specifically retracts the prior “irreducible/permanent save-order ceiling”
claim: the separator emits zero instructions but changes the local-alloc basic-block decision.
Treat all remaining wall labels as evidence-backed working classifications, not proofs that no
source lever can exist; `make compare` remains the only match oracle.

Per-function current evidence (local and hosted scores are named separately
where toolchains differ):
1. **sub_800A34C** — proven score **60**; exact size 0x248/frame 0x78 and the
   corrected real five-argument `sub_800A194` ABI are covered by
   `PROVEN-BOUNDED(3)`. Active
   [`ABtKz`](https://decomp.me/scratch/ABtKz). The sole residual is GCC's
   costly-argument precompute/load order immediately before the solver call;
   **46,080 targeted trees** found no lower candidate.
2. **sub_800A594** — integrated local **369/500 bytes, 208/250 halfwords**,
   `PROVEN-BOUNDED(1)`, `EQUIV 60/60`. Active
   [`Sp10a`](https://decomp.me/scratch/Sp10a) contains exact guarded source and
   provenance at hosted score **8906** under stock hosted flags. Hosted 8906 is
   not the project-local 369 metric (`-fno-rerun-cse-after-loop` is local-only).
   Remaining wall: early `pts` allocation and resulting register/schedule order.
3. **sub_807D3BC** — integrated local score **550**, linked residual
   **61/392**, exact size 392/frame 0x90, `PROVEN-BOUNDED(1)`, `EQUIV 60/60`.
   Active [`J1ka1`](https://decomp.me/scratch/J1ka1) has function-body identity
   with the project source (normalized body SHA-256
   `f1845c7ccf949205fd81497acd4609ec04a9cec014120f23cf67495a5855d987`);
   the source header preserves the campaign provenance and the registry row is
   active. Hosted score is **10499** because decomp.me lacks project
   `-mjp-promote`. The compaction core matches; reject materialization and
   outer-loop register order remain.
4. **sub_80C05C8** — integrated hosted score **480** / local score **230**,
   target and candidate **544 B**, `PROVEN-BOUNDED(2)`. Active
   [`R7AaX`](https://decomp.me/scratch/R7AaX) contains exact guarded source and
   provenance. The phase-1 spill is removed and the phase/AP anchors are exact;
   the remaining bytes are allocator/scheduling residuals outside those solved
   anchors.

**Password-codec remainder = none.**
The password header decoder, encoder, and decode/verify entry point are all matching C.

### Asset-editability / QA wins this session (issues #140 + #141 closed)
- **#141 opanim scroll-bg palette FIXED (asset-editability win).** The opanim "garbage" scroll background had been decoded
  against a grayscale-ramp EMBEDDED palette; it is corrected to the real **blue palette at `0x08B103D8`** across 100 bands,
  byte-safe. A viewable preview `preview/tsa/opanim/OpAnimScrollBg.png` (240×800 assembled bg) was added. **#140 + #141 both
  resolved & closed.**
- **Asset-QA vs fe8u.** 39 extraction mistakes fixed byte-exact (8px-wide / grayscale strips reshaped → fe8u dims + palette).
  The full cross-check lives in **`docs/asset_fe8u_diff.md`** (175 UNREASONABLE extraction mistakes / 5 JP-US content /
  2323 IDENTICAL / 712 JP-unique) — reference it, do not duplicate. **Bidirectional caveat:** fe8u is ALSO AI-extracted and
  fallible, so adjudicate each case by view + code, NOT by trusting fe8u blindly.

## D337 (2026-07-03): remaining .bin frontier declared EFFECTIVELY AT OPAQUE FLOOR
A read-only scoping pass (`frontier-scope`) re-examined the 226 UNCERTAIN with the full multi-signal extractability
heuristics over a 40-file diverse sample spanning every subsystem group (`data/residual` 190, `frontier_df4_menu` 16,
`frontier_df4_ending` 12, `frontier_df4_uistuff` 4, others 4):
- **Bucket A (EXTRACTABLE-NOW) = 0.** No fe8u editable twin, no coherent start-pointer tables, no clean
  `.png`/`.map.bin` compression wins. 14 files carry a valid LZ prefix but decode with over-captured tails / no fe8u
  sink → **deep-RE probes only**, NOT a normal extraction wave.
- **Recommendation: do NOT dispatch another 10-20 file extraction wave.** The mechanically-extractable frontier is
  exhausted; the remaining 226 are JP-unique opaque residues (legit incbin) + the 14 optional per-file LZ deep-RE
  probes. The `.bin` axis-1/2/6 objective is effectively met; strict MISS=0 remains gated only on the 3 tilemap-floor
  audit artifacts + any future JP-LZ deep-RE, not on any tractable carve.
