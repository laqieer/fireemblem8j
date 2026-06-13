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

 // nullsub

int IsActiveEventTextTypeOnMap(void) {
    struct EventEngineProc* proc;

    if (!(proc = Proc_Find(ProcScr_StdEventEngine)))
        if (!(proc = Proc_Find(ProcScr_BattleEventEngine)))
            return FALSE;

    switch (proc->activeTextType) {

    case 0:
        return FALSE;

    case 1:
        return TRUE;

    case 2:
        return TRUE;

    case 3:
        return FALSE;

    case 4:
        return FALSE;

    case 5:
        return FALSE;

    }

    return FALSE;
}
