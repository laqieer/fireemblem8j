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
s8 AiIsUnitEnemyWithStoredUnitId(struct Unit* unit);
s8 AiIsUnitEnemyInDirectionOfTarget(struct Unit* unit);

s8 AiFunc_AttackStoredTargetOrMoveToward(const void* input) {
    struct Unit* unit;

    if (gAiState.cmd_result[0] == 0) {
        return 1;
    }

    unit = GetUnit(gAiState.cmd_result[0]);

    AiAttemptOffensiveAction(AiIsUnitEnemyWithStoredUnitId);

    if (gAiDecision.actionPerformed == 1) {
        return 1;
    }

    AiAttemptOffensiveAction(AiIsUnitEnemyInDirectionOfTarget);

    if (gAiDecision.actionPerformed == 1) {
        return 1;
    }

    AiTryMoveTowards(unit->xPos, unit->yPos, 0, 0xff, 1);
    return 1;
}
