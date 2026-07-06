# Proving equivalence for non-matching functions (Z3 / SMT)

Resolution write-up for **Discussion #149** — Serentty's idea of lifting
assembly into Z3 to prove a non-byte-matching decompiled function is still
*equivalent* to the original, and macabeus's two concerns (**timing** and
**MMIO**). This documents where the idea is sound, where it must be bounded, and
how it fits a byte-perfect project. A runnable PoC on real FE8J THUMB lives in
`scripts/tools/thumb_equiv/` (see its `README.md`).

## TL;DR verdict

Formal equivalence checking of non-matching functions is **real, useful, and
demonstrably works on FE8J THUMB** — but only as a **confidence annotation
strictly below byte-match**, under an explicit machine/ABI/environment model. Two
complementary techniques cover the 16 `src/nonmatching/*.c` reconstructions:
**bounded SMT symbolic execution** (`prove_nonmatching.py`, sound, 12/16) and,
where that is intractable (nonlinear math, callbacks, stack aliasing, size),
**concrete differential testing** (`differential_test.py`, +2) — **14/16
machine-checked equivalent** in total. It answers "is this readable C plausibly
the same function?", not "may we ship these bytes?". For FE8J the oracle is and
stays `make compare` (SHA-1). Equivalence proving is a **new upper tier of the
existing NON_MATCHING C ladder** (`docs/nonmatching.md`), not a change to the
oracle.

## The exact proposition posed to Z3 (the proof obligation)

For a function under test, let **T** = the JP ROM's ARM/THUMB bytes (the
byte-source in `asm/<fn>.s`) and **C** = the *compiled* reconstruction
(`src/nonmatching/<fn>.o`, relocations resolved). Both are **machine code** — the
prover compares *ARM-vs-ARM*, so the ground truth (the actual ROM bytes) is always
one operand. From a single **symbolic initial state** `σ = (r0..r15, NZCV, memory
M)` shared by both sides, define the observable of a run as the tuple

&nbsp;&nbsp;`O(P, σ) = ( return value r0[/r1], callee-saved r4–r11 + sp restored,
the set of data-memory writes {(addr, width, value)}, and the ordered trace of
external effects — each (call-target, live-args) and each volatile MMIO
read/write (kind, addr, width, value) )`.

The prover asserts the **negation** of

> **∀ σ.  O(T, σ) = O(C, σ)**

as a quantifier-free bit-vector (QF_BV) formula and asks Z3 for `unsat`
(⇒ **PROVEN** — no input distinguishes them) or a model (⇒ **REFUTED** — a concrete
`σ` that does). It is a **bounded** obligation, discharged under an explicit model:
loops are unrolled to a stated depth *N* (bounded model checking, not an
inductive proof); every `bl`/`bx` callee is an **uninterpreted function** applied
*identically* to both sides (so only the args each callee actually reads are
compared — sound because a summary that havocs external memory can only *fail* to
prove, never falsely prove); ROM is a read-only immutable array; MMIO is the
`[0x04000000, 0x05000000)` window with volatile reads modelled as fresh symbols
from a shared oracle. Two observable strengths are available: **ABI-functional**
(everything above except the MMIO trace — what a normal C caller relies on) and
**observational** (also the MMIO read/write trace — macabeus's stronger notion).
Neither entails cycle-timing equality; `make compare` remains the only guarantee
of that. Differential testing (`differential_test.py`) checks the *same* `O(·)`
observable concretely over many random `σ` (testing, not a `∀`-proof), and the
live-state harness supplies a real, self-consistent `σ` for functions that fault
on synthetic input.

## The two questions

### 1. Prior art (Serentty's question)

This technique has a long, well-established lineage — it is *translation
validation* / *equivalence checking* applied at the machine-code level:

* **Translation validation** — Pnueli, Siegel & Singerman (1998); Necula's
  proof-carrying / validated compilation (2000). Prove a transformed program
  equivalent to its source instead of trusting the transformer.
* **Verified/validated compilers** — CompCert (formally verified passes);
  **Alive / Alive2** (Lopes et al.) verify LLVM peephole optimizations with an
  SMT solver — the closest spiritual match to "prove two IR/asm snippets equal".
* **Superoptimizer verification** — Bansal & Aiken's peephole superoptimizer and
  **STOKE** (Schkufza et al.) verify candidate machine-code sequences equivalent
  to a target via SMT / test-and-verify. This *is* "prove a different instruction
  sequence computes the same function", i.e. exactly the decomp non-match case.
* **Sequential equivalence checking (SEC)** — a standard hardware/EDA discipline;
  the same idea (compare two implementations over all inputs) that FE decomp's
  byte-matching is a degenerate, syntactic instance of.
* **Binary lifting + symbolic execution engines** you would build this on:
  angr/claripy, BAP, Miasm, Remill/McSema, BINSEC, rev.ng, Triton. These lift
  machine code to an IR with SMT-backed symbolic state.
* **Formal ISA semantics** to lift *soundly* rather than hand-rolling opcodes:
  Sail (ARM's own machine-readable ARM semantics), HOL4 ARM, the K-framework ISA
  models, and Ghidra's SLEIGH / P-code (a ready-made lifter substrate).
* **Decomp-community tooling** — decomp.me, asm-differ, objdiff, m2c,
  decomp-permuter. Important contrast: these are *matching/diff/search* aids.
  They help you **find** a byte-match or eyeball a diff; they are **not** SMT
  equivalence proofs and do not accept non-matching C as an oracle substitute.

**Not aware of** any established matching-decomp workflow (pret/N64/GBA) that
*accepts* non-byte-matching C into the checksum build on the strength of an SMT
equivalence proof. Non-matching there is tracked as "decompiled ≠ matched" and
kept out of the byte oracle — which is exactly the posture recommended below.

### 2. Does the prover account for timing and MMIO? (macabeus's concern)

Not automatically — and this is the crux. You must **choose the observable** and
prove equivalence *with respect to that observable*. Three strictly increasing
notions:

| Notion | Observable | Catches | Misses |
|---|---|---|---|
| **ABI-functional** | return regs + callee-saved/sp restored + RAM final state | wrong results, wrong memory writes | MMIO order/extra accesses, timing |
| **Observational** | + ordered **volatile MMIO trace** (reads *and* writes: kind/addr/width/value) | different/extra/missing MMIO reads & writes, reordering | timing |
| **Cycle-exact** | + a real target timing model | timing divergence | (nothing, but see below) |

* **MMIO** — the fix is to make volatile accesses *observable events on an
  ordered trace*, not ordinary memory. On GBA (`0x04000000–0x040003FF` I/O, plus
  palette/VRAM/OAM), a write that is later overwritten still had a hardware
  effect, and a **read** can be side-effectful or return changing status bits.
  So the observable must include **both** reads and writes, in order, with width.
  Two functions with identical final registers/RAM but a different MMIO trace are
  **not** observationally equivalent. The PoC demonstrates this for both a
  differing write pattern (`1;2` vs `2`) and a differing read count.
* **Timing** — deliberately *not* solved here, and easy to oversell. GBA cycle
  counts depend on memory region and wait-states, sequential vs non-sequential
  accesses, prefetch, branch/pipeline behaviour, DMA contention, IRQ latency and
  alignment. A naive instruction count is **not** a GBA timing model. Therefore:
  timing-sensitive routines (IRQ/HBlank/DMA/serial/audio-mixer, anything a
  raster/DMA effect depends on) must **not** be accepted on functional or even
  observational equivalence alone. **Byte-match remains the only practical
  guarantee of cycle exactness.** The PoC exposes an `insn_count` only as an
  explicitly-labelled abstract cost proxy, never a timing proof.

## What the PoC proves (and its honest limits)

`scripts/tools/thumb_equiv/` lifts a straight-line ARMv4T THUMB leaf function
into Z3 (registers r0–r15 as 32-bit bit-vectors, NZCV flags, byte-addressed
memory arrays), then asserts the negation of the chosen observable and asks the
solver for UNSAT (proof) or a model (counterexample). Verified end-to-end:

* **A** two byte-different encodings of `x*9` → PROVEN ABI-functional equivalent.
* **B** `add` vs `sub` → REFUTED with a concrete counterexample input (soundness:
  a *wrong* equivalence claim is caught).
* **C/D** identical architectural result but different MMIO **write**/**read**
  pattern → functional-EQUIV yet observational-REFUTED (macabeus's point, live).
* **real_smoke** lifts the *actual ROM bytes* of `AiScriptCmd_14_DoNothing`,
  `GetGameClock` (PC-relative literal-pool load) and `BG0Shaker_Init` and proves
  each equivalent to a byte-different rewrite.

Honest boundaries (see the tool README for the full list): one basic block only
(no branches/loops/`bl` — loops need bounded unrolling or invariants; non-leaf
needs callee summaries); a partial THUMB subset; **nonlinear** `mul`/division
reasoning is the classic bit-vector-SMT blow-up and is not reliably decidable;
memory model assumes no stack/pointer aliasing, read-only ROM, and a fixed MMIO
window; value-carrying volatile reads need a shared read-oracle. It proves
equivalence **under this model**, not unconditionally "for all inputs".

## Applying it to the real FE8J non-matching functions (`prove_nonmatching.py`)

The 16 functions in `src/nonmatching/sub_*.c` are the project's genuinely
*unmatched* code: readable C reconstructions whose byte source is `asm/sub_*.s`
(region-different — a whole-function agbcc register-coloring/spill wall), built
only by `make nonmatching`, never in the oracle. This is exactly Discussion
#149's target: prove each reconstruction equivalent to the JP ROM function.

`scripts/tools/thumb_equiv/cfg_exec.py` scales the PoC to these: NZCV flags,
conditional branches (path forking), bounded loop unrolling (BMC), a fuller
THUMB ISA, and **sound uninterpreted call summaries**. For each function the
driver lifts the *JP ROM bytes* (target) and the *compiled reconstruction*
(candidate, relocations resolved) from one **shared** symbolic input state and
checks every reachable path pair for equal observables (return value,
callee-saved regs + sp restored, data memory, ordered call/MMIO trace). Call
targets are matched by **resolved address** (so `CpuSet` == `sub_80D6370`),
`_call_via_rN` veneers as indirect calls (the register choice is not a diff), and
ROM is served read-only from the cartridge image (immune to call-havoc).

**Result: 12/16 formally SMT-proven** (`PROVEN-BOUNDED(N)`), raised to **14/16
machine-checked equivalent** by a second technique (differential testing, below).
Full SMT run (`prove_nonmatching.py`, one shared symbolic input state per
function; the highest loop-unroll depth that proves is reported):

| function | status | note |
|---|---|---|
| `sub_8001570` (AddAttr2dBitMap) | **PROVEN-BOUNDED(3)** | only byte diff = two independent `mov`s in opposite order |
| `sub_80A3300` | **PROVEN-BOUNDED(3)** | 2 calls (`PutSpriteExt`), 2 loops |
| `sub_80A3528` | **PROVEN-BOUNDED(3)** | 48 calls |
| `sub_80A390C` | **PROVEN-BOUNDED(3)** | 20 calls; proven once `Decompress`'s args are shown to be {r0,r1} |
| `sub_80A6D34` | **PROVEN-BOUNDED(3)** | link-arena header codec |
| `sub_80A6E4C` | **PROVEN-BOUNDED(3)** | link-arena encode mirror |
| `sub_800E1FC` | **PROVEN-BOUNDED(3)** | proven once `EventStartFade` is shown (interprocedurally) to consume 0 args |
| `sub_807C8DC` | **PROVEN-BOUNDED(2)** | JP calls a helper directly, the C via a function pointer — same callee once names de-truncate |
| `sub_80C05C8` | **PROVEN-BOUNDED(2)** | |
| `sub_800A594` | **PROVEN-BOUNDED(1)** | spline evaluator; deeper unroll hits a modular limit |
| `sub_807D3BC` | **PROVEN-BOUNDED(1)** | |
| `sub_80A2E64` | **PROVEN-BOUNDED(1)** | |
| `sub_800A34C` | **DIFF-EQUIV** (differential; SMT `DIVERGENCE`) | stack-frame buffers at different spill offsets → intractable for modular SMT; concrete execution matches all memory effects over 145 trials (dead return, see below) |
| `sub_800FAD0` | **DIFF-EQUIV** (differential; SMT `UNKNOWN`) | 5 loops → SMT path-explosion; concrete execution matches full observable (return + writes) over 200 trials |
| `sub_80A6F1C` | ~DIFF (INCONCLUSIVE-CB) | link-arena codec w/ callback; **118/120 in-domain trials identical**, 2 codec-edge/callback residuals — strong corroboration, not a clean sweep |
| `sub_8057F80` | research-grade | 1248-insn monster reading ~30 live battle-anim globals — faults black-box (needs a live battle frame); equivalence rests on its header's block-by-block objdump |

**Coverage: 12/16 formally SMT-proven + 2 differential-only (`sub_800A34C`,
`sub_800FAD0`) = 14/16 machine-checked equivalent.** See "Differential testing"
below.

The PROVEN set spans real branchy, looping, call-heavy functions (up to 48 calls);
register-coloring/spills are handled *transparently* (the proof compares data-flow
outputs, not register names). Three ingredients unlocked most of them: a **sound
interprocedural callee-arg liveness** (read-before-write over each callee's
`(addr, written-set)` states, recursing into `bl` targets, conservative on
`svc`/`bx rN`/unknown/cycles) so only the args a callee actually consumes are
compared (e.g. `Decompress`={r0,r1}, `EventStartFade`={}); comparing call targets
by **address** (a direct `bl F` and an indirect `bx &F` are the same call); and
de-truncating relocation symbol names (`readelf -W`).

The other 4 are **not proven** — and, crucially, *not proven ≠ inequivalent*
(the reconstructions are believed correct; their headers argue register-coloring
is the only residual):

* **`DIVERGENCE` (2)** — equivalence hinges on state a *modular* model cannot
  resolve: `sub_800A34C` passes **stack-frame local buffers at different spill
  offsets** by pointer to a callee that writes through them; `sub_80A6F1C` uses an
  **indirect callback** with a stack address escaping to it. These need relational
  stack-frame modelling / whole-program context, not modular summaries.
* **`UNKNOWN:path-explosion` (2)** — `sub_800FAD0` (5 loops, 4200 paths — with a
  larger time budget it completes and shows the same modular `DIVERGENCE`) and
  `sub_8057F80` (1248 insns / 149 branches / 58 calls — a genuine path-enumeration
  wall). These need **symbolic-execution state-merging** or **relational
  loop-invariant / lockstep** proofs.

The prover is **sound but incomplete**: a `PROVEN-BOUNDED(N)` result really is an
equivalence (under the ARM/ABI/memory/call model, loops to depth N); it simply
cannot yet *reach* the large or external-state-dependent functions. Reproduce with
`$HOME/z3-venv/bin/python scripts/tools/thumb_equiv/prove_nonmatching.py`.

**Honest bottom line for "prove ALL non-matching functions equal":** with SMT
symbolic execution alone this is a genuine research program, not a one-shot
result — 12/16 are SMT-machine-checked. A second, independent technique
(**differential testing**, below) closes 2 of the remaining 4, for **14/16
machine-checked equivalent**; the last 2 are a callback codec (strongly
corroborated, 118/120) and a monster needing a live battle-anim frame.
`make compare` (byte-match) remains the sole oracle throughout; every result here
is a confidence annotation strictly below it.

## Differential testing — the second technique (`differential_test.py`)

Where a *bounded SMT proof* is intractable (nonlinear fixed-point math, indirect
callbacks, stack-buffer aliasing, sheer size), **concrete differential testing**
sidesteps every one of those. It runs the JP ROM bytes and the compiled
reconstruction under a Unicorn THUMB emulator (+ a small GBA BIOS/mem model) with
**identical, type-correct random inputs** (parsed from the reconstruction's own C
signature) and compares the caller-visible observable — return value (masked to
the declared width; omitted for `void`) + non-stack memory writes. This is the
standard decomp differential cross-check; it is **testing, not proof**, and its
trustworthiness is established by requiring the 12 SMT-proven functions to all
report `EQUIV` (they do).

Building it surfaced five soundness lessons (all encoded in the tool):

* **Out-of-domain inputs FAULT** (a random pointer/length/index/global the
  function was never meant to see). Such trials are *skipped*, not scored; the
  fault PC is never compared (the two code layouts differ).
* **A return value can be structurally DEAD** — `sub_800A34C`'s JP epilogue is
  `pop {r0}; bx r0`, so `r0` at exit is the *branch target* (the caller ignores
  it). Detected when the target's exit `r0` is always the injected LR sentinel;
  then only memory effects are compared. `sub_800A34C`'s memory effects match on
  every trial → equivalent.
* **A callback (fn-ptr) arg cannot be soundly *refuted* here.** The no-op stub
  leaves the callback-filled (stack) buffer uninitialised, which the two sides
  read back at *different spill offsets* — a harness artifact, not an
  inequivalence. Proven by `sub_80A6E4C`: SMT-PROVEN, yet a naive differential run
  "diverged" 92/92 for exactly this reason. Fixed by (a) correctly parsing the
  outer signature so the callback's inner `(int*,u8*)` isn't mistaken for two
  extra args, and (b) synthesising the `_call_via_rN`/`_call_via_sl` linker
  veneers as `bx rN` trampolines *appended to the candidate* (IWRAM is >4MB from
  ROM — a thumb `bl` can't reach a fixed stub). After both fixes `sub_80A6E4C`
  reports `EQUIV`, cross-confirming the SMT result.
* **Per-function input-domain fixups** clamp specific random globals into a valid
  domain (identical on both sides, so they can never mask a real divergence) —
  e.g. `sub_80A6F1C`'s payload-length / header-count globals, which otherwise
  index far out of bounds.
* **Candidate linking must be faithful** — all 16 candidates resolve every
  `.text` relocation (audited), so an `EQUIV` is a real comparison, not a
  degenerate one.

Differential results (`… --trials 100`): **10/16 `EQUIV`** including the two
functions SMT could not decide — `sub_800A34C` (memory effects; dead return) and
`sub_800FAD0` (full observable, 200 trials). `sub_80A6F1C` = `INCONCLUSIVE-CB`
(118/120 identical; 2 codec-edge/callback residuals). Four functions take a
struct pointer whose random fields are dereferenced (`INCONCLUSIVE`, but already
SMT-PROVEN). `sub_8057F80` needs a live battle-anim frame (faults black-box).
Reproduce with
`$HOME/z3-venv/bin/python scripts/tools/thumb_equiv/differential_test.py`.

## Third technique — a live game-state harness (`mgba_capture/`)

`sub_8057F80` reads dozens of live `gBanim*`/`gEkr*`/`gBattle*` globals and faults
on both random and all-zero state — it is only exercisable from a **real,
self-consistent battle frame**. `scripts/tools/thumb_equiv/mgba_capture/` boots
`fireemblem8.gba` in **mGBA** (`libmgba`), mashes **A** to fast-forward into FE8's
opening prologue (which plays scripted combat within ~12k frames), then
single-steps to catch the *exact* instant `sub_8057F80` is entered and dumps the
CPU registers + EWRAM + IWRAM. `replay_diff.py` replays the JP ROM bytes vs the
reconstruction from that captured state. It drove `sub_8057F80` from **untestable
→ 115/115 memory writes and return matching** the JP function, via three fixes:

1. **A harness correctness bug — now fixed (and audited).** `sub_8057F80.c`
   defines two functions: the `static GetBanimAllyPositionJ` (46 B, offset 0) and
   `PrepareBattleGraphicsMaybe` (2942 B, offset 0x30). The JP target is the
   *second*, but both tools extracted `.text` from **offset 0** — comparing the
   wrong 46-byte helper. Fixed via size-matched symbol selection (`_pick_symbol`
   in both `differential_test.py` and `prove_nonmatching.py`). Audited that
   `sub_8057F80` is the **only** file where the JP target isn't the first symbol,
   so the 12 SMT-PROVEN + 2 differential-EQUIV verdicts are unaffected.
2. **A missing `inline` in the reconstruction.** The JP asm has **zero** calls to
   `GetBanimAllyPositionJ` — it's *inlined* (the US analog is `static inline`),
   but the reconstruction wrote plain `static`, so agbcc emitted a standalone
   helper + a `bl` to it → a structure that doesn't match the JP's single inlined
   function (and, in the harness, an unresolved internal call → BIOS fault).
   Restoring `static inline` collapses it to one function and removes the fault.
3. **Corrupt baseline symbols.** The auto-generated fragment
   `layout/baseline_syms.d/cfbind_banim-ekrbattleintro.tsv` had five wrong data
   addresses (a swapped-row copy-paste: `gAnimCharaPalConfig`'s ROM address landed
   in `gBanimIdx_bak`'s row, etc.). Corrected against the JP asm literal pools /
   `sym_jp.txt` / the uniform −4 EWRAM shift: `gBanimIdx_bak 089CDE18→0203E108`,
   `gBanimMaxHP →0203E1AC`, `gBanimForceUnitChgDebug →0203E1A0`,
   `gAnimCharaPalConfig →089CDE18`, `gAnimCharaPalIt →089CEC18`. `make compare`
   stays OK (these are descriptive baseline symbols).

**Correction to an earlier claim:** `sub_8057F80` = `PrepareBattleGraphicsMaybe`
is a **`(void)`** function — it `push`es then immediately `bl ResetEkrDragonStatus`
(clobbering r0-r3) without reading incoming args. The `r0 = 0x08011ff1` seen at the
call is the caller's **leftover register garbage**, which the void function ignores
(it is *not* a callback, contrary to the first write-up).

After the three fixes, the only residual from the live state is **1 of 115 writes**:
`gEkrSpellAnimIndex[POS_R]` = 0 (target) vs 0xffff (reconstruction) — a genuine,
small spell-animation control-flow difference that still needs RE (the ~46-byte
size gap is the same register-coloring/codegen class as the other non-matching
functions). `sub_8057F80` went from untestable to 114/115-writes-equivalent.

### Combined verdict

| technique | functions | count |
| --- | --- | --- |
| formal SMT proof (bounded) | the 12 `PROVEN-BOUNDED` above | 12 |
| differential testing (SMT-intractable) | `sub_800A34C`, `sub_800FAD0` | +2 |
| **machine-checked equivalent** | | **14/16** |
| strongly corroborated (118/120) | `sub_80A6F1C` | 1 |
| research-grade (live harness: 114/115 writes match; inline+symbol bugs fixed) | `sub_8057F80` | 1 |

Neither technique puts non-matching bytes in the checksum build; `make compare`
stays green and remains the sole oracle.

## Where it fits FE8J (the acceptance hierarchy)

The proposal changes *nothing* about the oracle. It adds a rung to the existing
readability ladder in `docs/nonmatching.md`:

1. `make compare` byte-match — **the oracle**, ships the ROM.
2. Descriptive asm (`asm/<fn>.s`) — byte-perfect fallback, also in the oracle.
3. NON_MATCHING C — readable C whose *bytes still come from asm*, never in the
   oracle build.
4. **SMT equivalence proof** — an *annotation on tier 3*: machine-checked
   evidence that a NON_MATCHING C body is functionally/observationally equivalent
   to the asm-sourced bytes. Raises confidence for documentation and future
   matching work; still **never** authorises putting non-matching bytes in the
   checksum build.

Concretely useful for FE8J when: a region-different function will not byte-match
under agbcc but a readable C form exists (tier 3) — a tier-4 proof documents
"this readable form is the same function" with a machine-checked argument instead
of a hand-wave, and a refutation catches a mis-decompiled body early. It does
**not** reduce the remaining byte-match frontier and is not on the critical path
to 100% `make compare`.

## If pursued further

Build on a real lifter (Ghidra P-code / Sail-ARM / angr) instead of a hand-rolled
decoder for ISA-completeness and soundness; add bounded loop unrolling with a
stated bound (and label it bounded, not total); add callee summaries for
non-leaf functions; add a shared volatile read-oracle; and, only if ever needed,
a real GBA timing model — while keeping every result strictly below the byte
oracle. Realistically, for a project already at 99.82% matching-C with descriptive
asm covering the rest, this is a **readability/confidence enhancement**, not a
throughput lever — worth having as a documented capability, not worth blocking
the byte-match frontier on.

**Notes on adjacent tools (community feedback, Camdar):**

* **CBMC** — a strong C/goto-program bounded model checker, but it does **not**
  ingest ARM machine code. Using it means lifting the ROM target to C first
  (Ghidra/m2c) and proving *C-vs-C*; that only shows "our C ≡ the decompiled C",
  not "≡ the real bytes", so it is *weaker* on ground-truth fidelity than the
  ARM-vs-ARM check here — unless paired with a verified lifter. A useful *lighter*
  complementary cross-check for individual functions, not a replacement.
* **angr / BINSEC** (binary symbolic execution) are the right "mature engine"
  answer for this binary-level problem — they replace the hand-rolled THUMB
  lifter/executor with a maintained, ISA-complete one. This is the recommended
  next spike (tracked as option (b) in the discussion) and subsumes the lifter
  bullet above.
* **Rupicola / bedrock2 & relational compilation** — the principled *total-proof*
  ceiling above this bounded tier, and (per Camdar's correction) **not**
  forward-only. Relational compilation is parameterized over a source `S`, target
  `T`, their denotations, and a relation `s ~ t`; instantiating `S := ARMv4T`,
  `T := C` makes proof-carrying **decompilation** a plain *forward* instance, and
  the two-place relation can equally be searched as `∃ src. src ~ tgt` for a fixed
  ROM target (needing lemmas oriented tgt→src — essentially formalising the
  hand-decompilation rules). The resulting `src ~ tgt` proof is a **∀-total**
  machine-checked equivalence to the actual bytes, strictly stronger than the
  bounded-BMC / differential results here. We stay at the pragmatic tier only on
  cost: it is a proof-assistant formalisation of ARMv4T semantics + the agbcc/C
  fragment + the decompilation lemmas (a research program, even reusing existing
  Coq/Sail ARM and CompCert-style C semantics) — worth naming as the real ceiling,
  not pursued for a project already at 99.82% byte-match.

*Decision logged as D349. PoC validated end-to-end; approach reviewed with the
rubber-duck agent (MMIO reads, region model, ABI-vs-full-architectural, explicit
loop/call/stack preconditions, narrowed claims).*
