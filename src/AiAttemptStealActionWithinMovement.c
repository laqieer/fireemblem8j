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

//! FE8U = 0x0803DB60
s8 AiAttemptStealActionWithinMovement(void) {
    int ix;
    int iy;

    struct Vec2 pos;

    int itemSlot = 0;
    u8 rank = 0xff;
    u8 target = 0;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            struct Vec2 posTmp;
            struct Unit* unit;
            s8 slotTmp;
            u8 rankTmp;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0) {
                continue;
            }

            if (AreUnitsAllied(gActiveUnitId, gBmMapUnit[iy][ix]) == 1) {
                continue;
            }

            if (!AiFindBestAdjacentPositionByFunc(ix, iy, AiAttemptStealAction_GetMovementAt, &posTmp)) {
                continue;
            }

            unit = GetUnit(gBmMapUnit[iy][ix]);

            if (gActiveUnit->spd < unit->spd) {
                continue;
            }

            slotTmp = AiGetUnitStealItemSlot(unit);

            if (slotTmp < 0) {
                continue;
            }

            rankTmp = AiGetItemStealRank(ITEM_INDEX(unit->items[slotTmp]));

            if (rank < rankTmp) {
                continue;
            }

            rank = rankTmp;
            pos.x = posTmp.x;
            pos.y = posTmp.y;
            target = gBmMapUnit[iy][ix];
            itemSlot = slotTmp;
        }
    }

    if (rank != 0xFF) {
        gActiveUnit->ai_counter++;
        AiSetDecision(pos.x, pos.y, AI_ACTION_STEAL, target, itemSlot, 0, 0);

        return 1;
    }

    return 0;
}
