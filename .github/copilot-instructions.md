# Copilot instructions

This repository is a byte-perfect decompilation of Fire Emblem: Seima no Kouseki
(FE8 Japanese, game code `BE8J`). The goal is to replace the raw-ROM baseline
with real `src/` C and descriptive `asm/`/data while keeping `make compare`
ending in `fireemblem8.gba: OK`.

## Build and verification commands

- `make compare` builds `fireemblem8.gba` and checks its SHA-1 against
  `checksum.sha1`. This is the project oracle. It requires a local
  `baserom.gba` with SHA-1 `7da0456035366aa18414faa79d8fe7649f03c1ed`,
  `binutils-arm-none-eabi`, and `tools/agbcc`.
- First-time Ubuntu setup mirrors CI: install `build-essential`,
  `binutils-arm-none-eabi`, and `libpng-dev`, then clone `pret/agbcc` and run
  `./build.sh && ./install.sh ..` so the compiler lands in `tools/agbcc`.
- `make layout` regenerates `ldscript.txt`, `asm/baserom.s`, and
  `asm/jp_syms.s` from the `layout/` manifests. Use `make layout && make compare`
  after adding or changing carve manifest rows.
- `make clean && make compare` is the durable full rebuild check for nontrivial
  carve/integration work.
- Single-unit/symbol iteration commands:
  - `tools/objdiff/objdiff-cli diff -p . -u rng` diffs a configured unit from
    `objdiff.json`.
  - `tools/objdiff/objdiff-cli diff -1 <target.o> -2 src/<unit>.o <Symbol> -o - --format json`
    diffs one symbol when a target object exists.
  - `$HOME/asm-differ-venv/bin/python tools/asm-differ/diff.py -mw 0x<START> 0x<END>`
    watches a raw function range; `START`/`END` are ROM file offsets
    (`VMA - 0x08000000`).
- `make ida-db` rebuilds `tools/ida/fe8j.i64`; `make ghidra-db` rebuilds the
  cached Ghidra project after meaningful symbol/layout progress.

## Architecture and data flow

- The project starts from an incbin baseline: generated `asm/baserom.s` covers
  all ROM bytes not yet represented by real source. Carved ROM sections in
  `layout/carved_rom.tsv` and `layout/carved_rom.d/*.tsv` are spliced into the
  linker script ahead of the remaining incbin gaps.
- `scripts/gen_layout.py` is the source of truth for generated glue. Do not
  hand-edit or commit `ldscript.txt`, `asm/baserom.s`, or `asm/jp_syms.s`; they
  are gitignored build artifacts regenerated from manifests.
- `layout/carved_rom.tsv` stores ROM file offsets and section specs.
  `layout/carved_ram.tsv` places RAM/NOLOAD sections at JP addresses so literals
  resolve correctly. `layout/baseline_syms.tsv` defines symbols still inside the
  raw baseline; use typed `thumb`, `arm`, or `data` entries so the linker avoids
  bad interwork veneers.
- The sibling US decomp at `../fireemblem8u` is the primary reference for source,
  headers, maps, and scripts. Most US C recompiles byte-identically once placed at
  JP addresses; true JP differences are concentrated in text/font/glyph/menu/save
  code and JP data.
- The C build pipeline is `cpp -> iconv UTF-8 to CP932 -> agbcc -O2
  -mthumb-interwork -fhex-asm -> arm-none-eabi-as`, then
  `arm-none-eabi-ld -T ldscript.txt`. Preserve the CP932 conversion when adding
  compiler/permuter tooling.
- CI `compare.yml` runs `make compare` only when the private `BASEROM_URL` secret
  is available. `decomp-dev.yml` computes progress from manifests and built
  `src/*.o` without needing the ROM.

## MCP servers

Configure Copilot CLI with the local reverse-engineering MCP servers in
`~/.copilot/mcp-config.json`:

```json
{
  "mcpServers": {
    "ida": {
      "type": "local",
      "command": "/home/laqieer/ida-mcp-venv/bin/idalib-mcp",
      "args": ["--stdio"],
      "env": {
        "IDADIR": "/home/laqieer/ida-pro-9.3"
      },
      "tools": ["*"],
      "timeout": 180000
    },
    "ghidra": {
      "type": "local",
      "command": "/home/laqieer/fireemblem8j/scripts/ghidra/pyghidra_mcp_router.sh",
      "args": [
        "--project-path",
        "/home/laqieer/ghidra-projects",
        "--project-name",
        "fe8j-cp",
        "--wait-for-analysis"
      ],
      "env": {
        "JAVA_HOME": "/home/laqieer/ghidra-tools/jdk-21.0.11+10",
        "GHIDRA_INSTALL_DIR": "/home/laqieer/ghidra-tools/ghidra_12.1.2_PUBLIC"
      },
      "tools": ["*"],
      "timeout": 300000
    }
  }
}
```

For IDA, start `idalib-mcp` without passing `tools/ida/fe8j.i64`; open the
database later with `idb_open(input_path="tools/ida/fe8j.i64",
mode="force_headless")` and pass the returned session id as `database` to worker
tools. If `idb_open` fails because stale sidecar files are held, inspect the
specific idalib worker PID before terminating it.

**Ghidra uses a separate project `fe8j-cp`, not `fe8j`, for Copilot.** A Ghidra
project takes an exclusive lock while open, so Copilot and Claude Code cannot
serve the *same* project at once (the second `pyghidra-mcp` fails with
"Connection closed"). Claude holds `fe8j`; Copilot gets an isolated clone
`fe8j-cp` so both can decompile concurrently. The router script keeps Agency
from accidentally giving Claude Copilot's `fe8j-cp` config. Refresh the clone
whenever the canonical project is rebuilt: `make ghidra-db && make ghidra-cp`.
IDA needs no copy — its idalib worker is shared via the instance registry. See
`docs/decisions.md` (D18).

## Decompilation conventions

- Read `docs/strategy.md`, `docs/porting.md`, `docs/decisions.md`, and
  `docs/handoff.md` before porting or carving. Do not reopen settled decisions
  without new evidence.
- Per-translation-unit flow: copy the US source/header, locate JP function and
  data addresses via `layout/us_jp_funcmap.tsv` and `layout/addr_map.tsv`, add
  needed baseline symbols/RAM sections, register ROM sections in manifests, then
  run `make layout && make compare`.
- Prefer per-task manifest fragments under `layout/<name>.d/<task>.tsv` for new
  carve work, especially parallel work. Generated glue is intentionally not
  committed so branches do not conflict on it.
- Treat low-confidence `addr_map.tsv` data mappings carefully: check votes and
  conflicts, and verify suspicious RAM/ROM addresses from JP disassembly before
  relying on them.
- `make compare` is the final oracle. IDA/Ghidra pseudo-C, m2c output, objdiff,
  asm-differ, and decomp-permuter are aids, not proof.
- For reverse engineering, IDA MCP is the primary decompiler and Ghidra is the
  cross-check. Feed both the project's `fireemblem8.elf`; decompile by JP address
  from `sym_jp.txt`/`layout/us_jp_funcmap.tsv`, not by name alone.
- Raw `.incbin` data is acceptable for identified opaque assets with verified JP
  boundaries. Structured tables, pointer-bearing data, text/scripts, and
  understood value data should become structured C or descriptive asm instead of
  generic blobs.
- Match the US decomp style unless JP bytes require a difference: `#include
  "global.h"` first in C files, PascalCase functions/types, `gCamelCase` globals,
  `sCamelCase` statics, `UPPER_SNAKE_CASE` constants, struct fields annotated
  with byte offsets, and helpers such as `STRUCT_PAD`/`SHOULD_BE_CONST` where the
  existing headers use them.
