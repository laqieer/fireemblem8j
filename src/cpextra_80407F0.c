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



/* prototypes for same-file helpers called by this run */
void InitAiMoveMapForUnit(struct Unit* unit);
void GenerateUnitExtendedMovementMapOnRangeNeglectDoor(struct Unit* unit);
void GenerateExtendedMovementMapOnRangeNeglectDoor(struct Unit* unit);

s8 AiFindReachableUnlockPosition(struct Unit* unit, u32 flags, struct Vec2* posA, struct Vec2* posB) {

    InitAiMoveMapForUnit(unit);
    GenerateUnitExtendedMovementMapOnRangeNeglectDoor(unit);

    if ((AiFindClosestUnlockPosition(flags | 1, posA, posB) == 1) && (gMapMovementSigned[posA->y][posA->x] < MAP_MOVEMENT_MAX)) {
        return 1;
    } else {

        GenerateExtendedMovementMapOnRangeNeglectDoor(unit);

        if (AiFindClosestUnlockPosition(flags, posA, posB) == 1) {

            if ((gMapMovementSigned[posA->y][posA->x] < MAP_MOVEMENT_MAX) && (gBmMapUnit[posA->y][posA->x] == 0)) {
                return 0;
            }

            return 1;
        }
    }

    return 0;
}
