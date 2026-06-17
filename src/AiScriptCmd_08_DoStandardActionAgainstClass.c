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
s8 AiIsUnitEnemyAndScrClassId(struct Unit* unit);

void AiScriptCmd_08_DoStandardActionAgainstClass(u8* pc) {
    u8 rand = NextRN_N(100);

    if (rand <= gpAiScriptCurrent->unk_01) {

        if (AiTryDoStaff(AiIsUnitEnemyAndScrClassId) == 0) {
            AiAttemptOffensiveAction(AiIsUnitEnemyAndScrClassId);
        }
    } else {
        gAiState.decideState = 4;
    }

    (*pc)++;

    return;
}
