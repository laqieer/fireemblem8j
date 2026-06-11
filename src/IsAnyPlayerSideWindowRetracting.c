#include "global.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmmap.h"
#include "ctc.h"
#include "bmtrick.h"
#include "icon.h"
#include "uiutils.h"
#include "uichapterstatus.h"
#include "chapterdata.h"
#include "face.h"
#include "bm.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "bmlib.h"
#include "worldmap.h"
#include "player_interface.h"
#include "constants/event-flags.h"
#include "constants/msg.h"
#include "constants/terrains.h"

//! FE8U = 0x0808D814
bool IsAnyPlayerSideWindowRetracting(void)
{
    struct PlayerInterfaceProc * proc;

    proc = Proc_Find(gProcScr_UnitDisplay_MinimugBox);

    if (proc != NULL && proc->isRetracting)
    {
        return true;
    }

    proc = Proc_Find(gProcScr_TerrainDisplay);

    if (proc != NULL && proc->isRetracting)
    {
        return true;
    }

    proc = Proc_Find(gProcScr_GoalDisplay);

    if (proc != NULL && proc->isRetracting)
    {
        return true;
    }

    return false;
}
