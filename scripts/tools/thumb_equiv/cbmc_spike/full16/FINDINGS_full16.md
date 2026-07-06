# CBMC full16 findings
All verdicts are fail-closed and labelled: **source-level equivalence under modeled C semantics, trusting agbcc codegen/ABI**.
Headline: **0/16 CBMC-PROVEN via Cam's approach**.
## Trust gate
- adversarial/Q2a gate: PASS
```text
CBMC: 6.10.0 (cbmc-6.10.0)
| case | expected | observed | detail |
| --- | --- | --- | --- |
| gate.identical | PROVEN | PROVEN | VERIFICATION SUCCESSFUL |
| gate.return_plus_one | REFUTED | REFUTED | [main.assertion.1] line 17 return r0 vs r0+1: FAILURE |
| gate.helper_args_differ | REFUTED | REFUTED | [shared_oracle.assertion.4] line 14 implementation helper arg must match reference: FAILURE |
| gate.omitted_write | REFUTED | REFUTED | [main.assertion.2] line 27 all modeled mutable globals: FAILURE |
| gate.pointer_alias_global | REFUTED | REFUTED | [main.assertion.2] line 28 pointer alias to modeled global: FAILURE |
| gate.same_return_diff_global | REFUTED | REFUTED | [main.assertion.2] line 26 same return but different global side effect: FAILURE |
| gate.shared_oracle_same_args | PROVEN | PROVEN | VERIFICATION SUCCESSFUL |
| gate.loop_unwind | BOUNDED_ONLY_2 | BOUNDED_ONLY_2 | [sum_to_n.unwind.0] line 7 unwinding assertion loop 0: FAILURE |
| gate.unmodeled_pointer_unknown | UNKNOWN | UNKNOWN | [main.assertion.1] line 22 UNKNOWN: pointer may alias unmodeled storage: FAILURE |
| q2a.GetGameClock | PROVEN | PROVEN | VERIFICATION SUCCESSFUL |
| q2a.AddTarget | PROVEN | PROVEN | VERIFICATION SUCCESSFUL |
| q2a.GreenText_OnLoop | PROVEN | PROVEN | VERIFICATION SUCCESSFUL |
```
## Mutation smoke checks
| case | expected | observed | detail |
| --- | --- | --- | --- |
| sub_8001570_mutated_write | REFUTED | REFUTED | [main.assertion.1] line 35 sub_8001570 mutation must refute changed write: FAILURE |
| sub_80A6F1C_mutated_callback | REFUTED | REFUTED | [main.assertion.1] line 48 sub_80A6F1C mutation must refute callback arg: FAILURE |

## Per-function verdicts
| function | verdict | bridge | loop bound | evidence | blocker |
| --- | --- | --- | --- | --- | --- |
| `sub_8001570` | UNKNOWN | none | n/a | ARM-vs-ARM PROVEN-BOUNDED(3) | No validated reference-C and no cfg_exec-derived CBMC observable emitter; fail-closed instead of proving against hand-picked writes. |
| `sub_800A34C` | UNKNOWN | none | n/a | differential-EQUIV only; ARM-vs-ARM DIVERGENCE | No validated reference-C and no cfg_exec-derived CBMC observable emitter; fail-closed instead of proving against hand-picked writes. |
| `sub_800A594` | UNKNOWN | none | n/a | ARM-vs-ARM PROVEN-BOUNDED(1) | No validated reference-C and no cfg_exec-derived CBMC observable emitter; fail-closed instead of proving against hand-picked writes. |
| `sub_800E1FC` | UNKNOWN | none | n/a | ARM-vs-ARM PROVEN-BOUNDED(3) | No validated reference-C and no cfg_exec-derived CBMC observable emitter; fail-closed instead of proving against hand-picked writes. |
| `sub_800FAD0` | UNKNOWN | none | n/a | differential-EQUIV only; ARM-vs-ARM UNKNOWN/path-explosion | No validated reference-C and no cfg_exec-derived CBMC observable emitter; fail-closed instead of proving against hand-picked writes. |
| `sub_8057F80` | UNKNOWN | none | n/a | live harness 114/115 writes; not equivalent | No validated reference-C and no cfg_exec-derived CBMC observable emitter; fail-closed instead of proving against hand-picked writes. |
| `sub_807C8DC` | UNKNOWN | none | n/a | ARM-vs-ARM PROVEN-BOUNDED(2) | No validated reference-C and no cfg_exec-derived CBMC observable emitter; fail-closed instead of proving against hand-picked writes. |
| `sub_807D3BC` | UNKNOWN | none | n/a | ARM-vs-ARM PROVEN-BOUNDED(1) | No validated reference-C and no cfg_exec-derived CBMC observable emitter; fail-closed instead of proving against hand-picked writes. |
| `sub_80A2E64` | UNKNOWN | none | n/a | ARM-vs-ARM PROVEN-BOUNDED(1) | No validated reference-C and no cfg_exec-derived CBMC observable emitter; fail-closed instead of proving against hand-picked writes. |
| `sub_80A3300` | UNKNOWN | none | n/a | ARM-vs-ARM PROVEN-BOUNDED(3) | No validated reference-C and no cfg_exec-derived CBMC observable emitter; fail-closed instead of proving against hand-picked writes. |
| `sub_80A3528` | UNKNOWN | none | n/a | ARM-vs-ARM PROVEN-BOUNDED(3) | No validated reference-C and no cfg_exec-derived CBMC observable emitter; fail-closed instead of proving against hand-picked writes. |
| `sub_80A390C` | UNKNOWN | none | n/a | ARM-vs-ARM PROVEN-BOUNDED(3) | No validated reference-C and no cfg_exec-derived CBMC observable emitter; fail-closed instead of proving against hand-picked writes. |
| `sub_80A6D34` | UNKNOWN | none | n/a | ARM-vs-ARM PROVEN-BOUNDED(3) | No validated reference-C and no cfg_exec-derived CBMC observable emitter; fail-closed instead of proving against hand-picked writes. |
| `sub_80A6E4C` | UNKNOWN | none | n/a | ARM-vs-ARM PROVEN-BOUNDED(3) | No validated reference-C and no cfg_exec-derived CBMC observable emitter; fail-closed instead of proving against hand-picked writes. |
| `sub_80A6F1C` | UNKNOWN | none | n/a | DIVERGENCE/INCONCLUSIVE-CB; callback stack escape | No validated reference-C and no cfg_exec-derived CBMC observable emitter; fail-closed instead of proving against hand-picked writes. |
| `sub_80C05C8` | UNKNOWN | none | n/a | ARM-vs-ARM PROVEN-BOUNDED(2) | No validated reference-C and no cfg_exec-derived CBMC observable emitter; fail-closed instead of proving against hand-picked writes. |

## Summary

The CBMC harness infrastructure is live and rejects adversarial mutations, but the requested mechanical ASM-spec bridge is still absent for all 16 functions. Reporting PROVEN would require either a validated reference-C file per function (Bridge A) or a cfg_exec-derived CBMC observable with complete write/call footprint (Bridge B). Neither artifact exists yet, so every function remains UNKNOWN under Cam's CBMC approach rather than being false-proven.
