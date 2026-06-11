#include "global.h"

#include "cp_common.h"

#include "bmidoten.h"
#include "bmmap.h"
#include "bmunit.h"
#include "bmphase.h"
#include "bmitem.h"
#include "bmarch.h"
#include "rng.h"
#include "cp_utility.h"
#include "cp_data.h"
#include "cp_script.h"

#include "constants/items.h"
#include "constants/terrains.h"



// forward declarations
void AiFillDangerMap(void);
s8 AiUpdateGetUnitIsHealing(struct Unit*);
const struct AiEscapePt* GetEscapePointStructThingMaybe(void);
void AiMarkStaffCapabilityFlags(u16);
s8 AiIsWithinFlyingDistance(struct Unit*, int, int);
int StoreItemAndGetUnitAttack(struct Unit*, u16*);
s8 AiTryDoDanceAdjacent(int, int);
s8 AiTryDoStealAdjacent(int, int);
s8 AiTryDoCombatInRangeFromPosition(int, int);

/* file-scope type definitions used by this run */


struct Unknown_Sub80315C {
    u8* unk_00;
    u8 unk_04;
    u8 unk_05;
};

struct UnknownSub803F4A4 {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
    u8 unk_03;
};

//! FE8U = 0x0803E2F4
void AiInitDangerMap(void) {
    if ((u8)gAiState.dangerMapFilled == 0) {
        gAiState.dangerMapFilled = 1;

        BmMapFill(gBmMapOther, 0);
        AiFillDangerMap();
    }

    return;
}

//! FE8U = 0x0803E320
void AiFillDangerMap(void) {
    int ix;
    int iy;
    int i;
    int j;

    u16 item = 0;
    u8 might = 0;

    for (i = 1; i < 0xC0; i++) {
        u16 itemTmp;

        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_HIDDEN | US_DEAD | US_NOT_DEPLOYED | US_BIT16)) {
            continue;
        }

        if (AreUnitsAllied(gActiveUnitId, unit->index)) {
            continue;
        }

        // BUG: Item is never re-initialized in the loop

        for (j = 0; (j < UNIT_ITEM_COUNT) && (itemTmp = unit->items[j]); j++) {
            if (!CanUnitUseWeapon(unit, itemTmp)) {
                continue;
            }

            if (GetItemMight(itemTmp) > might) {
                item = itemTmp;
                might = GetItemMight(itemTmp);
            }
        }

        if (item == 0) {
            continue;
        }

        if (!AiCouldReachByBirdsEyeDistance(gActiveUnit, unit, item)) {
            continue;
        }

        FillMovementAndRangeMapForItem(unit, item);

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
                if (gMapRangeSigned[iy][ix] == 0) {
                    continue;
                }

                gBmMapOther[iy][ix] += (GetUnitPower(unit) + might) >> 1;
            }
        }
    }

    return;
}
