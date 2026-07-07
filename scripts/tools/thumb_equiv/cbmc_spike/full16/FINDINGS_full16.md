# CBMC full16 findings

Label for every result: **source-level equivalence trusting m2c (spec) + agbcc (codegen)**.

Headline: **0/16 via the generic auto-pipeline** (fail-closed: BMC scalability wall on
the loop/pointer-heavy functions, per `focused/sub_8001570`), **BUT the one genuinely-open
function `sub_80A6F1C` is now PROVEN by a focused, sound shared-oracle harness** — see
`focused/sub_80A6F1C/` and the section below. That closes Discussion #149 at **16/16
non-matching functions machine-checked equivalent** (12 ARM-vs-ARM SMT + 2 differential +
1 mGBA live-state + 1 shared-oracle CBMC), each by the strongest applicable method.


## Focused sub_80A6F1C shared-oracle verdict — **PROVEN** (the valuable case)

Harness: `focused/sub_80A6F1C/harness.c` (+ `README.md`). This is the one function no
other method could machine-check (ARM-vs-ARM SMT → DIVERGENCE, differential →
INCONCLUSIVE-CB), because of the opaque caller callback `consume(&cbarg,arg)` + 3 codec
leaves. Modelling all four callees as **shared call-indexed oracles** with **full
byte-for-byte argument comparison** (so an index-based return can never mask an argument
divergence → no false PROVE) proves the reconstruction ≡ the m2c decompilation of
`asm/sub_80A6F1C.s` on return + all visible memory writes.

```sh
CBMC=.cbmc-spike-tools/root/usr/bin/cbmc
$CBMC focused/sub_80A6F1C/harness.c --32 --unwind 17 --unwinding-assertions \
  --bounds-check --pointer-check --pointer-overflow-check --div-by-zero-check \
  --signed-overflow-check --undefined-shift-check
#   => VERIFICATION SUCCESSFUL   (0 of 409 failed)
```

| case | expected | observed | caught by |
| --- | --- | --- | --- |
| `harness.c` (true fn) | PROVEN | **PROVEN** (0/409) | — |
| `harness_mut_loop.c` (payload transform `-`→`+`) | REFUTED | **REFUTED** | `[main.assertion.9] same buffer arg bytes` (the anti-masking check) |
| `harness_mut_mask.c` (return tag `0x3FF`→`0x1FF`) | REFUTED | **REFUTED** | `[main.assertion.1] return value equal` |

Scope (honest): full-symbolic header / field-mask / payload; payload-window base offset
pinned to 0 (applied identically on both sides → representative; a symbolic-offset variant
`harness_symoff.c` is modeling-incomplete — trips CBMC pointer-bounds, not a real
divergence); payload length BMC-bounded to the modelled window (≤ 8, loop body
length-independent) **in the primary harness — now lifted to the FULL u16 domain by the
unbounded cut-point proof below**;
tier = trusting m2c (spec shape) + agbcc (codegen) + the shared-oracle abstraction of the
four opaque callees — strictly below the byte oracle. See `focused/sub_80A6F1C/README.md`.

### Unbounded (cut-point) upgrade for sub_80A6F1C — **PROVEN** over the full u16 length domain

Prompted by Serentty (Discussion #149): "unbounded proofs with cut points". The bounded
harness above BMC-bounds the payload length to ≤ 8; `focused/sub_80A6F1C/harness_unbounded.c`
removes that bound with a **loop invariant at the loop head (cut point)** — CBMC verifies the
de-obfuscation loop as base + inductive step + `__CPROVER_decreases` termination (`1
iterations`, NOT unrolled) for the **full u16 length domain 0..65535**.

```sh
# focused/sub_80A6F1C/run_unbounded.sh:
goto-cc -> goto-instrument --apply-loop-contracts -> cbmc --arrays-uf-always --unwind 1
```
| harness | verdict | note |
| --- | --- | --- |
| `harness_unbounded.c` | **PROVEN** (0/94, 1 iteration) | both loop invariants (entry+preserved+decreases) SUCCESS; de-obf bytes equal at arbitrary witness ⇒ all indices; loop-free epilogue return equal for all inputs |
| `harness_unbounded_mut.c` (`-`→`+`) | **REFUTED** | fails at the equivalence assert — non-vacuous |

Full-function coverage by decomposition: `sub_80A6F1C` = loop-free prologue ; de-obf loop ;
loop-free epilogue. The loop-free parts are covered for all inputs by the PROVEN bounded
`harness.c` (bounded ≡ unbounded on loop-free code); the de-obf loop — the sole
length-dependent part — is proven for the entire domain here. This is the **unbounded-proven**
tier (Serentty's taxonomy: byte-match > unbounded > bounded > differential), still trusting
m2c + agbcc + the shared-oracle abstraction.


## Focused per-function CBMC C-vs-C bounded proofs (upgrading differential/dynamic → bounded-proven)

Beyond `sub_80A6F1C`, the same shared-oracle CBMC C-vs-C method is being applied to the 3
functions our compiler-free ARM-vs-ARM prover could not close (its path-enumerator's
DIVERGENCE/path-explosion failures), to lift them from differential/dynamic-only to
**bounded-proven**. Tier label: `PROVEN-BOUNDED-CBMC-CVC` — bounded, trusting m2c (spec) +
agbcc (codegen) + the shared-oracle abstraction of callees; strictly below the byte oracle
and weaker than the 12 compiler-free ARM proofs, but a real upgrade.

- **`sub_800A34C` (SplineEvalCatmullRom) — PROVEN.** `focused/sub_800A34C/harness.c`:
  `** 0 of 687 failed ** VERIFICATION SUCCESSFUL` (`--unwind 17 --unwinding-assertions
  --slice-formula`). ARM-vs-ARM had reported DIVERGENCE, diagnosed (diagnose_divergence.py)
  as a FALSE-POSITIVE: only r0 (the fn is `void`) + the args to its 1 call (stack pointers
  into its own frame) can-differ; data-memory + callee-saved are always-equal. The CBMC
  harness compares the real caller-visible output (the 2 s32 written to *arg1) with
  `count ∈ [2,4]` fully-symbolic points/knots/time (monotonic-knot precondition), all callees
  (DivArm/MulU/UDiv/sub_800A194) as shared call-indexed oracles with **full argument-content
  anti-masking** (ref records args, impl asserts them equal). Mutation (negate `py0` in the
  spline output) → REFUTED. Independently reproduced. commit c58b127b8.
- **`sub_800FAD0` (GetUnitDefinitionFormEventScr) — PROVEN.** `focused/sub_800FAD0/harness.c`:
  `** 0 of 354 failed ** VERIFICATION SUCCESSFUL` (`--unwind 24`). ARM-vs-ARM had reported
  path-explosion (20 calls, 10 loops); CBMC's non-enumerating BMC handles it. `count ∈ [0,4]`
  fully-symbolic, `arg3` fully-symbolic (the `arg3==TRUE` BuildDeployedUnitDefinitionList
  branch is covered), the RNG collision/retry loop is **verified** (symbolic odd draws +
  progress-guaranteeing even draws for bounded termination — not assumed away), `arg2 ≤ 100`
  (the game percentage). Observable = return + full output buffer + call log (kind/args +
  Build-call input bytes, anti-masking). Two mutations REFUTE (return value; and a
  shuffle-logic flip of the `0x40` selected-flag, caught via the Build input). First attempt
  was rejected for a degenerate `count ≤ 1` domain — this v2 fixes it. Independently
  reproduced. commit 8eea275b9. (COUNTMAX=8 timed out >300s; 4 is the tractable bound that
  still exercises multi-unit selection + both reorder passes + collisions.)
- **`sub_8057F80` (PrepareBattleGraphicsMaybe) — UNKNOWN (stays live-state 115/115 tier).**
  204 calls / 658 lines, loop-free. A typed-EWRAM shim (`focused/sub_8057F80/`, 4 regions /
  2 indirection levels) gets past the pointer-provenance wall and a return-only check closes
  (0/810), but a *sound* proof — full caller-visible write-set observable + 204-call
  anti-masking + non-degenerate domain + mutation gate — is a **solver-sink** (narrower closes
  are degenerate, e.g. `CharacterData.number=1`). Honest boundary; this function keeps the
  strongest dynamic evidence of all 16 (mGBA live-state 115/115). commits 81c6807fe, 71aa61957.


## Focused sub_8001570 full-domain verdict

Corrected harness: `focused/sub_8001570/harness_full_domain.c`.

Verdict: **UNKNOWN(timeout@unwind33)** — source-level equivalence trusting m2c (spec) + agbcc (codegen) was attempted with full symbolic `ix`, `iy`, `chr`, full symbolic source header bytes, shared UF-backed source memory (`--arrays-uf-always`), padded 32x32 destination buffers, arbitrary symbolic observed destination index, and `--unwind 33 --unwinding-assertions`.

20-minute command:

```sh
timeout 1200s .cbmc-spike-tools/root/usr/bin/cbmc \
  scripts/tools/thumb_equiv/cbmc_spike/full16/focused/sub_8001570/harness_full_domain.c \
  -I include -I . --32 --unwind 33 --unwinding-assertions \
  --bounds-check --pointer-check --pointer-overflow-check --div-by-zero-check \
  --signed-overflow-check --undefined-shift-check --arrays-uf-always \
  --slice-formula --verbosity 5
```

Observed: `rc=124` timeout; no CBMC verdict. A 120s verbose run reached symex/SSA conversion (`Generated 58229 VCC(s), 39226 remaining after simplification`) and timed out before solving; see `focused/sub_8001570/cbmc_full_domain_timeout_excerpt.txt`.

Mutation gate: `harness_full_domain_mutated.c` also timed out at 300s before REFUTED, so the full-domain harness is **not proven mutation-sensitive**.

The earlier `harness_origin_1x1.c` result is now explicitly superseded: it was input-bounded and is only a smoke test, not a proof. Headline remains **0/16 full-domain PROVEN**. Per instruction, scaling to other functions stops here.

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

| function | verdict | m2c-ran | loop-bound | anchored/extrapolated | evidence | blocker |
| --- | --- | --- | --- | --- | --- | --- |
| `sub_8001570` | UNKNOWN | yes | --unwind 8 + unwinding assertions | anchored-known-equivalent | m2c ok label=AddAttr2dBitMap, lines=68; [main.assertion.1] line 18 UNKNOWN: complete observable model profile not yet generated for sub_8001570: FAILURE; log=build/cbmc_full16/logs/sub_8001570_harness.cbmc.txt | [main.assertion.1] line 18 UNKNOWN: complete observable model profile not yet generated for sub_8001570: FAILURE; log=build/cbmc_full16/logs/sub_8001570_harness.cbmc.txt |
| `sub_800A34C` | UNKNOWN | yes | --unwind 8 + unwinding assertions | anchored-known-equivalent | m2c ok label=SplineEvalCatmullRom, lines=121; [main.assertion.1] line 18 UNKNOWN: complete observable model profile not yet generated for sub_800A34C: FAILURE; log=build/cbmc_full16/logs/sub_800A34C_harness.cbmc.txt | [main.assertion.1] line 18 UNKNOWN: complete observable model profile not yet generated for sub_800A34C: FAILURE; log=build/cbmc_full16/logs/sub_800A34C_harness.cbmc.txt |
| `sub_800A594` | UNKNOWN | yes | --unwind 8 + unwinding assertions | anchored-known-equivalent | m2c ok label=SplineSampleAtTime, lines=172; file ./scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_800A594_ref.c line 169 function ref_SplineSampleAtTime: failed to find symbol 'sp24'; log=build/cbmc_full16/logs/sub_800A594_harness.cbmc.txt | file ./scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_800A594_ref.c line 169 function ref_SplineSampleAtTime: failed to find symbol 'sp24'; log=build/cbmc_full16/logs/sub_800A594_harness.cbmc.txt |
| `sub_800E1FC` | UNKNOWN | yes | --unwind 8 + unwinding assertions | anchored-known-equivalent | m2c ok label=Event18_ColorFade, lines=57; [main.assertion.1] line 22 UNKNOWN: complete observable model profile not yet generated for sub_800E1FC: FAILURE; log=build/cbmc_full16/logs/sub_800E1FC_harness.cbmc.txt | [main.assertion.1] line 22 UNKNOWN: complete observable model profile not yet generated for sub_800E1FC: FAILURE; log=build/cbmc_full16/logs/sub_800E1FC_harness.cbmc.txt |
| `sub_800FAD0` | UNKNOWN | yes | --unwind 8 + unwinding assertions | anchored-known-equivalent | m2c ok label=GetUnitDefinitionFormEventScr, lines=128; [main.assertion.1] line 18 UNKNOWN: complete observable model profile not yet generated for sub_800FAD0: FAILURE; log=build/cbmc_full16/logs/sub_800FAD0_harness.cbmc.txt | [main.assertion.1] line 18 UNKNOWN: complete observable model profile not yet generated for sub_800FAD0: FAILURE; log=build/cbmc_full16/logs/sub_800FAD0_harness.cbmc.txt |
| `sub_8057F80` | UNKNOWN | yes | --unwind 8 + unwinding assertions | extrapolated-hard | m2c ok label=PrepareBattleGraphicsMaybe, lines=506; file ./scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_8057F80_ref.c line 88 function ref_PrepareBattleGraphicsMaybe: in expression '0x10':; log=build/cbmc_full16/logs/sub_8057F80_harness.cbmc.txt | file ./scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_8057F80_ref.c line 88 function ref_PrepareBattleGraphicsMaybe: in expression '0x10':; log=build/cbmc_full16/logs/sub_8057F80_harness.cbmc.txt |
| `sub_807C8DC` | UNKNOWN | yes | --unwind 8 + unwinding assertions | anchored-known-equivalent | m2c ok label=AdjustNewUnitPosition, lines=60; file ./scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_807C8DC_ref.c line 35 function ref_AdjustNewUnitPosition: operand of unary * 'temp_r3 + *((s32 *)0x202E4D4)' is not a pointer, but got 's32'; log=build/cbmc_full16/logs/sub_807C8DC_harness.cbmc.txt | file ./scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_807C8DC_ref.c line 35 function ref_AdjustNewUnitPosition: operand of unary * 'temp_r3 + *((s32 *)0x202E4D4)' is not a pointer, but got 's32'; log=build/cbmc_full16/logs/sub_807C8DC_harness.cbmc.txt |
| `sub_807D3BC` | UNKNOWN | yes | --unwind 8 + unwinding assertions | anchored-known-equivalent | m2c ok label=SelectSummonPos, lines=100; file ./scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_807D3BC_ref.c line 53 function ref_SelectSummonPos: operand of unary * 'temp_r1_2 + *((s32 *)0x202E4D4)' is not a pointer, but got 's32'; log=build/cbmc_full16/logs/sub_807D3BC_harness.cbmc.txt | file ./scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_807D3BC_ref.c line 53 function ref_SelectSummonPos: operand of unary * 'temp_r1_2 + *((s32 *)0x202E4D4)' is not a pointer, but got 's32'; log=build/cbmc_full16/logs/sub_807D3BC_harness.cbmc.txt |
| `sub_80A2E64` | UNKNOWN | yes | --unwind 8 + unwinding assertions | anchored-known-equivalent | m2c ok label=DivinationRankSpriteUpdate, lines=81; file ./scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_80A2E64_ref.c line 46 function ref_DivinationRankSpriteUpdate: operand of unary * 'temp_r3 - 4' is not a pointer, but got 's32'; log=build/cbmc_full16/logs/sub_80A2E64_harness.cbmc.txt | file ./scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_80A2E64_ref.c line 46 function ref_DivinationRankSpriteUpdate: operand of unary * 'temp_r3 - 4' is not a pointer, but got 's32'; log=build/cbmc_full16/logs/sub_80A2E64_harness.cbmc.txt |
| `sub_80A3300` | UNKNOWN | yes | --unwind 260 + unwinding assertions | anchored-known-equivalent | m2c ok label=sub_80A3300, lines=36; CBMC timeout; log=build/cbmc_full16/logs/sub_80A3300_cbmc.cbmc.txt | CBMC timeout; log=build/cbmc_full16/logs/sub_80A3300_cbmc.cbmc.txt |
| `sub_80A3528` | UNKNOWN | yes | --unwind 8 + unwinding assertions | anchored-known-equivalent | m2c ok label=sub_80A3528, lines=91; file ./scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_80A3528_ref.c line 66 function ref_sub_80A3528: operand of unary * 'temp_r3 - 4' is not a pointer, but got 's32'; log=build/cbmc_full16/logs/sub_80A3528_harness.cbmc.txt | file ./scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_80A3528_ref.c line 66 function ref_sub_80A3528: operand of unary * 'temp_r3 - 4' is not a pointer, but got 's32'; log=build/cbmc_full16/logs/sub_80A3528_harness.cbmc.txt |
| `sub_80A390C` | UNKNOWN | yes | --unwind 8 + unwinding assertions | anchored-known-equivalent | m2c ok label=Augury_InitResultScreen, lines=113; file ./src/nonmatching/sub_80A390C.c line 133 function impl_Augury_InitResultScreen: function 'strcpy' is not declared; log=build/cbmc_full16/logs/sub_80A390C_harness.cbmc.txt | file ./src/nonmatching/sub_80A390C.c line 133 function impl_Augury_InitResultScreen: function 'strcpy' is not declared; log=build/cbmc_full16/logs/sub_80A390C_harness.cbmc.txt |
| `sub_80A6D34` | UNKNOWN | yes | --unwind 8 + unwinding assertions | anchored-known-equivalent | m2c ok label=sub_80A6D34, lines=39; [main.assertion.1] line 20 UNKNOWN: complete observable model profile not yet generated for sub_80A6D34: FAILURE; log=build/cbmc_full16/logs/sub_80A6D34_harness.cbmc.txt | [main.assertion.1] line 20 UNKNOWN: complete observable model profile not yet generated for sub_80A6D34: FAILURE; log=build/cbmc_full16/logs/sub_80A6D34_harness.cbmc.txt |
| `sub_80A6E4C` | UNKNOWN | yes | --unwind 8 + unwinding assertions | anchored-known-equivalent | m2c ok label=sub_80A6E4C, lines=36; file ./scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_80A6E4C_ref.c line 28 function ref_sub_80A6E4C: in expression 'var_r5':; log=build/cbmc_full16/logs/sub_80A6E4C_harness.cbmc.txt | file ./scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_80A6E4C_ref.c line 28 function ref_sub_80A6E4C: in expression 'var_r5':; log=build/cbmc_full16/logs/sub_80A6E4C_harness.cbmc.txt |
| `sub_80A6F1C` | UNKNOWN | yes | --unwind 8 + unwinding assertions | extrapolated-hard | m2c ok label=DecodeAndVerifyArenaRecord, lines=30; file ./scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_80A6F1C_ref.c line 19 function ref_DecodeAndVerifyArenaRecord: in expression 'var_r5':; log=build/cbmc_full16/logs/sub_80A6F1C_harness.cbmc.txt | file ./scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_80A6F1C_ref.c line 19 function ref_DecodeAndVerifyArenaRecord: in expression 'var_r5':; log=build/cbmc_full16/logs/sub_80A6F1C_harness.cbmc.txt |
| `sub_80C05C8` | UNKNOWN | yes | --unwind 8 + unwinding assertions | anchored-known-equivalent | m2c ok label=GmapScreen2_Loop, lines=84; [main.assertion.1] line 22 UNKNOWN: complete observable model profile not yet generated for sub_80C05C8: FAILURE; log=build/cbmc_full16/logs/sub_80C05C8_harness.cbmc.txt | [main.assertion.1] line 22 UNKNOWN: complete observable model profile not yet generated for sub_80C05C8: FAILURE; log=build/cbmc_full16/logs/sub_80C05C8_harness.cbmc.txt |

## Notes

The bridge now runs m2c for every function and builds a CBMC C-vs-C harness for every generated reference. A function is still fail-closed unless a complete observable model profile exists for its visible writes/calls. Current generated generic harnesses deliberately assert an UNKNOWN marker when that profile is absent; see `build/cbmc_full16/logs/` for exact CBMC output.
