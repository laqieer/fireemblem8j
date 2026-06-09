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




















/* prototypes for same-file helpers called by this run */
int TradeMenu_GetAdjustedRow(struct TradeMenuProc * proc, int col, int row);

void TradeMenu_OnInitSelected(struct TradeMenuProc * proc)
{
    int lastRow;

    proc->selectedColumn = proc->hoverColumn;
    proc->selectedRow = proc->hoverRow;

    proc->hoverColumn = proc->hoverColumn ^ 1;

    lastRow = TradeMenu_GetAdjustedRow(proc, proc->hoverColumn, (UNIT_ITEM_COUNT - 1));

    if (lastRow != (UNIT_ITEM_COUNT - 1))
    {
        proc->hoverRow = lastRow + 1;
        proc->hasItem[proc->hoverColumn][proc->hoverRow] = TRUE;

        proc->extraCellEnabled = TRUE;

        proc->extraColumn = proc->hoverColumn;
        proc->extraRow = proc->hoverRow;
    }
}
