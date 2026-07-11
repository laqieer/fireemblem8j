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
 *   Callees: DivRem=DivRem, CanUnitCrossTerrain=sub_8019174.
 * ============================================================================
 *
 * MATCH STATUS (2026-07-11 bounded 3x20k campaign): NOT byte-exact, but the best
 *   proven staging source is now 82/392 differing linked bytes, exact size 392
 *   and exact `sub sp,#144` frame. Progression from the committed v7 baseline:
 *     331 -> 210  destination readback + scoped empty-register barrier
 *     210 -> 201  scope `reject` inside the outer loop
 *     201 -> 138  signed-pointer zero-fill
 *     138 -> 109  do-while signed-pointer zero-fill (removes the pre-test)
 *     109 -> 82   move the reject fence to the fail path after the OR, plus a
 *                 zero-instruction do-while separator around the zero-fill store
 *   Semantics of this 82-byte candidate:
 *     prove_nonmatching.py = PROVEN-BOUNDED(1)
 *     differential_test.py --trials 60 = EQUIV (60/60)
 *
 * EXACT REMAINING ROOT:
 *
 *   1. The reject lifetime and fail path are now correct: both carry 0xff in r2
 *      through the call spill and emit `ldrb; orrs r0,r2; strb` with no stack
 *      reload. Mine still materializes `movs r2,#0xff` 18 bytes too early at
 *      +0x28; JP emits it at +0x3A after loading gBmMapSize. Mine consequently
 *      keeps x+2 in r9 instead of sl, keeps iy in sl instead of r9, and swaps
 *      ix/array-pointer r4/r5. The remaining outer-loop body is otherwise a
 *      clean register-role permutation.
 *
 *   2. ZERO-FILL SHAPE IS CORRECT, but setup ordering/coloring still differs.
 *      Both emit the exact decrementing `strb; subs; cmp; bge` loop. Mine computes
 *      the end pointer before count+1; JP computes count+1 first. The following
 *      compaction loop remains a clean register rotation
 *      (mine r1/r3/r4/r5 vs JP r5/r2/r3/r4).
 *
 * BOUNDED COMPUTE CAMPAIGN:
 *   J1ka1 harvest: NONE (family base/best 8821).
 *   Actual -O2 -mjp-promote pipeline, three local-only 20,000-iteration lanes:
 *     improved seed: score 1400 -> 655, linked residual 109 -> 82;
 *     reject-r2/+r/+m(iy): score 3850 -> 2905, rejected (frame 0x8c,
 *       size 400, linked residual 307);
 *     countdown zero-fill: score 1700 -> 820, linked residual 176.
 *   No score 0. No unbounded run, remote execution, or raw-opcode asm.
 *
 * VERDICT: UNSOLVED, objectively improved and proven-equivalent. The next useful
 * lever must delay the r2 materialization to JP's +0x3A while preserving the
 * 0x90 frame and exact fail path; do not regress to the old 331-byte experiments.
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
    s8* zero;

    for (iy = y - 1; iy < y + 2; iy++) {
        int reject = 0xff;

        for (ix = x - 1; ix < x + 2; ix++) {
            array[count].x = ix;
            array[count].y = iy;

            if (iy >= gBmMapSize.y || ix >= gBmMapSize.x || iy < 0 || ix < 0 ||
                gBmMapUnit[iy][ix] != 0 ||
                (gPlaySt.chapterVisionRange && gBmMapFog[iy][ix] == 0) ||
                !CanUnitCrossTerrain(&gBattleActor.unit, gBmMapTerrain[iy][ix])) {
                u8 available = array[count].boolAvailable;

                available |= reject;
                asm("" : "=r"(reject) : "0"(reject));
                array[count].boolAvailable = available;
            } else {
                array[count].boolAvailable = 1;
                count++;
            }
        }
    }

    if (!count)
        return -1;

    zero = &indices[8];

    do {
        do {
            *zero-- = 0;
        } while (0);
    } while ((int) zero >= (int) indices);

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
