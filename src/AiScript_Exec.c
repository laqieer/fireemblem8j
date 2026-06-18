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


typedef void(*AiScrCmd)(u8* pc);
enum { AI_SCRIPT_AI1, AI_SCRIPT_AI2 };
extern struct AiScr* gpAiScriptCurrent;
extern int gAiScriptKind;
extern struct AiScr gAiScript_FallbackAi1[];
extern struct AiScr gAiScript_FallbackAi2[];

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

void AiScript_Exec(u8* pc) {

    AiScrCmd funcLut[] = {
        [AI_CMD_CONDITIONAL]        = AiScriptCmd_00_ConditionalGoto,
        [AI_CMD_CALL_FUNC]          = AiScriptCmd_01_FunctionCall,
        [AI_CMD_SET_AI]             = AiScriptCmd_02_ChangeAi,
        [AI_CMD_GOTO]               = AiScriptCmd_03_Goto,
        [AI_CMD_ACTION_ON_CHAR]     = AiScriptCmd_04_ActionOnSelectedCharacter,
        [AI_CMD_ACTION]             = AiScriptCmd_05_DoStandardAction,
        [AI_CMD_NOP]                = AiScriptCmd_06_DoNothing,
        [AI_CMD_ACTION_IN_PLACE]    = AiScriptCmd_07_DoStandardActionNoMove,
        [AI_CMD_ACTION_ON_CLASS]    = AiScriptCmd_08_DoStandardActionAgainstClass,
        [AI_CMD_STAFF_ACTION]       = AiScriptCmd_09_DoStaffAction,
        [AI_CMD_STAFF_ACTION_2]     = AiScriptCmd_0A_DoStaffAction,
        [AI_CMD_STAFF_ACTION_3]     = AiScriptCmd_0B_DoStaffAction,
        [AI_CMD_MOVE_TOWARDS]       = AiScriptCmd_0C_MoveTowardsSetPoint,
        [AI_CMD_MOVE_TOWARDS_CHAR]  = AiScriptCmd_0D_MoveTowardsCharacterUntilInRange,
        [AI_CMD_NOP_0E]             = AiScriptCmd_0E_DoNothing,
        [AI_CMD_MOVE_TOWARDS_CLASS] = AiScriptCmd_0F_MoveTowardsUnitWithClass,
        [AI_CMD_PILLAGE]            = AiScriptCmd_10_DoLooting,
        [AI_CMD_MOVE_TO_SAFETY]     = AiScriptCmd_11_MoveTowardsSafety,
        [AI_CMD_MOVE_TO_ENEMY]      = AiScriptCmd_12_MoveTowardsEnemy,
        [AI_CMD_MOVE_TO_ENEMY_2]    = AiScriptCmd_13,
        [AI_CMD_NOP_14]             = AiScriptCmd_14_DoNothing,
        [AI_CMD_NOP_15]             = AiScriptCmd_15_DoNothing,
        [AI_CMD_MOVE_RANDOM]        = AiScriptCmd_16_RandomMovement,
        [AI_CMD_ESCAPE]             = AiScriptCmd_17_DoEscape,
        [AI_CMD_ATTACK_WALLS]       = AiScriptCmd_18_TryAttackSnagWall,
        [AI_CMD_MOVE_TO_TERRAIN]    = AiScriptCmd_19_MoveTowardsTerrain,
        [AI_CMD_MOVE_TO_LISTED_TERRAIN] = AiScriptCmd_1A_MoveTowardsTerrain,
        [AI_CMD_1B]                 = AiScriptCmd_1B_NoOp,
    };

    if (gpAiScriptCurrent->cmd >= AI_CMD_COUNT) {

        if (gAiScriptKind == AI_SCRIPT_AI1) {
            gpAiScriptCurrent = gAiScript_FallbackAi1;
        } else {
            gpAiScriptCurrent = gAiScript_FallbackAi2;
        }

    }

    gAiState.unk7E = gpAiScriptCurrent->unk_02;

    funcLut[gpAiScriptCurrent->cmd](pc);

    return;
}
