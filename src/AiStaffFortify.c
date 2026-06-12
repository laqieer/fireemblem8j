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

//! FE8U = 0x0803FF00
void AiStaffFortify(int itemIdx,  s8 (*isEnemy)(struct Unit* unit)) {
    int ix;
    int iy;
    int tempUnk;

    int bestUnk = 0;
    int xDecision = 0;
    int yDecision = 0;

    if (gAiState.flags & AI_FLAG_BERSERKED) {
        return;
    }

    if (AiCountCurrentPhaseFlaggedUnits() <= 2) {
        return;
    }

    AiGenerateUnitMovementMapRespectStay(gActiveUnit);

    GenerateMagicSealMap(-1);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0 || gBmMapUnit[iy][ix] == gActiveUnitId) {
                BmMapFill(gBmMapRange, 0);

                MapAddInRange(ix, iy, GetUnitMagBy2Range(gActiveUnit), 1);

                tempUnk = AiCountAlliedFlaggedUnitsInRange();

                if (tempUnk > bestUnk) {
                    bestUnk = tempUnk;
                    xDecision = ix;
                    yDecision = iy;
                }
            }
        }
    }

    if (bestUnk > 1) {
        AiSetDecision(xDecision, yDecision, AI_ACTION_STAFF, 0, itemIdx, 0, 0);
    }

    return;
}
