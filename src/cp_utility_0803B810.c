#include "global.h"

#include "cp_common.h"

#include "cp_data.h"
#include "bmunit.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "rng.h"
#include "bmitem.h"
#include "bmphase.h"

#include "constants/items.h"
#include "constants/terrains.h"

#include "cp_utility.h"

// forward decl.
s8 AiGetChestUnlockItemSlot(u8*);
void SetupUnitStatusStaffAIFlags(struct Unit*, u16);
void SetupUnitHealStaffAIFlags(struct Unit*, u16);
void SaveNumberOfAlliedUnitsIn0To8Range(struct Unit*);



//! FE8U = 0x0803B808
s8 AiFindSafestReachableLocation(struct Unit* unit, struct Vec2* out) {
    int ix;
    int iy;

    u8 bestDanger = 0xff;

    if (gAiState.flags & AI_FLAG_STAY) {
        BmMapFill(gBmMapMovement, -1);
        gBmMapMovement[unit->yPos][unit->xPos] = 0;
    } else {
        GenerateUnitMovementMap(unit);
    }

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId) {
                continue;
            }

            if (bestDanger < gBmMapOther[iy][ix]) {
                continue;
            }

            out->x = ix;
            out->y = iy;

            bestDanger = gBmMapOther[iy][ix];
        }
    }

    if (bestDanger != 0xFF) {
        return 1;
    }

    return 0;
}
