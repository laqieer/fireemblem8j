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

void TradeMenu_InitUnitNameDisplay(struct TradeMenuProc * proc)
{
    char* str;
    int xStart;

    // TODO: constants
    StartSysBrownBox(6, 0x4800, 0x08, 0x800, 0x400, (struct Proc *) (proc));

    EnableSysBrownBox(0, -40, -1, 1);
    EnableSysBrownBox(1, 184, -1, 0);

    // TODO: special effect constants
    SetBlendConfig(1, 12, 6, 0);

    // TODO: name functions
    SetBlendTargetA(FALSE, FALSE, FALSE, FALSE, FALSE);
    SetBlendTargetB(TRUE,  TRUE,  TRUE,  TRUE,  TRUE);

    // TODO: text color constants

    str = GetStringFromIndex(UNIT_NAME_ID(proc->units[0]));
    xStart = ((8 * UNIT_PANEL_WIDTH) - GetStringTextLen(str)) / 2;

    PutDrawText(NULL, gBG0TilemapBuffer + TILEMAP_INDEX(0, 0), 0, xStart, UNIT_PANEL_WIDTH, str);

    str = GetStringFromIndex(UNIT_NAME_ID(proc->units[1]));
    xStart = ((8 * UNIT_PANEL_WIDTH) - GetStringTextLen(str)) / 2;

    PutDrawText(NULL, gBG0TilemapBuffer + TILEMAP_INDEX(24, 0), 0, xStart, UNIT_PANEL_WIDTH, str);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}
