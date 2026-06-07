#include "global.h"

#include "bmmap.h"
#include "bmunit.h"
#include "uiselecttarget.h"
#include "bmidoten.h"
#include "bmtrick.h"
#include "bmphase.h"
#include "bmitem.h"
#include "bmreliance.h"
#include "bmarch.h"
#include "rng.h"
#include "bmsave.h"
#include "eventinfo.h"

#include "constants/classes.h"
#include "constants/terrains.h"

struct Unit* EWRAM_DATA gSubjectUnit = NULL;

s8 CanUnitCrossTerrain(struct Unit* unit, int terrain);

/* prototypes for same-file helpers called by this run */
void ForEachAdjacentUnit(int x, int y, void(*func)(struct Unit* unit));
void ForEachAdjacentPosition(int x, int y, void(*func)(int x, int y));

void TryAddToMineTargetList(int x, int y) {
    struct Trap* trap;

    if (gBmMapUnit[y][x] != 0) {
        return;
    }

    if ((gPlaySt.chapterVisionRange != 0) && (gBmMapFog[y][x] == 0)) {
        return;
    }

    if (!CanUnitCrossTerrain(gSubjectUnit, gBmMapTerrain[y][x])) {
        return;
    }

    trap = GetTrapAt(x, y);

    if ((trap != 0) && (trap->type != TRAP_TORCHLIGHT)) {
        return;
    }

    AddTarget(x, y, 0, 0);

    return;
}

void MakeTargetListForMine(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);
    ForEachAdjacentPosition(x, y, TryAddToMineTargetList);

    return;
}

void TryAddToLightRuneTargetList(int x, int y) {
    struct Trap* trap;

    if (gBmMapUnit[y][x] != 0) {
        return;
    }

    trap = GetTrapAt(x, y);

    if (trap != 0) {
        return;
    }

    if (TerrainTable_MovCost_FlyNormal[gBmMapTerrain[y][x]] <= 0) {
        return;
    }

    AddTarget(x, y, 0, 0);

    return;
}

void MakeTargetListForLightRune(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentPosition(x, y, TryAddToLightRuneTargetList);

    return;
}

void TryAddUnitToDanceRingTargetList(struct Unit* unit) {

    if (UNIT_FACTION(unit) != FACTION_BLUE) {
        return;
    }

    if (unit->statusIndex != UNIT_STATUS_NONE) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForDanceRing(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToDanceRingTargetList);

    return;
}
