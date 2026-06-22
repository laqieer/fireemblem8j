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

extern s8 gAiScriptEnded;
extern struct AiScr* gpAiScriptCurrent;

s8 AiIsUnitEnemyAndScrCharId(struct Unit* unit);

//! FE8U = 0x0803C904
void AiScriptCmd_04_ActionOnSelectedCharacter(u8* pc) {
    u8 rand = NextRN_N(100);

    if (rand <= gpAiScriptCurrent->unk_01) {

        if (!AiTryDoStaff(AiIsUnitEnemy)) {

            if (AiUnitWithCharIdExists(gpAiScriptCurrent->unk_04) == 1) {
                if (GetUnitFromCharId(gpAiScriptCurrent->unk_04)->state & US_RESCUED) {
                    gAiState.cmd_result[0] = 3;
                    gAiScriptEnded = 0;
                } else {
                    AiAttemptOffensiveAction(AiIsUnitEnemyAndScrCharId);
                }
            } else {
                gAiState.cmd_result[0] = 1;
                gAiScriptEnded = 0;
            }
        }
    } else {
        gAiState.decideState = 4;
    }

    (*pc)++;

    return;
}
