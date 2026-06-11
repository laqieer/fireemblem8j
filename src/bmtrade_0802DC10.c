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

void TradeMenu_HelpBox_OnEnd(struct Proc * proc)
{
    struct TradeMenuProc * tradeMenu = (struct TradeMenuProc *) proc->proc_parent;

    if (tradeMenu->extraCellEnabled)
    {
        tradeMenu->hasItem[tradeMenu->extraColumn][tradeMenu->extraRow] = TRUE;
    }

    CloseHelpBox();

    DisplayUiHand(
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);

    if (tradeMenu->extraCellEnabled)
    {
        DisplayFrozenUiHand(
            8 * gTradeItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].x,
            8 * gTradeItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].y);
    }
}

struct Proc * StartTradeMenu(struct Unit* lUnit, struct Unit* rUnit, int unused)
{
    int itemCount;

    struct TradeMenuProc * proc = Proc_Start(ProcScr_TradeMenu, PROC_TREE_3);

    proc->units[0] = lUnit;
    proc->units[1] = rUnit;

    proc->hasTraded = FALSE;

    proc->hoverColumn = POS_L;
    proc->hoverRow = 0;

    proc->tradeTutorialState = TRADE_TUT_NONE;

    gpTradeMenuProc = proc;

    if (CheckTradeTutorial())
    {
        SetKeyStatus_IgnoreMask(A_BUTTON | START_BUTTON | DPAD_DOWN | DPAD_UP);
        proc->tradeTutorialState = TRADE_TUT_INIT;
    }

    if (GetUnitItemCount(lUnit) == 0)
    {
        proc->hoverColumn = POS_R;
    }
}

void TradeMenu_TutorialHandCursor_Update(void)
{
    struct TradeMenuProc * tradeMenu = gpTradeMenuProc;

    DisplayFrozenUiHand(
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);
}

void TradeMenu_DoubleTutorialHandCursor_Update(void)
{
    struct TradeMenuProc * tradeMenu = gpTradeMenuProc;

    DisplayFrozenUiHand(
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);

    DisplayFrozenUiHand(
        8 * gTradeItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].x,
        8 * gTradeItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].y);
}

void StartTradeMenuTutorialHandCursor(void)
{
    Proc_Start(ProcScr_TradeMenu_TutorialHandCursor, PROC_TREE_3);
}

void StartDoubleTradeMenuTutorialHandCursor(void)
{
    Proc_Start(ProcScr_TradeMenu_DoubleTutorialHandCursor, PROC_TREE_3);
}

void EndTradeMenuTutorialHandCursor(void)
{
    Proc_EndEach(ProcScr_TradeMenu_TutorialHandCursor);
}

void EndDoubleTradeMenuTutorialHandCursor(void)
{
    Proc_EndEach(ProcScr_TradeMenu_DoubleTutorialHandCursor);
}
