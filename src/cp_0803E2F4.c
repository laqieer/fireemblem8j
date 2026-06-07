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

/* prototypes for same-file helpers called by this run */
s8 AiTryDoDanceAdjacent(int x, int y);
s8 AiTryDoStealAdjacent(int x, int y);
s8 AiTryDoCombatInRangeFromPosition(int x, int y);

//! FE8U = 0x0803ECC4
void AiTryDanceOrStealAfterMove(void) {

    if (gAiDecision.actionId == AI_ACTION_ESCAPE) {
        return;
    }

    if (AiTryDoDanceAdjacent(gAiDecision.xMove, gAiDecision.yMove) == 1) {
        return;
    }

    AiTryDoStealAdjacent(gAiDecision.xMove, gAiDecision.yMove);

    return;
}

//! FE8U = 0x0803ECF0
void AiTryActionAfterMove(void) {

    if (AiTryDoDanceAdjacent(gAiDecision.xMove, gAiDecision.yMove) == 1) {
        return;
    }

    if (AiTryDoStealAdjacent(gAiDecision.xMove, gAiDecision.yMove) == 1) {
        return;
    }

    AiTryDoCombatInRangeFromPosition(gAiDecision.xMove, gAiDecision.yMove);

    return;
}
