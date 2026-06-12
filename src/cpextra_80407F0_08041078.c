#include "global.h"

#include "cp_common.h"
#include "cp_utility.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmphase.h"
#include "bmbattle.h"

#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"


s8 AiFindReachableDoorPosition(struct Unit*, struct Vec2*);
s8 AiFindReachableUnlockPosition(struct Unit*, u32, struct Vec2*, struct Vec2*);
s8 AiTryDoRogueSpecialItems(void);
void InitAiMoveMapForUnit(struct Unit*);
void GenerateUnitExtendedMovementMapOnRange(struct Unit*);
void GenerateUnitExtendedMovementMapOnRangeNeglectDoor(struct Unit*);
void GenerateExtendedMovementMapOnRangeNeglectDoor(struct Unit*);


struct AiSpecialItemLutEntry {
    u16 itemId;
    void(*func)(int itemIdx);
};

void AiSpecialItemDoorKey(int item);
void AiSpecialItemLockpick(int item);
void AiSpecialItemAntitoxin(int item);

extern const struct AiSpecialItemLutEntry sAiSpecialItemFuncLut[];

/* file-scope type definitions used by this run */


struct UnknownAiInputA {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
};

struct UnknownAiInputB {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
    
    struct UnitDefinition* unk_04;
};

int AiDetermineNightmareEffectiveness(int* numValidTargets, int* numHit, u8 threshold) {
    int iy;
    int ix;
    struct Unit* unit;
    int unitId;

    *numValidTargets = 0;
    *numHit = 0;

    unitId = -1;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            if (!(gMapRangeSigned[iy][ix])) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0) {
                continue;
            }

            if (AreUnitsAllied(gActiveUnitId, gBmMapUnit[iy][ix])) {
                continue;
            }

            unit = GetUnit(gBmMapUnit[iy][ix]);

            if ((unit->statusIndex == UNIT_STATUS_POISON) || (unit->statusIndex == UNIT_STATUS_SLEEP) || (unit->statusIndex == UNIT_STATUS_SILENCED) || (unit->statusIndex == UNIT_STATUS_BERSERK)) {
                continue;
            }

            if ((unit->statusIndex == UNIT_STATUS_PETRIFY) || (unit->statusIndex == UNIT_STATUS_13)) {
                continue;
            }

            (*numValidTargets)++;

            if (GetOffensiveStaffAccuracy(gActiveUnit, unit) < threshold) {
                continue;
            }

            if (unitId < 0) {
                unitId = unit->index;
            }

            (*numHit)++;
        }
    }
    
    return unitId;
}
