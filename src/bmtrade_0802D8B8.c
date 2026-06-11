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

extern CONST_DATA struct ProcCmd ProcScr_TradeMenu_HelpBox[];

extern CONST_DATA struct ProcCmd ProcScr_TradeMenu_TutorialHandCursor[];

extern CONST_DATA struct ProcCmd ProcScr_TradeMenu_DoubleTutorialHandCursor[];

extern CONST_DATA struct ProcCmd ProcScr_TradeMenu_TutorialWait[];

extern CONST_DATA struct ProcCmd ProcScr_TradeMenu_TutorialEventLock[];

/* prototypes for same-file helpers called by this run */
s8 TradeMenu_UpdateSelection(struct TradeMenuProc * proc);
void TradeMenu_ApplyItemSwap(struct TradeMenuProc * proc);
s8 TradeMenu_UpdateTutorial(struct TradeMenuProc * proc);

void TradeMenu_OnLoopSelected(struct TradeMenuProc * proc)
{
    if (TradeMenu_UpdateTutorial(proc))
    {
        DisplayUiHand(
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);

        DisplayFrozenUiHand(
            8 * gTradeItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].x,
            8 * gTradeItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].y);
    }
    else
    {
        TradeMenu_UpdateSelection(proc);

        DisplayUiHand(
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);

        DisplayFrozenUiHand(
            8 * gTradeItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].x,
            8 * gTradeItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].y);

        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            TradeMenu_ApplyItemSwap(proc);

            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
            Proc_Break(proc);
        }
        else if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            Proc_Break(proc);
        }
        else if (gKeyStatusPtr->newKeys & R_BUTTON)
        {
            Proc_StartBlocking(ProcScr_TradeMenu_HelpBox, proc);
        }
    }
}
