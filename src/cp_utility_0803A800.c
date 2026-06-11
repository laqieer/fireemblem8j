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

// forward decl.
s8 AiGetChestUnlockItemSlot(u8*);
void SetupUnitStatusStaffAIFlags(struct Unit*, u16);
void SetupUnitHealStaffAIFlags(struct Unit*, u16);
void SaveNumberOfAlliedUnitsIn0To8Range(struct Unit*);



//! FE8U = 0x0803A788
s8 AiFindTargetInReachByCharId(int uid, struct Vec2* out) {

    int i;

    GenerateExtendedMovementMapOnRange(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));
    MarkWorkingMapEdges();

    out->x = -1;

    for (i = 1; i < 0xC0; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (gBmMapRange[unit->yPos][unit->xPos] > MAP_MOVEMENT_MAX) {
            continue;
        }

        if (unit->pCharacterData->number != uid) {
            continue;
        }

        if (unit->state & US_DEAD) {
            gAiState.cmd_result[0] = 1;
            return 0;
        }

        if (unit->state & US_RESCUED) {
            gAiState.cmd_result[0] = 3;
        }

        out->x = unit->xPos;
        out->y = unit->yPos;
    }

    if (out->x >= 0) {
        return 1;
    }

    if (!(GetUnitFromCharId(uid)->state & US_UNAVAILABLE)) {
        gAiState.cmd_result[0] = 4;
        return 0;
    }

    gAiState.cmd_result[0] = 1;

    return 0;
}

//! FE8U = 0x0803A878
s8 AiFindTargetInReachByClassId(int classId, struct Vec2* out) {
    int i;

    u8 bestDistance = 0xff;

    GenerateExtendedMovementMapOnRange(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));

    out->x = -1;

    for (i = 1; i < 0xC0; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_HIDDEN | US_DEAD | US_RESCUED | US_BIT16)) {
            continue;
        }

        if (gBmMapRange[unit->yPos][unit->xPos] > MAP_MOVEMENT_MAX) {
            continue;
        }

        if (unit->pClassData->number != classId) {
            continue;
        }

        if (bestDistance < gMapRangeSigned[unit->yPos][unit->xPos]) {
            continue;
        }

        bestDistance = gBmMapRange[unit->yPos][unit->xPos];
        out->x = unit->xPos;
        out->y = unit->yPos;
    }

    if (out->x >= 0) {
        return 1;
    }

    return 0;
}
