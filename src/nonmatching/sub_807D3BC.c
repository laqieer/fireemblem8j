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
 * MATCH STATUS (2026-07-11 reject-lifetime pass): NOT byte-exact, but the best
 *   proven staging source is now 109/392 differing linked bytes, exact size 392
 *   and exact `sub sp,#144` frame. Progression from the committed v7 baseline:
 *     331 -> 210  destination readback + scoped empty-register barrier
 *     210 -> 201  scope `reject` inside the outer loop
 *     201 -> 138  signed-pointer zero-fill
 *     138 -> 109  do-while signed-pointer zero-fill (removes the pre-test)
 *   Semantics of this 109-byte candidate:
 *     prove_nonmatching.py = PROVEN-BOUNDED(1)
 *     differential_test.py --trials 60 = EQUIV (60/60)
 *
 * EXACT REMAINING ROOT:
 *
 *   1. `reject` is still LICM-hoisted to the loop preheader:
 *        mine +0x20 `movs r2,#0xff; str r2,[sp,#0x80]`
 *        JP   +0x20 `ldr r2,[sp,#0x78]; adds r2,#2; mov sl,r2`
 *      JP instead materializes `reject` per outer iteration at +0x3A:
 *        `ldr r3,=gBmMapSize; movs r2,#0xff`.
 *      Mine therefore keeps x+2 in r3, nextIy in sl, gBmMapSize in r2, and
 *      reloads reject into r1 at +0xB4. JP keeps x+2 in sl, spills nextIy at
 *      [sp,#0x84], keeps gBmMapSize in r3, and carries reject in r2 through the
 *      inner loop/call spill. This causes the remaining r4/r5 and r2/r3 rotation:
 *        mine +0xB2 `ldrb r0,[r5,#2]; ldr r1,[sp,#0x80]; orrs r0,r1`
 *        JP   +0xB2 `ldrb r0,[r4,#2];                 orrs r0,r2`.
 *
 *   2. ZERO-FILL SHAPE IS NOW CORRECT, but setup ordering/coloring still follows
 *      the reject-driven allocation. Both emit the exact decrementing
 *      `strb; subs; cmp; bge` loop at +0x114. Mine computes the end pointer before
 *      count+1 and colors base/zero as r1/r2; JP computes count+1 first and colors
 *      base/zero as r2/r1. The following compaction loop is consequently a clean
 *      register rotation (mine r1/r3/r4/r5 vs JP r5/r2/r3/r4).
 *
 * BOUNDED VARIANTS THIS PASS (stop after four as requested):
 *   (1) scoped reject + proven readback/barrier: 201;
 *   (2) a pre-init zero-instruction BB separator: no change (201);
 *   (3) signed-pointer zero-fill: 138;
 *   (4) do-while signed-pointer zero-fill: 109.
 * No long permuter, raw opcode asm, register pin, or global compiler flag used.
 *
 * VERDICT: UNSOLVED, objectively improved and proven-equivalent. The next useful
 * lever must make the compiler define 0xff inside the outer loop without giving
 * it a preheader stack home; do not regress to the old 331-byte experiments.
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

        asm("" : "=r"(reject) : "0"(reject));

        for (ix = x - 1; ix < x + 2; ix++) {
            array[count].x = ix;
            array[count].y = iy;

            if (iy >= gBmMapSize.y || ix >= gBmMapSize.x || iy < 0 || ix < 0 ||
                gBmMapUnit[iy][ix] != 0 ||
                (gPlaySt.chapterVisionRange && gBmMapFog[iy][ix] == 0) ||
                !CanUnitCrossTerrain(&gBattleActor.unit, gBmMapTerrain[iy][ix])) {
                u8 available = array[count].boolAvailable;

                available |= reject;
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
        *zero-- = 0;
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
