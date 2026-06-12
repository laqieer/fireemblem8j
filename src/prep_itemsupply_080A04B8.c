#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "icon.h"
#include "face.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmcontainer.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmind.h"
#include "bmio.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "constants/faces.h"

#include "prepscreen.h"
#include "constants/songs.h"

extern EWRAM_OVERLAY(0) struct PrepItemSuppyText PrepItemSuppyTexts;

/* prototypes for same-file helpers called by this run */
void PrepItemSupply_DrawItemListIcons(u16 * tm, int yLines);
void PrepItemSupply_DrawItemListRow(struct Text * textBase, u16 * tm, int yLines, struct Unit * unit);

//! FE8U = 0x0809E218
void PrepItemSupply_ScrollVertical(struct PrepItemSupplyProc * proc, int amount)
{
    ResetIconGraphics_();

    PrepItemSupply_DrawItemListIcons(gBG2TilemapBuffer + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4);
    DrawPrepScreenItemIcons(gBG0TilemapBuffer + 0x122, proc->unit);

    BG_EnableSyncByMask(5);

    if (amount < 0) {
        PrepItemSupply_DrawItemListRow(&PrepItemSuppyTexts.th[7], gBG2TilemapBuffer + 0xF, (proc->yOffsetPerPage[proc->currentPage] >> 4) - 1,  proc->unit);
    }

    if (amount > 0) {
        PrepItemSupply_DrawItemListRow(&PrepItemSuppyTexts.th[7], gBG2TilemapBuffer + 0xF, (proc->yOffsetPerPage[proc->currentPage] >> 4) + 7, proc->unit);
    }

    proc->yOffsetPerPage[proc->currentPage] += amount;

    BG_SetPosition(2, 0, proc->yOffsetPerPage[proc->currentPage] - 40);

    return;
}
