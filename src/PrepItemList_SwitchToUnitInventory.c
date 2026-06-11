#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "icon.h"
#include "face.h"
#include "statscreen.h"
#include "bm.h"
#include "uiutils.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "sysutil.h"
#include "worldmap.h"
#include "prepscreen.h"
#include "constants/songs.h"

//! FE8U = 0x0809FB34
void PrepItemList_SwitchToUnitInventory(struct PrepItemListProc * proc)
{
    int count = GetUnitItemCount(proc->unit);

    if (count == UNIT_ITEM_COUNT)
        proc->unitInvIdx = 4;
    else
        proc->unitInvIdx = count;

    ShowSysHandCursor(16, proc->unitInvIdx * 16 + 72, 0xb, 0x800);
}
