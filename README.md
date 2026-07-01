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
`python3 scripts/calcprogress.py` for all four axes.

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
| **Matching-C functions** |        **99.65%** (8650 / 8,680) — **30 still asm** (D307: +LoadClassReelFontPalette; the rest are verifier-proven agbcc reg-coloring/RTL walls + large JP reconstructs, kept as descriptive asm like fe8u's own NONMATCHING — D308) | functions whose bytes come from compiling `src/*.c` plus the handful linked from libc/libgcc archives, over the **true JP function total** (decompiled + still-as-asm). Earlier this read "99.99% (8,527 / 8,528)" because the denominator was the **US** ROM's function count — but JP has region-different and JP-only functions the US lacks, so that understated the remainder. Fixed to divide by the real JP total, so 100% is reached only when **zero** functions remain as asm (the badges above pull this honest number). The **Code** badge is a separate **code-byte** measure (~96.7% of code bytes are real-source incl. lib; the remaining ~3.3% is byte-heavy asm), legitimately lower than the function-count. **32 functions remain** — JP-only / JP-divergent code that cannot be ported verbatim from fe8u. The ROM cartridge header (`src/rom_header.s`, fe8u parity) is now real source — its `Init` entry stub decompiled, its `RomHeader*` cartridge-header DATA fields (Nintendo logo / title / game-code / checksum) correctly excluded from the function census rather than miscounted as functions. A real-source/lib-link sweep (D288/D289) cleared the newlib stdio members (`__swsetup`/`__smakebuf`/`__sfvwrite`/`strcmp`, same-size reloc-only), the `nullsub_3`/`nullsub_111` empty-fn return idioms (`mov pc, lr` / `bx lr; nop`, committed `src/*.s`), `VerifySramFast_Core` + `SetSramFastFunc` (the SRAM IWRAM-copy cluster, -O1 + static-BSS pin), `j_ClearOam` (thumb→arm veneer), and the **entire newlib locale + malloc clusters** — `setlocale`/`localeconv`/`_setlocale_r`/`_localeconv_r` (locale.o) and `_malloc_r`/`malloc_extend_top`/`_free_r`/`_malloc_trim_r` (mallocr.o + freer.o), lib-linked with their `.text`/`.rodata`/`.data` sections placed at the JP addresses (the "size mismatch" that had hidden these was an artifact of comparing a whole archive member to a single function, and the `.data`'s "diff" was unresolved relocations — byte-identical once linked). With `_dtoa_r` lib-linked (its mprec Bigint + libgcc soft-float deps were already linked), the **entire newlib/libgcc subsystem is real library source**. The remainder is **32 game `sub_*` functions** — mostly register-coloring NEARs (the permuter fleet's domain — several proven to be 2-6 byte residuals that resist every deterministic agbcc lever) plus a few JP-only reconstructions. Much of what D275 called a "compiler-version ceiling" turned out to be **agbcc thumb-config knobs**, not a foreign compiler: a single agbcc with a **`-mjp-promote` CC flag** (built by `scripts/build_jp_agbcc.sh`, applied **per-TU** via `CC1FLAGS` like `m4a`'s `old_agbcc`) gates `thumb.h` `PROMOTE_MODE` (preserve sub-word signedness) **+** `PROMOTE_FUNCTION_ARGS` (declaration-order arg extension) — default-off it is byte-identical to stock, so the ~8077 normal TUs are unchanged. It unlocks the **s8/s16-hold AND arg-extension-order subclasses** plus downstream reg-alloc/LICM/scheduling residuals — incl. AddGorgonEggTrap, D275's flagship "impossible" example (see [`docs/decisions.md`](docs/decisions.md) **D276/D276b/D276c**). The rest is JP-divergent reconstruction + levers + permuter + still-unattributed codegen knobs. See [`docs/frontier.md`](docs/frontier.md). |
| **Extracted data** | **97.71%** (of the measured set) | genuinely-extracted asset bytes (typed C struct tables / PNG / charmap text) ÷ measured data bytes. Named `.incbin "baserom.gba"` (of a committed `.bin`) is **not** counted as extraction. **Scope note (D311/D312):** this counter measures C/PNG bytes only — the **588 `.mid` songs + 93 `.s` voicegroups + `song_table.s` + 439 `.aif` samples** the music lane made editable build from source via `mid2agb`/`as`/`aif2pcm` but are **not** C/PNG, so they fall outside this counter even though they ARE from-source (captured by **Build self-containment = 100%**) and editable. So 97.71% here *understates* real extraction; each `.mid` conversion is net-positive (more editable, still self-contained) yet lowers this C/PNG-scoped number. Data is ~94% of the ROM by volume; see [`docs/frontier.md`](docs/frontier.md). |
| **Named symbols** | **85.85%** (13,176 / 15,348) — capped: ~1,611 `banim_`/`gfx_`/`snd_` labels are fe8u's own auto-naming convention (un-named in fe8u itself), so this axis cannot structurally reach 100%; reachable-max ≈ 95.8% of nameable, ~545 blocked (JP-divergent no-fingerprint `sub_`, inline-`__asm__`-referenced `data_`) — D307/W10 | labels with meaningful names ÷ total labels. The rest are `sub_/data_/nullsub_/sheet` placeholders. See [`docs/decisions.md`](docs/decisions.md) for the naming-lever history. |
| **Shiftability** (data pointers) | **gate = 0** ✅ **COMPLETE** (D309) — the user-ratified criterion `audit_pointers.py --true-debt --gate` = 0 is met. The last stuck `.4byte 0x0800260C` literal was a coincidental `struct UnitDefinition` bitfield word (not a pointer); fixed by typing `data_0890915C` as `struct UnitDefinition[4]`. ~14,800 relocated. The 5 remaining "CODE-axis literal pools" are not in the gate — they relocate when their Thumb fn is decompiled (a #2 item). **Now also validated by the ported fe8u shiftcheck harness (D317/V1): `make shiftcheck` — build-address audit → `--emit-relocs` reloc scan → cross-resource offset scan → differential two-shift; 0 HIGH, wired as a blocking CI step; 8 real cross-resource pointers de-pointered (byte-neutral).** | fraction of pointers in extracted data expressed as **relocatable symbol references** vs baked-in absolute `0x08xxxxxx` addresses. Raw `INCBIN`/`​.byte` data freezes pointers as constants — on any rebuild that shifts a section they dangle and the game crashes. The fix (D296/D297): rewrite each table into a `.4byte Sym` relocation block — byte-identical (`make compare` stays OK) yet shiftable. **The literal raw-`0x08xxxxxx` count (2,867) can never reach 0** — it is dominated by **2,567 coincidental constants** (graphics pixels, packed unit-stat bitfields where the level byte is 0x08, sine-table values, sound samples) that are NOT pointers and whose "relocation" would corrupt the shifted game. The honest metric (D304, cross-AI reviewed) is **confirmed-real + unclassified real-pointer debt**, computed by the fe8u reloc oracle (`scripts/fe8u_ptr_offsets.py`) plus positive-evidence structural classification (FUNC-interior / ASSET-interior / ROM-header / UnitDef-non-redas-field are provably not pointers). Driven 7,639 → 14,374 over the program; the final session cracked the hex-offset slice class (+97), the `impure_data` newlib `_reent` self-pointers (+3), and the **gFontgrp Shift-JIS `sjisNext` glyph linked-list (+234)**. Residual gate = 12: ~9 deep-blob coincidental, 1 LUT, 2 event-script operands (needs event-script-aware de-pointering). Audit with `scripts/audit_pointers.py --true-debt --gate`. |
| **Asset editability** | measured by **SOURCE FORM** (per [`docs/asset_forms.md`](docs/asset_forms.md)), not the raw-incbin byte count — a `.bin` moved into `graphics/` passes `make compare` yet isn't editable (D310 user correction). **Done in editable fe8u form:** 166/166 event scripts → `EVENT_*` macros, all proc scripts → `PROC_*`, 237 `UnitDef_*` → typed `struct UnitDefinition[]` (155 + 82 chapter tables at D313/UD1), 21 battle backgrounds → `.png` (FETSATOOL), 122 palettes → `.pal`/`.agbpal` (109 bit-15→`.agbpal`), 74 chapter maps → `.mar`/`.S`, **72 songs → editable `.mid`** + **all 93 voicegroups (000-092) → `.s`** (S2: the last 7 — vg035/036/076/077/078/086/092 — converted from opaque `.bin`/`__asm__`-literal/blob-embedded data; 0 unresolved pointers) (439 PCM samples already `.aif`), pixel gfx → `.png`, **battle animation → 201 editable `banim/*_motion.s` (OAM/script/modes macros) + `.png`/`.agbpal` via the fe8u compressing-linker pipeline (D313), replacing 804 opaque `data/banim/*.bin`**, **88 unit-icon move (AP) motion tables → editable `src/data/unit_icon_move_motion/unit_icon_move_*_motion.s` (`.2byte`-offset frame/anim macros, ported from fe8u; byte-verified region-same), replacing the opaque `data/residual/data_<ADDR>.bin` INCBIN wrappers (D316/wave4)**, **~480 misc/bg/chap-title/gmapunit pixel images → `.png` (D313/G1-G4)**, **menu string pools → `src/menu_def.c` literals (D315/C1)**. Plus 842 dead/orphan `.bin` removed; `scripts/audit_bin_forms.py` → `docs/bin_audit.md` is the reproducible `.bin`-form miss-tracker (D313/U0). **Carve waves 2-4 (D319):** +101 `AnimSprite_*` → typed C `struct AnimSpriteData[]`, +17 AP map-anim/trap objects (316 `.bin`) → `ap.inc` macros, +30 ANIMSCR → `ANIMSCR_*` macros, +147 frontier REDA runs → named `struct REDA[]` (editable + shiftable), +41 OAM sprite/object-list tables → typed C, +3 worldmap/AP-anim TUs → `.s`, +m4a/sound tables → `.s`/typed C — all byte-verified region-same. **Waves 6-7 (D321, strict goal "no `.bin` unless it is `.bin` in fe8u"):** the D319 "reference-parity end-state" claim was **RETRACTED** — wave 6 proved ~981 real fe8u-editable misses still remained (the banim `Img/Pal/Tsa` are PNG-derived in fe8u; `gFontgrp` LUTs were decodable). Tracked committed `.bin` 4901→3088 (waves 1-5)→2183 (wave 6, PR #75)→**1981** (wave 7, PRs #76-79: 112 dead `song*.bin` deleted, 29 event/proc scripts, 35 banim AP-anim/gfx, 50 typed `UnitDefinition` + 3 event scripts; 3 shiftcheck HIGH fixed)→**1919** (wave 8, D322: 45 INCBIN→typed-C + 6 `.png` + 8 `.agbpal` + 3 string pools). The regenerated `scripts/audit_bin_forms.py` heuristic (corrected classifier, wave 8 / D322) reports MISS 318 / FLOOR 1128 / UNCERTAIN 473 — but **642 is a name-class upper bound, not a work-list** (it does not verify bit-exact round-trippability); the careful verified floor is **~159 firm** (≈92 compressed-no-bit-exact-recompressor + ≈66 JP-opaque + 1 code-axis) **+ ~67 soft** struct-ptr cascade. A verification pass split the 642 into truly-reducible vs heuristic-false-positive floor — **done in wave 8** (D322, 4 verifiers → `docs/bin_verification_wave8.md`): **~190 truly reducible** + ~48 at-parity + ~330–400 floor; **the strict goal is not yet reached.** **Waves 9-28 (D327) then drove the reducible `.bin` frontier to exhaustion: audit MISS 318 → 11** (tracked `.bin` 1981 → 1637), every wave byte-exact + `make shiftcheck` 0 HIGH + CI-green — banim OAM/AnimSprite → typed `struct AnimSpriteData[]`, **all 17 mixed JP-LZ blobs** hybrid-decomposed to per-sheet `.png`/`.map.bin` + typed OAM trailing, pixel-gfx LZ → per-sheet sources, structured offset/palette/OAM/SJIS tables → descriptive `.short`/`.byte`, `rom_header` crt0 → annotated `.4byte`, `ObjectType9` region-diff → u16 palette array. **Remaining 11 = documented genuine ceilings (D327):** 4 voicegroup/voice tables (blocked on the JP sound-sample-region decomp — 213 unnamed sample pointers), + 7 legitimately-`.incbin` opaque/compressed/region-diff blobs (LZ-no-clean-sink, opaque LUTs, the 28 KB `ch9events` JP-frontier blob, an 8 B fragment). **fe8u-parity binary floor** (kept binary in fe8u too): TSA/tilemap `.tsa.bin`/`.map.bin`, compressed region-diff gfx, m4a sample data. | data that is game *logic*/art should be in its editable fe8u **source** form (image `.png`, palette `.pal`/`.agbpal`, scripts as macros, tables as typed C), NOT an opaque `INCBIN` of a `.bin`. `make compare` is necessary but not sufficient — it passes on a `.bin` wrapper too. |

Progress is tracked on the [project board](https://github.com/users/laqieer/projects/3)
and charted live on the [**FE Decomp Portal**](https://laqieer.github.io/fe-decomp-portal/)
(alongside fe8u / fe6 / fe7j). See [`docs/strategy.md`](docs/strategy.md) for the
porting methodology and **[`docs/frontier.md`](docs/frontier.md) for the single
source of truth on what remains** (the live, de-inflated work list — do **not**
read `layout/nofuncmap_*.tsv` as the frontier; it is a stale ~10× classification cache).

## Building

You need the ARM toolchain (`binutils-arm-none-eabi`) and, for C decompilation,
`agbcc` installed into `tools/agbcc` (same as the US decomp).

```bash
# Place your own copy of the original ROM here:
#   ./baserom.gba   (sha1 7da0456035366aa18414faa79d8fe7649f03c1ed)
make compare       # builds fireemblem8.gba and verifies the sha1
```

Success ends with:
```
fireemblem8.gba: OK
```

**`baserom.gba` is NOT a build input** — every ROM byte comes from committed source
(matching C, descriptive asm, extracted assets, committed `data/*.bin`). It is used
*only* to verify the result. The **self-contained build** (the achieved end state):

```bash
mv baserom.gba /tmp/ && make           # ✅ builds the byte-identical ROM from source ALONE
mv /tmp/baserom.gba . && make compare   # restore ONLY to verify: sha1 -> OK
```

Check the current self-containment with `python3 scripts/check_selfcontained.py`.

## Layout

| Path             | Purpose                                                        |
|------------------|----------------------------------------------------------------|
| `baserom.gba`    | Original JP ROM (you provide; gitignored).                     |
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
