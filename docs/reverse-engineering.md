# Reverse-engineering tools: IDA Pro Hex-Rays via MCP

The project board's *Reverse Engineering tools* section lists IDA Pro 9.3 and
Ghidra and says "search and install MCP on GitHub to use them." This is the
result: the autonomous loop (and you, interactively in Claude Code) can drive
**IDA Pro's Hex-Rays decompiler headlessly** over the Model Context Protocol.

This is the lever for the remaining work. The automatable porting has converged
(see [`docs/decisions.md`](decisions.md)); what's left is the ~16
**region-different** functions (text rendering, font/glyph, menu geometry, save
versioning) that must be **hand-decompiled against the JP ROM's actual
behaviour**. A decompiler that produces pseudo-C for any JP address is exactly
what that needs.

## What got set up (all local, outside the repo)

| Piece | Location | Notes |
|-------|----------|-------|
| IDA Pro 9.3 (Linux x64) | `/home/laqieer/ida-pro-9.3` | installed from `~/ida93/ida-pro_93_x64linux.run`, patched + licensed (HEXARM ARM decompiler) |
| idalib venv | `/home/laqieer/ida-mcp-venv` | system `python3.12` + `idapro` wheel + `ida-pro-mcp` |
| Headless MCP server | `…/ida-mcp-venv/bin/idalib-mcp` | from [mrexodia/ida-pro-mcp](https://github.com/mrexodia/ida-pro-mcp); the upstream-recommended idalib path (no GUI) |
| GBA loader | `…/ida-pro-9.3/loaders/GBA_Loader.py` | from [laqieer/ida_gba_stuff](https://github.com/laqieer/ida_gba_stuff), patched for idalib (see below) |
| Prepared database | `tools/ida/fe8j.i64` | built by `make ida-db`; gitignored |

Why **Linux-native** and not the Windows `~/ida93/portable_win` build: it avoids
the WSL2↔Windows bridge entirely (this box is WSL2 in NAT mode, where
WSL→Windows `localhost` is not auto-forwarded), and idalib is purpose-built for
headless library use — load → analyse → decompile in one process, no display.

## Key design choice: feed IDA the ELF, not the raw `.gba`

We point IDA at **`fireemblem8.elf`** (the project's own build output), not
`baserom.gba`. Reasons, all verified:

* The ELF is a **32-bit ARM** image. Loading the raw `.gba` as a flat binary
  makes IDA's ARM module default to **AArch64**, and the decompiler then refuses
  the 32-bit Thumb functions (`only 64-bit functions can be decompiled`); forcing
  the flag off post-hoc trips `INTERR 50735`. The ELF loader creates a native
  **AArch32** database, so Hex-Rays loads the 32-bit `HEXARM` decompiler.
* The ELF carries the project's **4476 symbols** and ARM/Thumb `$t`/`$d` mapping,
  so everything already ported is named and correctly typed.
* The **still-incbin region is the raw ROM bytes at their real JP addresses** —
  identical to the `.gba` there — so the region-different functions we still need
  to decompile live in the ELF at the right place and decompile fine.

`make ida-db` then imports every JP function address from `sym_jp.txt` (7743):
for any address not already inside a function it forces Thumb and defines a
function, so `decompile(<jp_addr>)` works for **any** function in the ROM,
ported or not.

## Usage (from Claude Code)

The server is registered (machine-local) as the MCP server **`ida`**, started as
`idalib-mcp --stdio tools/ida/fe8j.i64`. It's a *supervisor*: each database lives
in an idalib worker process that **outlives** the server and self-exits after an
idle TTL (~1h), so repeated sessions are cheap. Useful tools: `decompile`,
`disasm`, `list_funcs`, `get_function`, `xrefs_to`, `get_bytes`, `rename`,
`set_comments`, plus session tools `idb_open`/`idb_list`.

**Every worker tool needs a `database=<session_id>`.** Get one with
`idb_open(input_path="…/tools/ida/fe8j.i64", mode="force_headless")` (or
`idb_list` to reuse an existing session), then pass that `session_id`.

**Decompile by address, not name** — some names resolve onto the `0x09000000`
ROM mirror. JP addresses come from `sym_jp.txt` / `layout/us_jp_funcmap.tsv`.

Typical loop for hand-decompiling a region-different function:

1. Look up the US function's behaviour (`../fireemblem8u/src/...`).
2. `decompile(database=<id>, addr="0x<jp_addr>")` to see what the JP ROM does.
3. Diff the two. For most functions they're identical and the existing porting
   recipe applies; for genuinely region-different ones, write `src/` C that
   matches the **JP** pseudo-C, then verify with `make compare`. Never commit
   Hex-Rays-shaped C directly — it's a hypothesis, `make compare` is the oracle.

`make compare` remains the only source of truth — the decompiler is a guide, not
an oracle. Never let a carve regress it.

## Rebuilding the database

Run `make ida-db` after meaningful decomp progress to refresh symbols. The
region-different targets live in the incbin (stable bytes), so a slightly stale
DB still decompiles them correctly — only the *names* of newly-ported functions
lag until the next rebuild.

## How it was installed (reproduce)

```bash
# 1. IDA 9.3 Linux, unattended (no X needed)
~/ida93/ida-pro_93_x64linux.run --mode unattended --prefix ~/ida-pro-9.3 --unattendedmodeui none
cp ~/ida93/kg_patch/linux/libida*.so ~/ida-pro-9.3/        # patched core
cp ~/ida93/kg_patch/idapro.hexlic    ~/ida-pro-9.3/        # named license (HEXARM)
cp ~/ida93/kg_patch/idapro.hexlic    ~/.idapro/
~/ida-pro-9.3/idapyswitch --force-path /lib/x86_64-linux-gnu/libpython3.12.so.1.0

# 2. idalib venv + the MCP
uv venv --python /usr/bin/python3.12 ~/ida-mcp-venv
uv pip install --python ~/ida-mcp-venv/bin/python ~/ida-pro-9.3/idalib/python/idapro-*.whl
~/ida-mcp-venv/bin/python ~/ida-pro-9.3/idalib/python/py-activate-idalib.py -d ~/ida-pro-9.3
uv pip install --python ~/ida-mcp-venv/bin/python \
    https://github.com/mrexodia/ida-pro-mcp/archive/refs/heads/main.zip

# 3. Accept the EULA headlessly (idalib batch mode is gated on this; normally a
#    GUI click). The kernel exposes the registry before open_database:
~/ida-mcp-venv/bin/python - <<'PY'
import idapro, ida_registry
ida_registry.reg_write_int("EULA 90", 1)   # records EULA v9.0 acceptance in ~/.idapro/ida.reg
PY

# 4. GBA loader (only needed if you load the raw .gba; the ELF path doesn't):
curl -sSL https://raw.githubusercontent.com/laqieer/ida_gba_stuff/master/loaders/GBA_Loader.py \
  -o ~/ida-pro-9.3/loaders/GBA_Loader.py
#   then patch the two `idaapi.cvar.inf.startIP/beginEA` lines (None under idalib)
#   to the guarded `ida_ida.inf_set_start_ea/ip` API — see scripts/ida/GBA_Loader.py.

# 5. Build the DB and register the MCP
make ida-db
claude mcp add ida -- ~/ida-mcp-venv/bin/idalib-mcp --stdio ~/fireemblem8j/tools/ida/fe8j.i64
```

See [`docs/decisions.md`](decisions.md) (D6) for the rationale and alternatives
considered (Ghidra headless was the documented fallback).
