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

CONST_DATA struct Vec2 gTradeItemDisplayTileLocation[2][UNIT_ITEM_COUNT] = {
    [POS_L] = {
        { ITEM_PANEL_LEFT_X + 1, ITEM_PANEL_LEFT_Y + 1 },
        { ITEM_PANEL_LEFT_X + 1, ITEM_PANEL_LEFT_Y + 3 },
        { ITEM_PANEL_LEFT_X + 1, ITEM_PANEL_LEFT_Y + 5 },
        { ITEM_PANEL_LEFT_X + 1, ITEM_PANEL_LEFT_Y + 7 },
        { ITEM_PANEL_LEFT_X + 1, ITEM_PANEL_LEFT_Y + 9 },
    },

    [POS_R] = {
        { ITEM_PANEL_RIGHT_X + 1, ITEM_PANEL_RIGHT_Y + 1 },
        { ITEM_PANEL_RIGHT_X + 1, ITEM_PANEL_RIGHT_Y + 3 },
        { ITEM_PANEL_RIGHT_X + 1, ITEM_PANEL_RIGHT_Y + 5 },
        { ITEM_PANEL_RIGHT_X + 1, ITEM_PANEL_RIGHT_Y + 7 },
        { ITEM_PANEL_RIGHT_X + 1, ITEM_PANEL_RIGHT_Y + 9 },
    }
};











extern CONST_DATA struct ProcCmd ProcScr_TradeMenu_TutorialWait[];



void TradeMenu_HelpBox_OnInit(struct Proc * proc)
{
    struct TradeMenuProc * tradeMenu = proc->proc_parent;

    int item = tradeMenu->units[tradeMenu->hoverColumn]->items[tradeMenu->hoverRow];

    if (!item)
    {
        Proc_End(proc);
        return;
    }

    if (tradeMenu->extraCellEnabled)
    {
        tradeMenu->hasItem[tradeMenu->extraColumn][tradeMenu->extraRow] = FALSE;
    }

    LoadHelpBoxGfx(NULL, -1);

    StartItemHelpBox(
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y,
        item);

    gKeyStatusPtr->newKeys = gKeyStatusPtr->newKeys &~ (B_BUTTON | R_BUTTON);
}
