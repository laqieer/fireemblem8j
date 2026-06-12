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

//! FE8U = 0x0809FB70
void PrepItemList_SwapItemWithUnitSlot(struct PrepItemListProc * proc)
{
    u16 idx = proc->idxPerPage[proc->currentPage];
    u16 item = proc->unit->items[proc->unitInvIdx];

    proc->unit->items[proc->unitInvIdx] = gPrepScreenItemList[idx].item;
    UnitRemoveInvalidItems(proc->unit);
    gPrepScreenItemList[idx].item = item;

    RebuildConvoyFromPrepList();
    if (item == 0) {
        SomethingPrepListRelated(proc->unit, proc->currentPage, 3);
    }

    PrepItemList_ClampCursorAndScroll(proc);
    DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, PrepItemSuppyTexts.th + 2, proc->unit, 0);
    PrepItemSupply_DrawItemList(PrepItemSuppyTexts.th + 7, gBG2TilemapBuffer + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4, proc->unit);
    StartParallelFiniteLoop(PrepItemList_DrawCurrentOwnerText, 1, proc);
    BG_EnableSyncByMask(4);

    PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);

    return;
}
