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

void CpPerform_MoveCameraOntoTarget(struct CpPerformProc* proc) {
    struct Unit* unit;

    int x = 0;
    int y = 0;

    if (gActionData.unitActionType == UNIT_ACTION_TRAPPED) {
        return;
    }

    switch (gAiDecision.actionId) {
        case AI_ACTION_NONE:
        case AI_ACTION_ESCAPE:
        case AI_ACTION_PILLAGE:
        case AI_ACTION_USEITEM:
        case AI_ACTION_RIDEBALLISTA:
        case AI_ACTION_EXITBALLISTA:
        case AI_ACTION_DKNIGHTMARE:
        case AI_ACTION_DKSUMMON:
        case AI_ACTION_PICK:

            return;

        case AI_ACTION_COMBAT:
            if (gAiDecision.targetId == 0) {
                x = gAiDecision.xTarget;
                y = gAiDecision.yTarget;
            } else {
                unit = GetUnit(gAiDecision.targetId);
                x = unit->xPos;
                y = unit->yPos;
            }

            if (((s8)gAiDecision.itemSlot == -1) && !(gActiveUnit->state & US_IN_BALLISTA)) {
                EndAllMus();

                gActiveUnit->xPos = gAiDecision.xMove;
                gActiveUnit->yPos = gAiDecision.yMove;

                RideBallista(gActiveUnit);

                StartMu(gActiveUnit);
                SetAutoMuDefaultFacing();
            }

            break;

        case AI_ACTION_STEAL:
            unit = GetUnit(gAiDecision.targetId);

            x = unit->xPos;
            y = unit->yPos;

            break;

        case AI_ACTION_REFRESH:
            unit = GetUnit(gAiDecision.targetId);

            x = unit->xPos;
            y = unit->yPos;

            break;

        case AI_ACTION_TALK:
            unit = GetUnit(gAiDecision.yTarget);

            x = unit->xPos;
            y = unit->yPos;

            break;

        case AI_ACTION_STAFF:
            if (gAiDecision.targetId == 0) {
                return;
            }

            unit = GetUnit(gAiDecision.targetId);

            x = unit->xPos;
            y = unit->yPos;

            break;
    }

    EnsureCameraOntoPosition(proc, x, y);
    StartAiTargetCursor(x * 16, y * 16, 2, proc);

    return;
}
