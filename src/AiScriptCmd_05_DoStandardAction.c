#include "global.h"
#include "cp_common.h"
#include "cp_data.h"
#include "bmunit.h"
#include "cp_utility.h"
#include "bmphase.h"
#include "rng.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmitem.h"
#include "bmtrick.h"
#include "cp_script.h"



extern struct AiScr* gpAiScriptCurrent;
s8 AiIsUnitEnemyOrInScrList(struct Unit* unit);
s8 AiIsUnitEnemyAndNotInScrList(struct Unit* unit);

void AiScriptCmd_05_DoStandardAction(u8* pc) {
    u8 rand = NextRN_N(100);

    if (rand <= gpAiScriptCurrent->unk_01) {
        if (gpAiScriptCurrent->unk_08 == 0) {
            if (AiTryDoStaff(AiIsUnitEnemy) == 0) {
                AiAttemptOffensiveAction(AiIsUnitEnemy);
            }
        } else {
            if (AiTryDoStaff(AiIsUnitEnemyOrInScrList) == 0) {
                AiAttemptOffensiveAction(AiIsUnitEnemyAndNotInScrList);
            }
        }
    } else {
        gAiState.decideState = 4;
    }

    (*pc)++;

    return;
}
