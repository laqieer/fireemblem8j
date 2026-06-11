#include "global.h"
#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "mu.h"
#include "bmmap.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "statscreen.h"
#include "bmidoten.h"
#include "bmpatharrowdisp.h"
#include "event.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "prepscreen.h"
#include "bmtrick.h"
#include "bmio.h"
#include "hardware.h"
#include "bmphase.h"
#include "bmmind.h"
#include "bmtrap.h"
#include "minimap.h"
#include "player_interface.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "eventinfo.h"
#include "playerphase.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd sProcScr_MoveLimitView[];

//! FE8U = 0x0801DACC
void HideMoveRangeGraphics(void)
{
    Proc_EndEach(sProcScr_MoveLimitView);
    return;
}

//! FE8U = 0x0801DADC
bool TrySetCursorOn(int unitId)
{
    ProcPtr proc;

    struct Unit * unit = GetUnit(unitId);

    if (!UNIT_IS_VALID(unit))
    {
        return false;
    }

    if (unit->state & (US_HIDDEN | US_UNSELECTABLE | US_DEAD | US_BIT16))
    {
        return false;
    }

    if (unit->statusIndex == UNIT_STATUS_BERSERK || unit->statusIndex == UNIT_STATUS_SLEEP)
    {
        return false;
    }

    proc = Proc_Find(gProcScr_PlayerPhase);

    if (!proc)
    {
        proc = Proc_Find(gProcScr_SALLYCURSOR);
    }

    EnsureCameraOntoPosition(proc, unit->xPos, unit->yPos);
    SetCursorMapPosition(unit->xPos, unit->yPos);

    return true;
}
