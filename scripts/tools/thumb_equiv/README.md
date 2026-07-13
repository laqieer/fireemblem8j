# thumb_equiv — Z3 equivalence PoC for non-matching THUMB functions

Proof-of-concept for **Discussion #149** ("Prove equivalence for non-matching
functions using Microsoft Z3 Theorem Prover"). It lifts one straight-line
ARMv4T **THUMB** leaf function into a Z3 symbolic effect and proves (or refutes)
that two functions compute the same thing — and shows why *functional*
equivalence is not enough for MMIO/timing-sensitive code.

Full rationale, prior art and the modelling contract: **`docs/equivalence_proving.md`**.

## Run

```bash
python3 -m venv "$HOME/z3-venv" && "$HOME/z3-venv/bin/pip" install z3-solver
"$HOME/z3-venv/bin/python" scripts/tools/thumb_equiv/demo.py        # 4 synthetic cases
"$HOME/z3-venv/bin/python" scripts/tools/thumb_equiv/real_smoke.py  # 3 real FE8J ROM funcs
```

Needs `arm-none-eabi-as/objcopy/objdump` (already required by the project) and
`z3-solver`. Both scripts exit non-zero on an unexpected verdict, so they double
as regression self-tests.

## What it demonstrates

* `demo.py`
  * **A** — two byte-different encodings of `x*9` → *PROVEN* ABI-functional equivalent.
  * **B** — `add` vs `sub` (a plausible bug) → *REFUTED* with a concrete counterexample input (soundness).
  * **C** — same architectural result, different **MMIO write** pattern → functional-EQUIV but observational-REFUTED.
  * **D** — same architectural result, different **MMIO read** count → functional-EQUIV but observational-REFUTED.
* `real_smoke.py` — lifts the *actual ROM bytes* of `AiScriptCmd_14_DoNothing`,
  `GetGameClock` (literal-pool load) and `BG0Shaker_Init` and proves each
  equivalent to a byte-different rewrite.

## Two equivalence notions (see equiv.py)

* **ABI-functional** — return value (r0[/r1]) + callee-saved r4–r11/sp restored +
  data memory equal at every address. Private stack scratch is excluded by
  construction (SP-based accesses use a separate array). What a normal C caller relies on.
* **Observational** — ABI-functional **and** the ordered trace of volatile MMIO
  accesses (reads *and* writes: kind/address/width, and store values) matches.
  This is macabeus's concern: same result, different MMIO behaviour ≠ equivalent.

Neither implies cycle-timing equivalence. **Byte-match (`make compare`) stays the
only guarantee of cycle + MMIO exactness and the sole oracle.** This tool is a
confidence annotation *below* byte-match, never a replacement.

## Honest limitations (do not oversell)

* One **basic block** only: no conditional/unconditional branches, no loops
  (would need bounded unrolling or invariants — not a full proof), no `bl` calls
  (non-leaf needs callee summaries / compositional proof).
* THUMB subset: mov/cmp/add/sub/lsl/lsr/asr/mul/and/orr/eor/bic/mvn/neg/tst/
  ror/adc/sbc, ldr/str/ldrb/strb/ldrh/strh (imm & sp-relative & pc-relative),
  push/pop, `bx lr`. Unknown/ARM/Thumb-2 encodings raise `LiftError`.
* **Nonlinear** reasoning (symbolic×symbolic `mul`/division) is the classic hard
  case for bit-vector SMT and can blow up or return `unknown`; equivalences that
  need the solver to reason *through* a multiply are not reliably decidable.
* Memory model assumes **no aliasing between the stack frame and pointer args**
  (standard for compiled C leaf frames); ROM is read-only; addresses in
  `[0x04000000,0x05000000)` are MMIO. Volatile *reads* are modelled as fresh
  values recorded on the trace — value-carrying volatile reads that must agree
  across the two programs need a shared read-oracle (documented extension).
* This proves equivalence **under the model above**, not "for all inputs" in an
  unqualified sense.

Files: `thumb_lift.py` (decoder + symbolic executor), `equiv.py` (checker),
`demo.py`, `real_smoke.py`.

## Proving the real non-matching functions (`prove_nonmatching.py`)

`src/nonmatching/*.c` are readable reconstructions whose byte source is
`asm/*.s` (region-different, "register-coloring wall"), compiled only by
`make nonmatching` and never in `make compare`. This is exactly Discussion
#149's scenario: prove each reconstruction equivalent to the JP ROM function.

`cfg_exec.py` extends the straight-line PoC to real functions: full NZCV flags,
conditional branches (path forking), bounded loop unrolling (BMC), a fuller
THUMB ISA (`ldrsh/ldrsb`, `ldmia/stmia`, hi-reg ops, push/pop of hi regs), and
**sound uninterpreted call summaries**. `prove_nonmatching.py` drives it:

```bash
$HOME/z3-venv/bin/python prove_nonmatching.py            # all src/nonmatching
$HOME/z3-venv/bin/python prove_nonmatching.py sub_8001570 # one function
```

For each function it lifts the **JP ROM bytes** (target) and the **compiled
reconstruction** (candidate, relocations resolved against the ELF) from a
*shared* symbolic input state and checks that every reachable path pair has
equal observables: return value, callee-saved regs + sp restored, data memory,
and the ordered call/MMIO trace. Call targets are compared by **resolved
address** (so `CpuSet` == `sub_80D6370`), `_call_via_rN` veneers as indirect
calls (register choice is not a diff), and ROM is served read-only from the
cartridge image (immune to call-havoc). Unknown callees compare the live
`r0-r3` inputs; explicit ABI metadata records and compares later stack words
too. The `sub_800A34C -> sub_800A194` entry is the first five-word case:
four pointers in `r0-r3` plus `n` at `[sp]`. Both proof and differential entry
points reject a reconstruction whose required callee declaration/call has the
wrong arity before running.

Status labels (honest — see review):
| label | meaning |
|---|---|
| `PROVEN-BOUNDED(N)` | all path pairs equivalent, loops unrolled to N (BMC). **Sound**: a PROVEN function really is equivalent under the model. |
| `DIVERGENCE@..` | a reachable pair differs under the *modular* model. Because the summaries **havoc external memory/globals**, this can appear on a genuinely-equivalent reconstruction whose equivalence depends on external state — it is **not** a confirmed reconstruction bug. |
| `UNKNOWN:..` | path explosion / enumeration timeout / unsupported insn. Needs state-merging or loop invariants (out of scope). |

The prover is **sound but incomplete**: it confirms equivalence for
loop-light, mostly-self-contained functions; large multi-loop functions explode
the path enumeration and functions whose equivalence hinges on external global
state can only be shown modularly. See `docs/equivalence_proving.md` for the
per-function results table and the honest frontier.

Files added: `cfg_exec.py` (CFG symbolic-execution engine), `prove_nonmatching.py`
(driver + coverage report).

## Differential testing the SMT-intractable functions (`differential_test.py`)

Where a *bounded SMT proof* is intractable (nonlinear fixed-point math, indirect
callbacks, stack-buffer aliasing, sheer size), concrete **differential testing**
sidesteps all of them. It runs the JP ROM bytes and the compiled reconstruction
under a Unicorn THUMB emulator (+ small GBA BIOS/mem model) with **identical
type-correct random inputs** (parsed from the reconstruction's own C signature)
and compares the caller-visible observable (return masked to the declared width,
`void`-omitted; + non-stack memory writes).

```bash
"$HOME/z3-venv/bin/pip" install unicorn
$HOME/z3-venv/bin/python differential_test.py                 # all 16
$HOME/z3-venv/bin/python differential_test.py sub_800FAD0 --trials 200
```

It is **testing, not proof**; trustworthiness is gated by requiring the 12
SMT-PROVEN functions to all report `EQUIV`. Soundness safeguards baked in:
out-of-domain FAULT trials are skipped (never scored, fault-PC never compared);
a structurally-dead return (`pop {r0}; bx r0`) is detected and only memory
effects compared; a callback (fn-ptr) arg is never *refuted* (the no-op stub +
different spill layouts are a harness artifact — `INCONCLUSIVE-CB`, proven by
`sub_80A6E4C`); `_call_via_rN` linker veneers are synthesised as `bx rN`
trampolines appended to the candidate; per-function input-domain fixups clamp
specific random globals identically on both sides.

Result: **+2 machine-checked over SMT → 14/16** — `sub_800A34C` (memory effects;
dead return) and `sub_800FAD0` (full observable, 200 trials) which SMT could not
decide. `sub_80A6F1C` = 118/120 in-domain trials identical (`INCONCLUSIVE-CB`);
`sub_8057F80` needs a live battle-anim frame (research-grade). This never touches
the build path — `make compare` stays green and remains the sole oracle.
