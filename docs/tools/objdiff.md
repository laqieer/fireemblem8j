# objdiff — per-symbol match% and progress reporting for FE8J

[objdiff](https://github.com/encounter/objdiff) is a local diffing tool for
decompilation projects. It compares two object files symbol-by-symbol and
reports a **match percentage** for each function/data symbol, plus a
whole-project **progress report**.

## Why we want it

Our only oracle today is `make compare`: it builds `fireemblem8.gba` and checks
one SHA-1. It is **all-or-nothing** — a single wrong byte anywhere makes it fail,
and it tells us *nothing* about how close an individual translation unit (TU) is
to matching. There is no per-symbol match% or progress view.

objdiff fills exactly that gap:

- `objdiff-cli diff` shows, for one object or one function, an instruction-level
  diff and a fuzzy **match percent** (great while iterating on a single `src/x.c`).
- `objdiff-cli report generate` walks every unit in `objdiff.json` and emits a
  JSON report with a per-symbol `fuzzy_match_percent` and aggregate `measures`
  (`total_code`, `matched_code`, `matched_code_percent`, …) per unit and for the
  whole project. This is a real progress curve to complement the binary
  pass/fail of `make compare`.

`make compare` stays the source of truth for "is the ROM byte-perfect". objdiff
is the *navigation aid* that tells you which TU to work on and how close it is.

## ARM / GBA / Thumb support (evidence)

FE8J is a GBA title (ARM7TDMI, Thumb). objdiff supports it:

- The README "Supported architectures" list includes **`ARM (GBA, DS, 3DS)`**
  (and ARM64, PPC, MIPS, x86, SuperH).
- `objdiff-core/src/arch/arm.rs` handles ARM and **Thumb** disassembly via the
  `unarm` crate. It reads ELF **mapping symbols** (`$a` = ARM code, `$t` = Thumb
  code, `$d` = data) to switch decode modes per range — the same mapping symbols
  `arm-none-eabi-as` emits for our objects.

Smoke-tested in this repo:

```
$ tools/objdiff/objdiff-cli --version
objdiff-cli 3.7.2
```

## Install

The CLI ships as a prebuilt static binary — **no cargo/Rust needed**.

```bash
scripts/tools/objdiff/setup.sh
```

This downloads the latest `objdiff-cli-linux-x86_64` release asset into
`tools/objdiff/objdiff-cli` (gitignored) and `chmod +x`'s it. It prefers
`gh release download -R encounter/objdiff` (gh is authenticated here) and falls
back to `curl` of the GitHub "latest" asset URL. Re-running just overwrites.

## Configuration: `objdiff.json` (repo root)

objdiff reads `objdiff.json` from the project root. Each **unit** names a
`base_path` (the object built from current source) and a `target_path` (the
"expected" object — the intended match):

- **base** = `src/<tu>.o`, built in place by our normal `make` C pipeline
  (`cpp → iconv → agbcc → as`). objdiff rebuilds these automatically
  (`build_base: true`, `custom_make: make`).
- **target** = the expected object, derived from `baserom.gba`. objdiff does
  **not** build these (`build_target: false`); we generate them ourselves (see
  next section). They live under `build/objdiff/target/src/<tu>.o` (gitignored:
  `*.o` and the binary install are ignored).

The committed `objdiff.json` covers a handful of **representative carved C
units** (`agb_sram`, `irq`, `rng`, `proc`, `ap`, `hardware`). This is a
**best-effort, partial config** — FE8J is ~300 carved C TUs plus mostly incbin'd
data, and a full unit list is mechanical to generate (one entry per `src/*.c`,
which `ldscript.txt` already pins to a JP address). Extend `units` as more TUs
become worth tracking, or generate the list from `$(wildcard src/*.c)`.

`progress_categories` (`code`, `data`) drive the per-category percentages in the
report; each unit tags itself via `metadata.progress_categories`.

The `options` block sets `arm.unifiedSyntax: true` so the disassembly view uses
UAL mnemonics (matching `arm-none-eabi-as`); objdiff's own default for this key
is `false`. This only affects how instructions are *displayed*, not the
match-percent computation. (Note: objdiff option keys are **camelCase with
dotted prefixes**, e.g. `arm.unifiedSyntax`, `functionRelocDiffs` — an unknown
key makes the report hard-fail, so keep these exact.)

## Generating the target objects (the honest part)

This is an **incbin-baseline** decomp: the whole ROM starts as one incbin and we
relink real objects at fixed JP addresses (see `docs/strategy.md`). So there is
no pre-existing "expected `.o`" per TU — we have to carve it out of `baserom.gba`.

Two workable approaches:

1. **Per-TU carve from baserom (recommended for `report`/`diff`).** For a TU
   whose `.text` lives at `[addr, addr+size)` in the ROM (read the address from
   `ldscript.txt` / `layout/*.tsv` / `sym_jp.txt`):
   - `dd`/`objcopy` the byte range out of `baserom.gba`,
   - wrap it as an ELF section at that VMA with `arm-none-eabi-objcopy
     -I binary -O elf32-littlearm --rename-section .data=.text`, or assemble a
     small `.incbin` stub,
   - add the matching symbol names (same names objdiff sees in the base object,
     so the diff lines symbols up; `symbol_mappings` in the unit can bridge any
     naming gaps).
   The resulting object goes to `build/objdiff/target/src/<tu>.o`.

2. **Split a target ELF.** Build/obtain an ELF whose contents are the baserom
   bytes (e.g. link the all-incbin baseline, or `objcopy` baserom into an ELF
   with our symbol table from `sym_jp.txt`), then carve per-unit objects from it.
   This reuses the symbol table we already maintain.

A helper to mechanize approach (1) over all `units` is a natural follow-up; it
is intentionally **not** committed here so this change touches no build/asm/ld
files. Note that `objdiff-cli report generate` is **all-or-nothing about
targets**: if *any* configured unit's `target_path` is missing it fails fast
(`Failed to open …`, exit 1) and writes **no** report — it does not skip the
missing units and emit a partial report (verified with objdiff-cli 3.7.2). So to
run `report` you must first generate the `target_path` object for *every* unit
listed in `objdiff.json` (or temporarily trim `units` to just the ones whose
targets exist). For incremental rollout, keep `units` limited to TUs whose target
objects you have actually produced. The single-object `objdiff-cli diff -1 … -2 …`
(below) needs only the two objects you pass and works before any full `units`
config is buildable.

## Commands

Run from the repo root (where `objdiff.json` lives):

```bash
# Whole-project progress report (per-symbol match% + aggregate measures):
tools/objdiff/objdiff-cli report generate -f json-pretty -o build/objdiff-report.json

#   -f json | json-pretty | proto   output format (default: json)
#   -d                              deduplicate global/weak symbols
#   -p <dir>                        project dir (default: ".")

# Diff one object interactively (TUI), picking symbols to inspect:
tools/objdiff/objdiff-cli diff -1 build/objdiff/target/src/rng.o -2 src/rng.o

# One-shot diff of a single function to stdout as JSON:
tools/objdiff/objdiff-cli diff -1 <target.o> -2 <base.o> SomeFunctionName -o - --format json

# Diff via a unit name from objdiff.json (resolves both paths for you):
tools/objdiff/objdiff-cli diff -p . -u rng

# Track progress over time (diff two reports):
tools/objdiff/objdiff-cli report changes old-report.json new-report.json
```

Reading the report JSON: each unit has `measures` with
`matched_code` / `total_code` / `matched_code_percent` (and the data
equivalents) plus an overall `fuzzy_match_percent`, and a `sections`/symbols
list whose items each carry a per-symbol `fuzzy_match_percent`. The top-level
`measures` is the project-wide roll-up — that is the number to watch climb
toward 100%.

## GBA / Thumb gotchas (pret/decomp.me consensus — verify per-object)

Mined operator experience running objdiff on GBA/Thumb objects, beyond the
ARM-support facts above:

1. **Needs objdiff ≳3.7 for Thumb-branch relocs.** Older objdiff refuses an object
   carrying `R_ARM_THM_JUMP8` / `R_ARM_THM_JUMP11` relocs. (This repo ships 3.7.2,
   so we are clear — but pin ≥3.7 if `setup.sh` ever fetches an older asset.)
2. **Data-after-function makes it over-read trailing data as code** (very common in
   FE: rodata/pools right after a function). objdiff then shows phantom diffs like
   `.hword 0x0` vs `lsl r0,#0`. Fix with accurate symbol **`.size`** / bounds — the
   same sizing discipline the coddog backlog already uses; export local labels as
   symbols so objdiff segments functions correctly.
3. **A "match" is instruction/mnemonic-EQUIVALENCE, not byte-identity.** objdiff
   can report 100% on equivalent mnemonics that differ in encoding/operands. It is a
   navigation aid; **`make compare` sha1 is still the only proof** (consistent with
   the all-or-nothing note above).

## Progress / report pipeline & CI (decomp.dev)

`objdiff-cli report generate` emits a machine-readable per-object report (proto
schema) and runs in GitHub Actions; the **decomp.dev** dashboard ingests it for a
per-function progress view. GBA friction worth knowing: the standard split
pipeline emits EITHER a target OR a source object, but objdiff needs BOTH — which
is exactly why the "Generating the target objects" section above has to produce a
per-TU **target extract** from `baserom.gba`. (Cross-tool: **frogress is being
sunset** in favor of decomp.dev / objdiff-based reporting; `mapfile_parser` (pip)
can also emit an objdiff-format progress report straight from a `.map`, with a
path-index mode that counts WITHOUT relying on asm-file paths — robust to
`#ifdef`-skipped `INCLUDE_ASM`. Cross-check against `scripts/calcprogress.py`.)

## Relationship to the existing progress script

`scripts/calcprogress.py` already computes a coarse progress number for the
frogress portal from the carve manifest (bytes carved vs. US totals). objdiff is
complementary and finer-grained: it measures *instruction-level match quality*
of the carved C objects against the real ROM bytes, per symbol — useful for
deciding "is this TU actually matching, or just placed?" before trusting
`make compare`.

## Files

- `scripts/tools/objdiff/setup.sh` — idempotent installer (tracked).
- `objdiff.json` — objdiff project config (tracked).
- `tools/objdiff/objdiff-cli` — the binary (gitignored; produced by setup.sh).
- `build/objdiff/target/…` — generated target objects (gitignored).
