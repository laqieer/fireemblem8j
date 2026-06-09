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

//! FE8U = 0x0803E878
const struct AiEscapePt* GetEscapePointStructThingMaybe(void) {
    int i = 0;

    const struct AiEscapePt* list = NULL;
    const struct AiEscapePt* result = NULL;

    int chapter = gPlaySt.chapterIndex;

    u8 resultMove = 0xFF;

    switch (gPlaySt.faction) {
        case FACTION_BLUE:
            return NULL;

        case FACTION_RED:
            list = gRedAiEscapePoints[chapter];
            break;

        case FACTION_GREEN:
            list = gGreenAiEscapePoints[chapter];
            break;
    }

    for (; list[i].x != 0xFF; i++) {
        if (gBmMapMovement[list[i].y][list[i].x] > MAP_MOVEMENT_MAX) {
            continue;
        }

        if (resultMove > gMapMovementSigned[list[i].y][list[i].x]) {
            resultMove = gMapMovementSigned[list[i].y][list[i].x];
            result = list + i;
        }
    }

    return result;
}

//! FE8U = 0x0803E900
s8 AiCanEquip(void) {

    if (gActiveUnit->state & US_CANTOING) {
        return 0;
    }

    if (gAiDecision.actionId == AI_ACTION_COMBAT) {
        return 0;
    }

    if (gActiveUnit->statusIndex == UNIT_STATUS_BERSERK) {
        return 0;
    }

    return 1;
}
