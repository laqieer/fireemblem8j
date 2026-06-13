#include "global.h"

#include "cp_common.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "mu.h"
#include "bmtrick.h"
#include "bmitem.h"
#include "bmmind.h"
#include "bmusemind.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmarch.h"
#include "hardware.h"
#include "bmtrap.h"
#include "playerphase.h"
#include "popup.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmbattle.h"
#include "eventinfo.h"

#include "cp_perform.h"

#include "constants/terrains.h"
#include "constants/songs.h"

struct CpPerformProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ s8(*func)(struct CpPerformProc* proc);
    /* 30 */ u8 unk_30;
    /* 31 */ u8 isUnitVisible;
};

/* JP-specific symbol names for these function pointers */
s8 sub_803A6EC(struct CpPerformProc* proc);
s8 sub_803A2E8(struct CpPerformProc* proc);

s8 AiEscapeAction(struct CpPerformProc*);
s8 AiWaitAndClearScreenAction(struct CpPerformProc*);
s8 AiPillageAction(struct CpPerformProc*);
s8 AiStaffAction(struct CpPerformProc*);
s8 AiUseItemAction(struct CpPerformProc*);
s8 AiTalkAction(struct CpPerformProc*);
s8 AiRideBallistaAction(struct CpPerformProc*);
s8 AiExitBallistaAction(struct CpPerformProc*);
s8 AiPickAction(struct CpPerformProc*);

void AiStartCombatAction(struct CpPerformProc* proc);
void AiStartEscapeAction(struct CpPerformProc* proc);
void AiStartStealAction(struct CpPerformProc* proc);
void AiDKNightmareAction(struct CpPerformProc* proc);
void AiDKSummonAction(struct CpPerformProc* proc);

void CpPerform_PerformAction(struct CpPerformProc* proc) {
    proc->unk_30 = 0;

    if (gActionData.unitActionType == UNIT_ACTION_TRAPPED) {
        proc->func = sub_803A6EC;

        return;
    }

    switch (gAiDecision.actionId) {
        case AI_ACTION_NONE:
            proc->func = sub_803A6EC;

            break;

        case AI_ACTION_COMBAT:
            proc->func = sub_803A6EC;
            AiStartCombatAction(proc);

            break;

        case AI_ACTION_ESCAPE:
            AiStartEscapeAction(proc);
            proc->func = AiEscapeAction;

            break;

        case AI_ACTION_STEAL:
            AiStartStealAction(proc);
            proc->func = AiWaitAndClearScreenAction;

            break;

        case AI_ACTION_PILLAGE:
            proc->func = AiPillageAction;

            break;

        case AI_ACTION_STAFF:
            proc->func = AiStaffAction;

            break;

        case AI_ACTION_USEITEM:
            proc->func = AiUseItemAction;

            break;

        case AI_ACTION_REFRESH:
            proc->func = sub_803A2E8;

            break;

        case AI_ACTION_TALK:
            proc->func = AiTalkAction;

            break;

        case AI_ACTION_RIDEBALLISTA:
            proc->func = AiRideBallistaAction;

            break;

        case AI_ACTION_EXITBALLISTA:
            proc->func = AiExitBallistaAction;

            break;

        case AI_ACTION_DKNIGHTMARE:
            proc->func = sub_803A6EC;
            AiDKNightmareAction(proc);

            break;

        case AI_ACTION_DKSUMMON:
            proc->func = sub_803A6EC;
            AiDKSummonAction(proc);

            break;

        case AI_ACTION_PICK:
            proc->func = AiPickAction;

            break;
    }

    return;
}
