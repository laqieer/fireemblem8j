# angr spike findings

## Recommendation

**Adopt partially: use VEX/angr as a lifting/reference substrate, but do not
replace the current FE8J equivalence prover with angr state execution yet.**

Reason: Q1 is positive (VEX lifts THUMB control-flow/call instructions that the
straight-line `thumb_lift.py` subset rejects), and the small relational checker
can be made sound enough to pass adversarial traps. But Q2 on real functions did
not reproduce the existing prover's 4/4 PROVEN agreement: default angr execution
quickly hits symbolic-address memory, unresolved external code, or timeout unless
we build substantial FE8J-specific memory/callee models. Q3 did not show a cheap
state-merging/scaling win for `sub_8057F80` in this scoped spike.

## Q1. ISA-completeness: does VEX lift instructions our subset rejects?

Command:

```bash
$HOME/angr-venv/bin/python scripts/tools/thumb_equiv/angr_spike/lift_probe.py
```

Evidence from this run:

| Probe | hand `thumb_lift.py` | VEX/angr result |
| --- | --- | --- |
| `cmp r0,#0; beq ...` (`sub_80A3300`-style branch) | `LiftError: conditional branch` | lifted sane block; Capstone showed `cmp`, `beq` |
| `bl ext` | `LiftError: bl/call` | lifted as `Ijk_Call`; Capstone showed `bl #0x1007` |
| high-register prologue (`push`; `mov r7,sl`; `mov r6,sb`; `mov r5,r8`) | accepted | lifted and stepped |

Answer: **yes**. VEX's ARMv4T THUMB lifter covers branch/call control flow that
the original straight-line PoC intentionally rejects. This supports using VEX as
a decoder/lifter oracle.

## Q2. Can an angr relational checker prove equivalence soundly?

### Stage 2/3 adversarial trust gate

Command:

```bash
$HOME/angr-venv/bin/python scripts/tools/thumb_equiv/angr_spike/adversarial_suite.py
```

Results:

| Case | Expected | Observed |
| --- | --- | --- |
| identical function | PROVE | PROVE |
| return `r0` vs `r0+1` | REFUTE | REFUTE (counterexample model emitted) |
| branch-partition mismatch, same behavior | PROVE | PROVE |
| same with hidden bad branch | REFUTE | REFUTE |
| symbolic load address | UNKNOWN | UNKNOWN |
| external call, same args/shared oracle | PROVE | PROVE |
| external call, different args | REFUTE or UNKNOWN, never PROVE | REFUTE |
| callee may write memory/havoc | not PROVE | UNKNOWN |

Soundness controls implemented in `checker.py`: `auto_load_libs=False`, raw blob
loading, custom external-call oracle, ordered call trace, cross-product final-path
comparison, concrete PC/SP, symbolic GP registers, and inspect hooks that turn
symbolic-address memory into `UNKNOWN`.

Answer for synthetic/small cases: **yes, with strict FE8J-specific controls**.
The important adversarial traps passed.

### Stage 4 real-function cross-validation

Command:

```bash
$HOME/angr-venv/bin/python scripts/tools/thumb_equiv/angr_spike/real_probe.py
```

Observed:

| Function | Existing prover | angr spike result |
| --- | --- | --- |
| `sub_8001570` | PROVEN-BOUNDED(3) | TIMEOUT after 30s |
| `sub_80A3300` | PROVEN-BOUNDED(3) | UNKNOWN: symbolic read from `r0 + 0x3b`, unresolved external block `0x8005330`, step budget |
| `sub_80A6E4C` | PROVEN-BOUNDED(3) | UNKNOWN: step budget, no final states |
| `sub_80C05C8` | PROVEN-BOUNDED(2) | TIMEOUT after 30s |

Answer for real FE8J functions: **not yet**. The checker did not falsely prove
anything, but it also did not agree with the existing prover on the 3-4 required
PROVEN functions. Getting agreement would require porting the current tool's
FE8J-specific ROM/data/stack model, relocation/call-target resolution, callee arg
liveness, and memory-write observable into angr.

## Q3. Does angr state-merging scale better on the monster?

Command:

```bash
$HOME/angr-venv/bin/python scripts/tools/thumb_equiv/angr_spike/real_probe.py sub_8057F80
```

Observed result:

```text
sub_8057F80: target_size=2936 cand_symbol=PrepareBattleGraphicsMaybe cand_size=2934 verdict=UNKNOWN finals=0/0 reason=No bytes in memory for block starting at 0x8071fac.; step budget exceeded
```

No audited state-merging proof was attempted, per the soundness rule that merged
observable traces/memory events must be audited before any `PROVE`. As a cheap
scalability smoke test, angr did not get meaningfully further than the existing
path enumerator; it ran into unresolved control flow and budget limits before a
useful relational result.

## Bottom line

- **Do not adopt angr as a drop-in replacement engine now.** It would be a rewrite
  of the hard FE8J modelling pieces, not a simple engine swap.
- **Do adopt VEX/angr partially for lifting research**: use it to identify THUMB
  instructions/control-flow cases missing from the hand lifter and as an
  independent decoder sanity check.
- Keep the current `prove_nonmatching.py` as the trusted working prover until an
  angr prototype can reproduce the 12/16 formal PROVEN set and pass the same
  adversarial suite without returning false `PROVE`.
