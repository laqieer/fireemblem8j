#include "global.h"

#include "constants/items.h"

#include "proc.h"
#include "hardware.h"
#include "icon.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "statscreen.h"
#include "face.h"
#include "sysutil.h"
#include "bm.h"
#include "bmitem.h"
#include "bmtrade.h"
#include "bmunit.h"
#include "bmmind.h"
#include "m4a.h"
#include "uimenu.h"
#include "helpbox.h"
#include "soundwrapper.h"
#include "event.h"
#include "eventinfo.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "constants/songs.h"

extern EWRAM_DATA struct TradeMenuProc * gpTradeMenuProc;
extern EWRAM_OVERLAY(0) struct Text gTradeMenuText[2][UNIT_ITEM_COUNT];

extern CONST_DATA struct Vec2 gTradeItemDisplayTileLocation[2][UNIT_ITEM_COUNT];



extern CONST_DATA struct ProcCmd ProcScr_TradeMenu[];



extern CONST_DATA struct ProcCmd ProcScr_TradeMenu_TutorialHandCursor[];

extern CONST_DATA struct ProcCmd ProcScr_TradeMenu_DoubleTutorialHandCursor[];

extern CONST_DATA struct ProcCmd ProcScr_TradeMenu_TutorialWait[];

extern CONST_DATA struct ProcCmd ProcScr_TradeMenu_TutorialEventLock[];

/* prototypes for same-file helpers called by this run */
int TradeMenu_GetAdjustedRow(struct TradeMenuProc * proc, int col, int row);
void TradeMenu_RefreshItemText(struct TradeMenuProc * proc);

s8 TradeMenu_UpdateSelection(struct TradeMenuProc * proc)
{
    s8 changedSelection = FALSE;
    int newSelectedRow;

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) && proc->hoverColumn == POS_R)
    {
        newSelectedRow = TradeMenu_GetAdjustedRow(proc, POS_L, proc->hoverRow);

        if (newSelectedRow < 0)
            goto end;

        proc->hoverColumn = POS_L;
        proc->hoverRow = newSelectedRow;

        changedSelection = TRUE;

        PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) && proc->hoverColumn == POS_L)
    {
        newSelectedRow = TradeMenu_GetAdjustedRow(proc, POS_R, proc->hoverRow);

        if (newSelectedRow < 0)
            goto end;

        proc->hoverColumn = POS_R;
        proc->hoverRow = newSelectedRow;

        changedSelection = TRUE;

        PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_UP))
    {
        if (proc->hoverRow == 0)
        {
            if (gKeyStatusPtr->repeatedKeys != gKeyStatusPtr->newKeys)
                goto end;

            proc->hoverRow = TradeMenu_GetAdjustedRow(proc, proc->hoverColumn, UNIT_ITEM_COUNT - 1) + 1;
        }

        proc->hoverRow--;

        changedSelection = TRUE;

        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_DOWN))
    {
        if (!proc->hasItem[proc->hoverColumn][proc->hoverRow + 1])
        {
            if (gKeyStatusPtr->repeatedKeys != gKeyStatusPtr->newKeys)
                goto end;

            proc->hoverRow = -1;
        }

        proc->hoverRow++;

        changedSelection = TRUE;

        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
    }

end:
    return changedSelection;
}

void TradeMenu_ApplyItemSwap(struct TradeMenuProc * proc)
{
    u16* pItemA = &proc->units[proc->hoverColumn]->items[proc->hoverRow];
    u16* pItemB = &proc->units[proc->selectedColumn]->items[proc->selectedRow];

    u16 swp = *pItemA;
    *pItemA = *pItemB;
    *pItemB = swp;

    proc->hasTraded = TRUE;

    gActionData.unitActionType = UNIT_ACTION_TRADED;

    UnitRemoveInvalidItems(proc->units[0]);
    UnitRemoveInvalidItems(proc->units[1]);

    TradeMenu_RefreshItemText(proc);
}
