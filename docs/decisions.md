# Decision log

## D1 — Next phase: per-function-run porting (not whole-file-only)

**Date context:** after 10 whole-file TUs (~0.01%), a 12-file batch ported 0/12 —
larger files don't match as whole units because one region-different function (or
one unmasked placement-dependent byte) poisons the whole-file masked signature.

**Consulted:** Copilot CLI (`agency cp`). Its recommendation: prioritize
**per-function porting** over more whole-file masking — whole-file matching is
all-or-nothing; per-function isolates the differing function, turning "0/12
files" into "most functions matched, a few flagged," and yields a precise queue
for region-specific decompilation.

**Validation (done before committing to it):**
- `-ffunction-sections` with agbcc: REJECTED. It accepts the flag and emits
  per-function `.text.<fn>` sections, but concatenation/placement adds alignment
  that shifts bytes; not usable for byte-matching.
- **Source-level run splitting: VALIDATED.** Compiling a subset `.c` containing
  only a contiguous run of functions (e.g. NextRN+InitRN) produces those
  functions byte-for-byte identical to the JP ROM (`0xB60..0xC0C`), *provided*
  baseline-resident calls (memcpy, __modsi3, …) are declared as typed-Thumb
  symbols so the linker emits direct BL with no interwork veneer. (A first test
  wrongly suggested literal-pool coupling; that was veneer bytes from untyped
  test symbols — corrected.)

**Decision:** adopt **per-function-run porting** as the next-phase architecture:
1. For a target file, get each function's JP match status (match_us_jp +
   per-function locate).
2. Group consecutive *matching* functions into contiguous JP runs.
3. For each run, compile a subset `.c` (the run's functions only) and carve it at
   the run's JP range; non-matching functions stay in the incbin baseline,
   exposed as typed baseline symbols.
4. Genuinely region-different functions become the queue for behavioural JP
   decompilation (the old option #3).

Targeted masking improvements (jump tables / `.rodata`) are done only as needed
to support per-function location — not as a standalone whole-file-perfection phase.

**Status:** validated; implementation pending (extend locate_tu/port_tu to
per-function granularity). Tracked on project board #14.

## D2 — Runs must be verified as a compiled block (not trusted per-function)

**Date context:** per-function-run porting (D1) worked for small runs (time: 2
fns) but failed for bmtrick's 18-fn run — the compiled subset matched JP for ~5
functions then shifted (871 diffs). Root cause: per-function masked search gives
individually-unreliable matches (small functions get false-positive unique hits
that still pass the source→JP monotonicity filter), so the grouped "run" isn't a
true JP-contiguous block.

**Consulted:** Copilot CLI. Recommendation (adopted): the unit you carve is a
linked block, so the unit you *trust* must also be a linked block. Per-function
matches are proposals only.

**Decision (D2):** the carve primitive is **compile-and-verify-the-block**:
1. Propose candidate functions via per-function masked search.
2. Form a candidate run (consecutive matched functions, source order).
3. Compile the subset `.c` and masked-search its WHOLE emitted `.text` for a
   UNIQUE match in the JP ROM.
4. Only carve if the block uniquely matches, at the matched JP base.
5. On no/!unique match, find the longest matching prefix (binary search on the
   function count), carve that, recurse on the remainder.

Rule: **never carve a run unless the compiled block has a unique masked ROM
match.** This makes the porter self-validating; false runs auto-shrink to real
verified runs. ROM-resident `.data`/`.rodata` placement (D1 follow-up) layers on
top once the `.text` block is verified.

## D3 — Sequence opaque JP `.rodata` before full JP text extraction

**Date context:** after D1/D2, the next sequencing fork is whether to invest
immediately in full JP text/script extraction plus `include/constants/msg.h`, or
to keep porting verified code runs while carving region-different `.rodata` as
raw JP bytes.

**Consulted:** Copilot CLI. Recommendation: choose the hybrid path now; full text
extraction is a large fixed-cost data project, while per-run raw JP `.rodata`
keeps the D2 code porter moving and preserves byte-perfect validation.

**Decision:** use **hybrid near-term porting**:
1. Continue D2: only carve a compiled `.text` run after the whole block has a
   unique masked JP ROM match.
2. When that verified run needs region-different `.rodata`, carve only the
   minimal owner blob as raw JP incbin bytes at its exact JP address, exposing the
   labels required by the compiled code. Leave the data opaque for now.
3. Do not front-load complete JP text/script extraction or a complete JP
   `msg.h`. Add narrow message/header constants only when a current verified run
   needs them and they can be checked cheaply.
4. Start the full JP text/script extraction phase once text becomes the measured
   dominant blocker, not before.

**Rationale:** Option 3 maximizes unblocked code per unit effort. It has low
fixed cost, composes with D2's unique-block validation, and keeps `make compare`
as the authority. Option 1 risks scope expansion into text encoding, control
codes, extractor correctness, message-id renumbering, and broad header churn
before those pieces are proven to unlock more code than the raw-blob path.

**Risks and mitigations:**
- Opaque data debt / later redo: keep blobs minimal, named by owner/address, and
  treat them as temporary manifests to replace with typed data later.
- Wrong blob bounds or pointerful data: allow a raw blob only when its exact JP
  address/range is justified by literal refs, high-confidence `addr_map.tsv`, or
  adjacent section boundaries; place it at the original JP address with no byte
  transformations.
- Hybrid path stalls on text-heavy code: switch phases when evidence shows text
  data, not code layout, is the bottleneck.

**Validation criteria:**
- Before any code carve, the compiled `.text` block has a unique masked match in
  the JP ROM.
- Before any raw `.rodata` carve, the blob bytes are copied from the exact JP ROM
  range, labels resolve to the addresses used by the verified code, and internal
  pointer bytes remain at original JP addresses.
- After each manifest change, `make layout && make compare` must end with
  `fireemblem8.gba: OK`.
- Track per batch: functions/bytes carved, opaque `.rodata` blob count/bytes, and
  reasons rejected runs failed. Revisit Option 1 if a batch shows most rejected
  runs are blocked only by JP message/text `.rodata`, or if temporary text/message
  blobs exceed roughly 20 blobs or 64 KiB.

## D3 — Region-different DATA gates code; JP text extraction is the critical path

**Finding:** much un-ported code is logically identical to US but references
region-different *data* — most commonly `.rodata` tables of `MSG_*` text IDs that
differ JP<->US (bmreliance affinity table: JP 0x499.. vs US 0x510..). These IDs
come from a generated `include/constants/msg.h` (US: scripts/texttools from
texts/*.txt).

**Rejected (raw-incbin substitution):** the region-different `.rodata` is emitted
*from the C source* (a `static const` array of `MSG_*` constants), so the `.text`
references its own compiled `.rodata`. Substituting raw JP bytes would break that
linkage; it only works for data that is a *separate* blob, not C-generated.

**Decision (D3):** the critical path is **JP text/data extraction**. Generating a
JP `include/constants/msg.h` with correct JP message IDs lets the US C source
recompile to the JP `.rodata` automatically, unblocking a broad swath of code at
once. This is the original Epic 4 (#15) and is now the highest-leverage track.
Per-function code porting continues to harvest data-clean + identical-data runs
in parallel, but the bulk needs the JP data first.

**Status:** JP text extraction is a large, multi-step sub-project (decode the JP
message table from the ROM, rebuild texts/ + msg.h). Next track to open.

## D4 — Message-name alignment: use code-reference correspondence, not text

**Tried & insufficient:** aligning US↔JP messages by control-code skeletons.
Control-code *vocabularies* differ (US uses code 1 ~18k times, absent in JP; JP
uses 17/22/24/25, absent in US); only codes 3/9/12/16 are shared. Restricting
skeletons to shared codes yields too few unique anchors (6, chain of 2) — not
enough to align 3438↔3340 messages. The text content can't align them either
(different languages).

**Better approach (recommended):** derive US-index↔JP-index correspondence from
the *code/data that references messages*. A region-different function/table is
logically identical except the embedded `MSG_*` constant *values*; match it
US↔JP by masking the message-id literals (as scripts/match_us_jp.py masks
pointers), then read the US value and the JP value at the matched site → a direct
correspondence pair. bmreliance's affinity `.rodata` already gave 7 such pairs
(US 0x510..0x516 ↔ JP 0x499..0x49f). Aggregate thousands of these across the ROM,
filter for monotonic consistency, and interpolate → US `MSG_*` → JP index map →
regenerate `msg.h`. This is reliable (exact integer pairs) and language-agnostic.

**Status:** the alignment crux now has a concrete, evidence-backed method;
implementing the masked MSG-reference matcher is the next step. The huffman
decode + table location remain validated and done.

## D5 — Progress backfill: replay manifests via git-show, not per-commit rebuild

**Context:** the `PROGRESS_API_KEY` secret is now configured and the frogress
project `fireemblem8j` exists (version `jp` auto-creates on first authenticated
POST). `progress.yml` only ever publishes HEAD; the portal needs the *whole*
history charted. 51 commits changed `layout/carved_rom.tsv` (the carve manifest).

**Decision (Copilot-reviewed, endorsed):** compute each historical point with
method **B** — read that commit's manifest via `git show <commit>:layout/*.tsv`
for **exact** code/data bytes, and compute functions/symbols by summing a
per-object `nm` cache built **once at HEAD**. Rationale: carves only ever accrete
(a committed object stays), so every historical object still exists at HEAD; the
only inaccuracy is an object whose run was *extended* after its first carve
(rare), slightly over-counting its functions at earlier commits. Avoids 51
rebuilds while keeping the dominant code/data curve exact.

**Guards (from Copilot review, implemented in scripts/backfill-progress.py):**
include the first manifest commit (not just diffs); flag any historical object
missing at HEAD (accretion-drift); detect later byte-range extensions and mark
those symbol counts approximate; always take bytes from the commit's own
manifest; key the nm cache by object path; monotonic sanity check; run the POST
once (frogress entries keyed by git_hash/timestamp). The accurate-but-slow
method A (per-commit checkout+rebuild) is reserved as a fallback for any commit
the guards flag as suspicious.

**Status:** implemented as `scripts/backfill-progress.py` +
`.github/workflows/backfill-progress.yml` (workflow_dispatch, uses the secret).
One run creates the `jp` version and fills the timeline; `progress.yml` keeps it
current on every push thereafter.

## D6 — Reverse-engineering: IDA Pro Hex-Rays via headless MCP, fed the ELF

**Date context:** the automatable porting has converged; what remains is the
~16 region-different functions (text/font/menu/save) that need *hand*-decompiling
against the JP ROM's actual behaviour. The project board's *Reverse Engineering
tools* section lists IDA Pro 9.3 + Ghidra and says "search and install MCP to use
them." So: stand up a decompiler the autonomous loop can query.

**Consulted:** the in-repo research workflow (4-way fan-out + adversarial
verification) and Copilot CLI (`agency cp`). Copilot endorsed the ELF-first
approach and added the guardrails below.

**Decision:** install **IDA Pro 9.3 Linux-native** and expose its Hex-Rays
decompiler through **mrexodia/ida-pro-mcp's `idalib-mcp`** (the upstream-
recommended *headless* server — no GUI, no WSL↔Windows bridge), registered with
Claude Code as the MCP server `ida`. Feed IDA the project's own **`fireemblem8.elf`**
(32-bit ARM), not the raw `.gba`.

**Rationale / what was validated (empirically, end-to-end):**
* Linux-native idalib avoids the WSL2 NAT-mode bridge and runs in the autonomous
  loop with no display. Install + keygen-patch + named `.hexlic` (HEXARM) all work
  headlessly. The idalib "License not yet accepted" batch gate (normally a GUI
  click) is cleared headlessly by writing the `EULA 90` registry key via the IDA
  registry API.
* **ELF, not `.gba`:** loading the raw `.gba` makes IDA's ARM module default to
  **AArch64**; the decompiler then refuses the 32-bit Thumb functions and forcing
  the flag off trips `INTERR 50735`. The ELF loads as native **AArch32** (correct
  `HEXARM` decompiler), carries the project's symbols + `$t`/`$d` Thumb mapping,
  and its still-incbin region is the raw ROM bytes at real JP addresses — so the
  region-different functions decompile there. Proven: `NextRN`, `DrawGlyph`
  (font blitter), and `DecodeString` (the JP Huffman text decoder) all produce
  clean C, both via direct idalib and through the MCP protocol.
* `make ida-db` builds `tools/ida/fe8j.i64` from the ELF, importing all 7743
  `sym_jp.txt` functions (forced Thumb) so `decompile(<addr>)` works anywhere.

**Guards (from Copilot review):** treat the `.i64` as a *disposable cache*, not
a source of truth — `make compare` remains the only authority. Use Hex-Rays as a
*hypothesis generator*: port US C with JP-specific data/layout, then verify with
`make compare`; never commit Hex-Rays-shaped C directly. Decompile **by address**
(names can resolve onto the 0x09000000 ROM mirror). Rebuild the `.i64` after
meaningful decomp progress to refresh symbols.

**Operational addendum (2026-06-09):** register `ida` as `idalib-mcp --stdio`
only, with `IDADIR` set; do **not** pre-open `tools/ida/fe8j.i64` in the MCP
startup command. Pre-opening made GitHub Copilot CLI time out when an orphaned
idalib worker from an earlier session still held `fe8j.id0/.id1/.nam`: the new
supervisor tried to open the same DB and exited with `Failed to open initial
binary`. Start MCP first, then use `idb_open(.../tools/ida/fe8j.i64,
mode="force_headless")` and pass the returned session id to worker tools.

**Rejected alternative:** the IDA GUI-plugin MCP (needs a running GUI + the
WSL↔Windows bridge).

**Second decompiler (added later): Ghidra via `pyghidra-mcp` (server `ghidra`).**
A free, independent cross-check for the region-different functions — agreement
between Hex-Rays and Ghidra makes a hand-decompilation much safer. Also fed the
ELF (so Ghidra's loader applies the ARM `$a`/`$t` mapping for correct ARM-vs-Thumb).
No GBA-loader extension needed. Key learning: the *interactive* full analysis
(`open_program(analyze=True)`) is impractically slow (>25 min), but
`analyzeHeadless` does the same full analysis in **~3.5 min** and is cached — so
`make ghidra-db` is practical. Verified: it decompiles `DecodeString` (140 B
Huffman decoder) and `DrawGlyph` (188 B) fully and matching IDA. IDA stays the
workhorse (HEXARM is stronger and instant); Ghidra is the second opinion.

**Status:** both decompilers installed, registered (`claude mcp list` →
`ida ✓ Connected`, `ghidra ✓ Connected`), and verified end-to-end through the MCP
protocol. Tooling tracked under `scripts/ida/` + `scripts/ghidra/` +
`docs/reverse-engineering.md`; the DBs and the IDA/Ghidra installs are
local/gitignored.

## D7 — Accelerating the decomp carve loop (profile first, parallelize second)

**Question:** how to make the harvester (carve the remaining ~190 TUs) faster.
The instinct was "parallelize across the 16 cores"; the profile said otherwise.

**Measured (16-core box), per carve:**
| phase | time |
|---|---|
| `make clean` + full rebuild + `make compare` (what port_run did) | **13.1 s** |
| incremental `make layout` + `make compare`, **no** `make clean` | **0.30 s** |
| `make -j16` full rebuild | 1.77 s |
| assemble the 16 MB incbin (`asm/baserom.o`) | 0.06 s |
| relink only | 0.14 s |

**Finding:** the dominant per-carve cost was a **redundant `make clean`** forcing a
full recompile of all ~169 carved objects. make already rebuilds exactly what a
carve changes (the new `src/<name>.o`, the shrunk incbin, the relink). Removing
the clean → **~44× faster verify, byte-identical output.** A/B-verified by
un-carving and re-carving `fontgrp` with the change: identical manifests, `make
compare` OK. Done in **D7 commit** (`port_run` no longer cleans; verify-or-revert
is still the safety net).

**Decision — acceleration tiers, in priority order:**
1. **Drop the per-carve `make clean`** (done): 44×, zero parallelism, zero risk.
2. **Parallelize run discovery (`find_runs`)** — now the dominant cost: it
   compiles the full TU + every candidate subset serially. It's read-only on the
   repo (writes only `/tmp` scratch), so it parallelizes across TUs/cores cleanly
   once its temp files are per-process. *Next.*
3. **Parallel carve+verify needs ISOLATED build dirs** — concurrent `make` in one
   working tree races (observed). Use git worktrees (one per worker) or compute
   all manifest rows in parallel and do **one** batched `make compare`; manifest
   rows are append-only & per-TU independent, so they merge by concatenation
   (address conflicts are caught by the single final compare).
4. `make -j16` for any remaining full rebuild (7×).

**Rejected:** fanning the work out to ~30 isolated-worktree worker agents (the
naive "/batch" shape). It's the wrong tool here — the carves share the `layout/*.tsv`
manifests (textual merge conflicts) and the single whole-ROM verifier, most of the
remaining TUs are region-different (≈0 yield, observed: an 18-TU batch carved 0),
and each worker still pays the full rebuild. Tier 1 alone beats it; Tiers 2–3 are
the right parallelism and live in one harvester, not 30 PRs.

## D8 — Disable the auto_drive cron (2026-06-08)

**Decision:** removed the `41 */2 * * * scripts/auto_drive.sh` crontab entry. The
script is kept on disk; restore = re-add that one line via `crontab -e`.

**Why:** the cron's headless `agency cc` agent step (after the PATH fix that made it
fire at all) was **killed by an external SIGTERM (exit 143/144) ~13 min in**, mid-task,
committing nothing. Dig-in found: **no agency execution limit** (no hardcoded time/turn
cap; only `--max-budget-usd`), **not OOM** (29 GB free, no kill in dmesg), **not** the
script's 90-min `timeout`. **Cause (root-caused 2026-06-08):** agency's headless mode has a HEARTBEAT/IDLE
**monitor watchdog** (binary strings `HEARTBEAT`, `IDLE`, `monitor did not ack within
2s`). FE8J carves require repeated **10-15s BLOCKING `make compare`/`make clean`**
builds; during one the claude process can't ack the 2s monitor heartbeat, so the
watchdog SIGTERM-kills it (143/144). Structural incompatibility — a build-heavy agent
will keep tripping it. The cron agent is
non-viable regardless: the harvester step now carves **0** (automated frontier exhausted)
and the remaining frontier is region-different (needs IDA/Ghidra/permuter, slow per-fn —
won't complete in a short, unreliable cron agent). It burned API budget for no commits.

**Continuation now relies on:** interactive/driven sessions + `docs/handoff.md`. Re-enable
the cron only after the agent step is made resilient (resumable small increments that
commit before any kill) or the frontier shifts back to harvester-automatable work.

## D9 — Next-phase path for region-different CODE: permuter from funcmap-gap boundaries (2026-06-08)

**Context:** mechanical carving is exhausted at **306 objects / 15.51%** (thunder, the
last byte-matchable TU, landed via the reloc-consistency NOLOAD fix). The remaining
~11 code TUs (banim-efxmagic-aura/bindingblade/gespenst/refresh, banim-main,
classdisplayfont, code_8086934, eventfx-stoneshatter, events_script, main, msg) are
genuinely region-different: confirmed data-driven that **none of their functions appear
in the 7740-entry `us_jp_funcmap.tsv`** (both exact and masked tiers fail). No
byte-matchable run exists, so `port_run`/`find_runs`/`carve_mapped` cannot touch them.

**Decision:** the next headless-viable path is to **bootstrap the decomp-permuter from
funcmap-gap-derived boundaries**, not to pivot to DATA carving. A region-different TU's
functions live in the JP ROM *between* its two nearest funcmap-mapped neighbors (the
mapped functions immediately before/after the TU's run in US order). Within that outer
interval: split on halfword-aligned Thumb `push {..., lr}` prologue candidates, then
**validate each candidate by CFG/refs** (BL/B targets land on a candidate start,
returns/tail branches, literal-pool boundaries, and *no* code reference into the middle
of a candidate). Feed one validated function at a time to the permuter (US source as the
seed; JP bytes in the derived interval as the target). DATA carving (banim_data,
banim_pal_chara, banim_terrain_data, banim-efxsound-data) stays **secondary** — named
incbin chunks until a code ref forces precise structure.

**Why (validated):** my own analysis + Copilot second-opinion (`agency cp`, 2026-06-08)
agreed: region-different CODE is the blocker for any permuter-driven progress, so
unblocking boundaries has higher leverage than DATA; and the `push {lr}` split is a
*candidate* generator that MUST be CFG-validated (not proof) to avoid mis-split seeds.
Interactive IDA/Ghidra MCP remains the faster route when an interactive session is
available — the permuter path is the headless fallback. `make compare` stays the only
oracle; every permuter output is verify-or-revert gated exactly like a carve.

**Next concrete step:** `scripts/derive_boundaries.py <tu>` — read the funcmap, find the
TU's JP gap, emit candidate function intervals (prologue split + CFG validation) for the
permuter. First target: `banim-efxmagic-bindingblade` (smallest, 6 funcs).

## D10 — Pivot to the DATA frontier (data is 94% of the ROM) (2026-06-08)

**Context:** the Stop-hook goal is byte-complete decomp, and the progress breakdown shows
the real bulk is DATA, not code: **code 13.4% (858 KB total), data was 0.05% (13.3 MB
total), functions 15.5%**. The ~11 region-different code TUs are a few KB — a rounding
error against the goal. ROM-wide analysis: **26% of the ROM is byte-identical US<->JP at
the same offset** (a 3.28 MB region-same block at 0x08BC3A00, a 922 KB block at
0x08EF9454, etc.) — shared graphics/animation/asset data.

**Decision:** carve the DATA frontier, in tiers by fidelity (match the US representation):
1. **Region-SAME named data → DONE / mechanical.** For each US data object whose full
   range is byte-identical in JP, emit `asm/<name>.s` defining the US symbols as labels
   and incbinning the bytes from baserom.gba between them (`scripts/carve_data.py`, the
   data harvester). Carved `banim_data[]` (6.4 KB table, as real C), `data_banim`
   (2.38 MB, 1475 syms), `data_banim_terrain` (74 KB). Result: **data-in-src 0.05% ->
   18.6%, symbols 3.8% -> 7.7%**, all `make clean && make compare` durable. Among 1113 US
   data objects only **2** are fully region-same (both now carved) — this sub-frontier is
   exhausted.
2. **Region-DIFFERENT ASSET data (graphics/sound/sprites) → JP-byte incbin w/ US names.**
   The US decomp itself represents these as `.incbin` of named binaries; the JP equivalent
   is `.incbin` of JP's (differing) bytes under the same descriptive name. Byte-matches by
   construction and matches US fidelity. LEGITIMATE — this is the "descriptive asm/data"
   the goal calls for, NOT gaming (the bytes ARE that asset; the name is honest).
3. **Region-DIFFERENT STRUCTURED tables → C with JP values (harder, deferred).** Where US
   uses a C array of semantic values, blob-incbin would be lower fidelity; these want real
   C. Region-different localized tables also need the JP values.

**Integrity line (Copilot-validated 2026-06-08):** the test is NOT whether bytes come
from the ROM — it is whether the object is **identified and represented at the right
semantic level**. LEGITIMATE: "this range is the JP version of named asset X, consumed
as format Y, with verified start/end and references → source = `INCBIN` of that JP
asset" (exactly what the US decomp does for graphics/sound/sprites/palettes). GAMING:
"this range is unknown/inconvenient, so split baserom and give it a plausible name while
bytes match by construction." Corollary: raw `.incbin` is fine for **opaque authored
assets**; structured data/tables/scripts/text/pointer-bearing data with an understood
format want **real structured C / descriptive asm**, not a blob. So the region-same
blocks with NO US object (922 KB @ 0x08EF9454, 247 KB @ 0x08BC3A00) must NOT be carved
as generic `data_<addr>` blobs — they are unidentified (incbin in US too); leave them.

**Tooling:** `scripts/carve_data.py [substr...|--all]` (region-same gate, verify-or-revert).
**Tier 2 requirement (before any region-different asset carve):** verify the JP asset's
own boundary — for region-different assets the JP size/offset can differ from US, so use
the JP pointer tables (e.g. the carved `banim_data[]`/reference tables that point at the
JP asset addresses), NOT the US boundary, to bound each `.incbin`. Restrict to US
`INCBIN_*`/graphics+sound/banim asset objects; never blob a C value table. `make compare`
stays the only oracle (it byte-matches by construction for incbin, so correctness rests
entirely on honest boundary+identity — hence the JP-boundary verification gate).

## D11 — coddog cross-binary matcher: patch GBA platform string in the vendored clone (2026-06-08)

**Context:** Set up `ethteck/coddog` (Rust cross-binary function matcher) to accelerate
FE8J↔FE8U region-same/region-different triage (`compare2` buckets every JP function's best
US match by similarity + decompiled-status). Setup/config/docs live under
`scripts/tools/coddog/` + `docs/tools/coddog.md`; the build is vendored to the gitignored
`tools/coddog`.

**Fork:** coddog v0.6.3's CLI resolves the yaml `platform:` via `Platform::from_name`,
which omits `"gba"` (returns `None`) and panics `Invalid platform: gba` — even though GBA
Thumb support fully exists in `coddog-core` (objdiff + `unarm` V4T; the `simple_gba` tests
construct `Platform::Gba` directly, and `from_decompme_name` lists `gba`). So out of the
box the tool cannot read a GBA config.

**Decision:** `setup.sh` applies a small **idempotent** patch to the vendored (gitignored)
clone that adds the arms already in `from_decompme_name` (`gba` — the one we need — plus
`nds`/`nds_arm9`, `n3ds`, and `irix`; the last is MIPS/big-endian, not ARM, but included to
keep the two resolvers in sync) to `from_name`. Rationale: the alternative (ship a
non-functional tool) defeats the unit's purpose; the fix is a few match-arms, low-risk,
reversible (re-clone), and only touches the local clone — no project source/Makefile/ldscript
changes. The clone is pinned to upstream tag `0.6.3` (the revision the patch needle is
verified against) and fetched straight from the upstream URL — an earlier `/tmp/coddog`
seed-clone shortcut was dropped because building unverified code from a world-writable path
is a supply-chain risk. Verified end-to-end: after the patch, `coddog cluster` ingests the
real US GBA ELF and emits real clusters. **Follow-up: file the one-line fix upstream** so we
can drop the local patch later.

**Known limitation (logged, not a blocker):** coddog's `read_elf` keeps only ELF symbols with
`size > 0` + a real section + `SymbolKind::Function`. The JP functions we have not yet carved
are sizeless ABS `.set` symbols (`asm/jp_syms.s`) or live in `asm/baserom.s` incbin gaps, so
coddog skips them. `compare2` from the `jp` version therefore covers only already-carved/sized
JP functions, not the full remaining backlog. Documented in `fe8.coddog.yaml` + `docs/tools/coddog.md`
("Coverage"); extending triage to pending functions needs a JP ELF whose pending functions carry
real `.size`s (a later work item).

## D12 — Decomp/RE tooling investigation: set up asm-differ/objdiff/m2c/coddog (2026-06-08)

**Context:** Investigated 10 external decomp/RE projects for usefulness to FE8J. Full write-up:
`docs/tooling-investigation.md` + per-tool `docs/tools/*.md`. Each useful tool was vendored to
the gitignored `tools/<name>/` via `scripts/tools/<name>/setup.sh`, reviewed by Copilot CLI on
its PR, merged (#17–#26), then exercised in the main tree against the real ROM/ELF.

**Decision:** Set up the four genuinely useful local tools — **asm-differ** (per-function ARM
diff), **objdiff** (per-symbol match% / progress), **m2c** (`-t gba` seed C for region-different
functions), **coddog** (FE8J↔FE8U cross-version triage). **Pilot** mizuchi (Atlas UI), defer its
auto-`run`. **Keep upstream** decomp-permuter (the agbcc fork trails upstream ~10 mo; only its
`pipefail` guard is worth folding into our active `permuter_settings.toml`). **Learn-only:**
frog-adv-temple (the AI-decomp playbook), kappa, decomp.me (hosted). **Skip:** binary-comp
(x86/MSVC-PE only, no ARM/Thumb).

**Fix in this change:** coddog's GBA-platform patch (D11) had a broken idempotency guard — a bare
`grep -q '"gba" => Some(Platform::Gba),'` matched the arm already present in `from_decompme_name`,
so the patch to `from_name` (the resolver the CLI actually calls) was always skipped on a fresh
clone, leaving `compare2`/`cluster` panicking `Invalid platform: gba`. Changed the guard to require
**two** occurrences (one per function). Only surfaced by running `compare2` in the main tree
(D11's smoke test had used a manually-patched clone) — a reminder that per-PR worker smoke tests
need a coordinator integrated-e2e backstop.

**e2e (main tree, real ROM/ELF):** coddog `compare2` found FE8J↔FE8U 100% twins (AP_ExecFrame,
AdvanceGetLCGRNValue, AnimSpr_*); m2c produced seed C for `AdvanceGetLCGRNValue`; asm-differ
rendered a clean raw-binary diff; `objdiff-cli 3.7.2` runs (per-symbol report needs target objects
carved from the baserom). `make compare` → `fireemblem8.gba: OK` (no regression from the batch).

**Consulted:** Copilot CLI (`agency cp`) reviewed every tooling PR; review caught real bugs
(asm-differ objdump arch flags, mizuchi `cpp -P` stripping FE8J macros, decomp.me `-Werror`
parity), not just nits.

**Status:** Done. This tool set is the substrate for the conflict-free parallelization plan
(objdiff as the per-symbol pre-gate, coddog for region triage, frog's worktree + serial-integrator
pattern).

## D13 — Parallelize carving (Phase 1): per-task layout fragments + stop committing generated glue (2026-06-08)

**Context:** To run many decomp tasks in parallel the blocker is shared mutable state: every carve
edits the layout monoliths **and** the *committed* generated glue (`ldscript.txt`, `asm/baserom.s`,
`asm/jp_syms.s`), so parallel branches collide on coding and committing. Key enabling fact (verified
byte-identical on re-run): the resulting **ROM** is a deterministic, order-invariant function of the
manifest *set* — `gen_layout.py` address-sorts `carved_rom`, and `carved_ram`/`baseline_syms` place
every section/symbol at its explicit address (so for those two only the generated ldscript's internal
section numbering follows fragment order, never the ROM bytes). Approved plan: parallelization
(Phase 1 = structural conflict removal).

**Decision:**
1. `scripts/gen_layout.py` now reads each manifest as the union of the monolith `<name>.tsv` **plus**
   per-task fragments `<name>.d/*.tsv` (sorted glob), with byte-identical duplicate rows deduped.
   Order-invariant, so fragments can be written concurrently with zero merge conflict.
2. **Stop committing the generated glue** — gitignore `ldscript.txt`/`asm/baserom.s`/`asm/jp_syms.s`
   and regenerate them at build time (Makefile grouped target `$(LDSCRIPT) $(GENERATED_S) &:`
   depending on the manifests; `make clean` now removes them). They become per-worktree build
   artifacts → impossible to conflict on. This removes the *worst* conflict surface.
3. `.gitattributes` union merge for **`carved_rom.tsv` only** — the one gen_layout overlap-validates,
   so a bad union aborts the build rather than miscompiling. NOT `carved_ram`/`baseline_syms` (not
   validated; rely on fragments there), `patches.tsv` (per-object keyed), or the reference TSVs. The
   `*.d/` fragment dirs are explicitly un-ignored past the generic `*.d` rule so fragments are tracked.

**Verification:** `gen_layout` output byte-identical before/after (dedup is a no-op on today's
no-duplicate manifests); `make clean && make compare` → `fireemblem8.gba: OK` (regenerates the glue
from manifests, byte-perfect); functional test confirms a row sourced from a fragment appears in the
output and a duplicate fragment row is deduped.

**Status:** Phase 1 structural core done. Next: migrate the carve scripts to write per-task fragments
(Phase 1.3); worktree build-ability + serial integrator (Phase 2); parallel pilot (Phase 3).

## D14 — Parallel carving Phases 2–4: claim registry, worktree setup, serial integrator + pilot (2026-06-08)

**Context:** With Phase 1 (D13) making carves conflict-free at the file level, Phases 2–4 build the
machinery to actually run many carves in parallel and integrate them safely.

**Decision (all under `scripts/parallel/`, guide in `docs/parallel-carving.md`):**
- **`layout_frag.py`** — write/remove a task's manifest rows as per-task fragments (collision-free
  filenames via a hash suffix).
- **`claim.py`** — atomic task-claim registry: every mutation (claim/beat/release/reap) runs under a
  shared `fcntl.flock`, and beat/release require the owning agent — so two agents never double-claim
  and a stale agent can't disturb a stolen task. TTL + reap recover abandoned claims. `layout/claims/`
  is gitignored.
- **`worktree_setup.sh`** — make a fresh worktree buildable: symlink the gitignored read-only inputs
  (`tools/agbcc`, `baserom.gba`), **copy** (never hardlink/symlink) the warm `.o` cache (objects and
  the ELF are mutable outputs — hardlinking/symlinking them would corrupt the main repo).
- **`integrate.py`** — the SERIAL integrator: the single point the whole-ROM oracle runs. Merge each
  ready branch → `make compare` → accept (keep) or reject (`reset --hard`, save the diff). Periodic
  `make clean && make compare` durability gate (Phase 4). Serial is the *safety* property; cheap
  because the verify is incremental (D7). Claim release is the agent's, not the integrator's.

**Verification (Phase 3 pilot, real parallel agents):** three agents concurrently carved three
disjoint ROM gap regions (0xF2F580, 0xF63820, 0xF97AC0) into named incbin objects, each in its own
isolated worktree writing only its own fragment + `asm/` file, self-verifying `make compare` → OK,
and pushing a branch. The serial integrator merged all three onto an integration branch with **0
conflicts, 3/3 accepted**, and the Phase 4 durability gate (`make clean && make compare`) → OK. The
parallel→integrate→green flow is proven end-to-end. (Unit tests earlier confirmed accept+reject,
claim collision-freedom/ownership, and that a worktree build never mutates the main repo's objects/ELF.)

**Status:** Phases 0–4 complete. The remaining carve-script migration to fragments (Phase 1.3) is an
incremental follow-up — gen_layout reads monolith + fragments, so existing monolith carvers and new
fragment carves coexist; parallel work uses `layout_frag.py` today.

## D15 — Curate external US↔JP maps (FEBuilderGBA ROM defs + RAM map) as reference data (2026-06-09)

**Context:** `layout/addr_map.tsv` only covers addresses referenced by located functions' literal pools,
so unreferenced table bases (esp. ROM-tail assets) are missing. Two external sources fill that gap:
FEBuilderGBA's per-version ROM definitions (`ROMFE8{JP,U}.cs`, GPL-3.0; identical field names → join by
name) and the US decomp's named RAM symbols.

**Decision:** harvest a curated `reference/maps/` set (issue #32, PRs #33/#34/#35) — **reference data, NOT
build inputs** (nothing reads it from the build, so `make compare` is unaffected): the FEBuilder ROM map
(`febuilder_rom_us_jp.tsv`, 302 rows), the 9 resolved dynamic `FindROMPointer` pointers
(`febuilder_dynamic.tsv`), and a US↔JP RAM map (`ram_us_jp.tsv`, 697 data rows). See `reference/README.md`.

**Correctness discipline (the plan was Copilot-reviewed; review caught real data bugs, all fixed):**
- Strict value classifier — never blindly `+0x08000000`; skip non-address constants/counts/offsets/sentinels
  (review caught count/offset values wrongly promoted to VMAs).
- `region` is **byte-evidence-based**, never `us==jp`.
- RAM is **not** identical US↔JP — use real JP/US pairs; no-evidence rows are `jp_addr=-`/`unverified`
  (review caught fabricated `jp==us` rows + cross-region bogus relocations).
- Crosswalk emits `exact_symbol` + `nearest_symbol+off` (data rarely has an exact symbol).
- **No GPL text copied** — only `ROMFE8{JP,U}.cs:<line>` source refs + own descriptions; `reference/README.md`
  attributes FEBuilderGBA (GPL-3.0). Addresses are facts (not copyrightable).

**Value:** 291/302 (96%) of the FEBuilder ROM addresses are NEW vs `addr_map`.

**Status:** Done (reference data on main). Wiring select entries into `baseline_syms.d/`/`addr_map` is a
deliberate, validated, per-symbol follow-up — not done here.

## D16 — Merge gate = local `make compare`; drop the per-PR review/CI gate (2026-06-09)

**Context:** We were running a Copilot-CLI review loop on every PR. For a byte-perfect decomp that is
mostly redundant: `make compare == OK` *is* the verification, so reviewing decompiled C is meaningless
(a byte-matched function is correct by definition). Reviewing this session caught real bugs *only* in
code/data that `make compare` cannot verify — derived reference data (no oracle), build/orchestration
scripts (latent races/corruption), and CI — never in decomp. The project is single-user with the AI in
the loop on every merge.

**Decision:**
1. **The merge gate is LOCAL `make compare`, run in the main tree at merge time** — by the serial
   integrator (`scripts/parallel/integrate.py`) for parallel work, or by the assistant before an ad-hoc
   merge. It is the same oracle but ~0.3s (incremental, D7) and works even though worker worktrees lack
   the gitignored toolchain/ROM. master is green *at merge*. Always **confirm the merge actually landed**
   and resolve blocks (conflicts, red compare).
2. **Skip the Copilot PR-review loop for byte-matched decomp/carve PRs.** For non-decomp changes with no
   `make compare` oracle (reference data, build/infra/orchestration scripts, CI), do **light
   self-verification against ground truth** (run it, check the data vs the ROMs/ELF); pull in a Copilot
   review only when genuinely uncertain or the change is high-blast-radius — and say so.
3. **CI (`compare.yml` on `push`) stays a post-merge BACKSTOP + the README badge** — a clean-environment,
   reproducible re-verification. Checked after a batch of merges; a red run signals env/determinism drift
   (not a logic bug, since merges are locally verified) → fix or revert. **No per-PR CI, no branch
   protection, no `BASEROM_URL`-gated auto-merge** is added — they buy little here and add latency/setup.

**Exception:** if work ever goes **fully hands-off** (auto-merge with no AI/human at the merge step), then
CI-on-`pull_request` + branch protection requiring the `make compare` check (and `BASEROM_URL` set) becomes
the gate. Not needed while the assistant confirms every merge.

**Rationale:** the byte-match oracle is cheaper/faster locally than in CI; the AI is the merge-time gate;
review's value was confined to no-oracle artifacts, which a targeted self-check covers. Supersedes the
earlier "Copilot-review every PR" working rule (which still applies opt-in for risky no-oracle changes).

**Status:** Adopted 2026-06-09 (discussed with + chosen by the repo owner).

## D17 — RE MCP servers: fix flaky startup (ida path-on-startup + ghidra cold-start timeout) (2026-06-09)

**Context:** A session reported `ghidra: failed — MCP error -32000: Connection closed`; a fresh
`claude mcp list` reported the *opposite* (`ida` failed, `ghidra` OK). Looked like a random race; it
wasn't. Isolated, repeated `claude mcp get` timing made it deterministic:
- **`ida`** failed *every* round at a fixed ~12.5s. Its registered command had drifted to
  `idalib-mcp --stdio <…>/tools/ida/fe8j.i64` — passing the 115 MB DB on the supervisor command line,
  which `docs/reverse-engineering.md` (§Usage) explicitly forbids: the supervisor tries to open a DB the
  long-lived idalib worker already holds → stalls ~12s → fails.
- **`ghidra`** connected every isolated round but at a **~16–19s cold start** (`--wait-for-analysis`).
  That's close to the client's startup window, so at *session* launch — both servers spawned at once,
  with `ida`'s failing 12s DB-open hogging CPU/IO, plus a leftover `fe8j.lock` from a previously
  SIGKILL'd JVM — ghidra's cold start overran the startup timeout → "Connection closed". The two servers
  don't contend with each other (different resources); each collided with *its own* leftover/slow start.

**Decision (all verified, `make compare` untouched — env/registration only):**
1. **Re-register `ida` WITHOUT the `.i64` path** — canonical per the install doc
   (`claude mcp add ida -e IDADIR=… -- …/idalib-mcp --stdio`). Supervisor starts in <0.5s; the DB is
   opened on demand by `idb_open`, which adopts the existing worker. (Was 12.5s *fail* → now <0.5s
   *connect*.)
2. **Set `MCP_TIMEOUT=60000` in `.claude/settings.json` `env`** so ghidra's ~16s cold analysis fits with
   margin (after reboot / cold cache it can run longer). **Empirically proven the lever is honored from
   settings.json**: `MCP_TIMEOUT=500` there reproduced ghidra's failure *identically* to the shell export
   `MCP_TIMEOUT=500 claude …`; 60000 restores reliable connect. (The Claude Code docs only document the
   shell-export form and call `MCP_TIMEOUT` the *startup* timeout in ms; the per-server `.mcp.json`
   `timeout` field is tool-call only and does **not** help startup.)
3. **Clear genuinely-stale Ghidra locks** (`~/ghidra-projects/fe8j.lock{,~}`) only when **no** java/pyghidra
   process owns them — a clean open recreates the lock. Such leftovers are a *symptom* of a startup-timeout
   SIGKILL, so fixing (1)+(2) prevents new ones. Recovery steps added to
   `docs/reverse-engineering.md` §Troubleshooting.

**Verification:** `claude mcp list` (connects to **both** concurrently = the session-startup scenario)
returns `ida ✔ + ghidra ✔` **3/3** rounds with the 60s timeout. Don't run `claude mcp get/list` launches
back-to-back when debugging Ghidra — a launch killed mid-analysis pollutes the *next* open (reproduced:
two rapid launches both failed; a single isolated launch connected).

**Rationale:** the failures were deterministic config/timing issues, not flakiness — fix the registration
drift and give the slow-but-correct ghidra cold start enough startup budget. Reversible (re-add the path /
drop the env line); no source or build impact.

**Status:** Done 2026-06-09. Verified by repeated concurrent `claude mcp list`.
