# decomp.me — hosted scratchpad for tricky FE8J functions

## What it is

[decomp.me](https://decomp.me) is a collaborative, browser-based decompilation
"scratchpad". You paste a function's **target assembly** plus a **context**
(headers / type & symbol declarations), pick a **platform** and **compiler**,
and it runs that exact compiler server-side and live-diffs the compiler's
output against the target asm. You then iterate on the C source in the browser
until the diff is empty (a byte-perfect match). It is the same workflow we do
locally with `make compare` + asm-diff, but hosted, instant, and shareable —
ideal for the handful of genuinely region-different FE8J functions that need a
human (or another AI) to stare at a live diff.

It is an **occasional aid**, not part of the build. Our oracle remains
`make compare` in this repo; decomp.me is only a place to *develop* a matching
function body before committing it here.

## GBA + agbcc support is confirmed (from source)

A fresh clone of <https://github.com/decompme/decomp.me> was inspected. The
backend defines exactly the platform and compilers we need.

### GBA platform — `arch="arm32"`

`backend/coreapp/platforms.py` (lines 233–242):

```python
GBA = Platform(
    id="gba",
    name="Game Boy Advance",
    description="ARMv4T",
    arch="arm32",
    assemble_cmd='sed -i -e "s/;/;@/" "$INPUT" && arm-none-eabi-as -mcpu=arm7tdmi -mthumb -o "$OUTPUT" "$PRELUDE" "$INPUT"',
    objdump_cmd="arm-none-eabi-objdump",
    nm_cmd="arm-none-eabi-nm",
    has_decompiler=True,
)
```

Note the assembler is `arm-none-eabi-as -mcpu=arm7tdmi -mthumb` — exactly the
ARM7TDMI / Thumb target this project uses.

### agbcc compiler presets

`backend/coreapp/compilers.py` (lines 284–310) defines four GBA compilers, all
with `platform=GBA`:

| Compiler `id` | What it is |
| --- | --- |
| `agbcc`     | the standard agbcc (GCC 2.95-based) — **this is the one this repo uses** |
| `old_agbcc` | older agbcc build (`base_compiler=AGBCC`) |
| `agbcc_arm` | agbcc emitting ARM (non-Thumb) code (`base_compiler=AGBCC`) |
| `agbccpp`   | agbcp, the C++ front-end (`language=Language.CXX`) |

The `agbcc` preset's compile command:

```python
AGBCC = GCCCompiler(
    id="agbcc",
    platform=GBA,
    cc='/usr/bin/cpp -E -I "${COMPILER_DIR}"/include -iquote include -nostdinc -undef "$INPUT" '
       '| "${COMPILER_DIR}"/bin/agbcc $COMPILER_FLAGS -o - '
       '| arm-none-eabi-as -mcpu=arm7tdmi -o "$OUTPUT"',
)
```

This is the same `cpp → agbcc → arm-none-eabi-as` pipeline as our `Makefile`
(`CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm
-ffix-debug-line -g`). The matching preset for FE8J work is therefore:

- **platform id**: `gba`
- **compiler id**: `agbcc`
- **compiler_flags**: `-mthumb-interwork -Wimplicit -Wparentheses -Werror -O2`
  (drop `-fhex-asm`/`-ffix-debug-line`/`-g`; those are local debug/format flags,
  not codegen — keep `-O2 -mthumb-interwork`, which are the ones that affect
  matching. Use the in-browser flag UI to tweak if a function was built at a
  different `-O` level, e.g. `agb_sram.o` is `-O1` in our Makefile.)

(The full list of available GBA compilers is registered in
`backend/coreapp/compilers.py` around lines 1684–1688: `AGBCC`, `OLD_AGBCC`,
`AGBCC_ARM`, `AGBCCPP`.)

## How to use the HOSTED site for a hard FE8J function

The normal, recommended path is the **website UI**, not the API:

1. Get the function's **target asm**. From this repo, the per-function asm comes
   from the carve/objdump tooling (or the US ELF via `arm-none-eabi-objdump`).
   The asm decomp.me wants is plain `arm-none-eabi-as`-assemblable Thumb text
   for that one function.
2. Build a **context**: the minimal headers / `typedef`s / `struct`s / extern
   declarations the function references, so the compiler has the right types and
   symbol sizes. In practice this is a trimmed paste of the relevant
   `include/*.h` from this repo (or `../fireemblem8u`).
3. Go to <https://decomp.me/new>, choose **Platform → Game Boy Advance** and
   **Compiler → agbcc**, set the flags above, paste the **target asm** in the
   "Target assembly" box and the headers in the "Context" box, and create the
   scratch.
4. Iterate on the C in the editor. decomp.me recompiles and re-diffs on every
   change; drive the diff to 100% / 0 score.
5. Copy the final matching C back into this repo (`src/…`), wire it into
   `ldscript.txt` at the JP address per `docs/strategy.md`, and verify with
   `make compare` here — **that** is the authoritative check, not decomp.me's.

decomp.me has a built-in decompiler (`has_decompiler=True` for GBA) that can seed
an initial C body from the asm, which is a handy starting point for the hardest
functions.

## REST API for programmatic scratch creation

Routing (`backend/decompme/urls.py` → `path("api/", include("coreapp.urls"))`
and `backend/coreapp/urls.py` → `router.register(r"scratch", ScratchViewSet)`
with `trailing_slash=False`) gives the endpoint:

```
POST https://decomp.me/api/scratch
Content-Type: application/json
```

`ScratchViewSet.create` (`backend/coreapp/views/scratch.py:343`) calls
`create_scratch(request.data)`, which validates the body with
`ScratchCreateSerializer` (`backend/coreapp/serializers.py:156`). The accepted
JSON fields:

| Field | Type | Notes |
| --- | --- | --- |
| `platform` | string | e.g. `"gba"`. Optional if `compiler` implies it; if given it must match the compiler's platform. |
| `compiler` | string | e.g. `"agbcc"`. **Required when `preset` is omitted.** |
| `compiler_flags` | string | e.g. `"-mthumb-interwork -O2"`. |
| `target_asm` | string | the function's assembly (the thing to match). |
| `context` | string | headers / declarations. Defaults to `""`. |
| `source_code` | string | optional initial C; if omitted and asm is present, the server decompiles a stub. |
| `diff_label` | string | the symbol/label to diff against (the function name). |
| `diff_flags` | JSON | optional list of diff flags. |
| `name` | string | scratch name (defaults to `diff_label` or `"Untitled"`). |
| `libraries` | JSON list | each item needs `name` + `version`; default `[]`. |
| `preset` | id | optional; a saved preset that supplies platform/compiler/flags. |
| `target_obj` | file | optional; an object file instead of `target_asm` (multipart). |
| `rom_address`, `project` | — | project-mode only; not used for ad-hoc scratches. |

On success it returns **HTTP 201** with the scratch JSON, including a read-only
**`slug`** (`ScratchSerializer.slug`, `serializers.py:315`). The human URL is
then:

```
https://decomp.me/scratch/<slug>
```

(confirmed by the frontend `scratchUrl`,
`frontend/src/lib/api/urls.ts:31` → `` `/scratch/${scratch.slug}` ``).

Minimal example body:

```json
{
  "platform": "gba",
  "compiler": "agbcc",
  "compiler_flags": "-mthumb-interwork -O2",
  "diff_label": "SomeFeFunc",
  "target_asm": "SomeFeFunc:\n    push {lr}\n    ...\n    pop {pc}\n",
  "context": "#include \"global.h\"\n/* trimmed declarations */\n"
}
```

To enumerate live preset ids without creating anything, `GET /api/compiler`
returns `{ "compilers": {...}, "platforms": {...} }`
(`backend/coreapp/views/compiler.py:61` `CompilerDetail.get`); look for the
`gba` platform and the `agbcc` compiler keys.

## Smoke test (read-only) — result

Attempted a read-only `GET https://decomp.me/api/compiler` and
`GET https://decomp.me/api/platform` from this environment. Both returned the
Cloudflare **"Just a moment…"** JS anti-bot interstitial (HTML, not JSON):

```
<!DOCTYPE html><html lang="en-US"><head><title>Just a moment...</title>...
```

So the public API is reachable but gated by a browser JS challenge from this
sandbox; a plain `curl` cannot fetch the JSON. The GBA/agbcc facts above are
therefore confirmed from the **cloned source** (authoritative), not from the live
endpoint. From a normal browser the same endpoints return the JSON and the
website UI works as described. This Cloudflare gating is also a practical reason
**not** to rely on scripted API access.

## Honest recommendation

- **Use the hosted site (decomp.me) as an occasional human/AI aid** for the few
  genuinely region-different FE8J functions where a live, instant diff helps more
  than the local loop — and for sharing a stuck function with a collaborator.
  GBA + `agbcc` are first-class there, matching this project's toolchain exactly.
- **Do NOT self-host.** decomp.me's only supported deployment is Docker
  (`docker-compose.yaml`, `docs/DOCKER.md`), and Docker is not available in this
  environment. Self-hosting buys us nothing the local `make compare` loop and the
  IDA/Ghidra/permuter tooling don't already provide.
- **Treat scratch creation as a deliberate, opt-in, manual action — never
  automated.** Creating a scratch on the public site **publishes** the target
  asm, your context, and your C to a public, outward-facing service (other people
  can see and fork it). That is fine for a function you're comfortable sharing,
  but it must be a conscious choice, not something a loop does on its own. The
  optional helper (`scripts/tools/decompme/new_scratch.sh`) is gated behind an
  explicit opt-in env var for exactly this reason.
