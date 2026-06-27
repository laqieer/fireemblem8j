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
| **Matching-C functions** |        **99.63%** (8648 / 8,680) | functions whose bytes come from compiling `src/*.c` plus the handful linked from libc/libgcc archives, over the **true JP function total** (decompiled + still-as-asm). Earlier this read "99.99% (8,527 / 8,528)" because the denominator was the **US** ROM's function count — but JP has region-different and JP-only functions the US lacks, so that understated the remainder. Fixed to divide by the real JP total, so 100% is reached only when **zero** functions remain as asm (the badges above pull this honest number). The **Code** badge is a separate **code-byte** measure (~96.7% of code bytes are real-source incl. lib; the remaining ~3.3% is byte-heavy asm), legitimately lower than the function-count. **32 functions remain** — JP-only / JP-divergent code that cannot be ported verbatim from fe8u. The ROM cartridge header (`src/rom_header.s`, fe8u parity) is now real source — its `Init` entry stub decompiled, its `RomHeader*` cartridge-header DATA fields (Nintendo logo / title / game-code / checksum) correctly excluded from the function census rather than miscounted as functions. A real-source/lib-link sweep (D288/D289) cleared the newlib stdio members (`__swsetup`/`__smakebuf`/`__sfvwrite`/`strcmp`, same-size reloc-only), the `nullsub_3`/`nullsub_111` empty-fn return idioms (`mov pc, lr` / `bx lr; nop`, committed `src/*.s`), `VerifySramFast_Core` + `SetSramFastFunc` (the SRAM IWRAM-copy cluster, -O1 + static-BSS pin), `j_ClearOam` (thumb→arm veneer), and the **entire newlib locale + malloc clusters** — `setlocale`/`localeconv`/`_setlocale_r`/`_localeconv_r` (locale.o) and `_malloc_r`/`malloc_extend_top`/`_free_r`/`_malloc_trim_r` (mallocr.o + freer.o), lib-linked with their `.text`/`.rodata`/`.data` sections placed at the JP addresses (the "size mismatch" that had hidden these was an artifact of comparing a whole archive member to a single function, and the `.data`'s "diff" was unresolved relocations — byte-identical once linked). With `_dtoa_r` lib-linked (its mprec Bigint + libgcc soft-float deps were already linked), the **entire newlib/libgcc subsystem is real library source**. The remainder is **32 game `sub_*` functions** — mostly register-coloring NEARs (the permuter fleet's domain — several proven to be 2-6 byte residuals that resist every deterministic agbcc lever) plus a few JP-only reconstructions. Much of what D275 called a "compiler-version ceiling" turned out to be **agbcc thumb-config knobs**, not a foreign compiler: a single agbcc with a **`-mjp-promote` CC flag** (built by `scripts/build_jp_agbcc.sh`, applied **per-TU** via `CC1FLAGS` like `m4a`'s `old_agbcc`) gates `thumb.h` `PROMOTE_MODE` (preserve sub-word signedness) **+** `PROMOTE_FUNCTION_ARGS` (declaration-order arg extension) — default-off it is byte-identical to stock, so the ~8077 normal TUs are unchanged. It unlocks the **s8/s16-hold AND arg-extension-order subclasses** plus downstream reg-alloc/LICM/scheduling residuals — incl. AddGorgonEggTrap, D275's flagship "impossible" example (see [`docs/decisions.md`](docs/decisions.md) **D276/D276b/D276c**). The rest is JP-divergent reconstruction + levers + permuter + still-unattributed codegen knobs. See [`docs/frontier.md`](docs/frontier.md). |
| **Extracted data** | **100.00%** ✅ (of the measured set) | genuinely-extracted asset bytes (typed C struct tables / PNG / charmap text) ÷ measured data bytes. Named `.incbin "baserom.gba"` (of a committed `.bin`) is **not** counted as extraction. Note: data is ~94% of the ROM by volume; the measured set is the extraction-tracked subset, see [`docs/frontier.md`](docs/frontier.md) (Data frontier) for the remaining graphics/text bulk. |
| **Named symbols** | **85.36%** (13,175 / 15,435) — capped: ~1,611 `banim_`/`gfx_`/`snd_` labels are fe8u's own auto-naming convention (un-named in fe8u itself), so this axis cannot structurally reach 100% | labels with meaningful names ÷ total labels. The rest are `sub_/data_/nullsub_/sheet` placeholders. See [`docs/decisions.md`](docs/decisions.md) for the naming-lever history. |
| **Shiftability** (data pointers) | **IN PROGRESS** — 14,383 relocated; honest gate = **364** real pointers stuck in `__asm__` `.4byte` literals **+ unmeasured pointers inside compressed data** (Huffman text, LZ77 banim/gfx). The D305 "gate=0/complete" was **retracted (D306)** — the auditor had blind spots. True completion = fe8u-style typed asset extraction (see right), not inline-asm `.4byte`. | fraction of pointers in extracted data expressed as **relocatable symbol references** vs baked-in absolute `0x08xxxxxx` addresses. Raw `INCBIN`/`​.byte` data freezes pointers as constants — on any rebuild that shifts a section they dangle and the game crashes. The fix (D296/D297): rewrite each table into a `.4byte Sym` relocation block — byte-identical (`make compare` stays OK) yet shiftable. **The literal raw-`0x08xxxxxx` count (2,867) can never reach 0** — it is dominated by **2,567 coincidental constants** (graphics pixels, packed unit-stat bitfields where the level byte is 0x08, sine-table values, sound samples) that are NOT pointers and whose "relocation" would corrupt the shifted game. The honest metric (D304, cross-AI reviewed) is **confirmed-real + unclassified real-pointer debt**, computed by the fe8u reloc oracle (`scripts/fe8u_ptr_offsets.py`) plus positive-evidence structural classification (FUNC-interior / ASSET-interior / ROM-header / UnitDef-non-redas-field are provably not pointers). Driven 7,639 → 14,374 over the program; the final session cracked the hex-offset slice class (+97), the `impure_data` newlib `_reent` self-pointers (+3), and the **gFontgrp Shift-JIS `sjisNext` glyph linked-list (+234)**. Residual gate = 12: ~9 deep-blob coincidental, 1 LUT, 2 event-script operands (needs event-script-aware de-pointering). Audit with `scripts/audit_pointers.py --true-debt --gate`. |
| **Asset editability** | **759 KB** of structured/logic data still opaque raw-incbin (of 1.06 MB total; 303 KB is legit graphics binary) | data that is game *logic* (event/proc scripts, struct tables, LUTs) should be typed/editable C, not opaque `u8[] = INCBIN` blobs. Graphics/tilemap `.bin` are exempt (binary like fe8u's `.4bpp`). Target: 0 opaque structured blobs. |

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
