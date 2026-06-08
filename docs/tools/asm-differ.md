# asm-differ (per-function assembly diff)

[`asm-differ`](https://github.com/simonlindholm/asm-differ) is the interactive
assembly diff viewer used by [decomp.me](https://decomp.me). It shows a
side-by-side / unified diff of a function's disassembly so you can see, line by
line, where your decompiled C drifts from the original — register allocation,
instruction selection, stack layout, reordered branches, regswaps, etc. It
explicitly supports **ARM32**, which is exactly what FE8J needs (GBA / ARM7TDMI,
agbcc Thumb-interwork).

This fills the gap between our two existing oracles:

- `make compare` is all-or-nothing: it only tells you the whole ROM's SHA-1
  matched or not — never *which instruction* in a function is wrong.
- `decomp-permuter` (tools/decomp-permuter, see
  [reverse-engineering.md](../reverse-engineering.md)) *searches* for a matching
  permutation of source, scoring with an internal diff — but you still want eyes
  on the actual instruction-level delta to understand what to change.

asm-differ is the human/AI-readable lens in between: write/adjust C, rebuild,
look at the colored diff, fix the specific divergence, repeat — then confirm with
`make compare`.

## Install (one-time, local)

The upstream clone (`tools/asm-differ`) and its venv are **gitignored**, just like
`tools/agbcc` and `tools/decomp-permuter`. Set them up with:

```bash
scripts/tools/asm-differ/setup.sh
```

This clones `simonlindholm/asm-differ` into `tools/asm-differ` (skipped/updated if
already present), creates a venv (default `$HOME/asm-differ-venv`, override with
`ASM_DIFFER_VENV`), and installs the deps (`colorama watchdog levenshtein
cxxfilt`). Re-run any time to update the differ.

The FE8J-specific config — `diff_settings.py` at the **repo root** — is tracked.
asm-differ reads `diff_settings.py` from the current working directory, so always
run `diff.py` **from the repo root**.

## Invocation (FE8J)

Build the ROM first so `fireemblem8.elf` and `fireemblem8.map` exist
(`make compare`, or at least `make fireemblem8.elf`). Then, from the repo root:

```bash
# View a single function's current disassembly out of the linked ELF
# (-o = per-object so symbol names show; -1 = single/CURRENT, no "expected" .o
#  needed). This is the everyday "what does <Symbol> assemble to right now?" call.
$HOME/asm-differ-venv/bin/python tools/asm-differ/diff.py -o1 <Symbol>

# Same, but auto-rebuild on source change and keep watching (-m make, -w watch).
# Iterate on src/<file>.c and the diff refreshes live.
$HOME/asm-differ-venv/bin/python tools/asm-differ/diff.py -mwo1 <Symbol>
```

`diff.py` has a `#!/usr/bin/env python3` shebang and is executable, so if the
deps are on your system `python3` you can also write
`tools/asm-differ/diff.py -o1 <Symbol>` directly — but the venv python above is
the reliable path.

`<Symbol>` is a function name from the linker map (e.g. a US-derived label such as
`StartBmFade`). asm-differ looks it up in `fireemblem8.map`, finds the owning `.o`
and address, and disassembles with `arm-none-eabi-objdump -d -rz -j .text` (the
project's `-drz` convention, restricted to `.text`).

Useful flags (see `diff.py --help`):

- `-o` — diff `.o` objects (shows symbol names). **Recommended.**
- `-m` / `-w` — run `make` on change / watch for source edits and re-diff.
- `-1` / `-3` — single (CURRENT only) / three-way (vs base + previous) modes.
- `-s` — stop at the first diff; `-S N` — skip the first N instructions.
- `-c` — interleave source lines (needs `-g`, which the Makefile already passes).
- `-j .data` — diff a different section if you ever need it.

### Two-sided diffs against an "expected" object

`-o` *without* `-1` does a true two-sided diff: it compares the freshly built
`.o` against a reference copy under `expected/` (the `expected_dir` in
`diff_settings.py`). FE8J does not maintain an `expected/` tree, so the default
workflow is the single-/three-way modes above. If you want a hard before/after
on one translation unit, copy the known-good object into
`expected/<path-to>.o` first, then run `diff.py -o <Symbol>`.

## Caveats for this incbin-heavy ROM

- **Reference bytes live in `fireemblem8.elf` / `baserom.gba`, not a separate
  target ELF.** Unlike split-decomp projects that ship a stripped "target" ELF
  plus an "expected" object tree, FE8J bootstraps the whole ROM from one incbin
  (`asm/baserom.s`) and links a single `fireemblem8.elf`. So the natural diff is
  *against the ELF/map you just built*, via `-o1`/`-o3` or the two-sided
  `expected/` flow above — not the two-ELF `-e` mode (which wants a separate
  stripped baseimg we don't have).

- **Functions still inside the incbin won't resolve by name.** A region that
  hasn't been carved out of `asm/baserom.s` yet has no symbol in the map (it's
  part of the big `gUnknownData`/baserom blob). asm-differ needs a map entry to
  find the `.o` and address. To diff such a region, first carve/label it (see
  [strategy.md](../strategy.md)) so it gets a real symbol, or pass an explicit
  ROM address + end address instead of a name.

- **agbcc emits `-g` debug info** (Makefile `CC1FLAGS`/`ASFLAGS`), so `-c`
  source interleaving works on carved C objects. The final `.gba` is produced
  with `objcopy --strip-debug`, but the `.elf`/`.o` keep their symbols — diff
  against the `.elf`/`.o`, never the stripped `.gba`.

- **Endianness:** GBA is little-endian. We use `arch = "arm32"`; endianness is
  read from the ELF header for the `-o`/`-e` (objfile/ELF) workflows, so this is
  correct. The `arm32`-vs-`armel` distinction in asm-differ only affects raw
  `-bbinary` dumps, which we do not use.

## Relationship to the other tools

| Tool | Question it answers |
|------|---------------------|
| `make compare` | Does the *entire ROM* match, byte-for-byte? (the only real test) |
| `asm-differ` | *Where exactly* does one function's asm diverge from the target? |
| `decomp-permuter` | Can a randomized permutation of my C *close* a known asm gap? |

Typical loop: port/adjust `src/<file>.c` → `asm-differ -mwo1 <Symbol>` to see the
remaining delta → fix it (optionally let `decomp-permuter` search) → `make
compare` to confirm `OK`.
