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

/* prototypes for same-file helpers called by this run */
void AiSetMovCostTableWithTwoPassableTerrains(const s8* cost, int terrainIdA, int terraidIdB);

void GenerateUnitExtendedMovementMapOnRangeNeglectWallSnag(struct Unit* unit) {
    AiSetMovCostTableWithTwoPassableTerrains(GetUnitMovementCost(unit), TERRAIN_WALL_DAMAGED, TERRAIN_SNAG);

    SetWorkingBmMap(gBmMapRange);
    GenerateMovementMap(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, unit->index);

    return;
}
