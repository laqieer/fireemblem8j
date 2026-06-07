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
