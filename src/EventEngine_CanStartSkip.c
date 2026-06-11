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

bool8 EventEngine_CanStartSkip(struct EventEngineProc* proc) { // Events_CanSkip
    if (!(proc->evStateBits & EV_STATE_0002))
        return FALSE;

    // Why is this check so different??
    if (((proc->evStateBits >> 2) & 1)) // & EV_STATE_SKIPPING
        return FALSE;

    if ((proc->evStateBits & EV_STATE_NOSKIP))
        return FALSE;

    if (IsBattleDeamonActive())
        return FALSE;

    if (Proc_Find(ProcScr_MuDeathFade))
        return FALSE;

    return TRUE;
}
