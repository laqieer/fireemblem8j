# Lessons from the Frogger's Adventures: Temple of the Frog decomp

Research notes from a deep read of
[JRickey/frog-adv-temple-decomp](https://github.com/JRickey/frog-adv-temple-decomp)
(clone studied at `/tmp/frog-adv-temple-decomp`), a complete, byte-matching,
AI-driven **agbcc** GBA matching decomp of *Frogger's Adventures: Temple of the
Frog* (`AFRE`, Konami). It is our closest methodological twin after
`fireemblem8u`: same compiler (agbcc 2.x / Thumb), same oracle pattern
(`make check`), same headless Claude + m2c + decomp-permuter pipeline.

**Key difference to keep in mind while reading:** frog peels the ROM from a
single INCBIN **from scratch** (no sibling source repo). FE8J instead **relinks
US source** (`../fireemblem8u`) against JP addresses (see `docs/strategy.md`).
So frog's *boundary-detection / peel-first / corpus / progress-metric*
machinery transfers nearly verbatim, while its *m2c-seed-then-handwrite* flow
is only relevant to FE8J for the genuinely region-different TUs (the ~11 code
TUs and region-different data) that can't be relinked from US.

All claims below are cited against real files in the clone.

---

## 1. End-to-end pipeline (one paragraph)

The whole ROM begins as one INCBIN split across `asm/header.s` + `asm/rom.s`
(`CLAUDE.md` "Current state"). Work proceeds one function at a time through a
mechanized loop: **`pick_target.py`** surfaces the next *layout-legal*,
*not-already-done* target in baserom address order
(`tools/agent/pick_target.py`); **`decomp_brief.py`** bundles range, callee
peel-status, resolved pool literals, struct cross-refs, and an m2c seed into
one briefing (`tools/agent/decomp_brief.py`); any cross-region BL callee that
isn't yet a real symbol is **peeled first** with `auto_peel.py` (the project's
central insight — `CLAUDE.md` "Agent workflow — peel-first, then decomp"); the
agent writes C (m2c seed → hand-adapted), drives it to a match by reading the
categorized per-symbol diff from **`compile_and_view_assembly.py`** /
`objdiff-cli`, consulting the **agbcc corpus** (`corpus.py` /
`corpus_asm_search.py`) when a fold/coloring idiom resists, and finishing
register-coloring residue with **decomp-permuter**; **`make check`** (SHA1) is
the only success oracle, and **`progress.py` `asm_funcs_remaining`** is the
ground-truth "did this iteration make progress" signal. The loop is run
autonomously by a human-as-orchestrator runbook (`docs/loop-orchestrator.md`)
that dispatches background subagents, verifies each with `make check` before
committing, reverts on failure, and folds new agbcc quirks back into
`docs/codegen-notes.md` + `CLAUDE.md`.

---

## 2. Transferable techniques (concrete, with FE8J adaptation)

### T1. Peel-first linking of cross-region BL targets before decomp
The project's load-bearing insight: a Thumb function that calls outside its own
slice **cannot** be matched in C until every callee has a real Thumb-typed
symbol at its address — `PROVIDE()` and `.thumb_set` both fail (the latter
spawns `.text.__stub` veneers). So the *only* order that works is peel callees
first, decomp last (`CLAUDE.md` "Agent workflow"; `tools/agent/auto_peel.py`
header; `docs/tooling.md` "Phase C"). `auto_peel.py --callees-of <fn> --apply`
does boundary-detect → peel → bucket-split → `linker.ld` rewrite → `make check`
per callee, reverting any that breaks.
**FE8J adaptation:** we mostly sidestep this because relinking a US TU brings
its callees' symbols along, but it bites exactly on the region-different code
TUs and on hand-decompiled functions that call into still-incbin'd JP regions.
Our `scripts/locate_funcs.py` + `match_us_jp.py` already produce the JP addr
for a callee; a thin "ensure this BL target is a named symbol in the layout
before relinking the caller" check (a peel-equivalent) would prevent silent
veneer/relocation mismatches in those TUs.

### T2. Boundary detection before guessing a byte range
`detect-fn-boundary.ts` walks Thumb forward from a start address and flags
interior `bl` targets as a "you're about to peel two functions" signal; `peel.py`
runs it automatically and refuses a bad range (`CLAUDE.md` step 0;
`docs/tooling.md` "Phase A"; this prevented commit `0c989b1`, "AgbMain peeled
too wide"). The lesson is *machine-verify function extent before committing to a
range*, not eyeball objdump.
**FE8J adaptation:** for region-different functions we get extent from the US
ELF symbol size via `match_us_jp.py`, which is more authoritative than a Thumb
walk — but for JP-only functions with no US counterpart, a boundary detector
(or just trusting IDA/Ghidra MCP `func_profile`/`basic_blocks` extents) is the
equivalent guard. Worth a one-line note in `docs/porting.md`.

### T3. Brief-before-prompt context generation
`decomp_brief.py` composes range + callee peel-status + **resolved** pool
literals (no halfword-flip mistakes) + per-base struct cross-ref + m2c seed +
linker destination hint into **one command** the agent reads before writing any
C (`tools/agent/decomp_brief.py`; `docs/tooling.md` "Phase C"). `craft_prompt.py`
goes further and renders the full per-function prompt (callee extern decls from
`include/`, sampled neighbour functions as in-context examples — ported from
mizuchi's `craft-prompt.ts`).
**FE8J adaptation:** build a `scripts/decomp_brief.py` that, for a JP target,
emits: JP↔US addr pair (`us_jp_funcmap.tsv`), the US source body (our seed,
*far* better than m2c since it's the real code), the pool/literal resolution,
and the relink destination from `gen_layout.py`. This is the single
highest-value port — it front-loads everything the hand-decomp agents currently
re-derive per function.

### T4. Corpus-before-permuter idiom search across cached agbcc decomps
Two-tier corpus: `corpus.py grep` over the *current tree* of ~23 blob:none
agbcc-repo clones, and `corpus_asm_search.py` "pickaxe" over their *git
history* — because a match commit DELETES the asm-as-incbin and ADDS the C, so
history pairs the exact (asm, known-good C) for any idiom
(`tools/agent/corpus_asm_search.py` header; `docs/tooling.md` "Phase D"). The
discipline is explicit: **search corpus FIRST, permuter LAST** (`CLAUDE.md` step
7) — a worked example matched `sub_08000430` in 3 minutes of corpus grep after
permuter made it *worse*. The curated repo list (`scripts/corpus-sync.sh`)
includes `fireemblem8u`, `fireemblem6j`, `FireEmblem7J`, the pret pokemon
family, and Konami siblings.
**FE8J adaptation:** we already *have* the single best corpus member checked out
(`../fireemblem8u`) as primary reference, but `corpus_asm_search.py`'s
history-pickaxe over the *broader* agbcc corpus (pokeemerald/firered, fe6j,
fe7j, tmc, metroid) is new leverage for region-different idioms US doesn't cover.
Port `corpus-sync.sh` + `corpus_asm_search.py` and point them at the same repo
list (FE6J/FE7J/FE8U are especially apt — same engine family).

### T5. Progress-metric as ground truth (`asm_funcs_remaining` / per-function diff)
`progress.py` exits 0 iff SHA1 matches, and `--per-function` emits the top-50
nonmatching symbols sourced from the map — the *direct* feedback signal: a good
change drops `diff_bytes` on your target while leaving others at 0; if it raises
diff elsewhere you broke layout (`tools/agent/progress.py`; `CLAUDE.md`
"Quantifying progress", "The 'is this making progress?' rule"). One number per
iteration must improve or the change is reverted.
**FE8J adaptation:** we have `scripts/calcprogress.py` (frogress-format
numerators) but it is reporting-oriented. Add a per-iteration `--per-function`
byte-diff view (built ROM vs `baserom.gba` over each symbol's range from the
US-derived layout) so a hand-decomp agent gets the same "did *this* function get
closer, and did I break a neighbour" signal that frog gets, instead of only the
binary `make compare` pass/fail.

### T6. objdiff-cli per-symbol match loop on `expected/.o`
`build_expected.py` emits one ELF per source file with the same symbols pointing
at *baserom* bytes (with correct `$t`/`$d` mapping symbols), so `objdiff-cli diff
-1 expected/... -2 src/... <Sym>` gives a per-symbol `match_percent` + full
instruction categorization **without** rebuilding the 4 MB ROM each iteration —
the fast permuter/feedback loop (`docs/tooling.md` "Phase C" +
"`compile_and_view_assembly.py` vs the `expected/.o` pipeline";
`tools/agent/build_expected.py`).
**FE8J adaptation:** our MCP RE workflow leans on IDA/Ghidra; adding
`build_expected.py` + the bundled `objdiff-cli` gives a cheap local per-symbol
diff that doesn't need a full `make compare` round-trip — valuable for the
permuter loop in `scripts/permuter/` and for the hand-decomp grind on the ~11
region-different TUs.

### T7. Layout-invariant safety + duplicate-work guards in the target picker
`pick_target.py` enforces baserom address order (next legal target = *first*
`thumb_func_start` in each asm file; destination = the *previous* C neighbour in
`linker.ld`), and runs guards *before* layout checks: it greps every
`src/**/*.c` (linked AND unwired scaffolds, empty-body stubs included) and the
progress sheet so it never re-decomps landed/in-flight work
(`tools/agent/pick_target.py` `classify()`; `CLAUDE.md` "Layout invariant",
"the picker checks for duplicate work"). It also hard-skips libgcc and the GAX
audio middleware as non-targets.
**FE8J adaptation:** our `gen_layout.py`/`locate_tu.py` already encode the layout
order; the transferable bit is the **duplicate-work + non-target guard**. A
picker that refuses a TU already carved (check `layout/carved_rom.tsv`) and skips
known library regions (agbcc libgcc, any third-party middleware in FE8J) would
stop parallel agents from colliding on the same region.

### T8. Subagent parallelism with explicit independence rules
Parallel targets must touch *different* `asm/*.s` files AND *different* `src/*.c`
files AND **neither** `linker.ld` nor a shared header; cap ~4 subagents because
each one's full build dominates wall time; "serialize within a cluster,
parallelize across clusters" (`CLAUDE.md` "Subagent parallelism";
`docs/loop-orchestrator.md` step 3 adds the coordination hint: tell each agent
the *other* agent's distant address range and to use precise `Edit` not
`replace_all`).
**FE8J adaptation:** directly applies to our parallel batch + harvest loops
(`scripts/harvest_parallel.py`, `harvest_loop.sh`). The concrete rule worth
adopting: never let two parallel agents both edit `layout/` or a shared header;
partition by TU/region and pass each agent the others' touched ranges. Add this
to `docs/handoff.md` parallelism notes.

### T9. Verify-then-commit orchestration with clean-rebuild discipline
The loop runbook makes `make tidy` (full clean rebuild) **non-negotiable** before
trusting `make check`, because a bare `make check` only re-verifies the SHA1 of
an already-built ROM and stale `.o` files from an in-flight agent can make it
falsely pass — this caused a real loop halt (`docs/loop-orchestrator.md` step 1;
"iter-9 false-positive"). Every completion is verified (`make check` +
per-function `byte_diff: 0`) *before* commit, and reverted with a `loop-log.md`
note on failure.
**FE8J adaptation:** our `auto_drive.sh`/`harvest_*.sh` should force a clean
`make` (not just `make compare` on a possibly-stale tree) before declaring a
carve/port landed. Cheap insurance against a green-looking but non-reproducing
tree.

### T10. Conservative up-front unmatchability triage (skip the grind honestly)
`classify_unmatchable.py` disassembles a function straight from baserom and flags
**only** near-zero-false-positive signatures (e.g. wide `push {r4-r7,lr}` whose
every `bl` is a libgcc helper) as STRONG_UNMATCHABLE; everything fuzzy stays
`ATTEMPT_MATCH`. The design contract is explicit: a false "unmatchable" is a
permanent regression (a NAKED ship) while a false "attempt" only wastes one run,
so the tool is deliberately asymmetric/conservative
(`tools/agent/classify_unmatchable.py`). Paired with a hard "NAKED gate"
(permuter actually run ≥1000 iters, ≥5 distinct C variants tried, evidence for
*this* function, NON_MATCHING reference body present) in
`tools/agent/prompts/decomp.md`.
**FE8J adaptation:** mostly we relink rather than hand-match, so this is niche —
but for the region-different TUs it gives a principled "is this worth grinding"
gate and a NAKED+`NON_MATCHING` fallback convention that maps the function (keeps
the build green and the repo fully mapped) without faking a match. Fold the NAKED
gate checklist into `docs/porting.md`.

### T11. Refcount-driven data extraction anchoring
`refcount_pool_loads.py` scans Thumb+ARM `ldr Rd,[pc,#N]` pool loads across the
code region, tallies references per target address, and cross-checks each
against `database.json` (EXTRACTED) and the map (NAMED) so `--pending-only
--threshold 5` surfaces the highest-yield *unclaimed* data anchors — "naming a
many-times-referenced table unblocks downstream decomps in bulk; neither m2c nor
permuter surfaces this view" (`tools/agent/refcount_pool_loads.py`;
`docs/loop-orchestrator.md` step 2 data target).
**FE8J adaptation:** data is 94% of our ROM and the active frontier
(`carve_data*.py`). A refcount view over JP pool loads would rank which
region-different tables to carve *next* by how much code references them — a
better priority signal than our current size/adjacency carve order. High-value
port alongside our existing `data_addr_map.py`.

### T12. Doc-discipline: small CLAUDE.md, topic docs, decisions log
CLAUDE.md is kept loadable in every context; anything topic-specific goes to
`docs/{codegen-notes,memory-map,subsystems,unknowns}.md`, with an explicit "bar
for writing: would a future agent benefit without re-deriving this?"
(`CLAUDE.md` "Agent notes — docs/"). Per-function deferral analyses live in
`docs/deferred-analysis/<fn>.md` and are what flips a function's status from
terminal `naked` to revisitable `deferred` (`tools/agent/function_status.py`;
`tools/agent/prompts/decomp.md` "DEFER, and MAP it").
**FE8J adaptation:** we already follow this (`docs/decisions.md`,
`docs/handoff.md`). The new idea worth stealing: a **derived** per-function/per-TU
status index (`function_status.py` scans the tree on demand rather than
maintaining a file that drifts) — for us, a `scripts/tu_status.py` deriving
{incbin / carved / ported / region-diff-deferred} per TU from `layout/` would
give the loop a never-stale worklist.

---

## 3. Prioritized scripts worth porting to our `scripts/`

Ranked by value/effort for FE8J specifically. "Effort" assumes re-pointing
paths (`frog_us_baserom.gba`→`baserom.gba`, `frog_us.map`→our map/ELF, etc.) and
adapting the relink-vs-peel assumptions.

| # | Source (in clone) | What it does | Effort / Value |
|---|---|---|---|
| 1 | `tools/agent/decomp_brief.py` | One-command briefing: addr range, callee peel/symbol status, **resolved** pool literals, per-base struct cross-ref, seed C, destination hint. | Med effort (swap m2c-seed for our US-source seed via `us_jp_funcmap.tsv`) / **Very high** — front-loads everything hand-decomp agents re-derive. |
| 2 | `scripts/corpus-sync.sh` + `tools/agent/corpus_asm_search.py` (+ `corpus.py`) | Curated agbcc-corpus clone/sync; git-history pickaxe that pairs removed-asm with added-C for an idiom; current-tree grep. | Med / **High** — broader agbcc idiom coverage (fe6j/fe7j/pokeemerald/tmc) beyond US, for region-different folds. |
| 3 | `tools/agent/refcount_pool_loads.py` | Rank ROM data addrs by code-reference count; cross-checks already-carved/named; `--pending-only` surfaces unclaimed high-yield anchors. | Low-Med / **High** — directly improves data-frontier carve ordering (94% of ROM). |
| 4 | `tools/agent/build_expected.py` + bundled `tools/agent/bin/objdiff-cli` | Per-file `expected/.o` from baserom bytes (correct `$t`/`$d`) → per-symbol `match_percent` diff without full-ROM rebuild. | Med / **High** — fast per-symbol feedback for hand-decomp + permuter loops. |
| 5 | `tools/agent/progress.py` (`--per-function`) | SHA1 oracle + top-N nonmatching-symbol byte-diff list = the "did this function improve / did I break a neighbour" signal. | Low-Med / **High** — augments our reporting-only `calcprogress.py` with a per-function loop signal. |
| 6 | `tools/agent/classify_unmatchable.py` + the NAKED-gate from `tools/agent/prompts/decomp.md` | Conservative unmatchability triage + honest defer/NAKED+`NON_MATCHING` fallback that keeps the build green. | Low / **Med** — niche (we relink mostly) but valuable for the ~11 region-different TUs. |
| 7 | `tools/agent/function_status.py` | Derived (never-drifts) per-function status index queryable by `--status`. | Low / **Med** — adapt to per-TU status from `layout/` for a never-stale worklist. |
| 8 | `tools/agent/struct_xref.py` + `struct_grow.py` | Cross-ref every load/store through a base addr (reader/writer columns by offset); render a typed C struct from observed widths. | Med / **Med** — useful for JP-only structs with no US typedef; US relink already gives us most structs. |
| 9 | `tools/agent/auto_peel.py` + `tools/disasm/peel.py` + `detect-fn-boundary.ts` | Peel-first machinery: boundary-detect → peel → bucket-split → linker rewrite → `make check`, revert-on-break. | High / **Low-Med** — our incbin-baseline + US-relink replaces most of this; relevant only for JP-only callees of region-diff functions. |

Lower priority / mostly already covered by our pipeline: `pick_target.py`
(our `gen_layout.py`/`locate_tu.py` encode layout order — port only the
duplicate-work + library-region guards), `craft_prompt.py` (mizuchi port;
`decomp_brief.py` covers the high-value subset), `setup_permuter.py` /
`make_permuter_target.py` (we already have `scripts/permuter/`; the **`$t`/`$d`
mapping-symbol fix** in `make_permuter_target.py` is the one detail worth
copying — see Anti-patterns).

---

## 4. Anti-patterns / things to AVOID (their hard-won mistakes)

- **Don't trust `make check`/`make compare` on a stale tree.** A bare check only
  re-verifies the existing ROM's SHA1; stale `.o` files from an in-flight agent
  can make it falsely pass. Force a clean rebuild (`make tidy` equivalent) before
  declaring a landing. This caused a real multi-iteration loop halt
  (`docs/loop-orchestrator.md` "iter-9 false-positive").

- **Don't run the permuter against a `target.o` that lacks `$t`/`$d` mapping
  symbols.** Without them objdump disassembles the literal pool as garbage Thumb;
  every phantom pool insertion costs 100 points, inflating base scores ~100×
  (`byte_diff 8` scored **2545**), so score-0 is unreachable and the permuter
  chases noise — this silently wasted multiple sessions (`docs/tooling.md`
  "CRITICAL: the permuter `target.o` must carry `$t`/`$d`"). Always (re)build the
  target with the dedicated tool. **Directly applies to `scripts/permuter/`.**

- **Don't permute (or compile-check) a TU with the wrong agbcc.** Old vs new
  agbcc emit different code for some functions; permuting with the wrong one
  optimizes codegen that won't match the real build (`docs/tooling.md` "CRITICAL
  #2"). Match the per-TU compiler the Makefile actually uses.

- **Don't reach for the permuter as a *first* response to a fold.** Corpus FIRST,
  permuter LAST — a documented case had permuter make a function *worse* (score
  90 vs corpus's first-try byte match) (`CLAUDE.md` step 7). The permuter mutates
  C structure and hopes for a recolor; it does **not** steer the allocator, so on
  pure low-register coloring it *plateaus every time* — keep the `register asm()`
  pin instead of grinding 36k iters (`AGENTS.md`/`CLAUDE.md` permuter section ❌
  class).

- **Don't `#ifdef NON_MATCHING` your way past more than ~one function per session
  without flagging it**, and never ship NAKED as a shortcut around the match
  hunt — a 9-iter retrospective found ~9/10 NAKED commits shipped *without honest
  evidence* and were later shown matchable in pure C
  (`tools/agent/prompts/decomp.md` "NAKED gate").

- **Don't treat high-register pins (`mov sl/r8/r9`) as a blanket "unmatchable /
  NAKED" trigger.** They're usually a *pure-C* matching lever
  (`register T x asm("r8")`); the genuinely-hard case is narrow (a high reg
  holding loop state across an inner function-pointer `bl`). The earlier
  fast-path was removed because it caused premature NAKED ships
  (`tools/agent/prompts/decomp.md` "High registers are NOT a NAKED fast-path").

- **Don't edit the oracle inputs to "fix" a mismatch.** Never touch
  `frog_us.sha1`/`baserom`/`database.json` to make a diff go away, never disable
  `-Werror` or `--no-verify` past errors — agbcc warnings often *are* the
  matching problem (`CLAUDE.md` / `AGENTS.md` "What NOT to do"). FE8J equivalent:
  never weaken `make compare` or the baserom sha1 to force green.

- **Don't peel a range by eyeball.** Peeling too wide swallows the next function
  and silently corrupts layout (commit `0c989b1`); always machine-verify extent
  first (`docs/tooling.md` "Phase A").

- **Don't let parallel subagents both touch `linker.ld` or a shared header.**
  That's the merge-conflict / layout-drift trap; partition by file/region and
  pass each agent the others' touched ranges (`CLAUDE.md` "Subagent parallelism";
  `docs/loop-orchestrator.md` step 3).

- **Don't over-stuff CLAUDE.md.** It loads into every agent context; topic detail
  belongs in `docs/*`. (They enforce a written "would a future agent benefit
  without re-deriving this?" bar — `CLAUDE.md` "Agent notes".)
