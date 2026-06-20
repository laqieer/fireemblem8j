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

//! FE8U = 0x0803FBB8
void AiStaffHealMendRecover(int itemIdx, s8 (*isEnemy)(struct Unit* unit)) {
    int ix;
    int iy;
    struct Vec2 pos;

    u8 lowestHpPerc = 100;

    int xDecision = -1;
    int yDecision = -1;
    int targetId = 0;

    AiGenerateUnitMovementMapRespectStay(gActiveUnit);

    GenerateMagicSealMap(-1);

    MarkMovementMapEdges();

    if (gAiState.unk7C != 0) {
        lowestHpPerc = gAiState.unk7C;
    }

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            u8 tmpHpPerc;
            struct Unit* unit;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0 || gBmMapUnit[iy][ix] == gActiveUnitId) {
                continue;
            }

            unit = GetUnit(gBmMapUnit[iy][ix]);

            if ((gAiState.flags & AI_FLAG_BERSERKED) || (isEnemy == 0) || (isEnemy(unit) != 1)) {

                if ((gAiState.unk7C != 0) || (unit->aiFlags & AI_UNIT_FLAG_0)) {

                    tmpHpPerc = Div(GetUnitCurrentHp(unit) * 100, GetUnitMaxHp(unit));

                    if (tmpHpPerc <= lowestHpPerc && GetAiSafestAccessibleAdjacentPosition(ix, iy, &pos) != 0) {
                        lowestHpPerc = tmpHpPerc;
                        xDecision = pos.x;
                        yDecision = pos.y;
                        targetId = gBmMapUnit[iy][ix];
                    }
                }
            }
        }
    }

    if (xDecision != -1) {
        AiSetDecision(xDecision, yDecision, AI_ACTION_STAFF, targetId, itemIdx, 0, 0);
    }

    return;
}
