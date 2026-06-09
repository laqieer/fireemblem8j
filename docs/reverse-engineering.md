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

## Usage (from MCP clients)

The server is registered (machine-local) as the MCP server **`ida`**, started as
`idalib-mcp --stdio` with `IDADIR=/home/laqieer/ida-pro-9.3`. Do **not** pass
`tools/ida/fe8j.i64` on the MCP startup command line. Connect the MCP supervisor
first, then open the database explicitly with `idb_open`. Each database lives in
an idalib worker process that **outlives** the server and self-exits after an
idle TTL (~1h), so repeated sessions are cheap. Useful tools: `decompile`,
`disasm`, `list_funcs`, `func_query`, `xrefs_to`, `get_bytes`, `rename`,
`set_comments`, plus session tools `idb_open`/`idb_list`.

**Every worker tool needs a `database=<session_id>`.** Get one with
`idb_open(input_path="…/tools/ida/fe8j.i64", mode="force_headless")` (or
`idb_list` to reuse an existing session), then pass that `session_id`.

Why startup does not pre-open the `.i64`: `idalib-mcp` is a supervisor, but the
worker holding the unpacked IDA sidecars (`fe8j.id0`, `fe8j.id1`, `fe8j.nam`,
etc.) can survive after the stdio MCP process exits. A later MCP launch with
`idalib-mcp --stdio tools/ida/fe8j.i64` may try to open the same database again
instead of adopting the worker, then fail with `Failed to open initial binary:
Failed to open database`. Starting the supervisor without an input path makes MCP
connect fast and moves database ownership to the explicit `idb_open` step.

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
#   The upstream loader is now IDA-9.3-ready (laqieer/ida_gba_stuff#3); a local
#   copy is kept at scripts/ida/GBA_Loader.py.

# 5. Build the DB and register the MCP
make ida-db
. scripts/ida/idalib_env.sh
claude mcp add ida -e IDADIR="$IDADIR" -- "$IDALIB_MCP" --stdio
```

For GitHub Copilot CLI, the equivalent persistent config is
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
    }
  }
}
```

### Troubleshooting MCP startup

If `ida` reports "taking longer than expected" or "Failed to connect", first
check for an orphaned idalib worker holding the FE8J sidecars:

```bash
ps -eo pid,ppid,etime,stat,args | grep -Ei 'idalib|ida-pro|ida64' | grep -v grep
fuser tools/ida/fe8j.id0 tools/ida/fe8j.id1 tools/ida/fe8j.nam 2>/dev/null
```

Terminate only the specific stale PID, then remove stale discovery entries whose
PID no longer exists:

```bash
kill <pid>
# if it refuses to exit:
kill -9 <pid>
find ~/.idapro/mcp/instances -name 'instance_*.json' -print | while read -r f; do
  pid=$(jq -r '.pid // empty' "$f")
  [ -n "$pid" ] && ps -p "$pid" >/dev/null || rm -f "$f"
done
```

Do not delete `tools/ida/fe8j.i64`; it is the reusable packed database. The
unpacked sidecars are normal while a worker is using the DB. If Ghidra alone says
"taking longer than expected", that can be normal with `--wait-for-analysis`;
verify it by listing the cached project binaries and checking that
`fireemblem8.elf` is `analysis_complete`.

**If `ida` fails to connect at a fixed ~12s** (not a slow hang — a consistent
timeout), check that its registration has *not* re-acquired the `.i64` path:

```bash
claude mcp get ida          # Args MUST be just "--stdio" — never "--stdio …/fe8j.i64"
```

If the path is present, the supervisor is trying to open a DB the worker already
holds. Re-register the canonical (path-less) way:

```bash
. scripts/ida/idalib_env.sh
claude mcp remove ida -s local
claude mcp add ida -s local -e IDADIR="$IDADIR" -- "$IDALIB_MCP" --stdio
claude mcp get ida          # → ✔ Connected, sub-second
```

**If `ghidra` fails to connect at session startup** (`MCP error -32000:
Connection closed`), it is the ~16–19s cold `--wait-for-analysis` overrunning the
client's startup window — especially when launched concurrently with `ida` at
session start. The fix is a longer **MCP startup timeout** (`MCP_TIMEOUT`, in ms),
already set in `.claude/settings.json` `env` (verified honored from there, not
only as a shell export):

```json
{ "env": { "MCP_TIMEOUT": "60000" } }
```

For headless launches that don't load that file, export it instead:
`MCP_TIMEOUT=60000 claude …`. Confirm both servers come up together with
`claude mcp list` (it connects to both at once — the same condition as session
startup); expect `ida ✔` + `ghidra ✔`.

A leftover `~/ghidra-projects/fe8j.lock{,~}` is normally just a symptom of a prior
startup-timeout SIGKILL (raising `MCP_TIMEOUT` stops it recurring). Remove it
**only** when nothing owns it — a clean open recreates it:

```bash
ps -eo pid,args | grep -Ei 'pyghidra|ghidra|java' | grep -v grep   # must be empty
rm -f ~/ghidra-projects/fe8j.lock ~/ghidra-projects/fe8j.lock~
```

When debugging Ghidra startup, run launches **one at a time** — a `claude mcp
get/list` killed mid-analysis leaves the project in a state the *next* open trips
over, so back-to-back launches can both fail while a single isolated one
succeeds. See `docs/decisions.md` (D17).

## Second opinion: Ghidra (open-source cross-check)

A second, independent decompiler is useful for the region-different functions —
when Hex-Rays and Ghidra agree on a function's logic, a hand-decompilation is
much safer. Ghidra is set up headlessly via
[pyghidra-mcp](https://github.com/clearbluejar/pyghidra-mcp) (MCP server
`ghidra`), Linux-native, fed the **same `fireemblem8.elf`** (so its ELF loader
applies the ARM `$a`/`$t` mapping and gets ARM-vs-Thumb right).

Installed locally (gitignored / outside the repo): JDK 21 (`~/ghidra-tools/jdk-21*`),
Ghidra 12.x (`~/ghidra-tools/ghidra_*_PUBLIC`), and a venv with `pyghidra-mcp`
(`~/ghidra-mcp-venv`). Env lives in `scripts/ghidra/ghidra_env.sh`.

```bash
. scripts/ghidra/ghidra_env.sh
make ghidra-db                                  # one-time: analyzeHeadless -> cached .gpr (~3.5 min)
claude mcp add ghidra \
    -e JAVA_HOME="$JAVA_HOME" -e GHIDRA_INSTALL_DIR="$GHIDRA_INSTALL_DIR" \
    -- ~/ghidra-mcp-venv/bin/pyghidra-mcp \
       --project-path ~/ghidra-projects --project-name fe8j --wait-for-analysis
```

Verified through the MCP: `decompile_function(binary_name="fireemblem8.elf",
name_or_address="DecodeString")` returns the full Huffman decoder, matching IDA.
`--wait-for-analysis` is required — it runs an incremental `analyzeAll` over the
cached project so pyghidra-mcp marks it analysis-complete (only a few seconds on
the cache; without it, `decompile_function` refuses with "Analysis incomplete").
The JDK/Ghidra env vars must be passed with `-e` since the MCP server inherits a
bare environment.

Caveats (why IDA stays the primary): the **interactive** full analysis
(`open_program(analyze=True)`) is impractically slow (>25 min), so we build the
cache with `analyzeHeadless` (~3.5 min) instead. Like IDA, Ghidra auto-creates
only the functions it can reach — a region-different function still in the incbin
may need defining (in the correct ARM/Thumb mode) before it decompiles. Use
`ghidra` as a cross-check, `ida` as the workhorse; `make compare` is the oracle.

**Running Ghidra in Claude *and* Copilot at once.** A Ghidra project takes an
**exclusive lock** while open, so two `pyghidra-mcp` processes cannot serve the
*same* project simultaneously — the second fails with `MCP error -32000:
Connection closed`. Since Claude Code keeps its `ghidra` server (project `fe8j`)
alive for the whole session, the autonomous-loop Copilot consults (`agency cp`)
would otherwise be unable to attach Ghidra. Fix: Copilot opens an **isolated
clone** `fe8j-cp` instead (its `~/.copilot/mcp-config.json` sets
`--project-name fe8j-cp`). Build/refresh the clone with:

```bash
make ghidra-db        # rebuild the canonical fe8j project (after symbol progress)
make ghidra-cp        # mirror it into Copilot's fe8j-cp (scripts/ghidra/clone_copilot_project.sh)
```

Verified: with Claude on `fe8j` and Copilot on `fe8j-cp`, both `pyghidra-mcp`
connect concurrently (independent `fe8j.lock` / `fe8j-cp.lock`) and Copilot
decompiles through its copy. IDA needs no clone — its idalib worker is shared
across clients via `~/.idapro/mcp/instances`. See `docs/decisions.md` (D18).

## Byte-matching: decomp-permuter

The decompilers tell you *what* a function does; **decomp-permuter** closes the
last gap when your ported C compiles *close* but not byte-exact. It randomly
permutes the C (reorder statements, change temporaries, etc. — all
semantics-preserving) and keeps versions whose agbcc output scores closer to the
JP target, often finding an exact (score 0) match.

We use **upstream** [simonlindholm/decomp-permuter](https://github.com/simonlindholm/decomp-permuter)
— it now supports ARM32 (incl. Thumb) natively and is compiler-agnostic, so
agbcc works (the old `decomp-permuter-arm` fork is obsolete; see decisions.md).

Setup (one-time; the clone + venv are gitignored):
```bash
scripts/permuter/setup.sh          # clone upstream into tools/, make ~/permuter-venv
```

Per-function workflow:
```bash
# <func>.s is the JP function's descriptive disassembly, starting with
# `glabel <func>` (literal-pool data pointers as `.word gSymbol` so the target
# object gets the right relocations).
scripts/permuter/permute.sh import src/your_file.c path/to/<func>.s
scripts/permuter/permute.sh run nonmatchings/<func>/ -j   # prints base score, then searches
```

How it's wired (tracked: `permuter_settings.toml` + `scripts/permuter/`):
- `compiler_command` mirrors the Makefile C pipeline (cpp | iconv UTF-8→CP932 |
  agbcc | arm-none-eabi-as), minus `-Werror`. `scripts/permuter/compile.sh` is the
  hand-written, byte-validated standalone equivalent (its `.text` matches a
  Makefile-built object exactly).
- `compiler_type = "gcc"` (agbcc is GCC 2.x-era) picks the randomization weights.
- `scripts/permuter/prelude.inc` defines `glabel` for ARM/Thumb and sets `.thumb`.
- Don't set `objdump_command` — the scorer auto-detects ARM from the target object
  and uses `arm-none-eabi-objdump -drz`; a bare override drops the flags.

Verified end-to-end on `NextRN` (src/rng.c): `base score = 0`, 0 compile errors.
As always, a permuter-found source must still pass `make compare` and match the
repo's US-derived style before it's committed.

See [`docs/decisions.md`](decisions.md) (D6) for the rationale and the
alternatives considered.
