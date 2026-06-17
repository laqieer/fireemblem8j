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


struct RangeScore {
    /* 00 */ s8 x;
    /* 01 */ s8 y;
    /* 02 */ s8 score;
};

s8 AiAttemptBallistaCombat(s8 (*isEnemy)(struct Unit* unit), struct AiCombatSimulationSt* st) {
    struct AiCombatSimulationSt tmpResult;

    int iy;
    int ix;
    int i;

    u16 item;

    int ballistaCount = 0;

    u8 ballistaItemIds[] = {
        ITEM_BALLISTA_REGULAR, ITEM_BALLISTA_LONG, ITEM_BALLISTA_KILLER
    };

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            item = GetBallistaItemAt(ix, iy);

            if (item != 0) {
                ballistaCount++;
                gMapMovementSigned[iy][ix] = item;
            } else {
                gMapMovementSigned[iy][ix] = -1;
            }
        }
    }

    if (ballistaCount == 0) {
        return 0;
    }

    st->targetId = 0;
    st->score = 0;

    for (i = 0; i < 3; i++) {
        item = ballistaItemIds[i];
        st->itemSlot = -1;

        {
            int uid;
            for (uid = 1; uid < 0xC0; uid++) {
                struct Unit* unit = GetUnit(uid);

                if (!UNIT_IS_VALID(unit)) {
                    continue;
                }

                if (unit->state & (US_HIDDEN | US_DEAD | US_RESCUED | US_BIT16)) {
                    continue;
                }

                if (!isEnemy(unit)) {
                    continue;
                }

                if (!AiReachesByBirdsEyeDistance(gActiveUnit, unit, item)) {
                    continue;
                }

                AiFillReversedAttackRangeMap(unit, item);

                tmpResult.targetId = unit->index;

                if (!AiSimulateBestBallistaBattleAgainstTarget(&tmpResult, item)) {
                    continue;
                }

                if (tmpResult.score >= st->score) {
                    st->xMove = tmpResult.xMove;
                    st->yMove = tmpResult.yMove;
                    st->targetId = tmpResult.targetId;
                    st->score = tmpResult.score;
                }
            }
        }
    }

    if ((st->score != 0) || (st->targetId != 0)) {
        return 1;
    }

    return 0;
}
