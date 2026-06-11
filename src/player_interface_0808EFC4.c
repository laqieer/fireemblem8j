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

int GetWindowQuadrant(int x, int y);
void UnitMapUiUpdate(struct PlayerInterfaceProc * proc, struct Unit * unit);

//! FE8U = 0x0808CCC8
void MMB_Loop_OnSideChange(struct PlayerInterfaceProc * proc)
{
    int quadrant;
    struct PlayerInterfaceProc * tiProc;

    struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);

    if (unit == NULL)
    {
        return;
    }

    proc->hideContents = true;

    proc->cursorQuadrant = GetCursorQuadrant();

    quadrant = GetWindowQuadrant(
        sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug,
        sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug);

    tiProc = Proc_Find(gProcScr_TerrainDisplay);

    if (tiProc != NULL)
    {
        if ((tiProc->windowQuadrant > -1) && (tiProc->windowQuadrant == quadrant))
        {
            return;
        }
    }

    proc->windowQuadrant = quadrant;

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    DrawUnitMapUi(proc, unit);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0808CD74
void MMB_Loop_Display(struct PlayerInterfaceProc * proc)
{
    struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);

    proc->unitClock++;

    UnitMapUiUpdate(proc, unit);

    if ((proc->unitClock & 63) == 0)
    {
        PutUnitMapUiWindow(proc);
    }

    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    if ((proc->xCursor == proc->xCursorPrev) && (proc->yCursor == proc->yCursorPrev))
    {
        return;
    }

    if (unit != NULL && Proc_Find(ProcScr_CamMove) == NULL)
    {
        int cursorQuadrant = GetCursorQuadrant();

        if ((cursorQuadrant == proc->cursorQuadrant) ||
            ((sPlayerInterfaceConfigLut[cursorQuadrant].xMinimug ==
              sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug) &&
             (sPlayerInterfaceConfigLut[cursorQuadrant].yMinimug ==
              sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug)))
        {
            Proc_Goto(proc, 1);
            return;
        }
    }

    proc->isRetracting = true;

    Proc_Break(proc);

    return;
}
