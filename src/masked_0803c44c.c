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

/* prototypes for same-file helpers called by this run */
void AiScript_Exec(u8* pc);

//! FE8U = 0x0803C4BC
s8 AiTryExecScriptA(void) {
    gpAiScriptCurrent = gpAi1Table[0][gActiveUnit->ai1];
    gpAiScriptCurrent = gpAiScriptCurrent + gActiveUnit->ai_a_pc;

    gAiScriptEnded = 1;
    gAiScriptKind = AI_SCRIPT_AI1;

    AiScript_Exec(&gActiveUnit->ai_a_pc);

    return gAiScriptEnded;
}

//! FE8U = 0x0803C510
s8 AiExecFallbackScriptA(void) {
    gpAiScriptCurrent = gAiScript_FallbackAi1;

    gAiScriptEnded = 1;
    gAiScriptKind = AI_SCRIPT_AI1;

    AiScript_Exec(&gActiveUnit->ai_a_pc);

    return gAiScriptEnded;
}

//! FE8U = 0x0803C54C
s8 AiTryExecScriptB(void) {
    gpAiScriptCurrent = gpAi2Table[0][gActiveUnit->ai2];
    gpAiScriptCurrent = gpAiScriptCurrent + gActiveUnit->ai_b_pc;

    gAiScriptEnded = 1;
    gAiScriptKind = AI_SCRIPT_AI2;

    AiScript_Exec(&gActiveUnit->ai_b_pc);

    return gAiScriptEnded;
}

//! FE8U = 0x0803C5A0
s8 AiExecFallbackScriptB(void) {

    gpAiScriptCurrent = gAiScript_FallbackAi2;

    gAiScriptEnded = 1;
    gAiScriptKind = AI_SCRIPT_AI2;

    AiScript_Exec(&gActiveUnit->ai_b_pc);

    return gAiScriptEnded;
}
