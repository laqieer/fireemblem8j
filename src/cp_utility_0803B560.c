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



//! FE8U = 0x0803B558
void FillMovementAndRangeMapForItem(struct Unit* unit, u16 item) {
    int ix;
    int iy;

    GenerateUnitMovementMap(unit);
    BmMapFill(gBmMapRange, 0);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            MapAddInBoundedRange(ix, iy, GetItemMinRange(item), GetItemMaxRange(item));
        }
    }

    return;
}

//! FE8U = 0x0803B5F8
void AiMakeMoveRangeUnitPowerMaps(struct Unit* unit) {
    int ix;
    int iy;

    int power = GetUnitPower(unit) > 20 ? 20 : GetUnitPower(unit);

    GenerateUnitMovementMap(unit);
    BmMapFill(gBmMapRange, 0);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            MapAddInRange(ix, iy, power, 1);
        }
    }

    return;
}

//! FE8U = 0x0803B678
void AiMakeMoveRangeItemRangeMaps(struct Unit* unit, u16 item) {
    int ix;
    int iy;

    GenerateUnitMovementMap(unit);
    BmMapFill(gBmMapRange, 0);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            MapAddInBoundedRange(ix, iy, GetItemMinRange(item), GetItemMaxRange(item));
        }
    }

    return;
}
