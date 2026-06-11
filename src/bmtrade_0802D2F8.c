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

void TradeMenu_HighlightUpdater_OnLoop(struct TradeMenuProc * proc)
{
    struct TradeMenuProc * tradeMenu = proc->proc_parent;

    if (proc->hoverColumn == tradeMenu->hoverColumn && proc->hoverRow == tradeMenu->hoverRow)
        return;

    if (proc->hoverColumn != (u8)POS_INVALID)
    {
        ClearUiItemHover(
            gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y,
            12);
    }

    DrawUiItemHover(
        gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y,
        12);

    proc->hoverColumn = tradeMenu->hoverColumn;
    proc->hoverRow = tradeMenu->hoverRow;
}
