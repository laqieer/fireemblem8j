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



extern u8  gTerrainList_LootableVillagesAndChests[];
extern u8  gTerrainList_LootableVillages[];
s8 AiGetChestUnlockItemSlot(u8* out);

s8 AiFindPillageLocation(struct Vec2* out, u8* outItemSlot) {
    u8* terrainList;

    SetWorkingMoveCosts(GetUnitMovementCost(gActiveUnit));
    SetWorkingBmMap(gBmMapRange);

    GenerateMovementMap(gActiveUnit->xPos, gActiveUnit->yPos, 0x7c, gActiveUnit->index);

    terrainList = AiGetChestUnlockItemSlot(outItemSlot) == 1
        ? gTerrainList_LootableVillagesAndChests
        : gTerrainList_LootableVillages;

    if (AiFindClosestTerrainPosition(terrainList, 1, out) == 1) {
        return 1;
    }

    GenerateExtendedMovementMapOnRange(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));

    if (AiFindClosestTerrainPosition(terrainList, 0, out) == 1) {
        return 1;
    }

    return 0;
}
