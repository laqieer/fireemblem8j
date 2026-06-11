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

enum ScriptKind {
    AI_SCRIPT_AI1,
    AI_SCRIPT_AI2,
};

typedef void(*AiScrCmd)(u8* pc);

static s8 gAiScriptEnded;
static int gAiScriptKind;
static struct AiScr* gpAiScriptCurrent;
static AiScrFunc gpCurrentAiFunctionCall;

extern struct AiScr gAiScript_FallbackAi1[];
extern struct AiScr gAiScript_FallbackAi2[];

// forward decl.
void AiScript_Exec(u8*);

void AiScriptCmd_00_ConditionalGoto(u8* pc);
void AiScriptCmd_01_FunctionCall(u8* pc);
void AiScriptCmd_02_ChangeAi(u8* pc);
void AiScriptCmd_03_Goto(u8* pc);
void AiScriptCmd_04_ActionOnSelectedCharacter(u8* pc);
void AiScriptCmd_05_DoStandardAction(u8* pc);
void AiScriptCmd_06_DoNothing(u8* pc);
void AiScriptCmd_07_DoStandardActionNoMove(u8* pc);
void AiScriptCmd_08_DoStandardActionAgainstClass(u8* pc);
void AiScriptCmd_09_DoStaffAction(u8* pc);
void AiScriptCmd_0A_DoStaffAction(u8* pc);
void AiScriptCmd_0B_DoStaffAction(u8* pc);
void AiScriptCmd_0C_MoveTowardsSetPoint(u8* pc);
void AiScriptCmd_0D_MoveTowardsCharacterUntilInRange(u8* pc);
void AiScriptCmd_0E_DoNothing(u8* pc);
void AiScriptCmd_0F_MoveTowardsUnitWithClass(u8* pc);
void AiScriptCmd_10_DoLooting(u8* pc);
void AiScriptCmd_11_MoveTowardsSafety(u8* pc);
void AiScriptCmd_12_MoveTowardsEnemy(u8* pc);
void AiScriptCmd_13(u8* pc);
void AiScriptCmd_14_DoNothing(u8* pc);
void AiScriptCmd_15_DoNothing(u8* pc);
void AiScriptCmd_16_RandomMovement(u8* pc);
void AiScriptCmd_17_DoEscape(u8* pc);
void AiScriptCmd_18_TryAttackSnagWall(u8* pc);
void AiScriptCmd_19_MoveTowardsTerrain(u8* pc);
void AiScriptCmd_1A_MoveTowardsTerrain(u8* pc);
void AiScriptCmd_1B_NoOp(u8* pc);

//! FE8U = 0x0803CB34
void AiScriptCmd_09_DoStaffAction(u8* pc) {

    AiTryDoStaff(AiIsUnitEnemy);
    (*pc)++;

    return;
}

//! FE8U = 0x0803CB50
void AiScriptCmd_0A_DoStaffAction(u8* pc) {

    AiTryDoStaff(AiIsUnitEnemy);
    (*pc)++;

    return;
}

//! FE8U = 0x0803CB6C
void AiScriptCmd_0B_DoStaffAction(u8* pc) {

    AiTryDoStaff(AiIsUnitEnemy);
    (*pc)++;

    return;
}

//! FE8U = 0x0803CB88
void AiScriptCmd_0C_MoveTowardsSetPoint(u8* pc) {
    AiTryMoveTowards(gpAiScriptCurrent->unk_01, gpAiScriptCurrent->unk_03, 0, gpAiScriptCurrent->unk_02, 1);

    if (gAiDecision.actionPerformed == 1) {
        if (gAiDecision.xMove == gpAiScriptCurrent->unk_01) {
            if (gAiDecision.yMove == gpAiScriptCurrent->unk_03) {
                (*pc)++;
            }
        }
    }

    return;
}

//! FE8U = 0x0803CBD4
void AiScriptCmd_0D_MoveTowardsCharacterUntilInRange(u8* pc) {
    struct Vec2 pos;

    if (AiFindTargetInReachByCharId(gpAiScriptCurrent->unk_04, &pos) == 1) {
        AiTryMoveTowards(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);

        if (AiIsWithinRectDistance(pos.x, pos.y, gAiDecision.xMove, gAiDecision.yMove, 1) == 1) {
            struct Unit* unit = GetUnitFromCharId(gpAiScriptCurrent->unk_04);
            if ((unit->state & US_RESCUED) != 0) {
                gAiState.cmd_result[0] = 3;
            } else {
                AiUpdateDecision(0, 0, 0, 0, unit->index);

                gAiState.cmd_result[0] = 2;
                gAiDecision.actionPerformed = 0;
                gAiScriptEnded = 0;
            }
        }
    } else {
        gAiScriptEnded = 0;
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CC90
void AiScriptCmd_0E_DoNothing(u8* pc) {
    (*pc)++;
    return;
}

//! FE8U = 0x0803CC98
void AiScriptCmd_0F_MoveTowardsUnitWithClass(u8* pc) {
    struct Vec2 pos;

    if (AiFindTargetInReachByClassId(gpAiScriptCurrent->unk_04, &pos) == 1) {
        AiTryMoveTowards(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CCDC
void AiScriptCmd_10_DoLooting(u8* pc) {

    if (AiTryDoSpecialItems() == 1) {
        if (gpAiScriptCurrent->unk_03 == 0) {
            return;
        }

        gActiveUnit->ai_counter++;

        if (gActiveUnit->ai_counter != gpAiScriptCurrent->unk_03) {
            return;
        }

        (*pc)++;
        gAiScriptEnded = 0;
    } else {
        struct Vec2 pos;
        u8 itemSlot;

        if (AiFindPillageLocation(&pos, &itemSlot) == 1) {
            AiTryMoveTowards(pos.x, pos.y, 0, -1, 1);

            if (AiLocationIsPillageTarget(gAiDecision.xMove, gAiDecision.yMove) != 1) {
                return;
            }

            AiSetDecision(gAiDecision.xMove, gAiDecision.yMove, AI_ACTION_PILLAGE, 0, itemSlot, 0, 0);

            if (gpAiScriptCurrent->unk_03 == 0) {
                return;
            }

            gActiveUnit->ai_counter++;

            if (gActiveUnit->ai_counter != gpAiScriptCurrent->unk_03) {
                return;
            }

            (*pc)++;
            gAiScriptEnded = 0;
        } else {
            (*pc)++;
            gAiScriptEnded = 0;
        }
    }

    return;
}

//! FE8U = 0x0803CDD4
void AiScriptCmd_11_MoveTowardsSafety(u8* pc) {
    struct Vec2 pos;

    if (AiFindSafestReachableLocation(gActiveUnit, &pos) == 1) {
        AiSetDecision(pos.x, pos.y, AI_ACTION_NONE, 0, 0, 0, 0);
    }

    (*pc)++;

    return;
}
