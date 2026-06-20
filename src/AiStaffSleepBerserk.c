#include "global.h"
s8 AiUnitHasUsableWeaponOrStaff(struct Unit* unit);
#include "cp_common.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmphase.h"
#include "cp_utility.h"
#include "constants/items.h"

//! FE8U = 0x080404E0
void AiStaffSleepBerserk(int itemIdx, s8 (*isEnemy)(struct Unit* unit)) {
    u8 accuracy;
    int i;
    struct Vec2 pos;

    u8 best = 0;
    int xDecision = 0;
    int yDecision = 0;
    int targetId = 0;

    if (gAiState.flags & AI_FLAG_BERSERKED) {
        return;
    }

    AiGenerateUnitMovementMapRespectStay(gActiveUnit);
    GenerateMagicSealMap(-1);

    for (i = 1; i < 0xC0; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_HIDDEN | US_DEAD | US_BIT16)) {
            continue;
        }

        if ((gAiState.flags & AI_FLAG_BERSERKED) || (isEnemy == 0) || (isEnemy(unit) != 0)) {
            if (unit->statusIndex != UNIT_STATUS_NONE) {
                continue;
            }

            if (AiIsWithinRectDistance(gActiveUnit->xPos, gActiveUnit->yPos, unit->xPos, unit->yPos, GetUnitMagBy2Range(gActiveUnit) + UNIT_MOV(gActiveUnit)) == 0) {
                continue;
            }

            if (!AiUnitHasUsableWeaponOrStaff(unit)) {
                continue;
            }

            accuracy = GetOffensiveStaffAccuracy(gActiveUnit, unit);

            if (accuracy < 5) {
                continue;
            }

            if (accuracy + unit->level < best)  {
                continue;
            }

            BmMapFill(gBmMapRange, 0);

            MapAddInRange(unit->xPos, unit->yPos, GetUnitMagBy2Range(gActiveUnit), 1);

            if (GetAiBestSafeStaffTargetPosition(&pos) != 0) {
                best = unit->level;
                xDecision = pos.x;
                yDecision = pos.y;
                targetId = unit->index;
            }
        }
    }

    if (best != 0) {
        AiSetDecision(xDecision, yDecision, AI_ACTION_STAFF, targetId, itemIdx, 0, 0);
    }

    return;
}
