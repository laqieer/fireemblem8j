/* NON_MATCHING: byte source is asm/sub_807C8DC.s @ JP 0x0807C8DC (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 * Residual = agbcc spill-decision/reg-coloring vs the JP build (see
 * /tmp/longperm/807C8DC/residual.txt); near-match build flags: // FLAGS: -mjp-promote.
 * Graduate via permuter/lever -> move to src/, flip the carved_rom row, drop asm. */
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
