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
