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



void AiSetMovCostTableWithPassableWalls(const s8* cost);

void GenerateUnitExtendedMovementMapNeglectWall(struct Unit* unit) {
    AiSetMovCostTableWithPassableWalls(GetUnitMovementCost(unit));

    SetWorkingBmMap(gBmMapMovement);
    GenerateMovementMap(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, unit->index);

    return;
}
