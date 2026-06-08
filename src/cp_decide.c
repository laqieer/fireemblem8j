
#include "global.h"

#include "proc.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "bmarch.h"
#include "bmudisp.h"
#include "cp_utility.h"
#include "cp_script.h"
#include "bmsave.h"
#include "bmmind.h"
#include "constants/classes.h"

#include "cp_common.h"

 void CpDecide_Suspend(ProcPtr proc);
 void CpDecide_Main(ProcPtr proc);

 void DecideHealOrEscape(void);
 void DecideScriptA(void);
 void DecideScriptB(void);
 void DecideSpecialItems(void);

EWRAM_DATA struct AiDecision gAiDecision = {0};

typedef void(*DecideFunc)(void);







void AiClearDecision(void)
{
    gAiDecision.actionId = 0;

    gAiDecision.unitId = 0;
    gAiDecision.xMove = 0;
    gAiDecision.yMove = 0;
    gAiDecision.unk04 = 0;
    gAiDecision.unk05 = 0;
    gAiDecision.targetId = 0;
    gAiDecision.itemSlot = 0;
    gAiDecision.xTarget = 0;
    gAiDecision.yTarget = 0;

    gAiDecision.actionPerformed = FALSE;
}

void AiSetDecision(s16 xMove, s16 yMove, u8 actionId, u8 targetId, u8 itemSlot, u8 xTarget, u8 yTarget)
{
    gAiDecision.unitId = gActiveUnitId;
    gAiDecision.xMove = xMove;
    gAiDecision.yMove = yMove;

    gAiDecision.actionId = actionId;

    gAiDecision.targetId = targetId;
    gAiDecision.itemSlot = itemSlot;
    gAiDecision.xTarget = xTarget;
    gAiDecision.yTarget = yTarget;

    gAiDecision.actionPerformed = TRUE;
}

void AiUpdateDecision(u8 actionId, u8 targetId, u8 itemSlot, u8 xTarget, u8 yTarget)
{
    if (actionId != 0xFF)
        gAiDecision.actionId = actionId;

    if (targetId != 0xFF)
        gAiDecision.targetId = targetId;

    if (itemSlot != 0xFF)
        gAiDecision.itemSlot = itemSlot;

    if (xTarget != 0xFF)
        gAiDecision.xTarget = xTarget;

    if (yTarget != 0xFF)
        gAiDecision.yTarget = yTarget;

    gAiDecision.actionPerformed = TRUE;
}
