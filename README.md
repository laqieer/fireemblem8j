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

## Status — honest four-axis scorecard

FE8J is an **in-progress** decompilation. The ROM builds byte-perfect from
committed source without `baserom.gba`, but byte identity and an empty
binary-form `UNCERTAIN` list do not imply complete decompilation or zero opaque
assets.

| Axis | Current canonical result | Target |
|---|---:|---:|
| **Build self-containment** | **100.00%** (16,777,216 / 16,777,216; 0 baserom incbins) | 100% |
| **Matching-C functions** | **100.00%** (8,692 / 8,692; 0 descriptive asm) | 100% |
| **Extracted data, source-form** | **100.00%** (13,937,336 / 13,937,336) | 100% |
| **Named symbols** | **100.00%** (2,596 / 2,596; 0 placeholders) | 100% |

The supplemental strict C/PNG-under-`src/` subset is **79.91%**
(11,137,425 / 13,937,336); valid banim and sound source forms are outside that
narrow subset. Source-form 100% is an **allow-listed object-root metric**: it
accepts committed source-producing roots and their legitimate binary inputs,
including the **1,452 evidence-backed FLOOR** files. It does not mean zero
`.bin` files, zero FLOOR inventory, or that every byte is strict typed/
structured source. Current binary-form audit: **MISS=0, FLOOR=1452,
UNCERTAIN=0, TOTAL=1452**. Here `UNCERTAIN=0` means no actionable tracked
binary-form residuals. The former 1,075-symbol opaque self-reference extent
blind spot now has exact source-owned extents and the audit skips zero symbols;
the 1,452 evidence-backed FLOOR inventory remains, as documented in
[`docs/frontier.md`](docs/frontier.md).

Named 2,596/2,596 is the current literal `.global` assembly-label census used
by `calcprogress.py`; it is not a census of every ELF/C symbol and is not
directly comparable to historical 12,688-style denominators. Run
`calcprogress.py` only after the project toolchain and libraries are installed
and populated, especially `tools/agbcc/lib`. Without that library, its 127
linked functions are omitted and the function result can misleadingly read
8,565/8,565 instead of 8,692/8,692.

Run `python3 scripts/calcprogress.py` for the scorecard,
`python3 scripts/check_selfcontained.py` for self-containment, and
`python3 scripts/audit_bin_forms.py` for the generated binary audit. The live
work list and exact shiftability/graphics/glyph/ProcCmd gate counts are kept
only in [`docs/frontier.md`](docs/frontier.md); historical carve evidence is in
[`docs/decisions.md`](docs/decisions.md).

## Help decompile

The matching-C frontier is complete: `src/nonmatching/` contains no staged
functions and all 8,692 functions build from matching C or the linked runtime
libraries. Use [`docs/frontier.md`](docs/frontier.md) as the single source of
truth for any future refinement work; `make compare` remains the final oracle.


## Building

Since all data is now extracted to source form, a full build needs the ARM
toolchain plus the full asset toolchain that regenerates graphics/sound/text
from committed PNG/`.pal`/`.mid`/`.aif` sources — mirroring exactly what
[`.github/workflows/ci.yml`](.github/workflows/ci.yml) does on a clean
checkout with no `baserom.gba`:

```bash
# Host packages (Ubuntu/Debian)
sudo apt-get update
sudo apt-get install -y build-essential binutils-arm-none-eabi libpng-dev bash
python3 -m pip install ttp requests numpy Pillow   # asset-generator scripts

# agbcc with the JP -mjp-promote flag baked in -> installed into tools/agbcc
bash scripts/build_jp_agbcc.sh

# Asset toolchain (gbagfx/bin2c/preproc/aif2pcm/mid2agb/scaninc), vendored+built
# locally from the sibling US decomp; each setup.sh is idempotent
git clone --depth 1 https://github.com/laqieer/fireemblem8u.git ../fireemblem8u
scripts/tools/gbagfx/setup.sh
scripts/tools/bin2c/setup.sh
scripts/tools/preproc/setup.sh
scripts/tools/aif2pcm/setup.sh
scripts/tools/mid2agb/setup.sh
scripts/tools/scaninc/setup.sh

# FE6 SIO multiboot payload source (mgfembp submodule; builds its own agbcc)
git submodule update --init --recursive

# baserom.gba is NOT required: make compare builds fireemblem8.gba entirely from
# committed source and verifies it with `sha1sum -c checksum.sha1`.
make compare       # builds fireemblem8.gba from source and verifies the sha1
# Optional: a local ./baserom.gba (sha1 7da0456035366aa18414faa79d8fe7649f03c1ed) is
# only for RE/diff tooling (asm-differ/objdiff targets), never a build input.
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
| `asm/*.s`        | Carved/descriptive assembly. **0 `.incbin "baserom.gba"`** — matching-C and data extraction are both 100%, so only a handful of legitimately hand-written files remain (FE6 SIO glue, small padding/pilot fragments); see [`docs/frontier.md`](docs/frontier.md) for the live tally. |
| `src/`           | Decompiled C (ported/adapted from the US decomp).              |
| `include/`       | Headers (ported from the US decomp).                           |
| `graphics/`, `sound/` | Extracted, editable source assets (PNG/`.pal` graphics, `.mid`/`.aif` music) compiled by the asset toolchain into the ROM's binary graphics/sound data. |
| `ldscript.txt`   | ROM layout; decompiled objects are placed ahead of the incbin. |
| `tools/agbcc`, `tools/gbagfx`, ... | The GCC 2.95 ARM compiler and the vendored asset toolchain (install locally via `scripts/build_jp_agbcc.sh` / `scripts/tools/*/setup.sh`; gitignored). |
| `mgfembp/`       | Git submodule providing the FE6 SIO multiboot payload source.  |
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
