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



//! FE8U = 0x0803C284
s8 GetAiBestSafeStaffTargetPosition(struct Vec2* out) {
    int ix;
    int iy;

    u32 maxVal = 0;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            u32 val;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (gMapRangeSigned[iy][ix] == 0) {
                continue;
            }

            if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId) {
                continue;
            }

            val = ((AiGetTerrainCombatPositionScoreComponent(ix, iy) + AiGetFriendZoneCombatPositionScoreComponent(ix, iy)) - gBmMapOther[iy][ix] / 8) + 0x7FFFFFFF;

            if (maxVal >= val) {
                continue;
            }

            out->x = ix;
            out->y = iy;
            maxVal = val;
        }
    }

    if (maxVal != 0) {
        return 1;
    }

    return 0;
}
