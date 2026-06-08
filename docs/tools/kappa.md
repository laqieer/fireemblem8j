# Tool eval: kappa (macabeus/kappa)

Research-only assessment for the FE8J byte-perfect decomp. No install, no build.
Source read from a fresh clone at `/tmp/kappa` (commit-pinned shallow clone).
Upstream: https://github.com/macabeus/kappa

## 1. What kappa is, and why it isn't a direct fit

**kappa** is a VS Code extension ("your decompiler buddy who lives on VS Code")
that wraps the standard matching-decomp toolchain into an IDE: it bundles
`objdiff` (via `objdiff-wasm`), shells out to `m2c` and `decomp-permuter`,
one-click-creates [decomp.me](https://decomp.me) scratches, builds context-aware
AI prompts (with embeddings-based "similar function" retrieval using Voyage AI
`voyage-code-3`), drives GitHub Copilot in "agent mode" to iterate a function to
100% match, and runs user-written **AST-grep code-fix plugins** to mechanically
clean up decompiler output. It targets a `decomp.yaml`-described project across
many platforms (gba/nds/n64/gc/ps1/...).

**Why it's not a direct fit for us.** kappa is fundamentally a VS Code / Copilot
**IDE workflow** — its entry points are code lenses, command-palette commands,
`vscode.window` progress UI, `vscode.LanguageModelTool` registrations, and the
Copilot Agent chat. Our pipeline is **headless and AI-driven** (Claude Code CLI +
IDA/Ghidra MCP + upstream decomp-permuter), with `make compare` as the only
oracle. Almost every kappa feature is glued to the `vscode` API
(`src/db/db.ts`, `src/decompme/create-scratch.ts`, `src/m2c/m2c.ts` all
`import * as vscode`), so we cannot consume kappa as-is. It is also built for
**function matching** (m2c/permuter/decomp.me all operate per-function), whereas
our remaining frontier is ~94% **data** plus ~15 region-different code TUs — a
mismatch in problem shape. So: **learn-only**, borrow ideas, do not install.

## 2. Borrowable ideas

### A. AST-grep mechanical code-fix plugins for offset/struct hygiene  — HIGH value / LOW-MED effort
kappa's killer reusable idea. Plugins are tiny JS classes with `visit<NodeKind>`
methods over a tree-sitter/AST-grep C AST; a visitor API mutates the document
(`updateDocumentNodeWithRawCode`, `addLeadingComment`, `insertLineAfterNode`,
`applyRegexReplace`). Three of the shipped examples map almost 1:1 onto FE8
conventions:
- `example-kappa-plugins/AddOffsetCommentsPlugin.js` — walks a struct's
  `field_declaration` nodes, computes aligned offsets, and prepends
  `/* 0x00 */`-style leading comments plus a `/* size: 0xNN */` trailer. This is
  *exactly* our `/* 0C */` byte-offset annotation convention (CLAUDE.md).
- `example-kappa-plugins/AddCheckOffsetMacroPlugin.js` — same offset math, but
  emits `CHECK_OFFSET_X86(Struct, field, 0xNN);` after the struct. We'd template
  it to FE8U's static-assert offset macros (`STRUCT_PAD` / offset checks).
- `example-kappa-plugins/ApplyQNotationPlugin.js` — rewrites raw literals
  assigned to `.x`/`.y` into `Q(n)` fixed-point notation. FE8 has analogous
  fixed-point/flag-constant idioms where m2c/IDA emit raw hex.

**How we'd replicate (headless):** we don't need kappa's runtime. AST-grep ships
a standalone CLI (`ast-grep` / `sg`) and a Python/Node API (`@ast-grep/napi`,
which kappa itself depends on — see `package.json`). Add a
`scripts/codefix/` dir of AST-grep YAML rules + a thin `apply_codefix.py` that
runs `sg scan --rewrite` (or the napi API for the offset-arithmetic ones that
need computation, not pure pattern rewrite) over a `.c` file. Invoke it from the
loop right after an IDA/Ghidra/permuter draft, before `make compare`. The
offset/size plugins port directly to our `/* 0C */` style; value is high because
struct-offset bookkeeping is repetitive and error-prone, and we do a lot of it.
Note kappa hardcodes 8-byte `MEMORY_ALIGNMENT` — for GBA/ARMv4T we'd set
natural-alignment (max 4) and a `mapTypeToSize` keyed on FE8's `u8/u16/u32/s8…`.

### B. Embeddings-based "find a similar already-decompiled function"  — MED value / MED effort
`src/db/db.ts` + `src/db/index-codebase.ts` index every decompiled C function
alongside its built `.asm`, embed the **stripped assembly body** with Voyage
`voyage-code-3` (`#getEmbedding`, batch 25), store vectors in RxDB, and
`searchSimilarFunctions` does cosine-similarity top-k. The hits are then injected
as few-shot "# Examples" in the decompile prompt
(`src/get-context-from-asm-function.ts` → `craft-prompt.ts`).

**How we'd replicate:** the *idea* is what's valuable — when hand-decompiling a
JP region-different function, retrieve the most asm-similar **already-matched**
function (ours or, crucially, from `../fireemblem8u`, where most functions are
already decompiled) and hand it to the model as a worked example. We'd build an
offline embedding index (Voyage, or any local code-embedding model to avoid an
API key) over US function asm bodies keyed to their C source, as a
`scripts/retrieve_similar.py` that prints the top-k C examples for a target asm
function. This complements our existing US-symbol re-pointing strategy: instead
of only matching by name/address, we'd match by **asm shape**, surfacing reusable
templates even when names differ. Medium effort (need an index build + a small
retrieval script); medium value because we already have strong name/address
correspondence to US — embeddings mainly help the genuinely region-different
cases where the US name match is imperfect.

### C. One-shot decomp.me scratch creation with auto-assembled context  — MED value / LOW effort
`src/decompme/create-scratch.ts` POSTs to `https://decomp.me/api/scratch` with
`{target_asm, context, platform:'gba', compiler, preset, source_code}` and opens
the returned `slug`/`claim_token` URL. The nice part is `getInitialSourceCode()`:
it auto-seeds the scratch's context with the **type definitions and called-fn
declarations** the target needs and that aren't already in the context file
(dedup against `context.includes(name)`), and stubs the target signature.

**How we'd replicate:** a tiny `scripts/decompme_scratch.py` that takes a func
name, pulls its `.s` from our build, grabs declarations/types (we can lean on the
IDA/Ghidra MCP `decompile`/types or US headers), and POSTs the same payload
(`platform:"gba"`, our agbcc preset). decomp.me is a fine **escape hatch** to
crowd-source or hand-tune a stubborn region-different function, and creating a
fully-contexted scratch from the CLI is low effort. Value is medium (occasional
use, not in the hot loop). The platform/preset mapping table in
`create-scratch.ts` and `platform.ts` (`/api/platform/{id}`) is a useful
reference for the exact payload fields.

### D. objdiff as an in-loop, function-level diff oracle the model can read  — MED value / LOW effort (already partly planned)
kappa exposes objdiff two ways: a command, and a **Language Model Tool**
(`src/language-model-tools/objdiff.ts`) the Copilot agent calls as `#objdiff` to
get a textual current-vs-target diff for one function and "fix the gaps." The
prompt template (`src/prompt-builder/craft-prompt.ts`) bakes objdiff into the
build→diff→edit→repeat loop and tells the model to stop only at byte-identical.

**How we'd replicate:** we're already standing up `objdiff-cli` separately, so
this is mostly a wiring idea: wrap `objdiff-cli diff <build.o> <expected.o>
--symbol <fn>` as an MCP tool / slash-command the Claude loop can call to get a
*function-scoped* textual diff (vs. our current whole-ROM `make compare`
pass/fail). That gives the model a gradient to follow instead of a binary
oracle. kappa's `objdiff-wasm` route (loading `objdiff.core.wasm` in-process,
`src/objdiff/objdiff.ts`) is unnecessary for us — the native CLI is simpler
headless. Value medium, effort low; this is the most directly transferable
"agent loop" structure in the repo and worth mirroring in our loop prompt.

### E. The structured "decompile prompt" template  — LOW-MED value / LOW effort
`src/prompt-builder/craft-prompt.ts` is a well-shaped, copy-worthy prompt: it
assembles platform name + ISA ("Game Boy Advance / ARMv4T"), few-shot examples,
**functions that call the target** (call-site usage is strong type evidence),
declarations of called functions, type defs, the target asm, and an explicit
build→objdiff→refine→stop-at-byte-identical procedure. We can lift the section
structure (esp. "functions that call the target" and "reuse existing structs
before defining new ones") into `.claude/loop_prompt.md` for region-different
hand-decompiles. Low effort, modest value since we already have a porting
playbook — but the call-site-context idea is a genuinely good addition.

### F. (Minor) Build-pairing to mine (C, asm) training examples  — LOW value
`index-codebase.ts` pairs each source C function with its compiled asm by finding
the matching object in the build folder — a clean way to auto-build a corpus of
(C, asm) pairs without manual labels. For us the equivalent corpus is just
`../fireemblem8u` source ↔ its `.elf`/asm, which we already have; worth noting as
the mechanism behind idea B but not separately actionable.

## 3. Verdict: **borrow-ideas** (do not install)

kappa is the wrong *form factor* (VS Code + Copilot, function-matching-centric)
for our headless MCP pipeline and is not installable into our loop, but it is a
high-quality reference for several patterns we can cheaply re-implement as CLI
scripts:

- **Do soon (high ROI):** port the AST-grep offset/size/Q-notation code-fix
  plugins (idea A) to a `scripts/codefix/` set run before `make compare` — they
  map directly onto our `/* 0C */` / struct-offset conventions and AST-grep is
  already battle-tested here. Wire objdiff-cli as a function-scoped diff tool the
  loop can read (idea D) — we're building objdiff-cli anyway, and a readable
  per-function diff beats the binary `make compare` for guiding edits.
- **Do if/when useful:** asm-embedding similarity retrieval against US source
  (idea B) and a CLI decomp.me scratch creator (idea C) as an escape hatch for
  stubborn region-different functions.
- **Lift text:** the prompt structure (idea E) into `.claude/loop_prompt.md`.
- **Skip:** the VS Code extension, Copilot agent-mode, `objdiff-wasm` in-process
  loading, RxDB, and the scatter-chart UI — all IDE-coupled with no headless win.

These align with settled project direction: upstream decomp-permuter is already
our byte-matcher (`docs/reverse-engineering.md`, `docs/decisions.md` D6/D7/D9)
and objdiff-cli is being set up separately, so kappa mainly contributes the
AST-grep code-fix layer and the few-shot/objdiff loop structure on top of tools
we already run.

### Key file references (in the `/tmp/kappa` clone)
- AST-grep plugins: `example-kappa-plugins/AddOffsetCommentsPlugin.js`,
  `AddCheckOffsetMacroPlugin.js`, `ApplyQNotationPlugin.js`;
  runner `src/kappa-plugins.ts`; docs `docs/create-your-own-kappa-plugin.md`.
- Embeddings/index: `src/db/db.ts` (`#getEmbedding`, `searchSimilarFunctions`,
  `voyage-code-3`), `src/db/index-codebase.ts`, `src/db/voyage.ts`.
- decomp.me: `src/decompme/create-scratch.ts`, `src/decompme/platform.ts`.
- objdiff: `src/objdiff/objdiff.ts` (objdiff-wasm),
  `src/language-model-tools/objdiff.ts` (LM tool).
- m2c / permuter glue: `src/m2c/m2c.ts`, `src/decomp-permuter/decomp-permuter.ts`.
- Prompt + context assembly: `src/prompt-builder/craft-prompt.ts`,
  `src/get-context-from-asm-function.ts`.
- Bundled deps: `package.json` (`objdiff-wasm`, `@ast-grep/napi`,
  `@ast-grep/lang-c`, `rxdb`).
