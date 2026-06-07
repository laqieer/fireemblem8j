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

// clang-format off

struct PlayerInterfaceConfigEntry CONST_DATA sPlayerInterfaceConfigLut[4] =
{
    {
        +1, +1,
        -1, +1,
        +1, -1,
    },
    {
        -1, +1,
        -1, -1,
        +1, +1,
    },
    {
        +1, +1,
        -1, -1,
        +1, -1,
    },
    {
        -1, +1,
        -1, -1,
        +1, -1,
    }
};





































/* prototypes for same-file helpers called by this run */
int GetCursorQuadrant(void);

//! FE8U = 0x0808D870
void MenuButtonDisp_Init(struct PlayerInterfaceProc * proc)
{
    Decompress(Img_PrepHelpButtonSprites, OBJ_CHR_ADDR(0x280));

    proc->xHp = 136;
    proc->yHp = 140;
    proc->isRetracting = false;

    return;
}

//! FE8U = 0x0808D8A0
void UpdateMenuButtonPos(struct PlayerInterfaceProc * proc, int quadrant, int offset)
{
    int x = sPlayerInterfaceConfigLut[quadrant].xGoal;
    int y = sPlayerInterfaceConfigLut[quadrant].yGoal;

    if ((x < 0) && (y < 0))
    {
        proc->xHp = 8;
        proc->yHp = offset - 20;
    }

    if ((x > 0) && (y < 0))
    {
        proc->xHp = 172;
        proc->yHp = offset - 20;
    }

    if ((x < 0) && (y > 0))
    {
        proc->xHp = 8;
        proc->yHp = 164 - offset;
    }

    if ((x > 0) && (y > 0))
    {
        proc->xHp = 172;
        proc->yHp = 164 - offset;
    }

    return;
}

//! FE8U = 0x0808D924
void DrawMenuButtonAt(int x, int y)
{
    PutSprite(4, OAM1_X(x + 0), OAM0_Y(y), gObject_32x16, OAM2_CHR(0x280) + OAM2_PAL(2));
    PutSprite(4, OAM1_X(x + 32), OAM0_Y(y), gObject_32x16, OAM2_CHR(0x284) + OAM2_PAL(2));

    return;
}

//! FE8U = 0x0808D97C
void MenuButtonDisp_UpdateCursorPos(struct PlayerInterfaceProc * proc)
{
    proc->cursorQuadrant = GetCursorQuadrant();

    UpdateMenuButtonPos(proc, proc->cursorQuadrant, proc->showHideClock);

    proc->showHideClock = 0;

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    return;
}

//! FE8U = 0x0808D9B8
void MenuButtonDisp_Loop_OnSlideIn(struct PlayerInterfaceProc * proc)
{
    proc->showHideClock += 4;

    UpdateMenuButtonPos(proc, proc->cursorQuadrant, proc->showHideClock);
    DrawMenuButtonAt(proc->xHp, proc->yHp);

    if (proc->showHideClock == 24)
    {
        Proc_Break(proc);
        proc->isRetracting = false;
    }

    return;
}

//! FE8U = 0x0808D9FC
void MenuButtonDisp_Loop_Display(struct PlayerInterfaceProc * proc)
{
    DrawMenuButtonAt(proc->xHp, proc->yHp);

    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    if (proc->xCursor == proc->xCursorPrev && proc->yCursor == proc->yCursorPrev)
    {
        return;
    }

    if (Proc_Find(ProcScr_CamMove) == NULL)
    {
        int cursorQuadrant = GetCursorQuadrant();
        int quadrant = proc->cursorQuadrant;

        if (cursorQuadrant == quadrant)
        {
            return;
        }

        if ((sPlayerInterfaceConfigLut[cursorQuadrant].xGoal == sPlayerInterfaceConfigLut[quadrant].xGoal) &&
            (sPlayerInterfaceConfigLut[cursorQuadrant].yGoal == sPlayerInterfaceConfigLut[quadrant].yGoal))
        {
            return;
        }
    }

    proc->isRetracting = true;

    Proc_Break(proc);

    return;
}
