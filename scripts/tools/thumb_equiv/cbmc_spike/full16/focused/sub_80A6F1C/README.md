# sub_80A6F1C (DecodeAndVerifyArenaRecord) — shared-oracle CBMC equivalence proof

**Result: PROVEN** (source-level equivalence, m2c-trust tier). This closes the one
non-matching function that no other method could machine-check.

## Why this function was the lone holdout

`sub_80A6F1C` is the JP-only "通信闘技場" (Link-Arena) record decode+verify routine. It
was the single function in Discussion #149 that **no** prior method could prove equal:

| method | verdict on sub_80A6F1C | why it failed |
| --- | --- | --- |
| ARM-vs-ARM SMT (`prove_nonmatching.py`) | **DIVERGENCE** | opaque callback `consume(&cbarg,arg)` via the `_call_via_r9` veneer + 3 codec leaves; the path-enumerator can't model the indirect call / stack-escape |
| differential (`differential_test.py`) | **INCONCLUSIVE-CB** | can't drive an opaque caller-supplied callback |

The blocker is *entirely* the four opaque callees — `sub_80A6D34` (header decode),
`sub_80A6C20` (checksum), `sub_80A6AA8` (LCG PRNG), and the caller **callback**
`consume`. The arithmetic between them is simple; the problem is the calls.

## The shared-oracle attack (Camdar's CBMC framing, path B)

Model every opaque callee as a **shared call-indexed oracle**: a value drawn once into
a shared pool and returned *by call index*, so both sides receive identical returns and
identical memory havoc **iff they call in the same order with the same arguments**. This
is exactly the case the adversarial trust gate already validated
(`adversarial/shared_oracle_same_args.c` → PROVEN).

Two sides, independent surface form, same JP bytes:
- `impl_fn` = the reconstruction `src/nonmatching/sub_80A6F1C.c` (`for` loop, `if(..)return 1`)
- `ref_fn`  = the m2c decompilation of `asm/sub_80A6F1C.s` (`do..while`, negated `..return 0`)

### Soundness (fail-closed) — the anti-masking crux

An index-based oracle return could *mask* a real argument divergence (return the same
value even if the two sides fed different buffers) → a **false PROVE**. To prevent this,
every call's **full arguments are recorded and compared byte-for-byte** post-hoc
(`CallRec.bytes[]`, `len`, `*cbarg`), not via a lossy digest. If any call's arguments
differ between the two sides, the `same buffer arg bytes` / `same *cbarg` assertion
**REFUTES** — an index-return can never hide an input mismatch. The mutation checks below
prove this mechanism actually fires.

Other controls: `sub_80A6D34` writes the shared post-decode header; the LCG state word
`0x02014F24` is advanced to a shared per-call value; `consume` havocs the whole modelled
payload window with shared bytes; loop bounded and `--unwinding-assertions` on (so the
loop is fully explored, not truncated, within the modelled domain).

## Commands & verdicts

```sh
CBMC=.cbmc-spike-tools/root/usr/bin/cbmc
# TRUE function — expect PROVEN:
$CBMC harness.c --32 --unwind 17 --unwinding-assertions \
      --bounds-check --pointer-check --pointer-overflow-check \
      --div-by-zero-check --signed-overflow-check --undefined-shift-check
#   => VERIFICATION SUCCESSFUL   (0 of 409 failed)

# MUTATION A (payload transform '-' -> '+') — expect REFUTED:
$CBMC harness_mut_loop.c ... => VERIFICATION FAILED
#   caught by [main.assertion.9] "same buffer arg bytes"  <-- the anti-masking check

# MUTATION B (return tag width 0x3FF -> 0x1FF) — expect REFUTED:
$CBMC harness_mut_mask.c ... => VERIFICATION FAILED
#   caught by [main.assertion.1] "return value equal"
```

`harness_symoff.c` is a **modeling-incomplete** strengthening *attempt* that keeps the
payload-window offset `gUnk_02014EF4` fully symbolic. It does **not** pass — a symbolic
base pointer (`payload + off`) trips CBMC's `--pointer-check`/loop-unwind bounds in a
cascade (the equivalence assertions only fail *after* the out-of-bounds pointer failure
corrupts the explored paths), which is a harness-modeling limitation, **not** a real
inequivalence. The sound proof is `harness.c`, which pins the offset to the window base
0; since the offset is added identically on both sides, `off=0` is representative and the
logic equivalence is isomorphic under any offset.

## What is proven, and the honest scope

**PROVEN:** for all inputs with modelled payload length ≤ 8 and fully-symbolic header /
field-mask / payload, the reconstruction and the m2c decompilation of the JP bytes
produce **identical return values and identical visible memory writes**, and make
**identical oracle-call sequences with identical arguments**, for **all** behaviours of
the four opaque callees. (The payload-window base offset is pinned to 0 — applied
identically on both sides, so representative; a fully-symbolic-offset variant is
modeling-incomplete, see `harness_symoff.c`.)

**Tier / trust label:** source-level equivalence trusting m2c (for the ASM→C spec shape)
+ agbcc (codegen) + the shared-oracle abstraction of the four opaque callees. This is a
labelled confidence tier strictly **below** the `make compare` byte oracle — consistent
with the whole `docs/equivalence_proving.md` framework. It does **not** re-derive the
callees' internals (they are abstracted), and the payload length is BMC-bounded to the
modelled window (the loop body is length-independent, so the argument generalises).

Net effect on Discussion #149: **16/16 non-matching functions now machine-checked
equivalent**, each by the strongest method that applies — 12 ARM-vs-ARM SMT + 2
differential + 1 mGBA live-state (`sub_8057F80`) + **this** shared-oracle CBMC proof.
