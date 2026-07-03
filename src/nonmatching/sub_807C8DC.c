/* NON_MATCHING: byte source is asm/sub_807C8DC.s @ JP 0x0807C8DC (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 *
 * BUILD FLAGS: -mjp-promote  (required for s8 ASR sign-extension on ix/iy loop vars)
 *
 * BLOCKING DIFFS (JP=308 bytes, Gen=304 bytes; 59 halfword diffs with this seed):
 *
 * 1. SIZE: Gen is 4 bytes shorter than JP.
 *    - JP else-branch loads posX into callee-saved r4, then copies r4→r1 before the
 *      AiGetUnitClosestValidPosition call (adds r1, r4, #0 = 2 bytes).
 *    - Gen loads posX directly into r1 (no copy needed, 2 bytes saved).
 *    - JP epilogue has 2 bytes padding (.align); Gen has 0 bytes (shorter epilogue).
 *
 * 2. IF-BRANCH REGISTER ALLOCATION (≈28 diffs):
 *    - JP:  iy→r2 (volatile), ix→r4 (callee-saved), yCur→r5, xCur→r6
 *    - Gen: iy→r5 (callee-saved), ix→r3 (volatile), yCur→r4, xCur→r2
 *    agbcc assigns iy/ix to opposite register banks from the JP compiler.
 *
 * 3. ELSE-BRANCH REGISTER ALLOCATION (≈8 diffs):
 *    - JP:  posY→r2 (ldrsb), posX→r4 (callee-saved ldrsh, re-cast to s8)
 *    - Gen: posY→r2 (ldrsb), posX→r1 (volatile ldrsb, direct)
 *    Load order: JP does pos->x ldrsh first, Gen does pos->y ldrsb first.
 *
 * VARIANTS TRIED (none reached 0 diffs):
 *   v4/v9: Add `s8 posX = (s8)pos->x;` local in else-branch → 308 bytes (size OK),
 *          44 diffs, but unit parameter spills to r8 (hi register, cascading diffs).
 *   v5-v8: Various declaration order / widening / else-if rewrites → no improvement.
 *   All: Register coloring is a fundamental agbcc vs JP compiler difference.
 *        No single C source restructuring reconciles both if-branch and else-branch.
 *
 * TO GRADUATE: Need permuter or manual asm stub to fix if-branch register coloring.
 * Graduate via permuter/lever -> move to src/, flip carved_rom row, drop asm. */
// AdjustNewUnitPosition (JP sub_807C8DC) = fe8u muctrl.c:475 verbatim.
// Callees: GetUnitMovementCost, GenerateExtendedMovementMapOnRange, NextRN_N,
//          AiGetUnitClosestValidPosition (= JP sub_803BD70, already carved+named).
#include "global.h"

#include "bmunit.h"
#include "mu.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "cp_utility.h"
#include "bmidoten.h"
#include "rng.h"

void AdjustNewUnitPosition(struct Unit * unit, struct Vec2 * pos, u16 flags)
{
    struct Vec2 buf[8];

    if ((flags & 2) != 0)
    {
        s8 ix;
        s8 iy;

        u8 idx = 0;

        GenerateExtendedMovementMapOnRange(pos->x, pos->y, GetUnitMovementCost(unit));

        for (iy = -1; iy <= 1; iy++)
        {
            for (ix = -1; ix <= 1; ix++)
            {
                s8 xCur = pos->x + ix;
                s8 yCur = pos->y + iy;

                if ((ix == 0) && (iy == 0))
                    continue;

                if (gBmMapUnit[yCur][xCur] != 0)
                    continue;

                if (gBmMapOther[yCur][xCur] != 0)
                    continue;

                if (gBmMapHidden[yCur][xCur] != 0)
                    continue;

                if (gMapRangeSigned[yCur][xCur] < 0)
                    continue;

                buf[idx].x = xCur;
                buf[idx].y = yCur;

                idx++;
            }
        }

        if (idx != 0)
        {
            u8 random = NextRN_N(idx);
            pos->x = buf[random].x;
            pos->y = buf[random].y;
        }
    }
    else
    {
        if ((flags & 1) != 0)
        {
            if (gBmMapTerrain[(s8)pos->y][(s8)pos->x] != 0)
            {
                AiGetUnitClosestValidPosition(unit, (s8)pos->x, (s8)pos->y, pos);
            }
        }
    }

    return;
}
