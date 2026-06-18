#include "global.h"
#include <string.h>
#include "constants/items.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/terrains.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "bmtrick.h"
#include "monstergen.h"
#include "prepscreen.h"
#include "uiselecttarget.h"
#include "bmdifficulty.h"
#include "cp_utility.h"
#include "bmudisp.h"
#include "bmsave.h"
#include "muctrl.h"
#include "bmmind.h"
#include "eventcall.h"

s8 CanUnitMove(void) {
    s8 adjLookup[4 * 2] = {
        -1, 0,
        0, -1,
        +1, 0,
        0, +1,
    };

    int move = UNIT_MOV(gActiveUnit) - gActionData.moveCount;

    int xUnit = gActiveUnit->xPos;
    int yUnit = gActiveUnit->yPos;

    int i;

    for (i = 0; i < 4; ++i) {
        int xLocal = xUnit + adjLookup[i*2 + 0];
        int yLocal = yUnit + adjLookup[i*2 + 1];

        int cost;

        if (gBmMapUnit[yLocal][xLocal] & FACTION_RED)
            continue;

        cost = GetUnitMovementCost(gActiveUnit)[gBmMapTerrain[yLocal][xLocal]];

        if ((cost < 0) || (cost > move))
            continue;

        return TRUE;
    }

    return FALSE;
}
