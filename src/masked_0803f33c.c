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

//! FE8U = 0x0803F3AC
s8 AiTryMoveToSpecificPosition(struct Vec2* out) {

    const struct Vec2* posA;
    const struct Vec2* posB;

    int idx = (gActiveUnit->ai_config & 0x1fc0) >> 8;
    int ai_counter = gActiveUnit->ai_counter;

    if (gCpData_31 == NULL) {
        return 0;
    }

    posA = gCpData_31[idx];

    if (posA == NULL) {
        return 0;
    }

    posB = posA + ai_counter;
    if (posB->x == -1) {
        ai_counter = 0;
        gActiveUnit->ai_counter = 0;
        posB = posA;
    }

    out->x = posB->x;
    out->y = posB->y;

    if (gBmMapMovement[posB->y][posB->x] != 0xFF) {
        ai_counter++;
        gActiveUnit->ai_counter = ai_counter;
    }

    return 1;
}
