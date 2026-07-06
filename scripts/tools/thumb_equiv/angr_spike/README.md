# angr THUMB-equivalence spike

Scoped experiment for deciding whether FE8J should adopt `angr`/VEX as the engine
for `scripts/tools/thumb_equiv/` function-equivalence checking. This is isolated
spike code only; it does not change the existing hand-rolled prover or any build
oracle path.

## Setup

```bash
python3 -m venv "$HOME/angr-venv"
"$HOME/angr-venv/bin/pip" install angr
```

## Reproduce

```bash
# Q1: VEX lifting vs the straight-line thumb_lift.py subset
$HOME/angr-venv/bin/python scripts/tools/thumb_equiv/angr_spike/lift_probe.py

# Q2: adversarial known-answer trust gate
$HOME/angr-venv/bin/python scripts/tools/thumb_equiv/angr_spike/adversarial_suite.py

# Q2 on real nonmatching functions (timeout-safe wrapper)
$HOME/angr-venv/bin/python scripts/tools/thumb_equiv/angr_spike/real_probe.py

# Q3 monster smoke/scalability note
$HOME/angr-venv/bin/python scripts/tools/thumb_equiv/angr_spike/real_probe.py sub_8057F80
```

The checker is deliberately conservative: symbolic-address memory, unmodelled
non-stack writes, unresolved external code, and callee memory havoc return
`UNKNOWN`, not `PROVE`.

## Files

- `assemble.py` - in-repo THUMB snippet assembler helper.
- `checker.py` - minimal angr/claripy relational checker with cross-product final
  state comparison and soundness hooks.
- `adversarial_suite.py` - Stage 3 known-answer traps.
- `lift_probe.py` - Stage 1 VEX lifting probe.
- `real_probe.py` - Stage 4/5 real-function smoke probe.
- `FINDINGS.md` - evidence and recommendation.
