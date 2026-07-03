/* NON_MATCHING: byte source is asm/sub_807D3BC.s @ JP 0x0807D3BC (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 *
 * Proposed name: SelectSummonPos (US mapanim_summon.c:204 is the FUNCTIONAL
 * analogue, but the JP body is a DIFFERENT ALGORITHM — see below — so this is a
 * from-JP-asm reconstruction, NOT a US port).
 *
 * BUILD FLAGS: -mjp-promote  (this TU was compiled with it; it promotes the s8
 *   loop vars ix/iy/count/i/j to int register residence, generating the
 *   `movs r2,#0x80; lsls r2,#0x11` = 0x01000000 promote-accumulator sign-extend
 *   pattern the JP asm uses. Without it the match regresses ~11 points.)
 *
 * ============================================================================
 * ALGORITHM (JP is NOT the US algorithm):
 *   US SelectSummonPos uses NextRN_N over a contiguous candidate array. JP
 *   sub_807D3BC instead: (1) walks the 3x3 grid writing array[count].x/y BEFORE
 *   the validity checks; on FAIL sets boolAvailable|=0xff, on PASS sets =1 and
 *   count++; (2) if count==0 return -1; (3) zero-fills indices[9]; (4) compacts
 *   the PASSED slots into indices[]; (5) pick = DivRem(AdvanceGetLCGRNValue(),
 *   count+1) - 1; *result = array[indices[pick]]; return 1.
 *   Callees: DivRem=sub_80D637C, CanUnitCrossTerrain=sub_8019174.
 * ============================================================================
 *
 * MATCH STATUS (this reconstruction, v7):  NOT byte-exact.
 *   Register-blind (mnemonic LCS, instruction-for-instruction) = 93.5% (173/185);
 *   192 JP insns vs 193 mine; raw byte-diff 331/392. The raw byte figure is
 *   INFLATED by a register-renumber cascade seeded by ONE frame-size divergence
 *   (see #1) — the *instructions* are ~99% aligned; only their register operands
 *   differ. (Prior hand-recon without -mjp-promote: register-blind 82.2%, byte
 *   232/392 — this reconstruction is structurally CLOSER, same algorithm.)
 *
 * EXACT BLOCKING DIFFS (agbcc register-allocation decisions, not source-forceable):
 *
 *   1. FRAME SIZE — mine `sub sp,#140`, JP `sub sp,#144` (0x90). JP reserves ONE
 *      extra 4-byte spill slot [sp,#0x84] into which it spills the outer-loop var
 *      iy, reloading it (`ldr [sp,#0x84]`) at the outer-loop back-edge. Mine keeps
 *      iy in a register (no spill) → smaller frame. This one divergence renumbers
 *      every sp-relative slot below it and cascades the raw byte-diff.
 *
 *   2. REJECT-CONSTANT: LICM-hoist vs rematerialize (the ROOT of #1).
 *      JP hoists 0xff into r2 once per OUTER iteration (`movs r2,#0xff`) and uses
 *      the held register in the fail path (`ldrb r0,[r4,#2]; orrs r0,r2; strb`).
 *      Mine rematerializes the constant at the fail site (`ldrb r1,[r5,#2];
 *      movs r0,#255; orrs r0,r1; strb`). Holding 0xff in a register costs JP one
 *      register → forces the iy spill in #1. From provably-constant C, agbcc
 *      always chooses rematerialize (movs #255 is a cheap 2-byte immediate); a
 *      mask local (`int reject=0xff; |= reject`) DOES fix the loop-pointer
 *      induction (getting `orrs`, r-maintained address) but agbcc still peephole-
 *      rematerializes the immediate rather than hoisting it.
 *
 *   3. ZERO-FILL STRENGTH REDUCTION: JP strength-reduces
 *      `for (n=8; n>=0; n--) indices[n]=0` into a decrementing pointer walk
 *      (`add r0,sp,#116` base; `strb`,`subs`; SIGNED `cmp`/`bge`). Mine keeps the
 *      index form (`adds`; `cmp n,#0`; `bge`). An explicit `s8* p` pointer walk
 *      yields an UNSIGNED pointer compare (`bcs/bcc`) — wrong direction — so no
 *      source form reproduces JP's signed-compare pointer induction here.
 *
 * LEVERS TRIED (none reached 0; -mjp-promote is the only net-positive one):
 *   +mjp-promote (KEY, 43->72% on .o), De-Morgan `||` fail-inline inversion (+8pt),
 *   int zero-fill vs s8/reuse-i (int best), mask-local reject (induction fix),
 *   reject=-1 vs 0xff, reject reassigned per-outer-iteration (agbcc re-hoists it
 *   out), `register int reject` (ignored), decl reordering, register asm() pins
 *   (HURT allocation). decomp-permuter: base score 1695, plateau ~875 after
 *   60k+ iterations across two seeds (v7 and reject=-1) — the residual is pure
 *   agbcc register coloring the randomizer cannot cross from this structure.
 *
 * VERDICT: MATCHABLE-in-principle JP-specific reimplementation (confirmed NOT the
 *   US algorithm, needs -mjp-promote), currently walled by an agbcc register-
 *   allocation micro-decision (reject hoist -> iy spill -> frame 140 vs 144).
 *   Graduate via a longer permuter search or the exact hoist trick; then move to
 *   src/, flip the carved_rom row asm->src, drop the SelectSummonPos baseline
 *   alias (layout/baseline_syms_drop.d/), delete the .s; make compare must stay OK.
 */

#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "rng.h"
#include "mapanim.h"

extern int DivRem(int, int);

//! FE8U = 0x0807D3BC (SelectSummonPos)
s8 sub_807D3BC(int x, int y, struct SumThing* result)
{
    extern int CanUnitCrossTerrain(struct Unit* unit, int terrain);

    struct SumThing array[9];
    s8 indices[9];
    s8 count = 0;
    s8 i, j;
    s8 ix, iy;
    s8 pick;
    int n;
    int reject = 0xff;

    for (iy = y - 1; iy < y + 2; iy++) {
        for (ix = x - 1; ix < x + 2; ix++) {
            array[count].x = ix;
            array[count].y = iy;

            if (iy >= gBmMapSize.y || ix >= gBmMapSize.x || iy < 0 || ix < 0 ||
                gBmMapUnit[iy][ix] != 0 ||
                (gPlaySt.chapterVisionRange && gBmMapFog[iy][ix] == 0) ||
                !CanUnitCrossTerrain(&gBattleActor.unit, gBmMapTerrain[iy][ix])) {
                array[count].boolAvailable |= reject;
            } else {
                array[count].boolAvailable = 1;
                count++;
            }
        }
    }

    if (!count)
        return -1;

    for (n = 8; n >= 0; n--)
        indices[n] = 0;

    for (j = 0, i = 0; i < count; i++) {
        if (array[i].boolAvailable == 1) {
            indices[j] = i;
            j++;
        }
    }

    pick = DivRem(AdvanceGetLCGRNValue(), count + 1) - 1;
    *result = array[indices[pick]];
    return 1;
}
