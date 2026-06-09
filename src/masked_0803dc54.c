#include "global.h"

#include "cp_common.h"

#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmarch.h"
#include "bmitem.h"
#include "bmphase.h"
#include "cp_common.h"
#include "cp_utility.h"
#include "bmbattle.h"
#include "cp_data.h"

#include "constants/items.h"



/* file-scope type definitions used by this run */


struct RangeScore {
    /* 00 */ s8 x;
    /* 01 */ s8 y;
    /* 02 */ s8 score;
};

/* prototypes for same-file helpers called by this run */
u32 AiGetCombatPositionScore(int x, int y, struct AiCombatSimulationSt* st);
s8 AiSimulateBattleAgainstTargetAtPosition(struct AiCombatSimulationSt* st);

//! FE8U = 0x0803DCC4
s8 AiSimulateBestBattleAgainstTarget(struct AiCombatSimulationSt* st) {
    int ix;
    int iy;

    u32 score = 0;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            u32 scoreTmp;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (gMapRangeSigned[iy][ix] == 0) {
                continue;
            }

            if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId) {
                continue;
            }

            scoreTmp = AiGetCombatPositionScore(ix, iy, st);

            if (scoreTmp <= score) {
                continue;
            }

            st->xMove = ix;
            st->yMove = iy;
            score = scoreTmp;
        }
    }

    if (score == 0) {
        return 0;
    }

    return AiSimulateBattleAgainstTargetAtPosition(st);
}
