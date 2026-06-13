# Fire Emblem: Seima no Kouseki (聖魔の光石)

[![make compare](https://github.com/laqieer/fireemblem8j/actions/workflows/compare.yml/badge.svg)](https://github.com/laqieer/fireemblem8j/actions/workflows/compare.yml)
[![Self-contained build](https://github.com/laqieer/fireemblem8j/actions/workflows/selfcontained.yml/badge.svg)](https://github.com/laqieer/fireemblem8j/actions/workflows/selfcontained.yml)
[![Code](https://decomp.dev/laqieer/fireemblem8j/jp.svg?mode=shield&measure=matched_code_percent&label=Code)](https://decomp.dev/laqieer/fireemblem8j/jp)
[![Data](https://decomp.dev/laqieer/fireemblem8j/jp.svg?mode=shield&measure=matched_data_percent&label=Data)](https://decomp.dev/laqieer/fireemblem8j/jp)
[![Functions](https://img.shields.io/endpoint?url=https%3A%2F%2Fprogress.deco.mp%2Fdata%2Ffireemblem8j%2Fjp%2Fdefault%2F%3Fmode%3Dshield%26measure%3Dfunctions&label=Functions)](https://laqieer.github.io/fe-decomp-portal/)
[![Decomp progress](https://github.com/laqieer/fireemblem8j/actions/workflows/progress.yml/badge.svg)](https://github.com/laqieer/fireemblem8j/actions/workflows/progress.yml)
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
`7da0456…`) — the self-contained build **PASSES** (the blocking CI gate). The four
real axes (target: **100%** each):

| Axis | Today | Meaning |
|---|---|---|
| **Build self-containment** | **100%** ✅ | the ROM builds from committed source with `baserom.gba` absent — **0 `.incbin "baserom.gba"`** directives. The only ungameable number, and it's met. |
| **Matching-C functions** | **~78.0%** (6,650 / 8,528) | functions whose bytes come from compiling `src/*.c`. The rest are **gbadisasm descriptive asm** (disassembly, *not* decompilation) — the ongoing asm→C grind. (The decomp.dev **Code** badge above tracks the same progress by code *size* rather than function count — currently **~67%**, lower than the by-count figure because the functions still in asm are larger on average; descriptive asm counts as *unmatched* there, as in fe8u/decomp.dev.) NB: the honest ceiling is **8,209**, not 8,528 — ~170 functions (ARM-mode `arm.o`/`m4a_1`, libgcc/libc) are hand-assembly even in the US decomp; against that ceiling matching-C is **~81.0%**. Key (D60/D63/D64/D67/D68/D81/D89): most of the remaining was mechanically reachable — the "~2,224 region-different" estimate was largely a classifier false-negative. Levers that cleared the bulk: the fast **reloc-resolve carve** (`scripts/perm2_graduate.py` — region-SAME modulo relocation), **CF:agbcc data-binding** (bind the TU-private data table a function references, then it compiles byte-exact), **per-frag region-same harvest** (`scripts/perfrag_carve.py`), the **constant-diff carve** (`scripts/const_diff_carve.py` — D81: most of the "FAR" tail differs from US bytes ONLY in JP data-constants like msg-IDs `0x8A3`→`0x843`; substitute the JP literal and it compiles byte-exact), and the **codegen-shape type-widening sweep** (D89: the true-codegen FAR/LEN tail is dominated by a mechanizable temp-var-width delta — JP declares a local `int` where US uses `s8`/`s16`/`bool`, so agbcc holds one int temp instead of re-narrowing; sweep `signed/bool → int` per declaration + verify). The remaining hand-decomp/permuter frontier (reg-allocation/temp-ordering + the `lsr↔asr` compiler-extension residue + data-table-blocked + pure-JP) is materially smaller. |
| **Extracted data** | **~4.11%** (~573 KB) | genuinely-extracted asset bytes (typed C struct tables / PNG) ÷ data bytes. Named `.incbin "baserom.gba"` (of a committed `.bin`) is **not** counted as extraction. The big jump (D71) emits the ~404 KB JP message block as **compiled C** (`src/msg_data.c`: Huffman bitstreams + tree + `gMsgTable`, US-shaped) instead of a `.byte` asm blob — byte-identical after link; plus typed game-data tables (chapter/affinity/item/character/class/AI, D70–D76). **D97**: the deferred **graphics/gbagfx pipeline is now proven portable** — `worldmap_gmap` (~82 KB) round-trips JP ROM bytes through PNG→`gbagfx`→`INCBIN_U8` typed C byte-for-byte (the `DATA_INCBIN_CFILES` preproc path), un-deferring ~9 MB of region-same PNG-sourced data. NB the realistic data ceiling is ~50-70% (graphics LZ blobs are build-intermediate assets, not committed source — as in fe8u/pokeemerald), not 100%. |
| **Named symbols** | **~77.5%** | labels with meaningful names ÷ total labels. The rest are `sub_/data_/nullsub_/sheet` placeholders. |

Progress is tracked on the [project board](https://github.com/users/laqieer/projects/3)
and charted live on the [**FE Decomp Portal**](https://laqieer.github.io/fe-decomp-portal/)
(alongside fe8u / fe6 / fe7j). See [`docs/strategy.md`](docs/strategy.md) for the
porting methodology.

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
| `asm/*.s`        | Carved/descriptive assembly + data. **~83% is still `.incbin "baserom.gba"`** (generated `asm/baserom.s` + per-region `.s` files) — replaced by extracted source as decompilation progresses. |
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
