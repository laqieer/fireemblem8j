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

void TradeMenu_InitItemDisplay(struct TradeMenuProc * proc)
{
    DrawUiFrame2(1,  8, 14, 12, 0);
    DrawUiFrame2(15, 8, 14, 12, 0);

    ResetTextFont();

    ResetIconGraphics();
    LoadIconPalettes(4); // TODO: palette id constant

    TradeMenu_InitItemText(proc);
    TradeMenu_RefreshItemText(proc);

    // TODO: face display type (arg 5) constants
    StartFace(0, GetUnitPortraitId(proc->units[0]), 64,  -4, 3);
    StartFace(1, GetUnitPortraitId(proc->units[1]), 176, -4, 2);

    SetFaceBlinkControlById(0, 5);
    SetFaceBlinkControlById(1, 5);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
}
