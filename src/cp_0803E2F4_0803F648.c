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

//! FE8U = 0x0803F6B8
s8 AiIsUnitEnemyInDirectionOfTarget(struct Unit* unit) {
    int a;
    int b;
    int c;
    int d;

    struct Unit* other = GetUnit(gAiState.cmd_result[0]);

    a = (other->xPos - gActiveUnit->xPos);
    b = (other->yPos - gActiveUnit->yPos);
    c = (unit->xPos - gActiveUnit->xPos);
    d = (unit->yPos - gActiveUnit->yPos);

    if (AreUnitsAllied(gActiveUnit->index, unit->index)) {
        return 0;
    }

    if ((a * c) < 0) {
        return 0;
    }

    if ((d * b) < 0) {
        return 0;
    }

    return 1;
}
