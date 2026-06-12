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

extern CONST_DATA struct ProcCmd ProcScr_StdEventEngine[];

extern CONST_DATA struct ProcCmd ProcScr_BattleEventEngine[];

extern CONST_DATA EventFuncType gEventLoCmdTable[];





extern CONST_DATA EventFuncType gEventHiCmdTable[];

/* prototypes for same-file helpers called by this run */
void EventEngine_BlankTalkDisplay(struct EventEngineProc* unused);

void EventEngine_StartSkip(struct EventEngineProc* proc) {
    proc->evStateBits |= EV_STATE_SKIPPING;

    if (!GetZero()) {
        if (WM_Exists() == TRUE) // World Map check
            EventEngine_BlankTalkDisplay(proc);
        else if (!(proc->evStateBits & EV_STATE_NOFADE)) {
            if (proc->evStateBits & EV_STATE_FADEDIN)
                EventEngine_BlankTalkDisplay(proc);
            else
                StartLockingFadeToBlack(0x40, (struct Proc*)(proc));

            proc->evStateBits |= EV_STATE_FADEDIN;
        }
    }

    if (proc->execType == EV_EXEC_WORLDMAP)
        GMapScreen_OnWorldmapEventUpdate();

    Proc_BlockEachMarked(5);
}
