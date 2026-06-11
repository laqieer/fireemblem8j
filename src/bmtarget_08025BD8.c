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

extern struct Unit* EWRAM_DATA gSubjectUnit;

s8 CanUnitCrossTerrain(struct Unit* unit, int terrain);

/* prototypes for same-file helpers called by this run */
void ForEachUnitInRange(void(*func)(struct Unit* unit));
void ForEachAdjacentUnit(int x, int y, void(*func)(struct Unit* unit));
void ForEachAdjacentPosition(int x, int y, void(*func)(int x, int y));
void ForEachPosAtSinglePosition(int x, int y, void(*func)(int x, int y));
void ForEachUnitInMagBy2Range(void(*func)(struct Unit* unit));

void AddAsTarget_IfPositionCleanForSummon(int x, int y) {

    if (gBmMapUnit[y][x] != 0) {
        return;
    }

    if (gPlaySt.chapterVisionRange != 0 && gBmMapFog[y][x] == 0) {
        return;
    }

    if (!CanUnitCrossTerrain(gSubjectUnit, gBmMapTerrain[y][x])) {
        return;
    }

    AddTarget(x, y, 0, 0);

    return;
}

void MakeTargetListForSummon(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentPosition(x, y, AddAsTarget_IfPositionCleanForSummon);

    return;
}

void AddPosToTargetListIfCleanForSummon(int x, int y) {

    if (gBmMapUnit[y][x] != 0) {
        return;
    }

    if (gPlaySt.chapterVisionRange != 0 && gBmMapFog[y][x] == 0) {
        return;
    }

    if (!CanUnitCrossTerrain(gSubjectUnit, gBmMapTerrain[y][x])) {
        return;
    }

    AddTarget(x, y, 0, 0);

    return;
}

void MakeSummonTargetListSouth(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachPosAtSinglePosition(x, y + 4, AddPosToTargetListIfCleanForSummon);

    return;
}

void MakeSummonTargetListWest(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachPosAtSinglePosition(x - 4, y, AddPosToTargetListIfCleanForSummon);

    return;
}

void MakeSummonTargetListEast(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachPosAtSinglePosition(x + 4, y, AddPosToTargetListIfCleanForSummon);

    return;
}

void MakeSummonTargetListNorth(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachPosAtSinglePosition(x, y - 4, AddPosToTargetListIfCleanForSummon);

    return;
}

void TryAddUnitToHealTargetList(struct Unit* unit) {

    if (!AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (unit->state & US_RESCUED) {
        return;
    }

    if (GetUnitCurrentHp(unit) == GetUnitMaxHp(unit)) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForAdjacentHeal(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToHealTargetList);

    return;
}

void MakeTargetListForRangedHeal(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    InitTargets(x, y);

    BmMapFill(gBmMapRange, 0);

    MapAddInRange(x, y, GetUnitMagBy2Range(gSubjectUnit), 1);

    ForEachUnitInRange(TryAddUnitToHealTargetList);

    return;
}

void AddToTargetListIfNotAllied(struct Unit* unit) {

    if (AreUnitsAllied(gSubjectUnit->index, unit->index) == 1) {
        return;
    }

    if (unit->statusIndex != UNIT_STATUS_NONE) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForFuckingNightmare(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    InitTargets(x, y);

    BmMapFill(gBmMapRange, 0);

    MapAddInRange(x, y, 3, 1);
    MapAddInRange(x, y, 0, -1);

    ForEachUnitInRange(AddToTargetListIfNotAllied);

    return;
}

void TryAddUnitToRestoreTargetList(struct Unit* unit) {

    if (!AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (unit->state & US_RESCUED) {
        return;
    }

    if (unit->statusIndex == UNIT_STATUS_NONE) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForRestore(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToRestoreTargetList);

    return;
}

void TryAddUnitToBarrierTargetList(struct Unit* unit) {

    if (!AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (unit->state & US_RESCUED) {
        return;
    }

    if (unit->barrierDuration >= 7) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForBarrier(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToBarrierTargetList);

    return;
}

void TryAddUnitToRescueStaffTargetList(struct Unit* unit) {

    if (!AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForRescueStaff(struct Unit* unit) {
    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachUnitInMagBy2Range(TryAddUnitToRescueStaffTargetList);

    return;
}

void TryAddUnitToSilenceTargetList(struct Unit* unit) {

    if (AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (unit->statusIndex != UNIT_STATUS_NONE && unit->statusIndex != UNIT_STATUS_SILENCED) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void TryAddUnitToSleepTargetList(struct Unit* unit) {

    if (AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (unit->statusIndex != UNIT_STATUS_NONE && unit->statusIndex != UNIT_STATUS_SLEEP) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void TryAddUnitToBerserkTargetList(struct Unit* unit) {

    if (AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (unit->statusIndex != UNIT_STATUS_NONE && unit->statusIndex != UNIT_STATUS_BERSERK) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForSilence(struct Unit* unit) {
    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachUnitInMagBy2Range(TryAddUnitToSilenceTargetList);

    return;
}

void MakeTargetListForSleep(struct Unit* unit) {
    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachUnitInMagBy2Range(TryAddUnitToSleepTargetList);

    return;
}

void MakeTargetListForBerserk(struct Unit* unit) {
    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachUnitInMagBy2Range(TryAddUnitToBerserkTargetList);

    return;
}

void TryAddUnitToWarpTargetList(struct Unit* unit) {
    if (!AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForWarp(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToWarpTargetList);

    return;
}
