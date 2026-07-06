# CBMC source-level equivalence spike for FE8J

Date: 2026-07-06

## Adoption criteria and recommendation

Criteria (decided before the experiments):

1. CBMC must pass the full adversarial trust gate, including no false
   `PROVEN` for omitted writes, aliases, helper-call argument mismatches, and
   loop unwinding gaps.
2. It must handle at least one real FE8J idiom with less effort or better
   source-level counterexamples than the existing ARM-vs-ARM prover.
3. Every result must be clearly labelled:
   **source-level equivalence under modeled C semantics, trusting agbcc
   codegen/ABI**.

**Recommendation: do not adopt CBMC as a regular FE8J complementary equivalence
tier yet.** It passed the scoped trust gate and can prove small C-vs-C
region-same harnesses, but those wins duplicate cases where the existing
ARM-vs-ARM proof/byte comparison is stronger and cheaper. CBMC's advantage is
source-level counterexamples during harness development; its cost is a fragile
manual C memory/call model plus an extra compiler-trust boundary. Keep this spike
as evidence and revisit only for a narrow follow-up that mechanically derives an
ASM write/return spec.

CBMC must **not** become a carve or acceptance gate. `make compare` and the
existing `scripts/tools/thumb_equiv/` ARM-vs-ARM proposition remain authoritative.

## Stage 0: install

`apt-get install cbmc` could not run without sudo. I installed CBMC 6.10.0 in an
untracked local extraction under `.cbmc-spike-tools/`:

```sh
curl -L -o .cbmc-spike-tools/download/cbmc.deb \
  https://github.com/diffblue/cbmc/releases/download/cbmc-6.10.0/ubuntu-24.04-cbmc-6.10.0-Linux.deb
dpkg-deb -x .cbmc-spike-tools/download/cbmc.deb .cbmc-spike-tools/root
.cbmc-spike-tools/root/usr/bin/cbmc --version
```

Observed: `6.10.0 (cbmc-6.10.0)`.

## How to reproduce

```sh
cd /home/laqieer/fireemblem8j
CBMC=.cbmc-spike-tools/root/usr/bin/cbmc \
  python3 scripts/tools/thumb_equiv/cbmc_spike/run_cbmc_spike.py
python3 scripts/tools/thumb_equiv/cbmc_spike/region_same_cert.py
make compare
```

The runner uses fail-closed vocabulary only: `PROVEN`, `REFUTED`, `UNKNOWN`,
`BOUNDED_ONLY_N`. It enables CBMC safety checks and
`--unwinding-assertions`; `PROVEN` is reported only when all assertions,
including unwinding assertions, pass.

## Stage 1: adversarial trust gate

All results below are **source-level equivalence under modeled C semantics,
trusting agbcc codegen/ABI**.

Observed run:

| case | expected | observed | evidence |
| --- | --- | --- | --- |
| identical function | `PROVEN` | `PROVEN` | `VERIFICATION SUCCESSFUL` |
| return `r0` vs `r0+1` | `REFUTED` | `REFUTED` | `return r0 vs r0+1: FAILURE` |
| helper called with different args but same modeled return | `REFUTED` | `REFUTED` | `implementation helper arg must match reference: FAILURE` |
| implementation writes a global the reference does not | `REFUTED` | `REFUTED` | `all modeled mutable globals: FAILURE` |
| reference writes through pointer alias to a global, impl does not | `REFUTED` | `REFUTED` | `pointer alias to modeled global: FAILURE` |
| same final return but different global side effect | `REFUTED` | `REFUTED` | `same return but different global side effect: FAILURE` |
| uninterpreted call, same args both sides via shared oracle | `PROVEN` | `PROVEN` | `VERIFICATION SUCCESSFUL` |
| data-dependent loop beyond unwind bound | `BOUNDED_ONLY_2` | `BOUNDED_ONLY_2` | `unwinding assertion loop 0: FAILURE` |
| pointer may alias unmodeled storage | `UNKNOWN` | `UNKNOWN` | harness deliberately treats this refutation as fail-closed `UNKNOWN` |

Soundness controls used:

- Complete write observability for every modeled mutable global in the harness.
- Shared call-indexed oracle for uninterpreted helper calls; target, args, and
  order are asserted.
- Shared symbolic initial memory: both sides copy the same nondet values.
- Loop bounds are proof obligations via `--unwinding-assertions`; an unwinding
  failure is `BOUNDED_ONLY_N`, never `PROVEN`.
- Pointer alias uncertainty that might touch unmodeled storage is reported
  `UNKNOWN`, not proven.

## Stage 2 / Q2(a): real FE8J C-vs-C region-same functions

These are still **source-level equivalence under modeled C semantics, trusting
agbcc codegen/ABI**. They are not compiler-free proofs.

Region-same certificates were produced by
`scripts/tools/thumb_equiv/cbmc_spike/region_same_cert.py`, which compares JP and
US ELF disassembly after normalizing branch/call relocations and literal-pool
words:

```text
GetGameClock: MATCH
AddTarget: MATCH
GreenText_OnLoop: MATCH
```

Supporting repository map evidence:

- `GetGameClock`: `layout/nofuncmap_region_same.tsv` lists JP `08000CD8`, US
  `08000D28`, size 12, `reloc-ambiguous`.
- `AddTarget`: `layout/us_jp_funcmap.tsv` maps JP `08050630` to US `0804F8BC`,
  size 84, `masked`.
- `GreenText_OnLoop`: `layout/nofuncmap_region_same.tsv` lists JP `0800488C`,
  US `08004984`, size 40, `reloc-unique`.

CBMC Q2(a) results:

| FE8J idiom | Harness | Verdict | Loop bound | Observable |
| --- | --- | --- | --- | --- |
| leaf global read | `q2a/get_game_clock.c` | `PROVEN` | no loops | return + no visible writes |
| global-array writer | `q2a/add_target.c` | `PROVEN` | `--unwind 9` for bounded init/compare loops | all modeled `sSelectTargetList[4]` bytes + count |
| helper-call case | `q2a/green_text_on_loop.c` | `PROVEN` | `--unwind 33` for bounded palette compare | all modeled palette slots + helper-visible sync state |

Loop-bound justification: the real functions have no data-dependent loops. The
bounds cover only fixed-size harness initialization/comparison loops
(`AddTarget`: 4 entries with 8 padding bytes; `GreenText_OnLoop`: 16-entry LUT
init and 32 palette-slot comparison).

Pointer/alias contract: Q2(a) harnesses model legal scalar/global state only.
`AddTarget` constrains the target count to the modeled array extent. No pointer
argument may alias unmodeled storage in these three harnesses.

## Stage 3 / Q4: comparison to ARM-vs-ARM prover

| Axis | Existing ARM-vs-ARM tool | CBMC spike |
| --- | --- | --- |
| Proposition | JP target machine code vs compiled reconstruction machine code, shared symbolic ARM state | C source satisfies return + visible-write spec under modeled C semantics |
| Compiler trust | Does not trust agbcc for the equivalence claim | Trusts C semantics and then trusts agbcc codegen/ABI separately |
| Observable | Return, callee-saved/SP restoration, data writes, call/MMIO trace depending on mode | Return + all modeled mutable globals; helper effects only if manually modeled |
| Real FE8J scope shown here | Authoritative for actual ASM-vs-compiled-code equivalence | C-vs-C only for three small region-same examples |
| Diagnostics | ARM/register/memory counterexamples tied to binary states | Nice source-level assertion failures for harness bugs and omissions |
| Effort | Existing FE8J memory/call/relocation model already exists | Manual per-function state, alias, globals, helper oracle, and bounds |
| Failure mode | Incomplete but compiler-free under its stated machine model | Easy to under-model and false-prove unless every write/alias/helper is controlled |

CBMC's useful niche is explaining source-level contract mistakes: omitted writes,
wrong helper args, or alias obligations produce readable assertion failures. For
actual FE8J acceptance evidence, however, this spike did not beat the existing
ARM-vs-ARM workflow.

## Deferred Q2(b): ASM-derived spec sketch

Q2(b) is deferred. A credible follow-up would need to derive, from `cfg_exec`,
a conservative spec containing:

1. return value expression or relation;
2. complete visible write footprint, or `UNKNOWN` if a pointer write may hit
   unmodeled mutable memory;
3. ordered helper/call oracle entries keyed by target, args, and call index;
4. loop-unwind obligations carried into CBMC as explicit `BOUNDED_ONLY_N` gates.

Only if that derivation is mechanical enough to avoid hand-selected write
footprints should CBMC be reconsidered as a complementary confidence tier.

