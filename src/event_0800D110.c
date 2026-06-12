#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "mu.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "uimenu.h"
#include "scene.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "worldmap.h"
#include "cgtext.h"
#include "helpbox.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"

void EventEngine_OnUpdate(struct EventEngineProc * proc)
{
    if (DoesBMXFADEExist())
        return;

    if (EventEngine_CanStartSkip(proc) && (gKeyStatusPtr->newKeys & START_BUTTON)) {
        EventEngine_StartSkip(proc);
        return;
    }

    if (proc->execType != EV_EXEC_WORLDMAP && proc->execType != EV_EXEC_UNK4) {
        gLCDControlBuffer.dispcnt.bg0_on = TRUE;
        gLCDControlBuffer.dispcnt.bg1_on = TRUE;
        gLCDControlBuffer.dispcnt.bg2_on = TRUE;
        gLCDControlBuffer.dispcnt.bg3_on = TRUE;
        gLCDControlBuffer.dispcnt.obj_on = TRUE;
    }

    if (proc->pCallback) {
        proc->pCallback(proc);
        return;
    }

    proc->evStateBits |= EV_STATE_0002;

    while (TRUE) {
        unsigned evCode;
        EventFuncType evFunc;

        // Event Slot 0
        gEventSlots[0] = 0;

        evCode = (*proc->pEventCurrent) >> 8;
        evFunc = (evCode < 0x80) ? gEventLoCmdTable[evCode] : gEventHiCmdTable[evCode - 0x80];

        switch (evFunc(proc)) {
        case EVC_ADVANCE_CONTINUE:
            proc->pEventCurrent += ((*proc->pEventCurrent) >> 4)&0xF;
        case EVC_STOP_CONTINUE:
        case EVC_UNK4:
        case EVC_ERROR:
            break;
        
        case EVC_ADVANCE_YIELD:
            proc->pEventCurrent += ((*proc->pEventCurrent) >> 4)&0xF;
        case EVC_STOP_YIELD:
            return;
        
        case EVC_END:
            Proc_Break(proc);
            return;
        }
    }
}
