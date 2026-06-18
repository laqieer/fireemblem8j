#include "global.h"
#include "cp_common.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmphase.h"
#include "cp_utility.h"
#include "constants/items.h"

//! FE8U = 0x0803FD30
void AiStaffPhysicRescue(int itemIdx, s8 (*isEnemy)(struct Unit* unit)) {
    int i;
    struct Vec2 pos;

    u8 lowestHpPerc = 100;
    int xDecision = -1;
    int yDecision = -1;
    int targetId = 0;

    if (gAiState.flags & AI_FLAG_BERSERKED) {
        return;
    }

    AiGenerateUnitMovementMapRespectStay(gActiveUnit);

    GenerateMagicSealMap(-1);

    if (gAiState.unk7C != 0) {
        lowestHpPerc = gAiState.unk7C;
    }

    for (i = 1; i < 0xC0; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (gBmMapUnit[unit->yPos][unit->xPos] == gActiveUnitId) {
            continue;
        }

        if (unit->state & (US_HIDDEN | US_DEAD | US_BIT16)) {
            continue;
        }

        if ((gAiState.flags & AI_FLAG_BERSERKED) || (isEnemy == 0) || (isEnemy(unit) != 1)) {
            if ((gAiState.unk7C != 0) || (unit->aiFlags & AI_UNIT_FLAG_0)) {
                u8 tmpHpPerc;

                if (AiIsWithinRectDistance(gActiveUnit->xPos, gActiveUnit->yPos, unit->xPos, unit->yPos, GetUnitMagBy2Range(gActiveUnit) + UNIT_MOV(gActiveUnit)) == 0) {
                    continue;
                }

                BmMapFill(gBmMapRange, 0);

                MapAddInRange(unit->xPos, unit->yPos, GetUnitMagBy2Range(gActiveUnit), 1);

                if (GetAiBestSafeStaffTargetPosition(&pos) == 0) {
                    continue;
                }

                tmpHpPerc = Div(GetUnitCurrentHp(unit) * 100, GetUnitMaxHp(unit));

                if (tmpHpPerc <= lowestHpPerc) {
                    lowestHpPerc = tmpHpPerc;
                    xDecision = pos.x;
                    yDecision = pos.y;
                    targetId = gBmMapUnit[unit->yPos][unit->xPos];
                }
            }
        }
    }

    if (xDecision != -1) {
        AiSetDecision(xDecision, yDecision, AI_ACTION_STAFF, targetId, itemIdx, 0, 0);
    }

    return;
}
