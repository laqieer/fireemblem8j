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

void ClearUnitBurstMapUi(struct PlayerInterfaceProc * proc);
void UnitMapUiUpdate(struct PlayerInterfaceProc * proc, struct Unit * unit);

//! FE8U = 0x0808CEC8
void BurstDisplay_Loop_Display(struct PlayerInterfaceProc * proc)
{
    struct PlayerInterfaceProc * tiProc;
    struct PlayerInterfaceProc * piProc;

    proc->burstUnitIdPrev = proc->burstUnitId;

    proc->burstUnitId = gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x];

    if ((proc->burstUnitIdPrev != proc->burstUnitId) && (proc->burstUnitIdPrev != 0))
    {
        ClearUnitBurstMapUi(proc);
        proc->showHideClock = 0;

        return;
    }

    if ((proc->burstUnitId == 0) || (Proc_Find(ProcScr_CamMove) != 0))
    {
        return;
    }

    tiProc = Proc_Find(gProcScr_TerrainDisplay);

    if (tiProc != NULL)
    {
        if (tiProc->hideContents)
        {
            if (proc->showHideClock < 4)
            {
                proc->showHideClock++;
            }

            return;
        }
    }

    piProc = Proc_Find(gProcScr_GoalDisplay);

    if (piProc != NULL)
    {
        if (piProc->hideContents)
        {
            if (proc->showHideClock < 4)
            {
                proc->showHideClock++;
            }

            return;
        }
    }

    proc->showHideClock++;

    if (proc->showHideClock < 8)
    {
        return;
    }

    if (proc->showHideClock == 8)
    {
        DrawUnitBurstMapUi(proc, GetUnit(proc->burstUnitId));
    }
    else
    {

        proc->unitClock++;

        if (tiProc)
        {
            proc->hideContents = tiProc->hideContents;
        }
        else
        {
            proc->hideContents = false;
        }

        UnitMapUiUpdate(proc, GetUnit(proc->burstUnitId));
    }

    return;
}
