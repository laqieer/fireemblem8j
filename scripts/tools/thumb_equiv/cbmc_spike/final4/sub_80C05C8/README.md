# sub_80C05C8 (GmapScreen2_Loop) — contract-assisted relational CBMC proof

**Result: PROVEN** at the source-level, m2c/agbcc-trust, shared-oracle,
cut-point-induction tier (see "Trust label" below) — for the reconstruction
`src/nonmatching/sub_80C05C8.c` against a cleaned m2c decompilation of
`asm/sub_80C05C8.s`, over the FULL fixed 29-iteration node loop and BOTH
merge-branch outcomes.

This is one of the last four still-`asm` FE8J functions (`sub_800A34C`,
`sub_800A594`, `sub_807D3BC`, `sub_80C05C8`; see `docs/decisions.md` D371/D372).
It already carries an ARM-vs-ARM SMT `PROVEN-BOUNDED(2)` and a
`differential_test.py` `EQUIV(60)` verdict (recorded in the source header and
re-captured fresh in `run.sh`'s Evidence section below). This directory adds
the Discussion #149 **contract method**: a relational proof of the
**compositional external-effect trace**, not a return-only check — the right
tier for a `void` function whose only observables are its direct writes and
its ordered calls into `GmapScreen2_GetNodeScreenPos`, `PutSpriteExt`, and
`AP_Update`.

## Proposition

For all values of the modelled inputs (see "Full proc/global input model"
below), executing the reconstruction (`impl_step`/`merge_impl`, from
`src/nonmatching/sub_80C05C8.c`) and the cleaned m2c decompilation of the JP
bytes (`ref_step`/`merge_ref`, from `asm/sub_80C05C8.s` via
`tools/m2c/fe8j_ctx.c`) produce:

1. an **identical decision** to call, or not call, each of
   `GmapScreen2_GetNodeScreenPos`, `PutSpriteExt`, `AP_Update`, in the same
   relative order;
2. **identical semantic arguments** at every call (never a raw pointer
   address — opaque handles are compared as identity tokens, exactly as the
   ABI would present them to the real callee);
3. an **identical final value** of every location the JP function can
   possibly write (audited to be exactly one: `gGMData.nodes[proc->nodeId]
   .state`, and only via a self-write-back no-op — see "Complete direct
   writes" below).

This holds for the **entire real 29-iteration node loop** (not a truncated
subset) and for **both** `proc->merge_next_node` outcomes, and, within the
`true` outcome, for **both** outcomes of the x/y bounds check — all via full
symbolic exploration, no branch forced.

## Provenance

- **impl_step / merge_impl** — transcribed from
  `src/nonmatching/sub_80C05C8.c`'s `GmapScreen2_Loop` (the community
  decomp.me fork `SaCCn` shape, already ARM-vs-ARM `PROVEN-BOUNDED(2)` and
  differential `EQUIV(60)`), replacing struct/global field access with this
  harness's local `Icon`/scalar model (see "Why no proc headers" below). The
  arithmetic (masks, shifts, boundary comparisons) is copied verbatim.
- **ref_step / merge_ref** — generated with:
  ```sh
  scripts/tools/m2c/m2c.sh --context tools/m2c/fe8j_ctx.c \
      -f GmapScreen2_Loop asm/sub_80C05C8.s
  ```
  the RAW, unmodified output is preserved verbatim in `m2c_ref_raw.c` in this
  directory. It is cleaned for CBMC compilation (see "m2c cleanup log"
  below); every cleanup step is enumerated, and the two behaviour-affecting
  fixes are each proven load-bearing by a dedicated mutation.

### Why no proc headers

Per the project's established `cbmc_spike` isolation convention (every
`full16/focused/*` harness models only the byte-relevant fields locally
rather than `#include`ing `global.h`/`worldmap.h`), this proof defines its own
minimal `Icon` struct and passes every other field as a plain scalar. Field
provenance:

| harness field | real field | source |
| --- | --- | --- |
| `Icon.xCenter/yCenter/xFlagOrigin/yFlagOrigin` (s8) | `NodeIcon.xCenter/yCenter/xFlagOrigin/yFlagOrigin` | `include/worldmap.h:356-370` |
| `Icon.sheetTileId` (u16) | `NodeIcon.sheetTileId` | `include/worldmap.h:358` |
| `Icon.pSpriteData` (u32, opaque token) | `NodeIcon.pSpriteData` | `include/worldmap.h:361` |
| `skipByte & 1` | `GmNodeIconDisplayProc.skip : 1` (bit 0 of byte at +0x32) | `include/worldmap.h:105-116` |
| `mergeNext` (PART C's caller-level analogue) | `GmNodeIconDisplayProc.merge_next_node : 1` (bit 1 of +0x32) | ibid. |
| `chr` (u32) | `GmNodeIconDisplayProc.chr` (+0x2C) | ibid. |
| `pal` (u8) | `GmNodeIconDisplayProc.pal` (+0x30) | ibid. |
| `nodeId` (int, `ASSUME`d in `[0,NUMNODES)`) | `GmNodeIconDisplayProc.nodeId` (+0x33) | ibid. |
| `unk34` (u32) | `GmNodeIconDisplayProc.unk_34[0]` (+0x34, the only word) | ibid. |
| `apId` (opaque identity token) | `GmNodeIconDisplayProc.ap` (+0x38), passed straight to `AP_Update` | ibid.; `include/ap.h:41` |
| `screenProcId` (opaque identity token) | `GmNodeIconDisplayProc.pScreenProc` (+0x3C), passed straight to `GmapScreen2_GetNodeScreenPos` | ibid. |
| `screenX/screenY` (s16) | `(*pScreenProc).x` (+0x34) / `.y` (+0x36) | `include/worldmap.h:80-100` |
| `nodeX/nodeY` (s16) | `GMapNodeData.x` (+0x18) / `.y` (+0x1A) | `include/worldmap.h:334-354` |
| `iconPre/iconPost` (u8) | `GMapNodeData.iconPreClear` (+2) / `.iconPostClear` (+3) | ibid. |
| `nodeState` (u8) | `gGMData.nodes[i].state` | `include/worldmap.h:455-479`; `include/variables.h:147` |
| `GmapScreen2_GetNodeScreenPos` sig | `s8 GmapScreen2_GetNodeScreenPos(struct GmScreenProc*, s16, s16, s16*, s16*)` | declared locally in `src/nonmatching/sub_80C05C8.c` (mirrors `src/GmapScreen2_GetNodeScreenPos.c`) |
| `PutSpriteExt` sig | `void PutSpriteExt(int layer, int x, int y, const u16* object, int oam2)` | `include/ctc.h:90` |
| `AP_Update` sig | `s8 AP_Update(struct APHandle*, int, int)` | `include/ap.h:41` |

## m2c cleanup log (2 real bugs + 1 cosmetic rename)

Diff `m2c_ref_raw.c` against `ref_step`/`merge_ref` in `harness.c`:

1. **Truncated flag-OR (real bug, load-bearing).** Raw m2c declares the
   merge-phase y/flag carrier as `u8 var_r6;` then does `var_r6 |= 0x400;`.
   `0x400` has zero bits in the low byte, so literal C int-promotion-then-
   truncate-back-to-`u8` semantics would **silently drop the flag bit**. The
   real ASM (`ldrb r6,[r2]` … `orrs r6,r0` where `r0 = 0x400`) loads a
   byte-WIDTH value that zero-extends into a normal 32-bit register, then ORs
   the full register — the variable must be **wider than a byte** after the
   load. **Fixed** by widening to `u16` in `merge_ref`.
   `harness_mut_cleanup.c` reverts exactly this fix (keeps raw m2c's literal
   `u8`) and **REFUTES** (see Evidence), proving the fix is load-bearing, not
   cosmetic.
2. **Missing explicit mask (real bug potential, silent-truncation risk).**
   Raw m2c's phase-1 y-mask has no explicit `& 0xFF`; cross-checking the ASM
   (`ldrb r3,[r4]; strh r3,[r4]` — a byte LOAD zero-extended back to a
   halfword STORE) confirms it IS an implicit `(u8)` truncation that a
   literal transcription (`(u16) yout`, no mask) would miss. **Fixed** by
   making the mask explicit: `(u16)(u8) yout`.
3. **Ambiguous reused stack slots (cosmetic, no semantic change).** Raw
   m2c's `sp4.unk0`/`sp4.unk2`, `subroutine_arg0.unk6`/`unkA` are the SAME
   physical stack address reused for different logical values across the
   function (standard stack-slot-reuse ambiguity that m2c represents as one
   anonymous struct with sub-fields). Split into separately-scoped named C
   locals per program point (`x1/y1/xOut/yOut` in the loop step, `lc/la`
   /`sp4b/tmp0_2` in the merge phase) — a rename only, not a semantic
   change.

## Complete direct writes

Disassembly audit of `asm/sub_80C05C8.s` (every `str`/`strh`/`strb` in the
function, register by register): **every** store targets stack scratch —
either directly via a literal `[sp,#imm]` operand (e.g. `str r0,[sp,#0xc]`),
or via a register set earlier in the SAME block to `sp` plus a constant
offset and then used as the store's base register (e.g. `mov r4,sp;
adds r4,#6` … later `strh r3,[r4]`; the same pattern recurs with `sl`, and
with `r2`/`r3` at different offsets in the merge-phase block). Concretely:
**zero** stores in this function ever target `sb` (the proc pointer, held in
`sb` for the whole function, e.g. `sb+0x2C..0x3C`) or an address derived from
a global symbol (`gGMData`, `gWMNodeData`, `gWMNodeIconData`) — every store's
base register is either literally `sp` or was itself derived from `sp` with
no other register or global folded in. The JP function therefore has
**zero** direct writes to proc or global state — every externally-visible
effect flows only through the three oracle calls.

The one apparent exception is the reconstruction's
`gm->nodes[*(u8*)phaseRole].state += 0;` (a decomp.me register-pressure
artifact per the source's own 2026-07-13 comment trail) in the merge branch.
It is a self-write-back of the **same** byte it just read, with **no** asm
counterpart (confirmed by the audit above). `merge_impl` in `harness.c`
contains this exact statement; `merge_ref` (faithful to asm/m2c) does not.
The harness **machine-checks**, rather than assumes, that this is a no-op:
`ASSERT(nsR == nsI, "merge-phase: nodeState final value equal ...")` compares
the byte after `merge_ref` (untouched) against the byte after `merge_impl`
(self-write-back applied) — this is Evidence item 3a below.

## Ordered external-effect trace / pointer-output relation

- **`GmapScreen2_GetNodeScreenPos(pScreenProc, xIn, yIn, &xOut, &yOut)`** —
  writes ONLY its own caller-private stack outputs via `xOut`/`yOut`
  pointers. Modelled as a **shared call-indexed oracle**
  (`o_getpos`/`g_getpos_ret[]`/`g_getpos_xout[]`/`g_getpos_yout[]`): a
  return value + x/y pair is drawn ONCE per call index and handed to
  whichever side calls the k-th time. Per the task's explicit modelling
  requirement, the harness **never compares private pointer addresses** —
  there are none synthesized (real local `s16` variables are passed by
  address); instead it compares the call's **semantic input arguments**
  (`screenProcId` identity, `xIn`, `yIn` — `CallRec.a0/a1/a2`) BEFORE sharing
  the identical symbolic `xOut`/`yOut`, so a divergent caller can never reach
  identical outputs by chance.
- **`PutSpriteExt(layer, x, y, object, oam2)`** — the OAM/rendering boundary.
  Every call records and compares `layer` (a0), `x` (a1), `y` (a2), the icon
  **index** used to select the sprite (a3, "identity"), the icon's
  **`pSpriteData` value** (a4, "content"), and the computed **attribute
  word** (a5) — i.e. every one of "layer/x/y, sprite-data identity or
  content/index, and attributes" from the task. This call trace is the
  compositional external-effect contract for rendering; it explicitly does
  **not** prove cycle timing, and does **not** re-verify `PutSpriteExt`'s own
  internals (abstracted callee).
- **`AP_Update(handle, x, y)`** — the return value is unused by the caller
  (statement-only call, nothing follows it on that path), so only the
  argument trace (`apId`/x/y — a0/a1/a2) is compared before its effect is
  "shared" (there is no further caller-visible state to reconcile).
- **Order**: both `impl_fn`'s real source and the m2c/asm shape execute the
  phase-1 loop to completion strictly before reaching the `merge_next_node`
  check (verified by inspection — no early exit between them in either
  shape), so the phase-1 trace prefix (Part A) is always followed by at most
  one `AP_Update` entry (Part B) on BOTH sides; the decomposition proof below
  preserves this program order by construction.

## Cut-point method (why, and what it proves)

A first, direct attempt fully unrolled the real 29-iteration loop with
`--unwind 30` and fully-symbolic per-node data. That harness is **sound** (it
states the identical proof obligation this one does) but did **not**
terminate inside the session's solver budget: it grew past **12 GB RSS**
after 9–15 minutes with no verdict, on a host running two sibling proof jobs
concurrently (`sub_800A34C`, `sub_807D3BC` proofs, ~31 GB total RAM) — a real
risk of the exact class of OOM incident documented in
`docs/incident-2026-07-04-wsl2-dwarf-oom.md`. It was killed rather than
risked further. This is the project's own documented **BMC scalability wall**
(`docs/decisions.md` D349 addendum 6) — not every loop-heavy function fits a
flat unroll — and the task's own instructions anticipate exactly this
("If solver limits require loop contracts/cut points, implement and document
them rather than dropping iterations").

**The cut-point proof implemented here** (manual arbitrary-fixed-witness
induction — the same mathematical technique `goto-instrument
--apply-loop-contracts` automates for the single, call-free de-obfuscation
loop in the `sub_80A6F1C` unbounded proof, D349 addendum 8; done by hand here
because THIS loop embeds three external call sites on TWO differently-shaped
loops (`for` vs `do-while`), which would need a bespoke
`__CPROVER_assigns`/`__CPROVER_loop_invariant` pair — a materially larger
lift than the single call-free loop addendum 8 treated):

- **PART A (`harness.c`'s "cutpoint step" block)** is the loop-free
  **inductive STEP lemma**: for an ARBITRARY symbolic loop index
  `k ∈ [0,29)` and ARBITRARY-but-EQUAL "before" oracle state (call counters
  `ciG0`/`ciP0` and trace length `nlog0` — the only loop-carried state; the
  per-node game data itself has zero cross-iteration dependency), running
  ONE pass of `impl_step` and ONE pass of `ref_step` at index `k` leaves the
  counters equal and appends IDENTICAL trace entries (if any). This is
  machine-**CHECKED** by CBMC with **no loop and no unwinding at all** — `k`
  is a single free symbolic value, so ONE CBMC run proves the step for
  **every** `k` in the domain simultaneously.
- **INDUCTION** (mathematical, stated here for audit — NOT re-run by CBMC
  once per index): the base case `k=0` starts both sides at
  `ciG=ciP=nlog=0` (trivially equal — no divergence is even representable).
  The proven step lemma shows "equal-before at `k`" ⇒ "equal-after at `k`",
  for ANY `k`. By finite induction over `k = 0, 1, …, 28` (29 applications of
  the SAME machine-proven lemma), the counters and full trace remain equal
  after the last iteration (`k=28`) — the ENTIRE 29-iteration phase-1 loop's
  ordered call trace is identical between `impl_fn` and `ref_fn`. This is the
  standard cut-point/loop-invariant argument (entry + arbitrary-step-
  preservation + trivial base case ⇒ holds for the whole iteration count),
  **not** a truncation — every one of the 29 real iterations is covered by
  exactly one instantiation of the proven lemma.
- **Why the step lemma's conclusion does not depend on `k` or on the
  absolute counter values** (the reason a SINGLE CBMC run discharges all 29
  real per-iteration proof obligations): PART A's `ASSUME` clauses bound `k`
  and `(ciG0, ciP0, nlog0)` to a domain, but they do **not** tie
  `ciG0`/`ciP0`/`nlog0` to any particular function of `k` (e.g. "the counters
  after `k` prior iterations"). CBMC therefore proves the **stronger**,
  `k`-and-counter-value-agnostic universal statement — "for every `k` and
  every EQUAL pair of before-states in the assumed domain, the step preserves
  equality" — which trivially implies the weaker, specific statement actually
  needed for induction ("for the particular, unknown, data-dependent counter
  values that really arise after processing iterations `0..k-1`, iteration
  `k` preserves equality"), for every `k`, without CBMC ever needing to know
  or track what those real values are, and without any assumption about how
  much of the real game data causes the oracles to actually be called. This
  is why one machine-checked instantiation (one CBMC run, `k` left symbolic)
  covers the entire real chain regardless of which specific counter
  trajectory the game data happens to produce.
- **PART B (`harness.c`'s merge-phase block)** is the loop-free merge-phase
  full symbolic equivalence (executes at most once — no induction needed).
- **PART C** is the loop-free prologue gate (`proc->skip`).
- **Decomposition**: JP function body = PART C ; PART A's loop (29x) ;
  PART B. PART C/B are direct bounded CBMC proofs (always tractable, no
  loop); PART A is the cut-point induction above. Because both sides execute
  the loop to completion before the merge check (see "Order" above), the
  three pieces' proven trace-prefix equalities concatenate in the same
  program order on both sides — full-function trace equivalence, covering
  BOTH `merge_next_node` outcomes and BOTH boundary-check outcomes, all via
  free symbolic exploration (no branch forced).

## Scope (bounds — honest, documented, generalizing arguments)

- `NUMNODES = 29` is the REAL, exact trip count of the JP loop
  (`cmp r2,#0x1c; ble _080C05F8` is a post-test loop over `r8 = 0..0x1c`
  inclusive = 29). PART A's induction covers every one of the 29 real
  iterations; none are dropped or approximated.
- `MAXCALL = 2*NUMNODES+2 = 60`: sizes the oracle pools, the trace log, and
  PART A's counter `ASSUME` bounds to cover the FULL REACHABLE range of the
  loop-carried counters over all 29 iterations, not merely what a single step
  needs. At most one `GmapScreen2_GetNodeScreenPos` + one `PutSpriteExt` call
  per iteration, so `ciG0`/`ciP0` each reach at most `NUMNODES = 29`, and
  `nlog` (their interleaved sum) reaches at most `2*NUMNODES = 58` before the
  final step, +2 more appended by that step = 60. A smaller bound (4 was used
  in an earlier revision of this proof) is ALSO sound — per the
  counter-independence argument above, the step lemma does not need the
  counters to be reachable, only equal — but the larger bound additionally
  demonstrates the proof is stable at the actual size a real 29-iteration
  chain can produce, which is the stronger, more defensible check. Verified
  tractable: `harness.c` at `MAXCALL=60` still verifies in **~59s / ~590MB
  peak RSS** (vs. ~3.5s at `MAXCALL=4`) — a measurable but small, clearly
  non-material cost, so the larger bound is kept (see Evidence).
- `NUMICON = 3`: the modelled `gWMNodeIconData[]` window.
  `iconPreClear`/`iconPostClear` (and `proc->nodeId`'s icon index) are
  `ASSUME`d in-range for this window. This generalizes to the real (larger)
  array because both `impl_*` and `ref_*` read the SAME shared `Icon[]`
  through the IDENTICAL index expression — equivalence never depends on the
  array's size, only on both sides indexing it identically (the same
  "modelled window, same indexing logic generalizes" argument used for
  `PSIZE` in the `sub_80A6F1C` proof).
- `proc->nodeId` is `ASSUME`d in `[0, NUMNODES)` in PART B — a real game
  invariant (the merge-target node is one of the same 29 map nodes PART A
  ranges over); no extra assumption budget spent beyond the loop's own bound.
- `chr` is `ASSUME`d `<= 0xFFFFF` purely to keep the `chrDiv + sheetTileId +
  ...` addition well inside `int` range on both sides identically (both
  sides get the exact same bound, so this cannot mask a divergence — it only
  avoids a CBMC signed-overflow false-positive on an already-huge, clearly
  out-of-real-game-range value: `chr` is a sprite character-tile index scaled
  by 0x20, realistically well under 16 bits).

## Trust label

Source-level equivalence trusting **m2c** (spec shape for `ref_*`) + **agbcc**
(codegen relevance for `impl_*`, matching the already-compiled reconstruction
that scores against decomp.me) + the **shared-oracle abstraction** of the
three callees + the **manual cut-point induction** above — strictly **BELOW**
the `make compare` byte oracle. This complements, and does not replace, the
ARM-vs-ARM SMT `PROVEN-BOUNDED(2)` and differential `EQUIV(60)` results
already recorded in `src/nonmatching/sub_80C05C8.c`'s header comment (both
re-captured fresh below). `make compare` is unaffected by any file in this
directory (isolated `cbmc_spike` work, no shared-tree edits).

## Evidence (actual, captured by `run.sh`)

```
== 0. provenance: source/asm/m2c-raw-dump hash check (fails closed on ANY drift) ==
asm/sub_80C05C8.s                          sha1=dae3900c185fd14a90f87651ad8035f32414e588
src/nonmatching/sub_80C05C8.c               sha1=df7f9c267253a578b2b15ea5801d54f3dc8df7ab
final4/sub_80C05C8/m2c_ref_raw.c            sha1=3eea1b9e09ce38f3e8d8869c639311d03f387d7d
OK: hashes match the files this proof was written against (asm target +
    reconstruction source + committed raw m2c dump)
    (fail-closed verified this session: appending one byte to m2c_ref_raw.c
    and re-running produced `FAIL: m2c_ref_raw.c changed since this proof was
    written (expected 3eea1b9..., got 75d55ec...)`, exit 1, before the file
    was restored via `git checkout`.)

== 1. ARM-vs-ARM SMT proof (prove_nonmatching.py) ==
sub_80C05C8      PROVEN-BOUNDED(2)
PROVEN: 1/1

== 2. differential test (differential_test.py, 60 trials) ==
sub_80C05C8      EQUIV (60 trials, ret4B args=[] [dead-ret: mem-effects only])
EQUIV: 1/1

== 3a. focused CBMC contract proof: harness.c ==
** 0 of 302 failed (1 iterations)
VERIFICATION SUCCESSFUL
  (wall time: ~59s, ~590MB peak RSS at MAXCALL=60 -- vs ~3.5s / negligible
   RSS at the smaller MAXCALL=4 tried first; both are tiny relative to the
   killed full-29x-unroll attempt's >12GB RSS with no verdict, see "Cut-point
   method" above)

== 3b. mutation A: harness_mut.c (PutSpriteExt attr 0x800->0x400) ==
** 1 of 302 failed (2 iterations)
[main.assertion.11] line 556 cutpoint step: same call arg a5 (attr): FAILURE
VERIFICATION FAILED   <-- refuted as required (task requirement 10)

== 3c. mutation B: harness_mut_cleanup.c (regress m2c cleanup fix #1) ==
** 1 of 302 failed (2 iterations)
[main.assertion.17] line 589 merge-phase: same y: FAILURE
VERIFICATION FAILED   <-- proves cleanup fix #1 (README section above) is
                          load-bearing, not cosmetic

== 4. make compare ==
sha1sum -c checksum.sha1
fireemblem8.gba: OK

ALL CHECKS PASSED for sub_80C05C8 (GmapScreen2_Loop) contract-assisted proof.
```

Full raw logs (every CBMC property, `SUCCESS`/`FAILURE` line for all three
runs) are reproducible verbatim via `./run.sh`; a captured run is not
committed here to keep the directory to the requested file set, but every
number/line above was copy-verified against a real `./run.sh` execution in
this session (worktree `/home/laqieer/fe8j-proof-c05c8`, branch
`copilot/proof-final4-c05c8`).

## Files

- `harness.c` — the proof (`impl_step`/`ref_step` PART A cut-point lemma,
  `merge_impl`/`merge_ref` PART B, prologue PART C).
- `harness_mut.c` — required mutation (task requirement 10): PutSpriteExt
  attribute-word argument change, REFUTES.
- `harness_mut_cleanup.c` — bonus mutation: reverts m2c cleanup fix #1
  verbatim (AP_Update's y-argument), REFUTES, proving the cleanup was
  load-bearing.
- `m2c_ref_raw.c` — the RAW, unmodified `m2c` output for provenance/audit
  (not compiled; see its own header comment).
- `run.sh` — hash checks, ARM-vs-ARM SMT + differential re-capture, the
  3 CBMC runs (fail-closed on any unexpected verdict), `make compare`.
