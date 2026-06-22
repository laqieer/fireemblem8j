# Bindiff & Function-Matching Investigation for FE8J

**Purpose.** FE8J has unblocked the region-different *code* front via gbadisasm
(it carves descriptive asm by raw bytes, with no US correspondence needed). The
next phase is **asm → C decompilation**, where knowing that a region-different JP
function corresponds to a specific US C function lets us port and adapt the US
source. Byte-matching (`layout/us_jp_funcmap.tsv`) **structurally cannot** produce
that mapping — it only matches functions whose bytes are identical/maskable, i.e.
region-*same* functions. This report answers two questions:

1. Is the existing **FE_GBA_Function_Library** (the owner's cross-region FE
   correspondence DB, with a dedicated FE8J column) safe and worth ingesting as a
   hint source for the region-different asm→C step?
2. What is the **best modern bindiff / function-matching** approach to generate
   (and keep refreshing) a high-confidence US↔JP map for the region-different
   remainder, validated by the `make compare` oracle?

Throughout, remember the project's decisive advantage: **`make compare` is a sha1
oracle, so every US↔JP correspondence guess is self-validating.** A wrong guess
just makes a carve attempt fail `make compare` and auto-revert (parallel-carving
fragment model); it can never become a wrong byte-perfect commit. Bindiff output
is therefore a pure *hint generator*, never a source of truth.

---

## Verdict on FE_GBA_Function_Library — is it safe/worth ingesting?

**Verdict: YES — ingest as a REFERENCE-ONLY hint source, keyed on the FE8U
*address* (not the stored name), with a per-entry confidence column and a "hint,
not truth" banner. NEVER as a build input.** It is high-quality and contributes
exactly the region-different correspondences byte-matching cannot, but it is
unverified by the owner's own admission and carries a measurable (~0.6%) non-random
error rate plus stale names, so every entry must pass `make compare` before commit.

### The evidence

- **Agreement vs the byte-match funcmap: 99.38%.** On the 1,784 JP addresses
  present in *both* the library and `layout/us_jp_funcmap.tsv` (the byte-matched
  ground truth for region-same functions), the library's FE8J↔FE8U correspondence
  agrees with the funcmap in **1,773 cases (99.38%)**. Of the 11 disagreements: 6
  are adjacent-function slips (US-address delta ≤ 0x40) and 5 are genuine
  misalignments (delta up to 0xC3B8), at least one being a classic bindiff
  "off-by-one-row" — the library's US address exactly equals the *neighboring*
  funcmap row's US address. This is a free, large-sample confidence estimate, and
  ~99.4% on the verifiable subset is strong. But the ~0.6% error is **non-random**
  (transitive-stitch + bindiff row-shift), so it cannot be ignored per-entry.

- **NEW (region-different) mappings added: 6,580.** That many library FE8J
  addresses are *not* in `us_jp_funcmap.tsv` — i.e. region-different candidates,
  the high-value ones. Of these, **6,378 carry a usable FE8U address** and ~1,972
  also carry a (possibly stale) name. This roughly covers the **entire remaining
  region-different code front** (~5,942 functions remain to map at the time of
  this investigation; ~350 already carved as gbadisasm anchors). (Historical
  snapshot — matching-C is now at 95.44%; see `docs/frontier.md` for current counts.) 97.6% of all library FE8J entries also have an
  FE8U address, so almost every hint is directly portable from the US decomp.

- **Spot-check accuracy: 10/10 addresses correct.** A spot-check of 10 NEW
  region-different entries via the IDA DB (`tools/ida/fe8j.i64`) + the US ELF found
  **0 wrong addresses**; sizes matched/near-matched in all 10, and **2 were
  confirmed byte-exact by decompilation** (JP `0x80817B8` → US `ManimLevelUp_DimBgm`,
  both call `StartBgmVolumeChange(256,128,16,…)`; JP `0x80AADF8` → US
  `WriteSwappedSuspendSaveId`, identical Read/flip-slot/Write 3-statement body).

### The one real defect: STALE NAMES (not addresses)

The library was built ~2018 against an older IDA naming. **6 of 8 spot-checked
names differ from the current US decomp name** (e.g. lib `UpdateNextSuspendSaveId`
→ now `WriteSwappedSuspendSaveId`; `MapMain_SwitchPhases` → `BmMain_ChangePhase`;
`SetupSubjectBattleUnitForStaff` → `BattleInitItemEffect`). The **FE8U address was
correct in every case.** Ingestion rule that follows directly: **trust the
library's FE8U address as the link key, then resolve the *current* name/source
from `../fireemblem8u`'s ELF/map at that address.** Do not import the stored name.

### How the library was actually built (and why "not guaranteed correct")

`function match/merge_match_results.py` merges, at a **0.8 similarity/confidence
threshold**, the outputs of just **two** engines that are actually wired in —
**BinDiff 4.3.0** ("FE8J vs FE8U": overall similarity 0.967, confidence 0.987,
8,513 matches) and **diaphora** — despite 7 tools' outputs living in the repo (the
other 5 are exploratory dead weight). BinDiff pairs are kept only if *both*
similarity ≥ 0.8 *and* confidence ≥ 0.8; diaphora "best" pairs are kept
unconditionally, "partial" if ratio ≥ 0.8. Pairs are then **stitched transitively**
across games (a new pair sharing any one address with an existing row is merged in).
That transitive stitch is the principal risk — one bad pair in any game-pair can
mislink a whole row — and is the most likely cause of the 5 genuine disagreements.

### Recommended ingestion format

Stage it as a **reference artifact**, never in `ldscript.txt` and never as a build
input:

```
reference/maps/funclib_us_jp.tsv
# columns:
jp_addr   us_addr   us_name_current   lib_name_stale   confidence   source
```

- `jp_addr`, `us_addr`: normalized to `0x` + 8 hex digits (the library stores
  bare, leading-zero-stripped `8000234`; the funcmap stores `08000234` — normalize
  on ingest).
- `us_name_current`: **resolved live** from `../fireemblem8u`'s ELF/map at
  `us_addr` — this is the name to use. Leave `lib_name_stale` only for provenance.
- `confidence`: a per-entry tier, not a flat trust. Suggested:
  - `funcmap-agree` — overlaps the byte-match funcmap *and agrees* → effectively
    ground-truth (region-same; redundant with funcmap but useful as cross-check).
  - `funcmap-disagree` — overlaps but disagrees → **suspect, deprioritize/quarantine**
    (these are the ~0.6%).
  - `new-hint` — region-different, not in funcmap → the high-value carve hints
    (~6,378 with US addr). These are the queue.
- **Banner at the top of the file**:

  > HINT, NOT TRUTH. Built ~2018 by a 0.8-threshold BinDiff+diaphora merge;
  > owner states it is not guaranteed correct. ~99.4% agreement with the byte-match
  > funcmap on the overlap, but the ~0.6% errors are non-random (transitive-stitch
  > / bindiff row-shift) and stored NAMES are stale. Use the US ADDRESS as the key,
  > resolve the current name from fireemblem8u, and let `make compare` validate.
  > NEVER a build input.

### How it complements `us_jp_funcmap.tsv`

| Source | Covers | Trust | Role |
| --- | --- | --- | --- |
| `layout/us_jp_funcmap.tsv` | region-**same** funcs (7,739: 6,002 exact + 1,737 masked) | **ground truth** (byte-matched) | the anchor set; build-relink targets |
| `reference/maps/funclib_us_jp.tsv` (new) | region-**different** funcs (~6,378 new US-addr hints) | hint (~99.4% on overlap) | names the US C source for asm→C porting |

They are **disjoint by design**: the funcmap is exactly the set the library agrees
with at 99.38%; the library's *unique* value is the 6,580 entries the funcmap will
never have because those functions don't byte-match. That is precisely the input
the gbadisasm→C step needs.

---

## Modern bindiff tools

The FE8J regime is the **easy end** of binary similarity: same game, same compiler
(agbcc / GCC 2.95), same arch (ARMv4T THUMB), only region/build deltas → maximal
CFG + call-graph similarity. Classic graph-isomorphism differs win this regime
decisively and cheaply; ML/embedding models are tuned for the cross-arch /
cross-compiler / cross-opt problems FE8J **does not have**.

| Tool | OSS / runnable | ARM-Thumb | Cross-version strength | Fit for FE8J |
| --- | --- | --- | --- | --- |
| **QBinDiff** (Quarkslab) | Apache, pip, headless API+CLI | Yes — Capstone `CS_ARCH_ARM:CS_MODE_THUMB`, first-class | Design center; call-graph network-alignment (belief propagation), **anchor seeding** (`--pass-user-defined`) | **PRIMARY.** Seed the 7,739 anchors → BP propagates to neighbors. Best precision on the region-different tail. |
| **Google BinDiff 8 + BinExport 12** | Apache (2023), headless/CLI | Yes (via host disassembler) | Core strength; native name/comment porting | **PRIMARY (alt).** Mature, battle-tested; consumes `fe8j.i64` + US ELF. Beats the 2018 4.3 merge by itself. |
| **BinDiffHelper** (Ghidra ext) | OSS, runnable | via Ghidra | wraps BinDiff | One-click name import inside the Ghidra we already run; thin wrapper, low risk. |
| **Diaphora 3.x** (IDA) | GPL, headless, batch | via IDA | Explicit "relaxed-ratio" mode **for porting across versions**; adds pseudocode/microcode heuristics | **STRONG SECOND.** Pseudocode signal helps region-different funcs; CSV export → carve queue. |
| **Ghidra BSim** (NSA, built-in) | Apache, headless | via Ghidra P-code | Decompiler-normalized vectors, cross-version by design | **RECALL/TIE-BREAK.** No extra license; per-function (ignores call-graph), so best on the long tail BinDiff misses. |
| **ghidriff** (clearbluejar) | OSS pip, headless CLI | via Ghidra | patch-diffing is its primary use case | **AUTOMATION glue.** Machine-readable match lists, optional BSim; secondary to BinDiff on raw match quality. |
| **VexIR2Vec** (IITH) | OSS + pretrained model | **Yes** (x86+ARM trained) | +18% cross-compile / +21% cross-arch / +40% cross-opt | **FALLBACK ONLY.** ARM-capable ML that actually runs, but its strengths are gaps we don't have; own VEX pipeline, no IDA/Ghidra integration. Reserve for residual unmatched funcs. |
| jTrans / PalmTree / kTrans / UniASM | OSS code, x86 models | **No** (single-arch, x86 pretrained) | per-function embeddings | **SKIP.** Can't embed ARMv4T without retraining; ignore the near-identical call-graph; worse than BinDiff at higher cost. |
| DeepBinDiff / Gemini / Genius / SAFE / Asm2Vec | mixed (some closed) | **No** (x86-centric) | research-grade | **SKIP** (historical/baseline). Not ARM-ready; superseded by VexIR2Vec. |
| Trex / BinFinder / FASER / CEBin | research-grade | mostly x86 | cross-arch vuln search at scale | **SKIP.** Optimize axes FE8J doesn't have. |

**Which to adopt.** Engine: **QBinDiff** (anchor-seeded, the modern best fit) with
**Google BinDiff 8** as a proven cross-check; **Diaphora** + **Ghidra BSim /
ghidriff** as recall boosters; **VexIR2Vec** held in reserve for the residual tail
only. Skip the x86-trained transformer/embedding line entirely — they solve a
harder problem we don't have, at far higher setup cost.

---

## An improved oracle-validated US↔JP matching pipeline

The goal is a **refreshed, higher-confidence US↔JP map that supersedes the 2018
threshold-merge** and directly feeds gbadisasm→C. The design exploits the one thing
no published bindiff benchmark has: **7,739 byte-matched ground-truth anchors plus
~350 carved gbadisasm anchors**, and a sha1 oracle.

### Step 1 — Export both sides (reuse existing infra)

Export JP from the analysed IDA DB (`tools/ida/fe8j.i64`, 11,000+ funcs, correct
ARM/Thumb `$t` mapping because it loads the ELF) and US from a one-off IDA pass over
`../fireemblem8u/fireemblem8.elf`, to `.BinExport`. (If the BinExport plugin is
friction, QBinDiff can disassemble the ELFs directly via its Capstone ARM/Thumb
loader.) Feeding the **ELF, not the raw `.gba`**, is the project's proven choice —
it carries correct mode bits and current symbols; region-different funcs sit at
their true addresses in the still-incbin region and are exportable.

### Step 2 — Seed with all known anchors (the key advantage)

All 7,739 funcmap pairs carry **both** `us_addr` and `jp_addr`, and every `us_addr`
is a verified real US-ELF function address, so they drop into QBinDiff verbatim as
`--pass-user-defined '0x<US>:0x<JP>'` (similarity pinned to 1.0) **with zero
crosswalk**. Add the carved gbadisasm anchors and the library's `functions.ls`
pairs as extra (lower-priority) seeds. That pins ~57% of all nodes, turning
belief-propagation from recall-favoring guesswork into **high-precision neighbor
propagation** over the then-unmatched region-different funcs (~5,942 at the time of this investigation; see `docs/frontier.md` for current counts).

### Step 3 — Constrain with address-order monotonicity

Within a contiguous TU, US and JP function order is preserved. Between consecutive
anchors `A(us_a→jp_a)` and `B(us_b→jp_b)`, any candidate must satisfy
`us_a < us_x < us_b` **and** `jp_a < jp_x < jp_b`. FE8J **already uses exactly this
monotone source→JP filter** for data carving (`docs/decisions.md`), so the
discipline is in-house — a ~30-line filter that cheaply kills off-by-one-row slips
(the very failure mode behind the library's 5 genuine disagreements).

### Step 4 — Rank candidates with a blended confidence

Emit ranked US-symbol↔JP-addr candidates, confidence = blend of QBinDiff similarity
+ call-graph-neighbor agreement (an unmatched JP func whose entire call-neighborhood
matches one US func is near-certain) + optional Ghidra BSim P-code cosine as a
second opinion. Calibrate the cutoff against the 7,739 byte-matched pairs —
**measure precision/recall before trusting any threshold** — then ensemble with the
library and Diaphora, taking agreement as high confidence.

### Step 5 — Validate against the `make compare` oracle (self-validating)

- **Region-same candidates** re-confirm instantly via the existing exact/masked
  byte test (`scripts/match_us_jp.py`) — free, deterministic.
- **Region-different candidates** get the real test: port the candidate's US C to
  the JP address, build, check `make compare == OK`. A PASS is a **byte-perfect
  proof** the correspondence is correct; a FAIL **auto-reverts** via the
  parallel-carving fragment model and never produces a wrong commit.
- **Near-misses**: `asm-differ` / `objdiff` per-symbol delta ranks how close the US
  port is; a tiny non-zero delta still strongly *confirms* the pairing and promotes
  it to "high-confidence US source for hand-decomp" even before a clean byte match.
  `decomp-permuter` closes scheduling residue.

### Why this supersedes the 2018 merge

| | 2018 library merge | This pipeline |
| --- | --- | --- |
| Engine | BinDiff 4.3 + diaphora, **context-free** 0.8 threshold | QBinDiff **anchor-seeded** call-graph alignment (modern) |
| Anchors | none (each pair judged in isolation) | **7,739 ground-truth + ~350 carved** pinned at 1.0 |
| Off-by-one-row defense | none → 5 genuine slips | **monotonicity filter** (already in repo) |
| Validation | manual / none | **`make compare` sha1 oracle** — auto-revert, can't commit wrong |
| Names | stale 2018 IDA names | resolved live from current `fireemblem8u` |

### Tie to the gbadisasm → C phase

The pipeline's output is the **input queue for asm→C**: each region-different
gbadisasm anchor gets a named US C source to port, replacing the **270 carved
anchors that still carry only IDA `sub_XXXX` names** (zero US correspondence) with
real US functions, and ordering the carve queue by confidence. The library's 6,378
new US-addr hints seed this immediately; QBinDiff then extends coverage to the
remaining unmatched tail and re-confirms the library's entries, with `make compare`
filtering the ~0.6% wrong guesses for free.

---

## Recommendations & next steps

Prioritized for FE8J's current state (gbadisasm scaling in flight, code ~23%):

1. **[P0 — do now] Ingest the library as `reference/maps/funclib_us_jp.tsv`.**
   Parse `functions.md` / `functions.ls`, normalize addresses, resolve
   `us_name_current` live from `../fireemblem8u`, tag each entry's `confidence`
   tier (`funcmap-agree` / `funcmap-disagree` / `new-hint`), and prepend the
   "hint, not truth" banner. Quarantine the `funcmap-disagree` rows. This unlocks
   ~6,378 region-different carve hints **today**, with no new tooling. Cost: one
   script. This is the highest value-per-effort move available.

2. **[P0] Wire those hints into the gbadisasm→C queue.** For each carved anchor
   still named `sub_XXXX` (270 of them) and each unnamed region-different gbadisasm
   target, look up `funclib_us_jp.tsv` by JP address → get the US C source to port.
   Order the carve queue by confidence. Let `make compare` validate each port via
   the parallel-carving auto-revert flow.

3. **[P1] Stand up QBinDiff seeded with the 7,739 anchors.** Export US ELF +
   `fe8j.i64` to BinExport (or use the Capstone-direct loader), seed
   `--pass-user-defined`, add the monotonicity filter (port the data-carving one),
   and emit ranked candidates with blended confidence. This is the **engine that
   refreshes and extends** the library beyond what the 2018 merge could reach, and
   re-confirms the library's `new-hint` entries from a modern matcher.

4. **[P1] Calibrate every threshold against the funcmap before trusting it.**
   Run QBinDiff (and Diaphora) over the region-same set, measure precision/recall
   vs the 7,739 byte-matched pairs, pick the cutoff that maximizes precision, then
   apply that cutoff to the region-different remainder. Ensemble QBinDiff +
   Diaphora + library agreement as the high-confidence tier.

5. **[P2] Reserve BSim / ghidriff for the residual tail**, and VexIR2Vec only if a
   meaningful set of functions survives all graph-based matchers. Do not invest in
   the x86-trained transformer line.

6. **[Standing — honesty/uncertainty]** The library is **unverified by the owner**;
   treat it accordingly. Never let any matcher's output reach `ldscript.txt`
   without a passing `make compare`. The ~99.4% agreement is reassuring but the
   ~0.6% errors are non-random, so per-entry validation is mandatory, not optional.
   Record the ingestion + pipeline decision in `docs/decisions.md` and on project
   board #14.

**Bottom line.** The library is a high-quality, immediately useful hint source for
the exact thing byte-matching can't do — region-different US↔JP correspondences for
asm→C — and should be ingested **now** as reference-only with confidence tiers. In
parallel, a QBinDiff anchor-seeded, monotonicity-constrained, oracle-validated
pipeline supersedes the 2018 threshold-merge and continuously extends/refreshes the
map. Because `make compare` is self-validating, none of this can ever produce a
wrong byte-perfect commit; bindiff is purely a hint generator, and the oracle is
the gate.

---

## Ingested map (D25, implemented)

The P0 ingest is done. The library is now staged as a **reference-only** artifact:

- **`reference/maps/funclib_us_jp.tsv`** — the map. Columns:
  `jp_addr  us_addr  us_name_current  lib_name_stale  confidence  source`.
  Leading `#` lines carry the **"HINT, NOT TRUTH"** banner. It is **NOT a build
  input** (nothing in the build reads it; `make compare` is unaffected — verified).
- **`scripts/ingest_funclib.py`** — the reproducible generator. Reads the library
  from `/tmp/FE_GBA_Function_Library` if present, else clones
  `github.com/laqieer/FE_GBA_Function_Library` into `.cache/`. Deterministic:
  re-running over the same inputs regenerates a byte-identical TSV. Re-run it after
  the US decomp's symbols change to refresh `us_name_current`.

**Contents (8356 ROM `0x08` JP functions; the 8 RAM `0x03` entries are dropped):**

| tier | rows | meaning |
|---|---|---|
| `new-hint` | 6572 (6371 with a US addr) | region-different — **the asm→C carve queue** |
| `funcmap-agree` | 1774 | overlaps the byte-match funcmap *and agrees* → effectively ground truth (region-same) |
| `funcmap-disagree` | 10 | overlaps but disagrees → **suspect; QUARANTINE/deprioritize** (the ~0.6%, e.g. bindiff off-by-one-row slips) |

**How to use it.** For a region-different JP function you want to decompile, look up
its **JP address** in `funclib_us_jp.tsv` → take `us_addr` + `us_name_current` →
port/adapt that US C source from `../fireemblem8u` to the JP address → build →
**`make compare` is the gate**: `OK` is the byte-perfect proof the correspondence is
correct; a FAIL auto-reverts via the parallel-carving fragment model and never
produces a wrong commit. Use `us_name_current` (resolved live from the US ELF/map),
**never** `lib_name_stale` (the stale ~2018 IDA name, kept for provenance only).
**Quarantine `funcmap-disagree`** — try it last, and double-check the US source by
call-graph before trusting it.
