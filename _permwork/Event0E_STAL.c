#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "event.h"
#include "eventscript.h"
#include "eventinfo.h"

u8 Event0E_STAL(struct EventEngineProc * proc)
{
    u8 subcode;
    s16 stallTimer;

    subcode = EVT_SUB_CMD(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        proc->evStallTimer = 0;
        return EVC_ADVANCE_CONTINUE;
    }

    if (((subcode & 1) && (((proc->evStateBits >> 0x3) & 1) || (gKeyStatusPtr->newKeys & B_BUTTON))))
        goto end_stall;

    stallTimer = proc->evStallTimer;

    if (stallTimer <= 0)
    {
        proc->evStallTimer = proc->pEventCurrent[1];
    }
    else
    {
        int timeStep = 1;

        if (!(proc->evStateBits & EV_STATE_0040) && (subcode & 2))
            if ((gPlaySt.config.gameSpeed != 0) || (gKeyStatusPtr->heldKeys & A_BUTTON))
                timeStep = 4;

        stallTimer = stallTimer - timeStep;

        if (stallTimer <= 0)
        {

        end_stall:
            proc->evStallTimer = 0;
            return EVC_ADVANCE_CONTINUE;
        }

        proc->evStallTimer = stallTimer;
    }

    return EVC_STOP_YIELD;
}
