/* AdjustNewUnitPosition (JP sub_807C8DC), adapted from TsilaAllaoui's score-0
 * decomp.me fork gdTId in the taZrH family. The fork's register/source shape is
 * retained, while its scratch-only absolute addresses and temporary callee name
 * are replaced with the project's real map globals and
 * AiGetUnitClosestValidPosition symbol.
 */
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
        register int iy asm("r2");
        register int ix asm("r4");
        register int yCur asm("r5");
        register int xCur asm("r1");
        register int xBase asm("r8");
        register int yBase asm("r9");
        register int nextIy asm("ip");
        register int off asm("r3");
        u8 idx = 0;

        GenerateExtendedMovementMapOnRange(pos->x, pos->y, GetUnitMovementCost(unit));

        iy = -1;
        xBase = (u8) pos->x;
        yBase = (u8) pos->y;

    outer:
        ix = -1;
        nextIy = iy + 1;

        {
            register int tmp asm("r0");

            tmp = iy + yBase;
            yCur = (s8) tmp;
        }

    inner:
        {
            register int tmp asm("r0");

            tmp = ix + xBase;
            xCur = (s8) tmp;
        }

        if ((ix != 0) || (iy != 0))
        {
            void * map;

            map = gBmMapUnit;
            off = yCur << 2;

            if (((*((u8 **) (off + (u32) map)))[xCur] == 0) &&
                ((*((u8 **) (off + (u32) gBmMapOther)))[xCur] == 0) &&
                ((*((u8 **) (off + (u32) gBmMapHidden)))[xCur] == 0))
            {
                register s8 ** row asm("r0");

                row = (s8 **) (off + (u32) gMapRangeSigned);

                if ((*row)[xCur] >= 0)
                {
                    register struct Vec2 * dst asm("r0");

                    dst = &buf[idx];
                    dst->x = xCur;
                    asm volatile("strh %0, [%1, #2]" : : "r"(yCur), "r"(dst));
                    idx = idx + 1;
                }
            }
        }

        {
            register int tmp asm("r0");

            tmp = ix + 1;
            ix = (s8) tmp;
        }

        if (ix <= 1)
            goto inner;

        iy = nextIy;

        {
            register int tmp asm("r0");

            tmp = iy << 24;
            iy = tmp >> 24;
        }

        if (iy <= 1)
            goto outer;

        if (idx != 0)
        {
            u8 random = NextRN_N(idx);

            pos->x = buf[random].x;
            pos->y = buf[random].y;
        }
    }
    else if ((flags & 1) != 0)
    {
        register int x asm("r4");
        register int y asm("r2");
        register void * map asm("r1");
        register int off asm("r0");

        x = (s8) pos->x;
        y = (s8) pos->y;
        map = gBmMapTerrain;
        off = y << 2;

        if ((*((u8 **) (off + (u32) map)))[x] != 0)
        {
            register struct Unit * callUnit asm("r0");
            register int callX asm("r1");
            register struct Vec2 * callPos asm("r3");

            callUnit = unit;
            callX = x;
            asm volatile("" : : "r"(callX));
            callPos = pos;
            AiGetUnitClosestValidPosition(callUnit, callX, y, callPos);
        }
    }
}
