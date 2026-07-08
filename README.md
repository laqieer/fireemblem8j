# Fire Emblem: Seima no Kouseki (聖魔の光石)

[![CI](https://github.com/laqieer/fireemblem8j/actions/workflows/ci.yml/badge.svg)](https://github.com/laqieer/fireemblem8j/actions/workflows/ci.yml)
[![Code](https://decomp.dev/laqieer/fireemblem8j/jp.svg?mode=shield&measure=matched_code_percent&label=Code)](https://decomp.dev/laqieer/fireemblem8j/jp)
[![Data](https://decomp.dev/laqieer/fireemblem8j/jp.svg?mode=shield&measure=matched_data_percent&label=Data)](https://decomp.dev/laqieer/fireemblem8j/jp)
[![Functions](https://img.shields.io/endpoint?url=https%3A%2F%2Fprogress.deco.mp%2Fdata%2Ffireemblem8j%2Fjp%2Fdefault%2F%3Fmode%3Dshield%26measure%3Dfunctions&label=Functions)](https://laqieer.github.io/fe-decomp-portal/)
[![FE Decomp Portal](https://img.shields.io/badge/progress%20charts-FE%20Decomp%20Portal-2ea44f)](https://laqieer.github.io/fe-decomp-portal/)

A decompilation / disassembly of **Fire Emblem: The Sacred Stones — Japanese version**
(`Fire Emblem - Seima no Kouseki`, game code `BE8J`).

It builds the following ROM:
* `fireemblem8.gba` `sha1: 7da0456035366aa18414faa79d8fe7649f03c1ed`

This is the JP counterpart of the (essentially complete) US decomp
[laqieer/fireemblem8u](https://github.com/laqieer/fireemblem8u). The two ROMs are
compiled from the same Intelligent Systems source by the same compiler, so the
bulk of the work is **re-linking the US C source against the JP ROM's data
layout** and decompiling the comparatively small set of region-specific code and
data (text, fonts, menus, save versioning).

## Community & Docs

* [Wiki](https://github.com/laqieer/fireemblem8j/wiki) — project documentation and notes.
* [Discussions](https://github.com/laqieer/fireemblem8j/discussions) — questions, coordination, and ideas.

## Used by

Projects powered by this decomp, including its debug-info ELF for `nm -l`/`readelf` tooling:

* [**fe-maps**](https://github.com/laqieer/fe-maps) ([site](https://laqieer.github.io/fe-maps/)) — browsable ROM/RAM data maps extracted from this decomp's ELF.
* [**FE_GBA_Function_Library**](https://github.com/laqieer/FE_GBA_Function_Library) ([site](https://laqieer.github.io/FE_GBA_Function_Library/)) — cross-game function documentation with per-address signatures and `source:line` links.
* [**FE-Clib-Decomp**](https://github.com/laqieer/FE-Clib-Decomp) — ROM-hacking linker scripts, `lyn` reference assembly, and Event Assembler defines generated from this decomp's ELF.

## Goal

**Build the ROM byte-for-byte from committed source with `baserom.gba` removed.**
A real decompilation reproduces the ROM from matching C (`src/*.c`),
descriptive/data assembly (`asm/*.s`), and **extracted, descriptively-named
source assets** (PNG/`.pal` graphics, charmap-encoded text, C struct tables,
music) — compiled by an asset toolchain. The original ROM, `baserom.gba`, is
**only** the verification target of `make compare`; it is **never a build input**.
Delete `baserom.gba` and `make` must still emit the byte-identical ROM (this is
what `fireemblem8u` and `pokeemerald` already do). See
[`docs/decomp-completion-standard.md`](docs/decomp-completion-standard.md) for the
full standard and the honest audit behind the numbers below.

This is **not** "`asm/baserom.s` has zero incbins" (a cosmetic count, gameable by
relocating incbins into other files). The single number that matters is **build
self-containment**: remove `baserom.gba` and see if `make` still builds. Run
`python3 scripts/check_selfcontained.py` for it, and
`python3 scripts/calcprogress.py` for all scorecard axes, including the strict C/PNG data metric and the supplemental source-form data line.

## Status — honest scorecard

FE8J is an **in-progress** decompilation, but it has reached the foundational
milestone: **✅ the ROM builds byte-perfect from committed source with `baserom.gba`
removed.** `mv baserom.gba away && make` emits the byte-identical JP ROM (sha1
`7da0456…`) — the self-contained build **PASSES** (the blocking CI gate). The six
real axes (target: **100%** each — a byte-perfect ROM is necessary but not
sufficient; a real decomp is also **shiftable** and **editable**):

| Axis | Today | Meaning |
|---|---|---|
| **Build self-containment** | **100%** ✅ | the ROM builds from committed source with `baserom.gba` absent — **0 `.incbin "baserom.gba"`** directives. The only ungameable number, and it's met. |
| **Matching-C functions** |        **99.82%** (8,676 / 8,692) — **16 still descriptive asm** (D307: +LoadClassReelFontPalette; the rest are verifier-proven agbcc reg-coloring/RTL walls + large JP reconstructs, kept as descriptive asm like fe8u's own NONMATCHING — D308) | functions whose bytes come from compiling `src/*.c` plus the handful linked from libc/libgcc archives, over the **true JP function total** (decompiled + still-as-asm). Earlier this read "99.99% (8,527 / 8,528)" because the denominator was the **US** ROM's function count — but JP has region-different and JP-only functions the US lacks, so that understated the remainder. Fixed to divide by the real JP total, so 100% is reached only when **zero** functions remain as asm (the badges above pull this honest number). The **Code** badge is a separate **code-byte** measure — now published **source-form**: **99.33%** (895,356 / 901,428 code-region bytes are from committed source = **96.35%** compiled from `src/*.c` + **2.57%** linked from libc/libgcc archives + ~0.4% source-form `.rodata`/`.data` literal-pool gaps & the crt0 stub interleaved in the code region, all counted as done because they link like fe8u's own); the remaining **0.67% (6,072 bytes)** is byte-heavy descriptive asm — the **15 still-unmatched functions** — legitimately lower than the 99.83% function-count because that tail is disproportionately large functions (~4× the average). (Earlier this read ~98.6% because the `in asm` figure was computed as a region residual that wrongly swept the source-form `.rodata`/crt0 bytes into "asm"; `scripts/calcprogress.py` now sums the actual `asm/*.o .text` — see [`docs/decisions.md`](docs/decisions.md) **D343**) (see [`docs/decisions.md`](docs/decisions.md) **D343**) **16 functions remain** — JP-only / JP-divergent code that cannot be ported verbatim from fe8u. The ROM cartridge header (`src/rom_header.s`, fe8u parity) is now real source — its `Init` entry stub decompiled, its `RomHeader*` cartridge-header DATA fields (Nintendo logo / title / game-code / checksum) correctly excluded from the function census rather than miscounted as functions. A real-source/lib-link sweep (D288/D289) cleared the newlib stdio members (`__swsetup`/`__smakebuf`/`__sfvwrite`/`strcmp`, same-size reloc-only), the `nullsub_3`/`nullsub_111` empty-fn return idioms (`mov pc, lr` / `bx lr; nop`, committed `src/*.s`), `VerifySramFast_Core` + `SetSramFastFunc` (the SRAM IWRAM-copy cluster, -O1 + static-BSS pin), `j_ClearOam` (thumb→arm veneer), and the **entire newlib locale + malloc clusters** — `setlocale`/`localeconv`/`_setlocale_r`/`_localeconv_r` (locale.o) and `_malloc_r`/`malloc_extend_top`/`_free_r`/`_malloc_trim_r` (mallocr.o + freer.o), lib-linked with their `.text`/`.rodata`/`.data` sections placed at the JP addresses (the "size mismatch" that had hidden these was an artifact of comparing a whole archive member to a single function, and the `.data`'s "diff" was unresolved relocations — byte-identical once linked). With `_dtoa_r` lib-linked (its mprec Bigint + libgcc soft-float deps were already linked), the **entire newlib/libgcc subsystem is real library source**. The remainder is **16 game `sub_*` functions** — agbcc register-coloring/spill NEARs kept as descriptive non-matching C (like fe8u's own NONMATCHING), now permuter-bound (several proven to be 2-6 byte residuals that resist every deterministic agbcc lever; the sandbox SIGTERMs long permuter runs) plus a few JP-only reconstructions. Much of what D275 called a "compiler-version ceiling" turned out to be **agbcc thumb-config knobs**, not a foreign compiler: a single agbcc with a **`-mjp-promote` CC flag** (built by `scripts/build_jp_agbcc.sh`, applied **per-TU** via `CC1FLAGS` like `m4a`'s `old_agbcc`) gates `thumb.h` `PROMOTE_MODE` (preserve sub-word signedness) **+** `PROMOTE_FUNCTION_ARGS` (declaration-order arg extension) — default-off it is byte-identical to stock, so the ~8077 normal TUs are unchanged. It unlocks the **s8/s16-hold AND arg-extension-order subclasses** plus downstream reg-alloc/LICM/scheduling residuals — incl. AddGorgonEggTrap, D275's flagship "impossible" example (see [`docs/decisions.md`](docs/decisions.md) **D276/D276b/D276c**). The rest is JP-divergent reconstruction + levers + permuter + still-unattributed codegen knobs. See [`docs/frontier.md`](docs/frontier.md). |
| **Extracted data** | **Source-form: 99.31%** (13,840,532 / 13,937,336) — **the real data metric**; strict C/PNG-under-`src/` subset: 79.91% (11,137,425 / 13,937,336) | **Not all game assets are stored as C/PNG — source forms vary**, so the honest data metric is **source-form**: bytes built from committed *editable* source in **any** form with no `.incbin "baserom.gba"` fallback. That includes `banim/data_banim.o` (a compressing-linker from `banim/*_motion.s` + `graphics/banim` PNG/AGBPAL), `sound/songs/midi/*.o` (mid2agb from `.mid`), `sound/voicegroups/*.o` (editable macro `.s`), `asm/fe6sio.o` (mgfembp-built FE6 payload), and the m4a tables — all real source. The old "strict C/PNG-under-`src/`" counter (79.91%) is a **narrow decomp.dev-style subset** that only credits `src/*.o` C/PNG/typed data, so it path-filters out the ~20% that is banim/sound source — it is kept as a supplemental sub-line, **not** the gate. Source-form deliberately excludes the remaining **96,804 bytes** of opaque raw-incbin/`.bin` frontier (target: 0). The badge/decomp.dev "data" measure now publishes the source-form number (see `scripts/calcprogress.py` + `scripts/progress-template.txt`). |
| **Named symbols** | **95.53%** (12,323 / 12,899) — capped: ~1,611 `banim_`/`gfx_`/`snd_` labels are fe8u's own auto-naming convention (un-named in fe8u itself), so this axis cannot structurally reach 100%; reachable-max ≈ 95.8% of nameable, ~545 blocked (JP-divergent no-fingerprint `sub_`, inline-`__asm__`-referenced `data_`) — D307/W10 | labels with meaningful names ÷ total labels. The rest are the **576** `sub_/data_/nullsub_/sheet` placeholders. See [`docs/decisions.md`](docs/decisions.md) for the naming-lever history. |
| **Shiftability** (data pointers) | **gate = 1** (`audit_pointers.py --true-debt --gate`) — effectively **at floor** *for typed/visible data* **[but NOT the whole axis — CORRECTED by D345 (#143): `audit_pointers.py`/`shiftcheck` are blind to raw un-relocatable fn-pointers *inside* opaque `.incbin` proc-script/bmlib tables; typing `gProcScr_TitleScreen` (27 ptrs) + `gBmlib_0` (16 ptrs) unblocked the shifted title→menu path, `make compare` OK + `make shiftcheck` 0 HIGH; 84 `gProcScr_*`/`gBmlib_*` family tables remain raw — follow-up epic]**: the single residual is the **fe8u-confirmed coincidental constant `0x080896ED`** (in `frontier_df4_misc_lo`), a documented floor **false-positive — NOT real pointer debt** (this is the floor, not open debt). A prior stuck `.4byte 0x0800260C` literal was likewise a coincidental `struct UnitDefinition` bitfield word (not a pointer), fixed (D309) by typing `data_0890915C` as `struct UnitDefinition[4]`; ~14,800 relocated. The 5 remaining "CODE-axis literal pools" are not in the gate — they relocate when their Thumb fn is decompiled (a #2 item). **Now also validated by the ported fe8u shiftcheck harness (D317/V1): `make shiftcheck` — build-address audit → `--emit-relocs` reloc scan → cross-resource offset scan → differential two-shift; 0 HIGH, wired as a blocking CI step; 8 real cross-resource pointers de-pointered (byte-neutral).** | fraction of pointers in extracted data expressed as **relocatable symbol references** vs baked-in absolute `0x08xxxxxx` addresses. Raw `INCBIN`/`​.byte` data freezes pointers as constants — on any rebuild that shifts a section they dangle and the game crashes. The fix (D296/D297): rewrite each table into a `.4byte Sym` relocation block — byte-identical (`make compare` stays OK) yet shiftable. **The literal raw-`0x08xxxxxx` count (2,867) can never reach 0** — it is dominated by **2,567 coincidental constants** (graphics pixels, packed unit-stat bitfields where the level byte is 0x08, sine-table values, sound samples) that are NOT pointers and whose "relocation" would corrupt the shifted game. The honest metric (D304, cross-AI reviewed) is **confirmed-real + unclassified real-pointer debt**, computed by the fe8u reloc oracle (`scripts/fe8u_ptr_offsets.py`) plus positive-evidence structural classification (FUNC-interior / ASSET-interior / ROM-header / UnitDef-non-redas-field are provably not pointers). Driven 7,639 → 14,374 over the program; the final session cracked the hex-offset slice class (+97), the `impure_data` newlib `_reent` self-pointers (+3), and the **gFontgrp Shift-JIS `sjisNext` glyph linked-list (+234)**. Residual gate = 1: the fe8u-confirmed coincidental constant `0x080896ED` — a documented floor false-positive, not real pointer debt. Audit with `scripts/audit_pointers.py --true-debt --gate`. |
| **Asset editability** | measured by **SOURCE FORM** (per [`docs/asset_forms.md`](docs/asset_forms.md)), not the raw-incbin byte count — a `.bin` moved into `graphics/` passes `make compare` yet isn't editable (D310 user correction). **Done in editable fe8u form:** 166/166 event scripts → `EVENT_*` macros, all proc scripts → `PROC_*`, 237 `UnitDef_*` → typed `struct UnitDefinition[]` (155 + 82 chapter tables at D313/UD1), 21 battle backgrounds → `.png` (FETSATOOL), 122 palettes → `.pal`/`.agbpal` (109 bit-15→`.agbpal`), 74 chapter maps → `.mar`/`.S`, **72 songs → editable `.mid`** + **all 93 voicegroups (000-092) → `.s`** (S2: the last 7 — vg035/036/076/077/078/086/092 — converted from opaque `.bin`/`__asm__`-literal/blob-embedded data; 0 unresolved pointers) (439 PCM samples already `.aif`), pixel gfx → `.png`, **battle animation → 201 editable `banim/*_motion.s` (OAM/script/modes macros) + `.png`/`.agbpal` via the fe8u compressing-linker pipeline (D313), replacing 804 opaque `data/banim/*.bin`**, **88 unit-icon move (AP) motion tables → editable `src/data/unit_icon_move_motion/unit_icon_move_*_motion.s` (`.2byte`-offset frame/anim macros, ported from fe8u; byte-verified region-same), replacing the opaque `data/residual/data_<ADDR>.bin` INCBIN wrappers (D316/wave4)**, **~480 misc/bg/chap-title/gmapunit pixel images → `.png` (D313/G1-G4)**, **menu string pools → `src/menu_def.c` literals (D315/C1)**. Plus 842 dead/orphan `.bin` removed; `scripts/audit_bin_forms.py` → `docs/bin_audit.md` is the reproducible `.bin`-form miss-tracker (D313/U0). **Carve waves 2-4 (D319):** +101 `AnimSprite_*` → typed C `struct AnimSpriteData[]`, +17 AP map-anim/trap objects (316 `.bin`) → `ap.inc` macros, +30 ANIMSCR → `ANIMSCR_*` macros, +147 frontier REDA runs → named `struct REDA[]` (editable + shiftable), +41 OAM sprite/object-list tables → typed C, +3 worldmap/AP-anim TUs → `.s`, +m4a/sound tables → `.s`/typed C — all byte-verified region-same. **Waves 6-7 (D321, strict goal "no `.bin` unless it is `.bin` in fe8u"):** the D319 "reference-parity end-state" claim was **RETRACTED** — wave 6 proved ~981 real fe8u-editable misses still remained (the banim `Img/Pal/Tsa` are PNG-derived in fe8u; `gFontgrp` LUTs were decodable). Tracked committed `.bin` 4901→3088 (waves 1-5)→2183 (wave 6, PR #75)→**1981** (wave 7, PRs #76-79: 112 dead `song*.bin` deleted, 29 event/proc scripts, 35 banim AP-anim/gfx, 50 typed `UnitDefinition` + 3 event scripts; 3 shiftcheck HIGH fixed)→**1919** (wave 8, D322: 45 INCBIN→typed-C + 6 `.png` + 8 `.agbpal` + 3 string pools). The regenerated `scripts/audit_bin_forms.py` heuristic (corrected classifier, wave 8 / D322) reports MISS 318 / FLOOR 1128 / UNCERTAIN 473 — but **642 is a name-class upper bound, not a work-list** (it does not verify bit-exact round-trippability); the careful verified floor is **~159 firm** (≈92 compressed-no-bit-exact-recompressor + ≈66 JP-opaque + 1 code-axis) **+ ~67 soft** struct-ptr cascade. A verification pass split the 642 into truly-reducible vs heuristic-false-positive floor — **done in wave 8** (D322, 4 verifiers → `docs/bin_verification_wave8.md`): **~190 truly reducible** + ~48 at-parity + ~330–400 floor; **the strict goal is not yet reached.** **Waves 9-28 (D327) then drove the reducible `.bin` frontier to exhaustion: audit MISS 318 → 11** (tracked `.bin` 1981 → 1637), every wave byte-exact + `make shiftcheck` 0 HIGH + CI-green — banim OAM/AnimSprite → typed `struct AnimSpriteData[]`, **all 17 mixed JP-LZ blobs** hybrid-decomposed to per-sheet `.png`/`.map.bin` + typed OAM trailing, pixel-gfx LZ → per-sheet sources, structured offset/palette/OAM/SJIS tables → descriptive `.short`/`.byte`, `rom_header` crt0 → annotated `.4byte`, `ObjectType9` region-diff → u16 palette array. **Remaining 11 = documented genuine ceilings (D327):** 4 voicegroup/voice tables (blocked on the JP sound-sample-region decomp — 213 unnamed sample pointers), + 7 legitimately-`.incbin` opaque/compressed/region-diff blobs (LZ-no-clean-sink, opaque LUTs, the 28 KB `ch9events` JP-frontier blob, an 8 B fragment). **fe8u-parity binary floor** (kept binary in fe8u too): TSA/tilemap `.tsa.bin`/`.map.bin`, compressed region-diff gfx, m4a sample data. | data that is game *logic*/art should be in its editable fe8u **source** form (image `.png`, palette `.pal`/`.agbpal`, scripts as macros, tables as typed C), NOT an opaque `INCBIN` of a `.bin`. `make compare` is necessary but not sufficient — it passes on a `.bin` wrapper too. |

Progress is tracked on the [project board](https://github.com/users/laqieer/projects/3)
and charted live on the [**FE Decomp Portal**](https://laqieer.github.io/fe-decomp-portal/)
(alongside fe8u / fe6 / fe7j). See [`docs/strategy.md`](docs/strategy.md) for the
porting methodology and **[`docs/frontier.md`](docs/frontier.md) for the single
source of truth on what remains** (the live, de-inflated work list — do **not**
read `layout/nofuncmap_*.tsv` as the frontier; it is a stale ~10× classification cache).

## Help decompile

The current contributor frontier is the 16 remaining nonmatching `sub_*`
functions. Start from the decomp.me scratch table in
[`docs/nonmatching.md`](docs/nonmatching.md), and use
[`docs/frontier.md`](docs/frontier.md) as the single source of truth for the live
function list and blocking notes. These are help-wanted WIP scratches, not solved
matches; `make compare` remains the final oracle.


## Building

You need the ARM toolchain (`binutils-arm-none-eabi`) and, for C decompilation,
`agbcc` installed into `tools/agbcc` (same as the US decomp).

```bash
# baserom.gba is NOT required: make compare builds fireemblem8.gba entirely from
# committed source and verifies it with `sha1sum -c checksum.sha1`.
make compare       # builds fireemblem8.gba from source and verifies the sha1
# Optional: a local ./baserom.gba (sha1 7da0456035366aa18414faa79d8fe7649f03c1ed) is
# only for RE/diff tooling (asm-differ/objdiff targets) or one-time asset re-extraction.
```

Success ends with:
```
fireemblem8.gba: OK
```

**`baserom.gba` is NOT a build input** — every ROM byte comes from committed source
(matching C, descriptive asm, extracted assets, committed `data/*.bin`). It is used
*only* to verify the result. The **self-contained build** (the achieved end state):

```bash
mv baserom.gba /tmp/ && make           # ✅ builds the byte-identical ROM from source ALONE (baserom.gba absent)
make compare                           # ✅ verifies via `sha1sum -c checksum.sha1` — still no baserom.gba needed
```

Check the current self-containment with `python3 scripts/check_selfcontained.py`.

## Layout

| Path             | Purpose                                                        |
|------------------|----------------------------------------------------------------|
| `baserom.gba`    | Original JP ROM — optional (you provide; gitignored); only for RE/diff tooling, not the build. |
| `asm/*.s`        | Carved/descriptive assembly + data. **0 `.incbin "baserom.gba"`** (self-containment is 100%); the bulk is descriptive asm + committed `data/*.bin` references not yet decompiled to C / extracted as named assets — converted to real source as matching-C and extraction progress (see [`docs/frontier.md`](docs/frontier.md)). |
| `src/`           | Decompiled C (ported/adapted from the US decomp).              |
| `include/`       | Headers (ported from the US decomp).                           |
| `ldscript.txt`   | ROM layout; decompiled objects are placed ahead of the incbin. |
| `tools/agbcc`    | The GCC 2.95 ARM compiler (install locally; gitignored).       |
| `docs/`          | Strategy & methodology notes.                                  |

## Reverse engineering

For the remaining region-different functions (text/font/menu/save) that must be
hand-decompiled against the JP ROM, two decompilers are wired up **headlessly
over MCP** so Claude Code (and the autonomous loop) can ask for pseudo-C of a JP
address: **IDA Pro Hex-Rays** (server `ida`, the workhorse — `make ida-db`) and
**Ghidra** (server `ghidra`, an open-source cross-check — `make ghidra-db`).
Both are fed the project's own `fireemblem8.elf`. To close the last gap when a
ported function compiles *close* but not byte-exact, **decomp-permuter** (upstream,
which now supports ARM32/Thumb + agbcc) is wired up via `scripts/permuter/`. Setup,
rationale and usage are in [`docs/reverse-engineering.md`](docs/reverse-engineering.md)
and [`docs/decisions.md`](docs/decisions.md) (D6). The IDA/Ghidra/permuter installs
and databases are local/gitignored; only the scripts/config are tracked.

## License

Decompilation infrastructure mirrors the US decomp. Game assets/data are the
property of Nintendo / Intelligent Systems; no copyrighted ROM data is committed.
