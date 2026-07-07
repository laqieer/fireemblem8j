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
  (`Event1B_TEXTSHOW`). — [SUPERSEDED 2026-07-03: `Event1B_TEXTSHOW` MATCHED byte-exact in-repo
  (`int evArgument` makes stock agbcc reproduce the JP `ldrsh`, residual→0), banked; this example
  is no longer a live wall, though the r0/r1 scratch-choice pattern itself remains valid.]

Reclaim hit rate: **17 of ~142 classified dead-ends** (lsr/asr 31 + reg-alloc 93 +
scheduling 36, minus overlap) recovered to byte-0; the rest split between the
unsolved patterns above (provisional — mark UNSOLVED, not DEADEND) and genuine
region-different behavior (different US source).

## 7. agbcc reg-alloc FLAG MATRIX does NOT crack the spill-decision NEAR class (D284, tested)
The remaining ~42 Thumb NEARs (Event18_ColorFade 800E1FC, AdjustNewUnitPosition 807C8DC, 80CAEF4, 806A41C,
800A34C/594, 80A2E64/3528, etc.) are byte-CLOSE reconstructs whose only residual is agbcc choosing a different
register-allocation / SPILL decision than the JP ROM's original build (e.g. JP anchors proc to ip + spills 2
color locals to stack; agbcc-here pins proc to a callee-saved r7 + spills 1). HYPOTHESIS tested: a per-TU agbcc
optimization flag controls this. RESULT (Event18_ColorFade, 204B, base residual 95 differing bytes): NONE of the
11 combos helped — `-fcaller-saves` (95, no change), `-fno-regmove` (105 worse), `-fforce-mem` (95),
`-ffixed-r7` (96), `-fcall-used-r7` (95), `-ffixed-r7 -ffixed-r8` (185 worse), `-fcall-used-r7 -fcall-used-r8`
(176), `-fcall-saved-ip` (169), `old_agbcc` (152), `old_agbcc -mjp-promote` (105). The flags either no-op or
make it worse; 95 is the floor. CONCLUSION: the spill-decision residual is NOT a forceable per-TU flag — it is a
genuine reg-allocator-internal difference. It is a SOURCE-reconstruction problem (the original JP C source
structure differs from the reconstruction in a way the permuter's mutation neighborhood may or may not reach),
crackable only by (a) LONG decomp-permuter runs (millions of iters / days — the workers capped at 30-60k and
plateaued; lucky seeds may still hit 0), or (b) reproducing the original IS-build agbcc reg-allocator. NOT by
flags. Single-TU test harness: `cpp $CPPFLAGS src/F.c | iconv -f UTF-8 -t CP932 | tools/agbcc/bin/agbcc
$CC1FLAGS <flag> -o /tmp/t.s; as; objcopy -O binary -j .text; cmp -l vs the assembled oracle .text`.

## 8. -fno-gcse — a NEW lever for table-base-in-loop reg eviction (D285)
For functions that read a const lookup table (SIN/COS gSinLookup, msgid/sprite tables) or a common
subexpression INSIDE a loop, agbcc's GCSE pass HOISTS the table base-address into a callee-saved register,
which EVICTS the live struct/proc pointer to a different reg or to a stack spill -> a function-wide coloring
divergence from the JP build (which reloads the table base from the literal pool on each use). `-fno-gcse`
disables that hoist, reloading per-use like the JP build. VERIFIED: sub_800A34C (Catmull-Rom spline, reads a
table in the eval loop) goes 0x258 (+0x10 over) -> EXACT 0x248 size with -fno-gcse; sub_80A2E64 (sprite
rotator reading gSinLookup/COS) 199==199 instr exact. (Both still have a residual COLORING rotation on top of
the now-exact size — -fno-gcse fixes the GCSE-eviction axis, not every coloring choice.) Apply per-TU like
-mjp-promote: `src/<fn>.o: CC1FLAGS += -fno-gcse`. NOTE: -mjp-promote and -fno-gcse can CONFLICT (mjp-promote
strips the s16 sign-extend moves that -fno-gcse needs for 80A2E64) — try each alone and combined. Add this to
the all-levers re-examination toolset (re-run the spill-NEARs WITH -fno-gcse before declaring a ceiling).

## 9. The FULL spill/reg-alloc lever set (D286, agbcc-source-verified) — corrects §7
agbcc source (../fireemblem8u/.deps/agbcc/gcc/) confirms: NO instruction scheduler (so -fschedule-insns* are
no-ops); reg choice is driven by the PRIORITY formula `floor_log2(n_refs)*n_refs*size/live_length` (higher=wins
a hard reg first) + COPY-PREFERENCES (set_preference) + r0->r7 ascending scan, NOT by REG_ALLOC_ORDER (undefined
for thumb) and NOT by -ffixed/-fcall-used masks (confirmed dead — D284 was right those no-op). Caller-save vs
callee-save/spill is decided by `CALLER_SAVE_PROFITABLE = 4*CALLS < REFS` (regs.h:201).
UNTESTED-IN-D284 FLAGS (now tried on the 6 staged spill-NEARs — they REDUCE residual but did NOT reach 0 on
these specific fns; still worth a per-TU probe on others): `-Os` (swaps PRE for classic-GCSE+code-hoisting, a
different redundancy/live-range model), `-fno-caller-saves` (D284 only tried the no-op -fcaller-saves; the OFF
direction forces callee-saved/spill), `-fno-strict-aliasing` (shortens reg lifetimes), `-fno-expensive-optimizations`.
Best combo seen: 80A2E64 -fno-gcse -fno-caller-saves 364->297. THE REAL LEVERS for the residual coloring are
SOURCE-LEVEL (reach the IR the flag matrix can't):
  (a) cut/add the live pointer's REFERENCE COUNT (cache a field `int v=p->f;` to touch p fewer times -> flips
      4*CALLS<REFS and the priority formula) — the #1 source idiom per agbcc source.
  (b) shorten/lengthen a value's LIVE RANGE (sink the loser's def, hoist the winner's) — pri ∝ 1/live_length.
  (c) COPY-PREFERENCE steering: `int t = arg;` early ties t's allocno to that arg's hard reg (controls r4-vs-r5).
  (d) fe8u's PROVEN idiom (../fireemblem8u/src/spline.c, the matched twin family for 800A34C): name pointer
      locals AFTER their target register (`s16 *r8; u32 **sl;`) so decl-order colors them, + selective
      `register int x asm("rN")` pins ONLY where natural coloring fails (blind pins make it WORSE — verified
      CheckCanSummon 7->74). For 80A3528 the oracle keeps the tilemap base in low r4/r5/r6 (the `u16 *tm` idiom).
  (e) `&x` (addressable -> forced to stack) or `volatile` (per-use reload) on the local JP keeps spilled — a
      scalpel alternative to -fno-gcse.
Per-NEAR probe order (cheapest first): -Os, -fno-caller-saves, -fno-strict-aliasing x {-mjp-promote,-fno-gcse};
then source idioms (a)-(e); then the permuter; the linked make compare is the only oracle.

## 10. decomp.me scratches posted (D286) — community matching enabled
The 6 hardest spill-NEARs are public decomp.me scratches (platform=gba, compiler=agbcc; the 2 -mjp-promote ones
show a ~2-instr delta since stock decomp.me agbcc lacks the fork flag):
  sub_800A34C  https://decomp.me/scratch/5sdMe   Event18_ColorFade https://decomp.me/scratch/WmsgZ
  AdjustNewUnitPosition https://decomp.me/scratch/FtYfC   sub_80A2E64 https://decomp.me/scratch/3IquK
  sub_80A3528  https://decomp.me/scratch/0I8PP   sub_80CAEF4 https://decomp.me/scratch/kKWJ0

## 11. decomp.me scratches — round 2 (the next-tier reg-coloring NEARs)
8 more posted (14 total). Note: decomp.me's STOCK agbcc rejects -mjp-promote (the repo's fork flag), so the
7 -mjp-promote ones are reference-only there (target+near-match C, ~1-3 instr residual documented in each desc);
only sub_80BCD74 (PERMUTER_FLAGS=none) compiles + diffs live (1855/11300, a genuine community-iterable near).
  AddAttr2dBitMap https://decomp.me/scratch/az2Co   sub_80A3300 https://decomp.me/scratch/UbRNK
  sub_80A6E4C https://decomp.me/scratch/fFDjv        sub_80A730C https://decomp.me/scratch/34H33
  sub_80A73D4 https://decomp.me/scratch/vnbyw        sub_80BB240 https://decomp.me/scratch/k5Eb8
  sub_80BCD74 https://decomp.me/scratch/Km1Oj        sub_80D17C8 https://decomp.me/scratch/TwXsX
> [SUPERSEDED 2026-07-03: sub_80A730C (DrawArenaRosterNames) and sub_80A73D4 (ArenaScoreboard_DrawRecord)
> in this list have since MATCHED byte-exact in-repo (banked, removed from `src/nonmatching/`); their
> scratches are reference-only now.]
LIMITATION for community help: decomp.me stock agbcc has no -mjp-promote; to let outsiders match the
-mjp-promote functions, the fork flag would need upstreaming to decomp.me's agbcc, OR re-derive those functions
without needing -mjp-promote (harder). The genuine reg-coloring floor (~38 fns) is being ground by the local
permuter fleet (16-fn) + these scratches; remaining path = compute-time + community, deterministic levers done.

### decomp.me scratches posted 2026-06-26 (this session's reconstructed/permuter-base NEARs; checked: NO community-fork match yet)
  Event0F_CounterOps   https://decomp.me/scratch/aNjcw   (decomp.me score 620)
  PutFaceOnBackGround  https://decomp.me/scratch/jK5bE   (decomp.me score 245, closest)
  RegisterTsaWithOffset https://decomp.me/scratch/ZA4ER  (decomp.me score 2700; 6-byte local diff)
  EfxAdvanceFrameLut   https://decomp.me/scratch/HbXuD   (decomp.me score 735; 2-insn residual)
  sub_8084CE4          https://decomp.me/scratch/KKFDx   (decomp.me score 4121)
  CHECK-BEFORE-REWORK (D291): before reworking any posted fn, query
  `GET decomp.me/api/scratch/<slug>/family` for a score-0 fork (a community match) and integrate it
  instead of re-deriving. As of this posting, all 19 FE8J scratches' families have NO score-0 member.

## 12. decomp.me match patterns — from TsilaAllaoui's 8 fork matches (D292)

Nine FE8J reg-coloring NEARs (8 by TsilaAllaoui + sub_8057F80) (all labelled "agbcc reg-coloring NEAR") were driven to
**score 0** on decomp.me forks by community matcher **TsilaAllaoui**, then integrated to
`src/` byte-exact here. Diffing each non-matching parent (proxied from the in-repo
`src/nonmatching/*` stubs, git history, and the fe8u natural form — the decomp.me parents
were later overwritten by mark-solved, so the *fork's own explicit constructs* are the
primary evidence) against its matched fork yields a reusable lever set. These extend
§1–§9 with a new, more surgical family: **inline-asm constraint scripting** — directly
commanding agbcc's register allocator / instruction selector without changing behaviour.
They crack exactly the spill-decision + high-pressure reg-coloring NEARs §7 said flag
sweeps could not.

The 9 span a spectrum from *pure clean source-shape* (0 asm) to *total asm scripting*:

| fork (fn) | pins | `=r`/`0` reg-barrier | `+m` mem-barrier | inline-asm | headline lever |
|---|---|---|---|---|---|
| jmNW8 `PutFaceOnBackGround`   | 0  | 0 | 0 | 0  | **P8** pure source-shape (hoist+IV+widen) |
| 9rbYd `EfxAdvanceFrameLut`    | 1  | 0 | 0 | 3  | P7 return-widen + P3 `sub;strh` + P9 blocks |
| tnBW4 `GetPidDefeatedEnding…` | 5  | 0 | 0 | 5  | P4 pins + **P5** shift-pair sign-extract |
| JJIdk `sub_80BCD74`           | 2  | 1 | 0 | 2  | **P1** reg-barrier + P5 shift bit-test |
| cTKJG `Event0F_CounterOps`    | 7  | 0 | 0 | 12 | **P3** instr-scripting + P7 `volatile short` |
| mbcFD `sub_8084CE4`           | 11 | 0 | 0 | 13 | P4 pins + **P3** stack-arg `ldr` + P10 `&x` |
| 39OxE `RegisterTsaWithOffset` | 6  | 0 | 0 | 6  | P4 high-reg (r8) + **P6** shifted-domain loop |
| Qua5T `sub_80CAEF4`           | 34 | 6 | 2 | 34 | **P2** mem-barrier + P1/P4 swarm + goto |
| rtMN6 `PrepareBattleGraphicsMaybe` (sub_8057F80, 2936 B) | 2 | 0 | 0 | 0 | **P4** pins (`char_cnt`→r6, `banim_pos`→r4) + **§5a** s16→int widen (+`(s16)` casts) + inline the ally-position helper + decl-order. **Cracked a verdict recorded as "genuinely region-different, byte-match out of scope"** — see the LESSON below. |

**LESSON from rtMN6 (`sub_8057F80`, 2026-07-07): "region-different" ≠ unmatchable — measure it.**
The function was parked as "genuinely region-different (2936 vs US 3250 B), byte match out of
scope". That was half-wrong. The size delta is a real region difference (the US-only
Manakete/Myrrh + Demon-King tail block, absent in JP), but the *rest* is a plain
whole-function reg-coloring wall that P4 pins + s16-widen crack. **Before writing off a
larger "region-different" NEAR, align its `bl` sequence 1:1 vs the US `.o` (survey §4.3): if
the call graph matches except for a localized added/removed block, carve the JP control flow
and treat the residual as a normal coloring NEAR — the pins recipe applies.** (`sub_8057F80`
was also the function this repo's ROI note rated "≈NONE / don't attempt"; the community
decomp.me path landed it, exactly as that note predicted was its only viable route.)

### The levers (checklist — try cleanest first, escalate only if it resists)

**P8 — pure source-shape (try FIRST; the only "clean decomp" fork).** No asm at all.
Hoist next-iteration pointers/index to explicit temps computed *before* the inner loop,
and materialise the loop IV, so agbcc schedules + colours the loop like JP:
```c
for (i = 0; i < 10; i++) {                for (i = 0; i < 10; i++) {
    for (j = 0; j < 12; j++) {...}    ->      const u16 *nextSrc = src + 12;   /* hoist */
    src += 12; dst += 0x20;                    u16 *nextDst = dst + 0x20;
}                                              int nextI = i + 1;
                                               for (j = 0; j < 12; j++) {...}
                                               src = nextSrc; dst = nextDst; i = nextI - 1;
                                           }
```
Combine with **int-local-widen** (§2): copy an `s8`/`s16` param to an `int` up front
(`int flipped = c;` then test `flipped == 0`). *jmNW8.*

**P7 — return/param-type widening (drop a sign-extend/truncate).** When JP returns the
value raw (no final `lsl#16;asr#16` / `and`), widen the return or param type so agbcc
omits the narrowing:
```c
s16  f(...) {...}      ->   unsigned int  f(...) {...}   /* 9rbYd: drops trailing sign-ext */
u8   g(...) {...}      ->   volatile short g(...) {...}  /* cTKJG: drops return truncation  */
```
`volatile` on the return type also blocks agbcc from CSE-folding the final store. *9rbYd, cTKJG.*

**P5 — shift-domain signedness / bit-test (no mask, no `and`).** Extract a signed
sub-field or test a bit with a shift pair instead of a mask, matching JP's `lsl;asr`/`bpl`:
```c
chId = tmp & 0x3F;            ->  chId = ((u32)tmp << 0x1a) >> 0x1a;  /* lsl#26;asr#26 signed 6-bit */
if ((flags & 2) == 0) {...}  ->  flag <<= 0x1e; if (flag >= 0) {...} /* lsl#30;bpl, not and#2;beq */
```
This is §1 done at the *use* site via the shift domain. *tnBW4, JJIdk.*

**P6 — shifted-domain loop arithmetic (keep counter as a `<<16` value).** For an `s16`
loop counter JP holds pre-shifted in a register and decrements by adding the shifted
step, reproduce the domain instead of letting agbcc re-extend each iteration:
```c
while (i > 0xc) { ...; i--; }
->
if (i > 0xc) { int jStart = jrange << 16;          /* hold <<16 in a reg (JP: jrange<<16 in ip) */
  do { ...; j += (0xFFFF0000);  /* decrement in <<16 domain */
       dec = nextI << 16; i = dec >> 16;           /* re-narrow via lsl#16;asr#16 */
  } while (i > 0xc); }
```
Pairs with a `while`→`if + do/while` rotation. *39OxE (RegisterTsaWithOffset).*

**P4 — hard-register pin swarm, incl. high regs.** When JP colours under high pressure
(uses r8/r9/sl/ip), pin the locals explicitly (§3, but applied in bulk):
```c
register u16 *base asm("r8");  register int jrange asm("r6");  register int count asm("ip");
```
Effective but brittle and the least "clean" of the register levers — a single pin can add
shuffle `mov`s (see §3's regression warning). Reserve for genuinely high-pressure bodies
where declaration-order (§9) can't reach the coloring. *39OxE, mbcFD, Qua5T, tnBW4, cTKJG.*

**P1 — empty-asm register barrier `asm("" : "=r"(x) : "0"(x));`.** A no-op that forces `x`
to be *materialised in a register at that program point* and pins its class, creating a
live-range/scheduling fence without emitting an instruction. Use to stop agbcc hoisting or
coalescing a value across a point where JP keeps it live:
```c
register u8 *ram asm("r0");
ram = ...;
asm("" : "=r"(ram) : "0"(ram));   /* fence: ram stays in r0 here, reload not sunk */
```
*JJIdk, Qua5T (×6), tnBW4.*

**P2 — empty-asm memory barrier `asm("" : "+m"(a), "+m"(b));`.** Forces the named locals to
be **spilled to / reloaded from the stack** across the barrier — the decisive tool for the
*spill-decision NEAR class* §7 declared unreachable by flags. Place it where JP spills:
```c
asm("" : "+m"(a), "+m"(b), "+m"(vram));   /* commit a,b,vram to memory here */
```
Only Qua5T (4bpp tile deinterleave, extreme pressure) needed it — but it is the direct
answer to "same instructions, JP spills X and we keep it in a reg." *Qua5T (×2).*

**P3 — inline-asm instruction scripting.** When P1/P4 still won't route a value to the
right register or emit the exact instruction, write that one instruction inline with
`"=r"/"r"` constraints (agbcc still allocates the operands). Three proven uses:
```c
/* exact stack-arg load order + target regs (Thumb args 5-7 are on the stack): */
asm("ldr %0,[sp,#0x1c]\n\tldr %1,[sp,#0x20]\n\tldr %2,[sp,#0x24]"
    : "=r"(addTmp), "=r"(centerTmp), "=r"(scale));            /* mbcFD */
/* exact decrement-store the C form mis-coloured: */
asm("sub r0,%0,#1\n\tstrh r0,[%1]" :: "r"(count), "r"(pcount)); /* 9rbYd */
/* signed-byte extract / merged and+lsl / register move: */
asm("asr %0,%1,#24" : "=r"(newValue) : "r"(temp));            /* cTKJG: <<16 then asr#24 */
asm("add %0,%1,#0"  : "=r"(out)      : "r"(d));               /* cTKJG/mbcFD: mov via add#0 */
```
*mbcFD, cTKJG, 9rbYd.*

**P9 — block-structure wrappers (`do{...}while(0)`, dead assigns).** Empty or trivial
blocks create basic-block boundaries that steer cross-jumping / branch polarity — e.g. to
stop agbcc merging duplicate sentinel `return`s, or to fix which side of a compare falls
through:
```c
if (iframe == -1) { do { return -1; } while (0); }   /* separate BB: no cross-jump merge */
... do {} while (0); ...                             /* scheduling/branch fence */
new_var2 = &v; d = d*v; new_var = new_var2;           /* dead copies = live-range boundary */
```
*9rbYd, mbcFD.*

**P10 — `&x` addressable-forcing (force a local to the stack).** Taking a local's address
forces agbcc to give it a stack home instead of a register — a portable alternative to P2
for a single value (cf. §9(e)): `new_var2 = &v;` makes `v` addressable. *mbcFD.*

**P11 — repeated-cast temp reuse / arg-share (materialize-once).** When the *same*
`(T)cast` sub-expression feeds two consumers — e.g. an array index **and** a call argument —
hoist it into one named temp and reuse it. agbcc then computes the value once and *keeps it in
a single register* that it shares into the outgoing arg slot, reproducing the JP's explicit
"materialize + `adds rArg, rTmp, #0`" arg-staging instruction. This is a **structural** lever
(it changes the instruction *count* and the function's `.text` size), not just coloring:
```c
/* NEAR: agbcc recomputes (s8)pos->x twice and folds the arg (shorter .text) */
if (gBmMapTerrain[(s8)pos->y][(s8)pos->x]) AiGetClosest(unit, (s8)pos->x, (s8)pos->y, pos);
/* MATCH: one temp, index + arg share it -> extra materialize/arg-stage insn appears */
new_var = (s8)pos->x;
if (gBmMapTerrain[(s8)pos->y][new_var]) AiGetClosest(unit, new_var, (s8)pos->y, pos);
```
*Discovered by decomp-permuter on `AdjustNewUnitPosition` (sub_807C8DC): cut the residual
74→27 bytes and fixed the `.text` length; the last 27 B were an irreducible register-cycle
(see the field note below). Use this whenever a NEAR's size differs by exactly the width of a
repeated cast/sub-expression that is both indexed and passed.*

### How to run this on a NEAR (escalation order)
1. **Confirm it's a coloring/spill NEAR** (same instruction *count/opcodes*, regs or spill
   slots differ) — objdiff / the region `cmp`. If opcodes differ, it's a §1–§9 shape issue.
2. **P8 + §2 + P7 first** (source-shape only — keeps the decomp clean & portable). If the
   `.text` *size* differs by the width of a repeated `(T)cast`, apply **P11** (materialize-once).
3. **P5/P6** if the diff is a signed sub-field / re-extended loop counter (shift-domain).
4. **§9 declaration/first-use order**, then **P4 pins**, for a clean register permutation.
5. **P1 reg-barrier** to fence a live range; **P3 instruction scripting** to force one exact
   insn / stack-arg routing; **P2 `+m` mem-barrier** only for a stubborn spill-decision.
6. `make compare` is the oracle at every step; keep the *smallest* set of asm hacks that
   reaches OK (prefer removing a hack for a source-shape lever once matched).

**Caveat / provenance.** P1–P3 (inline-asm constraints) are *match-forcing*, not idiomatic
decomp — they encode the answer rather than discovering the source shape, and are non-portable
across compilers. Prefer P8/P7/P5/P6 (real source levers) and escalate to asm-constraints only
for reg-coloring/spill NEARs that resist everything else (Qua5T's extreme pressure is the
justified end of the spectrum; jmNW8's zero-asm form is the ideal). All eight patterns above
are credited to **TsilaAllaoui** (decomp.me), whose forks supplied the worked examples.

### Field application to the still-unmatched registry (D292 Phase 4)
Applying the above to the ~21 `DECOMP_THEN_UPDATE` registry functions confirmed they are the
**reg-coloring / spill permuter-floor** — the residue left after the community already ground
them down. Worked outcomes (decomp-permuter with the FE8J `-mjp-promote` config, `scripts/
permuter/permute.sh bg … --stop-on-zero`):
- **sub_807C8DC `AdjustNewUnitPosition`** (308 B, fe8u `muctrl.c` verbatim): `-mjp-promote`
  gave a 74 B NEAR; the permuter found the **P11** temp-reuse of `(s8)pos->x` → **74→27 B**
  and fixed `.text` size. The last **27 B are an irreducible `{r2 r3 r4 r5}` register cycle**
  (outer/inner loop counters `iy`/`ix` want caller-saved r2/r4; agbcc colours them r5/r3).
  The permuter plateaued there ~50 k iters; §9 decl-order/int-widen are no-ops or regress;
  P4 pins and P1 barriers **regress** (agbcc materialises `register asm("rN")` locals with
  shuffle `mov`s rather than allocating there). Left as asm (strong NEAR).
- **sub_8001570 `AddAttr2dBitMap`** (224 B, fe8u `hardware.c` verbatim, clean leaf): the
  **closest** — `-mjp-promote` gave 8 B; swapping the inner-loop declaration order
  `u16 *dst2 = dst;` **before** `const u16 *src = _src + _ix;` matched the loop-setup schedule
  → **8→2 B**. The last **2 B are an irreducible prologue mov-pair emission order**
  (`mov ip,r6` [width→_width] vs `mov r8,r2` [height→_height]) — a scheduler tie-break that
  resisted ~20 source forms (save/decl/compute/multiply order, chained/indirect assigns,
  dependency tricks), P1/scheduling barriers, 8 `-fno-*`/`-O1` flags (agbcc has **no**
  `-fno-schedule-insns`), and the permuter (130 k iters, plateaued at 2 B). Left as asm — a
  clean 2-byte NEAR not worth an asm hack.
- **sub_800E1FC `Event18_ColorFade`** (204 B, fe8u `eventscr.c` verbatim): 204/204
  mnemonic-identical, ~95 B pure register permutation; permuter plateaued ~965. Left as asm.
- **sub_80D1844 `LoadClassNameInClassReelFont`** (140 B): needs moving-pointer + separate
  live counter + top-peel simultaneously; no source phrasing forces all three (do-while gets
  the allocation but agbcc dumps the literal pool inline at the rotated loop entry → 144 B).
  Best clean form 25/140. Left as asm (permuter target). — [SUPERSEDED 2026-07-03: MATCHED
  byte-exact in-repo (banked), removed from `src/nonmatching/`.]

**Lesson:** the productive levers on this floor were **source-shape** — **P11** (permuter-found)
on sub_807C8DC and **declaration-order scheduling** (§9) on sub_8001570 each cleared most of the
residual. What remains is the true floor: **pure register cycles** (no nameable temp to re-seat)
and **prologue/epilogue mov-pair emission order** — agbcc scheduler tie-breaks that don't
respond to source, and hard **P4/P1 register pins regress** rather than help. These are best
left NEAR (or handed to a long permuter run) rather than force-matched with asm constraints.
