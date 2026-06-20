#include "global.h"
s8 AiUnitHasUsableWeaponOrStaff(struct Unit* unit);
u8 GetAiSilenceEffectivenessScore(struct Unit* unit);
#include "cp_common.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmphase.h"
#include "cp_utility.h"
#include "constants/items.h"

//! FE8U = 0x08040354
void AiStaffSilence(int itemIdx, s8 (*isEnemy)(struct Unit* unit)) {
    u8 tmp;
    int i;
    struct Vec2 pos;

    u8 bestUnk = 0;
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

            if (unit->statusIndex == UNIT_STATUS_SILENCED) {
                continue;
            }

            if (!AiCanUnitUseAnyStaff(unit)) {
                continue;
            }

            if (AiIsWithinRectDistance(gActiveUnit->xPos, gActiveUnit->yPos, unit->xPos, unit->yPos, GetUnitMagBy2Range(gActiveUnit) + UNIT_MOV(gActiveUnit)) == 0) {
                continue;
            }

            if (AiUnitHasUsableWeaponOrStaff(unit) == 0) {
                continue;
            }

            tmp = GetAiSilenceEffectivenessScore(unit);

            if (tmp == 0) {
                continue;
            }

            if (tmp >= bestUnk) {
                BmMapFill(gBmMapRange, 0);

                MapAddInRange(unit->xPos, unit->yPos, GetUnitMagBy2Range(gActiveUnit), 1);

                if (GetAiBestSafeStaffTargetPosition(&pos) != 0) {
                    bestUnk = tmp;
                    xDecision = pos.x;
                    yDecision = pos.y;
                    targetId = unit->index;
                }
            }
        }
    }

    if (bestUnk != 0) {
        AiSetDecision(xDecision, yDecision, AI_ACTION_STAFF, targetId, itemIdx, 0, 0);
    }

    return;
}
