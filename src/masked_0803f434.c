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

//! FE8U = 0x0803F4A4
s8 AiFunc_CheckUnitInBoundingBox(const void* input) {
    const struct UnknownSub803F4A4* castInput = (const struct UnknownSub803F4A4*)input;

    u8 x = gActiveUnit->xPos;
    u8 y = gActiveUnit->yPos;

    if (castInput->unk_00 <= x && castInput->unk_02 >= x && castInput->unk_01 <= y && castInput->unk_03 >= y) {
        gAiState.cmd_result[0] = 1;
        return 0;
    }

    gAiState.cmd_result[0] = 0;

    return 0;
}
