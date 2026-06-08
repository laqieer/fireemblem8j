# coddog — cross-binary function matcher (FE8J ↔ FE8U triage)

[`coddog`](https://github.com/ethteck/coddog) ("the dog that sniffs for cod") is
a Rust tool that finds functions which are **similar across binaries** by
hashing their instruction streams (opcodes / equivalence / exact bytes). It
reads a [`decomp_settings`](https://github.com/ethteck/decomp_settings)
`decomp.yaml`, parses each binary's ELF with `objdiff`, and disassembles GBA
code as Thumb (ARM7TDMI, `unarm` V4T) — exactly our target.

## Why we use it

Our core need is **triage**: for every FE8J function, decide whether it is

- **region-same** as its US sibling → we can *carve it directly* (the bytes line
  up, so the US source/asm ports over with at most address fixups), or
- **region-different** → we must *hand-decompile* it (IDA/Ghidra/permuter — see
  `docs/reverse-engineering.md`).

`coddog compare2` does this in one shot: it matches every function in our JP ELF
against the US ELF and prints a similarity %, **bucketed by which side is already
decompiled**. A near-100% hit to a US function tells us the region is identical —
a prime carve candidate. A low/no match flags a region-different function that
needs hand work. This turns "which of the ~hundreds of remaining functions are
free wins?" into a sorted list.

It complements, not replaces, the existing flow:

- `make compare` stays the only oracle (coddog never writes the ROM).
- US↔JP *address* mapping still comes from symbol names (`docs/strategy.md`);
  coddog adds *content* similarity, catching renamed/moved functions and
  confirming a region is byte-identical before you spend effort carving.

## Setup

```bash
scripts/tools/coddog/setup.sh
```

Idempotent. Installs a user-level Rust toolchain via `rustup` if `cargo` is
missing, clones `ethteck/coddog` into `tools/coddog` (gitignored), and
`cargo build --release -p coddog-cli`. Resulting binary:

```
tools/coddog/target/release/coddog
```

coddog is a cargo workspace (`crates/{core,cli,db,api}`); we build only the
`coddog-cli` crate, which produces the `coddog` binary — the `db`/`api` server
crates (sqlx/axum) aren't needed for local matching.

> coddog uses Rust **edition 2024**, so it needs a toolchain ≥ 1.85. `setup.sh`
> installs the latest stable via `rustup` when `cargo` is absent; if you already
> have an *old* `cargo` on `PATH`, run `rustup update` (or remove it so `setup.sh`
> installs a fresh one) or the build will fail with an edition-2024 error.

### Local patch: GBA platform string

Upstream coddog's CLI resolves the yaml's `platform:` via `Platform::from_name`,
which (as of v0.6.3) only knows `n64/psx/ps2/gc_wii/psp` and returns `None` for
`"gba"` — so a `platform: gba` config panics with `Invalid platform: gba`, even
though GBA/Thumb support fully exists in `coddog-core` (objdiff + `unarm` V4T;
see the `simple_gba` tests and `from_decompme_name`, which *does* list `gba`).
`setup.sh` applies a small idempotent patch to the gitignored clone that adds the
ARM/Thumb platforms (`gba`, `nds`, `n3ds`) to `from_name`, mirroring the arms
already in `from_decompme_name`. This is a local fix to a vendored tool; it
should also be filed upstream. See `docs/decisions.md`.

## Config

`scripts/tools/coddog/fe8.coddog.yaml` describes both binaries as two versions
of the same game:

| version | ELF                                  | role                         |
|---------|--------------------------------------|------------------------------|
| `jp`    | `fireemblem8.elf` (this repo)        | our in-progress JP decomp    |
| `us`    | `../fireemblem8u/fireemblem8.elf`    | near-complete US sibling     |

`scripts/tools/coddog/fe8u.coddog.yaml` is a convenience split holding only the
`us` version, so the two-binary compare reads naturally.

coddog only consumes `paths.elf` (function symbols) and `paths.asm` (to tag a
symbol `(decompiled)` when no matching `<name>.s` exists). `platform: gba` is
what selects Thumb/V4T disassembly. The other `paths.*` keys are required by the
schema and point at this project's real build outputs.

> **Both ELFs must exist.** `fireemblem8.elf` is a build output (gitignored), so
> run `make` in each repo first. In a fresh worktree the JP ELF is absent — run
> the real compare from the main tree after a build.

### Path handling (important)

Paths in the yaml resolve relative to the directory that holds the yaml coddog
is handed:

- `match` / `cluster` / `submatch` auto-discover a `decomp.yaml` in the **current
  working directory**. Copy the config to the repo root once:

  ```bash
  cp scripts/tools/coddog/fe8.coddog.yaml decomp.yaml
  ```

  The tracked configs live under `scripts/tools/coddog/`; the root `decomp.yaml`
  is a throwaway copy (delete it when done). Paths in the config are written
  repo-root-relative so they resolve from the root copy.

- `compare2 <yaml> <ver> <yaml> <ver>` resolves each yaml against **its own
  parent dir**. Run it with both configs copied to the repo root so the JP paths
  (`fireemblem8.elf`) and US paths (`../fireemblem8u/...`) both resolve:

  ```bash
  cp scripts/tools/coddog/fe8.coddog.yaml  decomp.yaml
  cp scripts/tools/coddog/fe8u.coddog.yaml fe8u.coddog.yaml
  ```

## Commands

Let `CODDOG=tools/coddog/target/release/coddog` and run from the **repo root**
(with `decomp.yaml` = the JP config copied there, plus `fe8u.coddog.yaml`).

### Triage: whole-binary cross-version compare (the main one)

```bash
$CODDOG compare2 decomp.yaml jp fe8u.coddog.yaml us --sort-by similarity
```

Output is grouped: *Decompiled in both*, *Only decompiled in us*, *Only in jp*,
*Decompiled in neither*, each line `jp_sym - us_sym (NN.NN%)`. Reading it for
triage:

- **High % (≈100%), US already decompiled, JP not** → region-same. **Carve it:**
  pull the US source/asm and relink at the JP address (`docs/porting.md`).
- **High %, both undecompiled** → region-same but US hasn't done it either; still
  a candidate to carve from US asm.
- **Low / no match** → region-different. Route to hand-decompile
  (`docs/reverse-engineering.md`).

Tunables: `-t/--threshold` (default 0.985; lower e.g. `-t 0.9` to surface
near-matches that need small fixups), `-m/--min-len` (skip tiny functions).

### Single-function neighbours (within one binary)

```bash
$CODDOG match <SymbolName> -t 0.9
```

Lists functions in the current binary similar to `<SymbolName>`. Useful to find
the JP twin of a function whose name/address you don't yet know, or to find
duplicate logic to fold into a shared `#include`.

### Duplicate clusters (de-dup within a binary)

```bash
$CODDOG cluster -m 10 -t 0.985
```

Groups near-identical functions (≥ `min_len` instructions). Surfaces families of
copy-paste functions to carve once and reuse.

### Partial / shared code chunks

```bash
$CODDOG submatch <SymbolName> 20
```

Finds `window`-length instruction runs shared between `<SymbolName>` and other
functions — handy when only part of a function is region-different and you want
to see which slice diverges.

## How results feed the carve workflow

1. Build both ELFs (`make` here and in `../fireemblem8u`).
2. `compare2 … --sort-by similarity` → ranked JP↔US function correspondence.
3. For each high-% / US-decompiled hit: confirm it's region-same, then carve per
   `docs/porting.md` (split the `asm/baserom.s` incbin, add the object at the JP
   address in `ldscript.txt`).
4. `make compare` must stay `OK` after every carve (the oracle).
5. Low-% functions → backlog for hand-decompilation
   (`docs/reverse-engineering.md`).
6. `cluster` on the JP ELF → fold duplicate functions into shared sources.

## Status / caveats

- Built and smoke-tested via `setup.sh`; see the PR for `coddog --help` output.
- A real cross-version `compare2` needs both ELFs present (gitignored, absent in
  worktrees) — run it from the main tree after a build.
- coddog matches **functions**, not data. FE8's ROM is ~94% data; the data
  frontier still uses `scripts/carve_data.py` (`docs/strategy.md`).
- Similarity is on instruction streams, so an exact name match in the US map is
  still the fastest path; coddog earns its keep on renamed/moved/region-shuffled
  functions and on *proving* a region is identical before carving.
