#include "global.h"
s8 GetAiSafestAccessibleAdjacentPosition(int x, int y, struct Vec2* out);
#include "cp_common.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmphase.h"
#include "cp_utility.h"
#include "constants/items.h"

//! FE8U = 0x08040164
void AiStaffRestore(int itemIdx, s8 (*isEnemy)(struct Unit* unit)) {
    int ix;
    int iy;
    struct Vec2 pos;

    u8 bestLevel = 0;
    int xDecision = 0;
    int yDecision = 0;
    int targetId = 0;

    if (gAiState.flags & AI_FLAG_BERSERKED) {
        return;
    }

    AiGenerateUnitMovementMapRespectStay(gActiveUnit);

    GenerateMagicSealMap(-1);
    MarkMovementMapEdges();

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            struct Unit* unit;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0) {
                continue;
            }

            unit = GetUnit(gBmMapUnit[iy][ix]);

            if ((gAiState.flags & AI_FLAG_BERSERKED) || (isEnemy == 0) || (isEnemy(unit) != 1)) {
                if (unit->statusIndex == UNIT_STATUS_NONE) {
                    continue;
                }

                if (unit->level < bestLevel) {
                    continue;
                }

                if (GetAiSafestAccessibleAdjacentPosition(ix, iy, &pos) != 0) {
                    bestLevel = unit->level;
                    xDecision = pos.x;
                    yDecision = pos.y;
                    targetId = gBmMapUnit[iy][ix];
                }
            }
        }
    }

    if (bestLevel != 0) {
        AiSetDecision(xDecision, yDecision, AI_ACTION_STAFF, targetId, itemIdx, 0, 0);
    }

    return;
}
