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
extern u8  gUnkData_0;
s8 AiIsUnitEnemyWithStoredCharId(struct Unit* unit);

s8 AiFunc_AttackUnitWithCharId(const void* input) {
    gUnkData_0 = ((u8*)(input))[0];

    if (AiUnitWithCharIdExists(((u8*)(input))[0]) != 1) {
        gAiState.cmd_result[1] = 1;
        return 0;
    }

    AiAttemptOffensiveAction(AiIsUnitEnemyWithStoredCharId);
    gAiState.cmd_result[0] = 0;

    if ((gAiDecision.actionPerformed == 1) && (gAiDecision.actionId == AI_ACTION_COMBAT)) {
        gAiState.cmd_result[0] = gAiDecision.targetId;
    }

    AiClearDecision();

    return 0;
}
