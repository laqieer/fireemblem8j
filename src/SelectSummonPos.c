#include "global.h"

#include "functions.h"
#include "variables.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "rng.h"
#include "mapanim.h"

/*
 * JP uses a different candidate-selection algorithm from the FE8U function.
 * This reconstruction matched through decomp.me fork hgL9F from the J1ka1
 * family.
 */
s8 SelectSummonPos(int x, int y, struct SumThing * result)
{
    extern int CanUnitCrossTerrain(struct Unit * unit, int terrain);

    struct SumThing array[9];
    s8 indices[9];
    s8 count = 0;
    s8 i;
    s8 j;
    s8 pick;
    s32 var_0;

    for (j = y - 1; j < y + 2; j++)
    {
        for (i = x - 1; i < x + 2; i++)
        {
            array[count].x = i;
            array[count].y = j;

            if (j >= gBmMapSize.y || i >= gBmMapSize.x)
            {
                array[count].boolAvailable |= -1;
            }
            else if (j < 0 || i < 0)
            {
                array[count].boolAvailable |= -1;
            }
            else if (gBmMapUnit[j][i] != 0)
            {
                array[count].boolAvailable |= -1;
            }
            else if ((gPlaySt.chapterVisionRange && gBmMapFog[j][i] == 0) ||
                     !CanUnitCrossTerrain(&gBattleActor.unit, gBmMapTerrain[j][i]))
            {
                array[count].boolAvailable |= -1;
            }
            else
            {
                array[count].boolAvailable = 1;
                count++;
            }
        }
    }

    if (!count)
        return -1;

    for (var_0 = 0; var_0 < 9; var_0++)
        indices[var_0] = 0;

    j = 0;
    i = 0;

    for (; i < count; i++)
    {
        if (array[i].boolAvailable == 1)
        {
            indices[j] = i;
            j++;
        }
    }

    pick = DivRem(AdvanceGetLCGRNValue(), count + 1) - 1;
    *result = array[indices[pick]];

    return 1;
}
