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

//! FE8U = 0x0804000C
void AiStaffWarp(int itemIdx,  s8 (*isEnemy)(struct Unit* unit)) {
    int ix;
    int iy;
    struct Vec2 out;

    u8 level = 0;
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
                if (unit->aiFlags & (AI_UNIT_FLAG_0 | AI_UNIT_FLAG_3)) {
                    continue;
                }

                if (unit->level < level) {
                    continue;
                }

                if (GetAiSafestAccessibleAdjacentPosition(ix, iy, &out) != 0) {
                    level = unit->level;
                    xDecision = out.x;
                    yDecision = out.y;
                    targetId = gBmMapUnit[iy][ix];
                }
            }
        }
    }

    if ((level != 0) && (GetAiWarpDestinationNearThreatenedAlly(&out) != 0)) {
        AiSetDecision(xDecision, yDecision, AI_ACTION_STAFF, targetId, itemIdx, out.x, out.y);
    }

    return;
}
