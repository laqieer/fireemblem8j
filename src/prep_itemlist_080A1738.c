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

/* prototypes for same-file helpers called by this run */
void PrepItemList_ClampCursorAndScroll(struct PrepItemListProc* proc);

//! FE8U = 0x0809F498
void PrepItemList_TakeItemToUnit(struct PrepItemListProc * proc)
{
    int count = GetUnitItemCount(proc->unit);

    if ((count == UNIT_ITEM_COUNT) || (gPrepscreen_2 == 0)) {
        PlaySoundEffect(SONG_6C);
        return;
    }

    proc->unk_36 = 0;

    proc->unit->items[count] = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
    UnitRemoveInvalidItems(proc->unit);
    gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item = 0;

    RebuildConvoyFromPrepList();

    SomethingPrepListRelated(proc->unit, proc->currentPage, 3);
    PrepItemList_ClampCursorAndScroll(proc);
    ResetIconGraphics_();

    DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, PrepItemSuppyTexts.th + 2, proc->unit, 0);
    PrepItemSupply_DrawItemList(
        PrepItemSuppyTexts.th + 7,
        gBG2TilemapBuffer + 0xF,
        proc->yOffsetPerPage[proc->currentPage] >> 4,
        proc->unit
    );

    if (gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].pid != 0) {
        StartParallelFiniteLoop(PrepItemList_DrawCurrentOwnerText, 1, proc);
    }

    ShowSysHandCursor(
        0x80,
        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
        0xb,
        0x800
    );

    BG_EnableSyncByMask(5);

    if (GetUnitItemCount(proc->unit) == UNIT_ITEM_COUNT) {
        Proc_Goto(proc, 1);
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
    } else {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
    }

    return;
}
