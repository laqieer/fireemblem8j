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
