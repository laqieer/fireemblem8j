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
strictly below byte-match**, under an explicit machine/ABI/environment model, and
only for the fragment a bit-vector SMT solver can actually decide (small,
loop-free, leaf, mostly-linear code). It answers "is this readable C plausibly
the same function?", not "may we ship these bytes?". For FE8J the oracle is and
stays `make compare` (SHA-1). Equivalence proving is a **new upper tier of the
existing NON_MATCHING C ladder** (`docs/nonmatching.md`), not a change to the
oracle.

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

**Result: 9/16 machine-checked equivalent** (`PROVEN-BOUNDED(N)`). Full run
(`prove_nonmatching.py`, one shared symbolic input state per function; the highest
loop-unroll depth that proves is reported):

| function | status | note |
|---|---|---|
| `sub_8001570` (AddAttr2dBitMap) | **PROVEN-BOUNDED(3)** | only byte diff = two independent `mov`s in opposite order |
| `sub_80A3300` | **PROVEN-BOUNDED(3)** | 2 calls (`PutSpriteExt`), 2 loops |
| `sub_80A3528` | **PROVEN-BOUNDED(3)** | 48 calls |
| `sub_80A6D34` | **PROVEN-BOUNDED(3)** | link-arena header codec |
| `sub_80A6E4C` | **PROVEN-BOUNDED(3)** | link-arena encode mirror |
| `sub_80C05C8` | **PROVEN-BOUNDED(2)** | |
| `sub_800A594` | **PROVEN-BOUNDED(1)** | spline evaluator; deeper unroll hits the modular external-state limit |
| `sub_807D3BC` | **PROVEN-BOUNDED(1)** | |
| `sub_80A2E64` | **PROVEN-BOUNDED(1)** | |
| `sub_800A34C` `sub_800E1FC` `sub_807C8DC` `sub_80A390C` `sub_80A6F1C` | DIVERGENCE | equivalence depends on external globals / a caller register contract the *modular* model havocs |
| `sub_800FAD0` `sub_8057F80` | UNKNOWN:path-explosion | 5 loops / the 1248-insn·149-branch·58-call monster — need state-merging / loop invariants |

The PROVEN set spans real branchy, looping, call-heavy functions (up to 48 calls);
register-coloring/spills are handled *transparently* (the proof compares data-flow
outputs, not register names). E.g. `sub_8001570`'s only byte difference is two
independent `mov`s emitted in the opposite order.

The other 7 are **not proven** — and, crucially, *not proven ≠ inequivalent*
(the reconstructions are believed correct; their headers argue register-coloring
is the only residual):

* **`DIVERGENCE` (5)** — the modular model's call summaries **havoc external
  memory/globals**. These functions' equivalence hinges on external state the
  modular analysis cannot see: e.g. `sub_80A390C`/`sub_800A34C` read a table base
  from a global the JP build loads and the reconstruction inlines; `sub_800E1FC`
  passes an incoming `r3` straight through while the reconstruction re-derives it
  from a struct deref (equal only under the caller's contract). A `DIVERGENCE`
  here is a **modular-analysis limitation, not a confirmed reconstruction bug** —
  resolving it needs inlining the reachable callees / supplying the caller/global
  context (whole-program, not modular, analysis).
* **`UNKNOWN:path-explosion` (2)** — `sub_800FAD0` (5 loops) and `sub_8057F80`
  (1248 insns / 149 branches / 58 calls). Path enumeration blows up; these need
  **symbolic-execution state-merging** (merge at join points) or **relational
  loop-invariant / lockstep** proofs (exploit the 1:1 CFG so loops align and are
  proved by induction — unbounded). That is the natural next step.

The prover is **sound but incomplete**: a `PROVEN-BOUNDED(N)` result really is an
equivalence (under the ARM/ABI/memory/call model, loops to depth N); it simply
cannot yet *reach* the large or external-state-dependent functions. Reproduce with
`$HOME/z3-venv/bin/python scripts/tools/thumb_equiv/prove_nonmatching.py`.

**Honest bottom line for "prove ALL non-matching functions equal":** with SMT
symbolic execution this is a genuine research program, not a one-shot result —
9/16 are machine-checked today; the rest split into modular-analysis limits (5,
external-state dependent — need whole-program/callee-inlined analysis) and path
explosion (2 — need state-merging + relational loop-invariant reasoning).
`make compare` (byte-match) remains the sole oracle throughout; every result here
is a confidence annotation strictly below it.

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

*Decision logged as D349. PoC validated end-to-end; approach reviewed with the
rubber-duck agent (MMIO reads, region model, ABI-vs-full-architectural, explicit
loop/call/stack preconditions, narrowed claims).*
