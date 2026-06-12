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
s8 AiFindBestAttackPositionAgainstTarget(int x, int y, struct Vec2* out, u8* itemSlotOut);
s8 AiFindClosestReachableTerrainPosition(const u8* terrainList, u32 flags, struct Vec2* out);

//! FE8U = 0x0803D228
void AiScriptCmd_18_TryAttackSnagWall(u8* pc) {
    struct Vec2 posA;
    struct Vec2 posB;
    u8 slot;

    GenerateExtendedMovementMapOnRangeNeglectWallSnag(gActiveUnit);

    if (AiFindClosestReachableTerrainPosition(gCpData_24, 0, &posA) == 1) {
        if (AiFindBestAttackPositionAgainstTarget(posA.x, posA.y, &posB, &slot) == 1) {

            struct Trap* trap = GetTrapAt(posA.x, posA.y);

            if (trap == 0) {
                return;
            }

            AiSetDecision(posB.x, posB.y, AI_ACTION_COMBAT, 0, slot, posA.x, posA.y);
        } else {
            AiTryMoveTowards(posA.x, posA.y, 0, 0xff, 1);
        }
    } else {
        gAiState.cmd_result[0] = 4;
        gAiScriptEnded = 0;
    }

    (*pc)++;

    return;
}
