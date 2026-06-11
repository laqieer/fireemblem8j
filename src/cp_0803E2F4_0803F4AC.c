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

//! FE8U = 0x0803F51C
s8 AiFunc_FindLeaderCombatTarget(const void* input) {
    u16 leaderAi1;
    u16 leaderai_a_pc;
    struct Unit* leader;

    int i = 0;
    u8 prevUid = gActiveUnitId;
    struct Unit* prevUnit = gActiveUnit;

    u16 leadUid = GetUnitLeaderCharId(gActiveUnit);
    if (leadUid == 0) {
        return 0;
    }

    leader = GetUnitFromCharId(leadUid);

    gActiveUnit = leader;

    if (leader == 0) {
        gActiveUnit = prevUnit;
        gAiState.cmd_result[1] = 1;
        return 0;
    }

    gActiveUnitId = leader->index;

    leaderAi1 = leader->ai1;
    leaderai_a_pc = leader->ai_a_pc;

    for (; i < 0x100; i++) {
        if (AiTryExecScriptA() == 1) {
            goto _0803F584;
        }
    }

    AiExecFallbackScriptA();

_0803F584:
    if ((gAiDecision.actionPerformed == 1) && (gAiDecision.actionId == AI_ACTION_COMBAT)) {
        gAiState.cmd_result[0] = gAiDecision.targetId;
    } else {
        gAiState.cmd_result[0] = 0;
    }

    AiClearDecision();

    gActiveUnit->ai1 = leaderAi1;
    gActiveUnit->ai_a_pc = leaderai_a_pc;

    gActiveUnitId = prevUid;
    gActiveUnit = prevUnit;

    return 0;
}
