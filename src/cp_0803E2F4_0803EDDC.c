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

//! FE8U = 0x0803EE4C
s8 AiTryDoStealAdjacent(int x, int y) {
    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_STEAL)) {
        return 0;
    }

    BmMapFill(gBmMapMovement, -1);

    gBmMapMovement[y][x] = 0;
    MapAddInRange(x, y, 1, MAP_MOVEMENT_MAX);

    if (AiAttemptStealActionWithinMovement() != -1) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803EEB0
s8 AiTryDoCombatInRangeFromPosition(int x, int y) {
    int ix;
    int iy;

    u16 item = GetUnitEquippedWeapon(gActiveUnit);
    if (item == 0) {
        return 0;
    }

    BmMapFill(gBmMapMovement, 0);

    MapAddInBoundedRange(x, y, GetItemMinRange(item), GetItemMaxRange(item));

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            struct Unit* unit;

            if (gMapMovementSigned[iy][ix] == 0) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0) {
                continue;
            }

            if (AreUnitsAllied(gActiveUnitId, gBmMapUnit[iy][ix]) == 1) {
                continue;
            }

            unit = GetUnit(gBmMapUnit[iy][ix]);

            if (AiGetInRangeCombatPositionScoreComponent(x, y, unit)) {
                AiSetDecision(x, y, AI_ACTION_COMBAT, unit->index, GetUnitEquippedWeaponSlot(gActiveUnit), 0, 0);
                return 1;
            }
        }
    }

    return 0;
}
