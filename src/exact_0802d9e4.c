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
void TradeMenu_RefreshSelectableCells(struct TradeMenuProc * proc);

void TradeMenu_OnEndSelected(struct TradeMenuProc * proc)
{
    proc->hoverColumn = proc->selectedColumn;
    proc->hoverRow = proc->selectedRow;

    TradeMenu_RefreshSelectableCells(proc);

    if (!proc->hasItem[proc->hoverColumn][0])
        proc->hoverColumn = proc->hoverColumn ^ 1;

    proc->hoverRow = TradeMenu_GetAdjustedRow(proc, proc->hoverColumn, proc->hoverRow);
}
