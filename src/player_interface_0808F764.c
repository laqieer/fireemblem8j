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

//! FE8U = 0x0808D47C
void GoalDisplay_Loop_OnSideChange(struct PlayerInterfaceProc * proc)
{
    int quadrant;
    struct PlayerInterfaceProc * tiProc;

    proc->showHideClock = 0;
    proc->hideContents = true;

    proc->cursorQuadrant = GetCursorQuadrant();

    quadrant = GetWindowQuadrant(
        sPlayerInterfaceConfigLut[proc->cursorQuadrant].xGoal, sPlayerInterfaceConfigLut[proc->cursorQuadrant].yGoal);

    tiProc = Proc_Find(gProcScr_TerrainDisplay);

    if (tiProc != NULL)
    {
        if ((tiProc->windowQuadrant > -1) && (tiProc->windowQuadrant == quadrant))
        {
            return;
        }
    }

    proc->windowQuadrant = quadrant;

    DrawGoalDisplayWindow(proc);

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0808D514
void PutGoalDisplayWindow(int quadrant, int param_2, int param_3)
{
    int x = sPlayerInterfaceConfigLut[quadrant].xGoal;
    int y = sPlayerInterfaceConfigLut[quadrant].yGoal;

    if ((x < 0) && (y < 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer, 12, 6, 0);
        TileMap_FillRect(gBG0TilemapBuffer, 12, 6, 0);

        TileMap_CopyRect(gUiTmScratchB + TILEMAP_INDEX(20, (16 - param_2)), gBG1TilemapBuffer, 12, param_2);
        TileMap_CopyRect(gUiTmScratchA + TILEMAP_INDEX(20, (18 - param_2)), gBG0TilemapBuffer, 12, param_2);
    }

    if ((x > 0) && (y < 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(19, 0), 12, 6, 0);
        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(19, 0), 12, 6, 0);

        TileMap_CopyRect(
            gUiTmScratchB + TILEMAP_INDEX(20, (16 - param_2)), gBG1TilemapBuffer + TILEMAP_INDEX(19, 0), 12, param_2);
        TileMap_CopyRect(
            gUiTmScratchA + TILEMAP_INDEX(20, (18 - param_2)), gBG0TilemapBuffer + TILEMAP_INDEX(19, 0), 12, param_2);
    }

    if ((x < 0) && (y > 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(0, 14), 12, 6, 0);
        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(0, 14), 12, 6, 0);

        TileMap_CopyRect(
            gUiTmScratchB + TILEMAP_INDEX(20, 10),
            gBG1TilemapBuffer + 0x1C0 + 0x20 * (({ (1 - param_3) * 2 + 20; }) - param_2) - 0x1C0, 12, param_2);
        TileMap_CopyRect(
            gUiTmScratchA + TILEMAP_INDEX(20, 12),
            gBG0TilemapBuffer + 0x1C0 + 0x20 * (({ (1 - param_3) * 2 + 20; }) - param_2) - 0x1C0, 12, param_2);
    }

    if ((x > 0) && (y > 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(19, 14), 12, 6, 0);
        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(19, 14), 12, 6, 0);

        TileMap_CopyRect(
            gUiTmScratchB + TILEMAP_INDEX(20, 10),
            gBG1TilemapBuffer + 0x1D3 + 0x20 * (({ (1 - param_3) * 2 + 20; }) - param_2) - 0x1C0, 12, param_2);
        TileMap_CopyRect(
            gUiTmScratchA + TILEMAP_INDEX(20, 12),
            gBG0TilemapBuffer + 0x1D3 + 0x20 * (({ (1 - param_3) * 2 + 20; }) - param_2) - 0x1C0, 12, param_2);
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}

//! FE8U = 0x0808D6D4
void GoalDisplay_Loop_SlideIn(struct PlayerInterfaceProc * proc)
{
    int unk = sGoalSlideInWidthLut[proc->showHideClock];

    PutGoalDisplayWindow(proc->cursorQuadrant, unk, proc->unitClock);

    proc->showHideClock++;

    if (proc->showHideClock == 5)
    {
        proc->showHideClock = 0;
        proc->hideContents = false;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808D71C
void GoalDisplay_Loop_SlideOut(struct PlayerInterfaceProc * proc)
{
    int unk;

    proc->hideContents = true;

    unk = sGoalSlideOutWidthLut[proc->showHideClock];

    PutGoalDisplayWindow(proc->cursorQuadrant, unk, proc->unitClock);

    proc->showHideClock++;

    if (proc->showHideClock == 3)
    {
        proc->showHideClock = 0;
        proc->hideContents = false;
        proc->isRetracting = false;
        proc->windowQuadrant = -1;

        Proc_Break(proc);
    }

    return;
}
