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
void TradeMenu_RefreshSelectableCells(struct TradeMenuProc * proc);

s8 TradeMenu_LoadForcedInitialHover(struct TradeMenuProc * proc)
{
    if (gBmSt.unk3F < 0)
        return TRUE;

    proc->hoverColumn = gBmSt.unk3F / UNIT_ITEM_COUNT;
    proc->hoverRow   = gBmSt.unk3F % UNIT_ITEM_COUNT;

    TradeMenu_RefreshSelectableCells(proc);
    Proc_Goto(proc, L_TRADEMENU_SELECTED);

    return FALSE;
}
