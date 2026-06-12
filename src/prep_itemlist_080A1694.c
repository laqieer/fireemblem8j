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

//! FE8U = 0x0809F3F4
void PrepItemList_ScrollVertical(struct PrepItemListProc * proc, int amount)
{
    ResetIconGraphics_();

    PrepItemSupply_DrawItemListIcons(gBG2TilemapBuffer + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4);
    DrawPrepScreenItemIcons(gBG0TilemapBuffer + 0x122, proc->unit);

    BG_EnableSyncByMask(5);

    if (amount < 0) {
        PrepItemSupply_DrawItemListRow(PrepItemSuppyTexts.th + 7, gBG2TilemapBuffer + 0xF, (proc->yOffsetPerPage[proc->currentPage] >> 4) - 1,  proc->unit);
    }

    if (amount > 0) {
        PrepItemSupply_DrawItemListRow(PrepItemSuppyTexts.th + 7, gBG2TilemapBuffer + 0xF, (proc->yOffsetPerPage[proc->currentPage] >> 4) + 7, proc->unit);
    }

    proc->yOffsetPerPage[proc->currentPage] += amount;

    BG_SetPosition(2, 0, proc->yOffsetPerPage[proc->currentPage] - 40);

    return;
}
