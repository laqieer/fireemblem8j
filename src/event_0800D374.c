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

struct EventEngineProc* EventEngine_Create(const u16* events, u8 execType) {
    struct EventEngineProc* proc = Proc_Start(ProcScr_StdEventEngine, PROC_TREE_3);

    proc->pCallback      = NULL;

    proc->pEventStart    = events;
    proc->pEventIdk      = events;
    proc->pEventCurrent  = events;

    proc->evStateBits    = EV_STATE_NONE;
    proc->evStallTimer   = 0;

    proc->overwrittenTextSpeed = -1;
    proc->execType       = execType;
    proc->activeTextType = 0;
    proc->chapterIndex   = -1;

    proc->mapSpritePalIdOverride = 0x000;

    proc->pUnitLoadData  = NULL;
    proc->unitLoadCount  = 0;
    proc->chance          = 0;

    if (gLCDControlBuffer.blendY == 0x10)
        proc->evStateBits |= EV_STATE_FADEDIN;

    switch (execType) {
    case EV_EXEC_WORLDMAP:
        break;

    case EV_EXEC_CUTSCENE:
    case EV_EXEC_GAMEPLAY:
        proc->chapterIndex = gPlaySt.chapterIndex;
        LockGame();
        break;
    }

    return proc;
}
