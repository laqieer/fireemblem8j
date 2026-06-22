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

Build first so `fireemblem8.gba`, `fireemblem8.elf` and `fireemblem8.map` exist
(`make compare`, or at least `make fireemblem8.elf`). You also need the original
ROM at `baserom.gba` (the diff target). Run everything **from the repo root**.

There are two ways to get a real per-function *diff against the target*, plus a
plain disassembly viewer. Pick based on whether you have an `expected/` object.

### 1. Raw-binary diff vs `baserom.gba` (no `expected/` needed)

This is the FE8J analogue of the US repo's `asmdiff.sh`: disassemble the *same
byte range* out of our build and out of the original ROM and diff them. Because
FE8J's ROM is linked and runs in place at `0x08000000`, the file offset of a
function is `vma - 0x08000000` (e.g. a function at `0x080A1234` lives at file
offset `0xA1234`). Pass that **file offset** (and an end offset) as a numeric
range:

```bash
# diff our fireemblem8.gba vs baserom.gba over one function's byte range.
# START/END are FILE OFFSETS (= vma - 0x08000000). baseimg/myimg come from
# diff_settings.py; objdump gets -Dz -bbinary -EL automatically (armel). In
# this raw mode diff_settings.py ALSO adds `-m arm -Mforce-thumb` (a flat
# binary has no ELF header, so the machine + Thumb mode must be forced) — it
# applies those only to raw-binary mode, not to -o/-e.
$HOME/asm-differ-venv/bin/python tools/asm-differ/diff.py 0x<START> 0x<END>

# auto-rebuild + watch while you iterate on src/<file>.c
$HOME/asm-differ-venv/bin/python tools/asm-differ/diff.py -mw 0x<START> 0x<END>
```

> **Why a numeric range and not a symbol name here?** asm-differ *can* look a
> symbol up in the map for raw-binary mode, but only when the map carries
> separate "load address" (LMA) columns. FE8J's in-place ROM has VMA == LMA, so
> the GNU map has none, and a symbol-name raw-binary diff errors out. Hence the
> explicit `vma - 0x08000000` offsets. Get a function's VMA/size from
> `fireemblem8.map` (or the US symbol).

> **Note:** a flat binary carries no ELF header, so objdump can't infer the
> machine or ISA. In raw-binary mode only, `diff_settings.py` adds
> `objdump_flags = ["-m", "arm", "-Mforce-thumb"]` so the path decodes as
> ARM/Thumb instead of erroring out with `can't disassemble for architecture
> UNKNOWN`. FE8J code is overwhelmingly Thumb, hence `-Mforce-thumb`; to
> raw-diff a rare ARM region, temporarily drop `-Mforce-thumb` from that branch
> in `diff_settings.py`, or cross-check with the per-object `-o` view (#2),
> which reads the ARM/Thumb state per instruction from the ELF mapping symbols.

### 2. Per-object two-sided diff vs an "expected" object (symbol names + relocs)

`-o` (without `-1`) diffs the freshly built `.o` against a reference copy under
`expected/` (the `expected_dir` in `diff_settings.py`), keyed by symbol name —
the decomp.me-style flow, with relocations and clean symbol labels:

```bash
$HOME/asm-differ-venv/bin/python tools/asm-differ/diff.py -o <Symbol>
$HOME/asm-differ-venv/bin/python tools/asm-differ/diff.py -mwo <Symbol>   # watch
```

FE8J does not ship an `expected/` tree, so this needs a one-time setup: build a
known-good object (or copy the matching `.o` from a prior `OK` build) to
`expected/<path-to>.o`, then run the command above. Without that file, `-o`
(non-`-1`) aborts with `Please ensure an OK .o file exists at "..."`; use `-o1`
(#3) to view-only, or workflow #1 to diff vs `baserom.gba`.

### 3. Just view one function's disassembly (not a diff)

To eyeball what a symbol currently assembles to, use single mode out of the
linked ELF (`-o` so symbol names resolve, `-1` = current-only):

```bash
$HOME/asm-differ-venv/bin/python tools/asm-differ/diff.py -o1 <Symbol>
```

Per asm-differ's own help, `-1` "view[s] the current asm only (not a diff)" — it
just prints the current bytes. Use #1 or #2 when you want the delta vs the
target.

`diff.py` has a `#!/usr/bin/env python3` shebang and is executable, so with the
deps on your system `python3` you can drop the `$HOME/asm-differ-venv/bin/python`
prefix — but the venv python above is the reliable path.

Useful flags (see `diff.py --help`):

- *(numeric range, no mode flag)* — raw-binary diff of `myimg` vs `baseimg`
  (our ROM vs `baserom.gba`) over a file-offset range. **(#1)**
- `-o` — diff `.o` objects (symbol names; needs `expected/` for a real diff). **(#2)**
- `-e <Symbol>` — two-ELF mode; unused (we have no separate stripped target ELF).
- `-m` / `-w` — run `make` on change / watch for source edits and re-diff.
- `-1` — single mode: **view current asm only, *not* a diff**; `-3` — three-way
  vs the asm prior to the last `-w` rebuild (requires `-w`).
- `-s` — stop at the first diff; `-S N` — skip the first N instructions.
- `-c` — interleave source lines (needs `-g`, which the Makefile already passes).
- `-j .data` — diff a different section in the `-o`/`-e` modes if you ever need it.

## Caveats for this incbin-heavy ROM

- **The reference is the original ROM `baserom.gba`, not a separate target
  ELF.** Unlike split-decomp projects that ship a stripped "target" ELF plus an
  "expected" object tree, FE8J bootstraps the whole ROM from one incbin
  (`asm/baserom.s`). The authoritative target bytes are the original ROM, so the
  diff that actually shows drift is *our build (`fireemblem8.gba`) vs
  `baserom.gba`*, via raw-binary mode over a file-offset range (workflow #1;
  `diff_settings.py` sets `baseimg = baserom.gba`, `myimg = fireemblem8.gba`), or
  per-object `-o` against an `expected/` copy (workflow #2). The `-o1`/`-o3`
  modes only view the *current* build, so they cannot reveal drift from the
  target on their own. The two-ELF `-e` mode is not used (we have no separate
  stripped baseimg ELF).

- **Raw-binary mode needs file offsets, not symbol names, on FE8J.** asm-differ's
  symbol-name lookup for `-bbinary` requires "load address" (LMA) columns in the
  map; FE8J's ROM runs in place (VMA == LMA) so the GNU map has none. Use the
  numeric `vma - 0x08000000` range (workflow #1) — or `-o` with an `expected/`
  object (workflow #2), which *does* key off symbol names.

- **Functions still inside the incbin won't resolve by name.** A region that
  hasn't been carved out of `asm/baserom.s` yet has no symbol in the map (it's
  part of the big `gUnknownData`/baserom blob). The per-object `-o` flow needs a
  map entry to find the `.o`. To `-o`-diff such a region, first carve/label it
  (see [strategy.md](../strategy.md)) so it gets a real symbol; or just use the
  raw-binary range (workflow #1), which needs only the ROM offsets.

- **agbcc emits `-g` debug info** (Makefile `CC1FLAGS`/`ASFLAGS`), so `-c`
  source interleaving works on carved C objects. The final `.gba` is produced
  with `objcopy --strip-debug`, but the `.elf`/`.o` keep their symbols — diff
  against the `.elf`/`.o`, never the stripped `.gba`.

- **Endianness + machine flag (raw-binary mode only):** GBA is little-endian, so
  `diff_settings.py` uses `arch = "armel"`, which makes asm-differ pass objdump
  `-EL`; `arm32` is big-endian and would mis-decode the raw ROM bytes. But
  asm-differ's `armel` arch carries *no* machine flag, and in raw `-bbinary`
  mode (#1) objdump has no ELF header to infer one — so `diff_settings.py` adds
  `objdump_flags = ["-m", "arm", "-Mforce-thumb"]`. Without `-m arm` the raw
  path errors with `can't disassemble for architecture UNKNOWN`; `-Mforce-thumb`
  selects the Thumb decoder FE8J needs. **asm-differ prepends `objdump_flags` in
  every mode**, so these flags must NOT be set globally: a forced Thumb decode
  would mis-read ARM-state code (e.g. the ARM `rom_header`/`Init`) in the
  `-o`/`-e` workflows. `diff_settings.py` therefore sets `objdump_flags` only
  when the parsed args indicate raw-binary mode (no `-o`/`-e`); in `-o`/`-e` the
  machine, endianness, and per-instruction ARM/Thumb state all come from the ELF
  mapping symbols.

## GBA gotchas (pret/decomp.me consensus — prefer objdiff)

- **The "load address" failure on GBA is STRUCTURAL, not a config bug.** GBA executes
  in place, so the link address == the final ROM/VRAM address — there is NO separate
  load-address (LMA) map, and asm-differ's map parser fails with
  `Failed to find "load address" in map file`. `export LANG := C` does NOT fix it
  (that is a different locale issue). The numeric `vma - 0x08000000` file-offset
  workflow (#1) sidesteps it, but **objdiff (object-vs-object) is the recommended GBA
  differ** — see `objdiff.md` (better ELF parsing, reloc-aware, no map dependency).
- **asm-differ shows RELOCATIONS only in `-o`/object mode** (default raw `-bbinary`
  mode strips relocs); and older asm-differ choked on Thumb output with `lr`/`pc` in
  pop lists (`invalid literal for int(): 'lr'`) — needs a recent asm-differ. On
  non-MIPS targets objdiff's reloc-aware diff is materially more trustworthy. A
  `.o`-level diff is instruction-equivalence, never the sha1 proof.
- **What asm-differ still wins at:** it DOES surface `-g` DWARF debug info that objdiff
  does not — keep it (or build the `.o` twice) when you want debug names in a diff/AI
  prompt.

## Relationship to the other tools

| Tool | Question it answers |
|------|---------------------|
| `make compare` | Does the *entire ROM* match, byte-for-byte? (the only real test) |
| `asm-differ` | *Where exactly* does one function's asm diverge from the target? |
| `decomp-permuter` | Can a randomized permutation of my C *close* a known asm gap? |

Typical loop: port/adjust `src/<file>.c` → `asm-differ -mw 0x<START> 0x<END>`
(raw-binary range vs `baserom.gba`, workflow #1) or `-mwo <Symbol>` (vs an
`expected/` object, #2) to see the remaining delta → fix it (optionally let
`decomp-permuter` search) → `make compare` to confirm `OK`.
