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

void TryAddTrapsToTargetList() {
    struct Trap* trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap) {
        if (trap->type != TRAP_OBSTACLE) {
            continue;
        }

        if ((gBmMapTerrain[trap->yPos][trap->xPos] == TERRAIN_WALL_DAMAGED) && (gMapRangeSigned[trap->yPos][trap->xPos] != 0)) {
            AddTarget(trap->xPos, trap->yPos, 0, trap->extra);
        }

        if ((gBmMapTerrain[trap->yPos + 1][trap->xPos] == TERRAIN_WALL_DAMAGED) && (gMapRangeSigned[trap->yPos + 1][trap->xPos] != 0)) {
            AddTarget(trap->xPos, trap->yPos + 1, 0, trap->extra);
        }

        if ((gBmMapTerrain[trap->yPos][trap->xPos] == TERRAIN_SNAG) && (gMapRangeSigned[trap->yPos][trap->xPos] != 0)) {
            AddTarget(trap->xPos, trap->yPos, 0, trap->extra);
        }
    }

    return;
}

void AddUnitToTargetListIfNotAllied(struct Unit* unit) {

    if (!AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        AddTarget(unit->xPos, unit->yPos, unit->index, 0);
    }

    return;
}

void MakeTargetListForWeapon(struct Unit* unit, int item) {

    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    InitTargets(x, y);

    BmMapFill(gBmMapRange, 0);

    MapAddInBoundedRange(x, y, GetItemMinRange(item), GetItemMaxRange(item));

    ForEachUnitInRange(AddUnitToTargetListIfNotAllied);

    TryAddTrapsToTargetList();

    return;
}

void TryAddUnitToTradeTargetList(struct Unit* unit) {

    if (!IsSameAllegiance(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (gSubjectUnit->pClassData->number == CLASS_PHANTOM || unit->pClassData->number == CLASS_PHANTOM) {
        return;
    }

    if (unit->statusIndex != UNIT_STATUS_BERSERK) {

        if (gSubjectUnit->items[0] != 0 || unit->items[0] != 0) {

            if (!(UNIT_CATTRIBUTES(unit) & CA_SUPPLY)) {
                AddTarget(unit->xPos, unit->yPos, unit->index, 0);
            }
        }
    }

    if (unit->state & US_RESCUING) {
        struct Unit* rescue = GetUnit(unit->rescue);

        if (UNIT_FACTION(rescue) != FACTION_BLUE) {
            return;
        }

        if (gSubjectUnit->items[0] == 0 && rescue->items[0] == 0 ) {
            return;
        }

        AddTarget(unit->xPos, unit->yPos, rescue->index, 0);
    }

    return;
}

void MakeTradeTargetList(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);
    ForEachAdjacentUnit(x, y, TryAddUnitToTradeTargetList);

    if (gSubjectUnit->state & US_RESCUING) {
        int count = GetSelectTargetCount();
        TryAddUnitToTradeTargetList(GetUnit(gSubjectUnit->rescue));

        if (count != GetSelectTargetCount()) {
            GetTarget(count)->x = gSubjectUnit->xPos;
            GetTarget(count)->y = gSubjectUnit->yPos;
        }
    }

    return;
}

void TryAddUnitToRescueTargetList(struct Unit* unit) {

    if (!AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (gSubjectUnit->pClassData->number == CLASS_PHANTOM || unit->pClassData->number == CLASS_PHANTOM) {
        return;
    }

    if (unit->statusIndex == UNIT_STATUS_BERSERK) {
        return;
    }

    if (unit->state & (US_RESCUING | US_RESCUED)) {
        return;
    }

    if (!CanUnitRescue(gSubjectUnit, unit)) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeRescueTargetList(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToRescueTargetList);

    return;
}

void TryAddToDropTargetList(int x, int y) {

    if (gBmMapUnit[y][x] != 0) {
        return;
    }

    if (!CanUnitCrossTerrain(GetUnit(gSubjectUnit->rescue), gBmMapTerrain[y][x])) {
        return;
    }

    AddTarget(x, y, 0, 0);

    return;
}

void MakeDropTargetList(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentPosition(x, y, TryAddToDropTargetList);
    return;
}

void TryAddRescuedUnitToTakeTargetList(struct Unit* unit) {

    if (!IsSameAllegiance(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (!(unit->state & US_RESCUING)) {
        return;
    }

    if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY) {
        return;
    }

    if (!CanUnitRescue(gSubjectUnit, GetUnit(unit->rescue))) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTakeTargetList(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddRescuedUnitToTakeTargetList);

    return;
}

void TryAddUnitToGiveTargetList(struct Unit* unit) {

    if (!IsSameAllegiance(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (unit->state & US_RESCUING) {
        return;
    }

    if (unit->statusIndex == UNIT_STATUS_BERSERK || unit->statusIndex == UNIT_STATUS_SLEEP) {
        return;
    }

    if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY) {
        return;
    }

    if (!CanUnitRescue(unit, GetUnit(gSubjectUnit->rescue))) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeGiveTargetList(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToGiveTargetList);

    return;
}

void TryAddUnitToTalkTargetList(struct Unit* unit) {
    if (unit->statusIndex == UNIT_STATUS_BERSERK || unit->statusIndex == UNIT_STATUS_SLEEP) {
        return;
    }

    if (!CheckForCharacterEvents(gSubjectUnit->pCharacterData->number, unit->pCharacterData->number)) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, unit->pCharacterData->number);

    return;
}

void MakeTalkTargetList(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToTalkTargetList);

    return;
}

void MakeTargetListForSupport(struct Unit* unit) {
    int i;
    int count;

    gSubjectUnit = unit;

    InitTargets(unit->xPos, unit->yPos);

    count = GetUnitSupporterCount(gSubjectUnit);

    for (i = 0; i < count; i++) {

        struct Unit* other = GetUnitSupporterUnit(gSubjectUnit, i);

        if (other == 0) {
            continue;
        }

        if (RECT_DISTANCE(gSubjectUnit->xPos, gSubjectUnit->yPos, other->xPos, other->yPos) != 1) {
            continue;
        }

        if (!CanUnitSupportNow(gSubjectUnit, i)) {
            continue;
        }

        if (other->state & (US_DEAD | US_NOT_DEPLOYED | US_RESCUED | US_BIT16)) {
            continue;
        }

        if (other->statusIndex == UNIT_STATUS_BERSERK || other->statusIndex == UNIT_STATUS_SLEEP) {
            continue;
        }

        AddTarget(other->xPos, other->yPos, other->index, i);
    }

    return;
}

void AddUnitToTargetListIfAllied(struct Unit* unit) {
    if (AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 1);

    return;
}

void FillBallistaRangeMaybe(struct Unit* unit) {

    int unk;

    int x = unit->xPos;
    int y = unit->yPos;
    gSubjectUnit = unit;

    InitTargets(x, y);

    unk = GetSomeBallistaItemAt(x, y);
    if (unk != 0) {
        BmMapFill(gBmMapRange, 0);

        MapAddInBoundedRange(x, y, GetItemMinRange(unk), GetItemMaxRange(unk));

        ForEachUnitInRange(AddUnitToTargetListIfAllied);

        TryAddTrapsToTargetList();
    }

    return;
}

void TryAddClosedDoorToTargetList(int x, int y) {

    if (gBmMapTerrain[y][x] != TERRAIN_DOOR) {
        return;
    }

    if (!IsThereClosedDoorAt(x, y)) {
        return;
    }

    AddTarget(x, y, TERRAIN_DOOR, 0);

    return;
}

void TryAddBridgeToTargetList(int x, int y) {

    if (gBmMapTerrain[y][x] != TERRAIN_BRIDGE_14) {
        return;
    }

    if (!IsThereClosedDoorAt(x, y)) {
        return;
    }

    AddTarget(x, y, TERRAIN_BRIDGE_14, 0);

    return;
}

void MakeTargetListForDoorAndBridges(struct Unit* unit, int terrainId) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    switch (terrainId) {
        case TERRAIN_DOOR:
            ForEachAdjacentPosition(x, y, TryAddClosedDoorToTargetList);
            return;
        case TERRAIN_BRIDGE_14:
            ForEachAdjacentPosition(x, y, TryAddBridgeToTargetList);
            return;
    }

    return;
}

void TryAddDoorOrBridgeToTargetList(int x, int y) {
    switch (gBmMapTerrain[y][x]) {
        case TERRAIN_DOOR:
            AddTarget(x, y, TERRAIN_DOOR, 0);
            return;
        case TERRAIN_BRIDGE_14:
            AddTarget(x, y, TERRAIN_BRIDGE_14, 0);
            return;
    }

    return;
}

void MakeTargetListForPick(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentPosition(x, y, TryAddDoorOrBridgeToTargetList);

    if (gBmMapTerrain[unit->yPos][unit->xPos] == TERRAIN_CHEST_FULL) {
        AddTarget(x, y, TERRAIN_CHEST_FULL, 0);
    }

    return;
}

void MakeTerrainHealTargetList(int faction) {
    int i;

    InitTargets(0, 0);

    for (i = faction + 1; i < faction + 0x40; i++) {
        struct Unit* unit = GetUnit(i);
        int terrainId;
        int amount;

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_DEAD | US_NOT_DEPLOYED | US_RESCUED | US_BIT16)) {
            continue;
        }

        terrainId = gBmMapTerrain[unit->yPos][unit->xPos];

        if (GetTerrainHealAmount(terrainId) != 0 && (GetUnitCurrentHp(unit) != GetUnitMaxHp(unit))) {
            amount = (GetTerrainHealAmount(terrainId) * GetUnitMaxHp(unit)) / 100;
            AddTarget(unit->xPos, unit->yPos, unit->index, amount);
        }

        if (GetTerrainHealsStatus(terrainId) == 0) {
            continue;
        }

        if (unit->statusIndex == UNIT_STATUS_NONE) {
            continue;
        }

        if (unit->statusIndex == UNIT_STATUS_13) {
            unit->statusIndex = UNIT_STATUS_PETRIFY;
        }

        AddTarget(unit->xPos, unit->yPos, unit->index, -1);
    }

    return;
}

void MakePoisonDamageTargetList(int faction) {

    int i;

    InitTargets(0, 0);

    for (i = faction + 1; i < faction + 0x40; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_DEAD | US_NOT_DEPLOYED | US_RESCUED | US_BIT16)) {
            continue;
        }

        if (unit->statusIndex != UNIT_STATUS_POISON) {
            continue;
        }

        AddTarget(unit->xPos, unit->yPos, unit->index, NextRN_N(3) + 1);
    }

    return;
}
