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

void SetDialogueSkipEvBit(void) {
    struct EventEngineProc* proc;

    if (!(proc = Proc_Find(ProcScr_StdEventEngine)))
        if (!(proc = Proc_Find(ProcScr_BattleEventEngine)))
            return;

    proc->evStateBits |= EV_STATE_0008;
}
