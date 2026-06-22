# agbcc codegen levers — forcing matching C past "codegen dead-ends"

Empirically established against the exact build binary `tools/agbcc/bin/agbcc`
(GCC 2.95, `-O2 -mthumb-interwork -fhex-asm`). These turn many region-different
`sub_` near-misses — previously written off as "unforceable reg-alloc / lsr↔asr
dead-ends" — into byte-perfect matching C. **17 of ~142 documented dead-ends were
reclaimed** applying these; 30 more reduced to single-digit diffs. The remainder
are marked UNSOLVED (not DEADEND — any Thumb function compiled from C has matching
C by construction; treat non-zero diffs as unsolved reconstruction work).

## 1. `lsr` vs `asr` is chosen ONLY by the shifted operand's signedness

Probe (`f(x){return EXPR;}`, `-O2`):

| operand expression | emits |
|---|---|
| `(u32)x >> n`, `u16`/`u8` field/var | `lsr` (unsigned) |
| `(s32)x >> n`, `int` | `asr` (signed) |
| `s16` field `>> n` | `lsl #16 ; asr #(16+n)` (sign-extend fused with shift) |
| `u16` field `>> n` | `lsl #16 ; lsr #(16+n)` (zero-extend) |
| `s8` field `>> n` | `lsl #24 ; asr #(24+n)` |

**Lever (signedness-cast):** cast AT THE SHIFT SITE to flip it.
- JP has `asr`, you emit `lsr` → cast operand to `(int)`/`(s32)`.
- JP has `lsr`, you emit `asr` → cast operand to `(u32)`/`(unsigned)`.

The same rule governs `ldrb` vs `ldrsb` and `ldrh` vs `ldrsh`: a `(s8)`/`(s16)`
cast on a memory read folds into the *signed* register-indexed load
(`movs rN,#off; ldrsb r,[base,rN]`). `SwapUnitStats` (130→0) matched once each
`u8` swap temp was `int tmp = (s8)(field);`.

## 2. int-local-widen — the highest-yield variant (8/13 reclaims)

When JP sign-extends a `s8`/`s16` **parameter or field once at entry** (an `asrs`
at the top) and reuses the widened value, copy it to an `int` local up front:

```c
int v = s8param;     /* one ASR at entry; no per-use re-extension */
```

This removes the "load-narrow-then-re-extend" bloat agbcc emits when a sub-word
value is used in `int` context repeatedly. It also frequently nudges agbcc into
JP's exact register choice as a side effect (so an explicit pin is unneeded).

## 3. reg-alloc — `register T x asm("rN")` DOES pin (use sparingly)

Probe: `register int x asm("r5"); register int y asm("r4");` produced
`add r5,r0,#1 / add r4,r1,#2` — exactly the annotated hard registers. So an
explicit pin works for a **clean register permutation** (identical instructions,
regs swapped). BUT it can introduce shuffle `mov`s and make things *worse*
(`PlayerPhase_PrepareAction` matched with plain `int`, regressed with a pin).
Prefer, in order: (a) int-local-widen / signedness-cast, (b) **declaration/first-use
order** (a local declared/used earlier gets the lower callee-saved reg r4<r5<r6),
(c) explicit `asm("rN")` pin only when a clean swap resists everything else.

## 4. Per-target `-O1` (matches fe8u file-level flags)

Some TUs byte-match only at `-O1` — fe8u sets `src/agb_sram.o: CC1FLAGS := … -O1 …`.
Replicate per-target in the Makefile:
```make
src/ReadSramFast_Core.o src/WriteSramFast.o: CC1FLAGS := … -O1 …
```
This fixed a pure `r0↔r1` swap `-O2` could not (`ReadSramFast_Core`/`WriteSramFast`).
Check fe8u's Makefile for the file's optimization level before assuming `-O2`.

## 5. Supporting levers seen alongside the above

- **branch-polarity:** write `if ((cond)==0) A; else B;` vs `if (cond) B; else A;`
  to match JP's `beq/bne` ordering (`Event03_CheckEvBitOrId`).
- **data/callee binding:** a LINK-undefined data LUT / proc-script / config → read
  its JP address from the original asm literal pool and add a `data` baseline alias
  (`gGMapMuSpriteLayerLut`, `gSummonConfig`, `gEventscr_*`). Numbered symbols
  (`gEventscr_1/3/4`) follow address order.

## Workflow

`/tmp/reclaim.js` (codegen-deadend-reclaim): worktree agents port each candidate,
`sadiff` it, disassemble the diff, apply the matching lever, re-test, and return
only `diff==0` fixes. Re-verify every reclaim with a full cold `make compare` on the
main thread before commit (worktree sadiff is reloc-excluded; the full link is the
oracle). Candidate sources: the `lsr-asr` / `reg-alloc` buckets of the sweep
dead-end classifications.

## 6. Statement reordering (scheduling class) + unsolved patterns (NOT a permanent wall)

agbcc materializes values in **source-statement order**. If JP computes A before B but
you emit B first, reorder the source (or hoist into an earlier temp / sink later). Two
concrete wins: splitting a chained `pointAlias = point = f();` into two statements kept
`point` (s8) sign-extended so `++point` used `adds;lsl;asr` not the shifted-domain
`+0x01000000` increment (`UpdatePathArrowWithCursor` 238→0); and removing a redundant
`(s16)` cast let agbcc materialize signed values eagerly to match JP scheduling
(`GmapTimeMons_ExecMonsterMergeMu` 104→0).

**"Hard" patterns — UNSOLVED reconstruction work, NOT a wall.** (Correction: an earlier
version of this doc called these "irreducible / not C-addressable." That was WRONG — a
Thumb function compiled from C has matching C by construction. Do not mark these DEADEND;
mark UNSOLVED and report the exact differing bytes. See `decomp_agent_playbook.md`.)
- **tail-merge / cross-jumping**: agbcc DOES cross-jump — proven (two switch cases each
  ending `acc += g(p,flag)` compile to ONE shared `bl g`). If JP merged a shared call tail
  and your C didn't, your two tails aren't textually identical; make them identical (compute
  a common local in each case, share the call via fallthrough/goto). `GetStrTalkLen` is a
  source-structure fix, not a wall.
- **post-RTL instruction scheduler batching**: JP finishes computing X fully before
  starting Y; agbcc batches two shared-base loads then both clamps (`EventShinningCursorAdvance`).
- **call-argument evaluation order**: agbcc evaluates the last arg first; JP left-to-right
  (`MoveTalkFace` 3 bytes, `PutFaceChibi`, `PrepItemScreen_DrawVisibleUnitNames`).
- **prologue push-list vs asm-pin**: a `register asm("r7")` is used in the body but NOT
  added to the prologue push/epilogue pop (`UpdateLinkArenaMenuScrollBar` — body byte-perfect,
  only the push reg-list differs by 2 bytes).
- **scratch-register choice**: agbcc picks r0 where JP picks r1 for an internal narrow
  (`Event1B_TEXTSHOW`).

Reclaim hit rate: **17 of ~142 classified dead-ends** (lsr/asr 31 + reg-alloc 93 +
scheduling 36, minus overlap) recovered to byte-0; the rest split between the
unsolved patterns above (provisional — mark UNSOLVED, not DEADEND) and genuine
region-different behavior (different US source).
