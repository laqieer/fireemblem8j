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




















void TradeMenu_RefreshSelectableCells(struct TradeMenuProc * proc)
{
    int col, row;

    for (col = 0; col < 2; ++col)
    {
        for (row = 0; row < UNIT_ITEM_COUNT; ++row)
        {
            u16 item = proc->units[col]->items[row];
            proc->hasItem[col][row] = (item ? TRUE : FALSE);
        }
    }

    proc->hasItem[0][UNIT_ITEM_COUNT] = 0;
    proc->hasItem[1][UNIT_ITEM_COUNT] = 0;
}
