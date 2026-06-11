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

//! FE8U = 0x0809E85C
void PrepItemSupply_GiveItemToSupply(struct PrepItemSupplyProc * proc)
{
    int unitItemCount;

    u16 item = proc->unit->items[proc->unitInvIdx];
    GetUnitItemCount(proc->unit); // Necessary for match, but pointless
    proc->unit->items[proc->unitInvIdx] = 0;
    UnitRemoveInvalidItems(proc->unit);

    proc->currentPage = GetPrepPageForItem(item);
    AddItemToConvoy(item);

    SomethingPrepListRelated(proc->unit, proc->currentPage, 1);
    PrepItemSupply_ClampScroll(proc);

    ResetIconGraphics_();
    DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, &PrepItemSuppyTexts.th[2], proc->unit, 0);
    PrepItemSupply_DrawItemList(&PrepItemSuppyTexts.th[7], gBG2TilemapBuffer + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4, proc->unit);
    StartParallelFiniteLoop(PrepItemSupply_RedrawConvoyHeaderWorker, 1, proc);

    BG_EnableSyncByMask(4);

    unitItemCount = GetUnitItemCount(proc->unit);

    gActionData.unitActionType = UNIT_ACTION_TRADED_SUPPLY;

    if ((unitItemCount == 0) || (GetConvoyItemCount_() == CONVOY_ITEM_COUNT)) {
        Proc_Goto(proc, 1);
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
    } else {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
        if (unitItemCount <= proc->unitInvIdx) {
            proc->unitInvIdx = unitItemCount - 1;
            ShowSysHandCursor(16, proc->unitInvIdx * 16 + 72, 0xb, 0x800);
        }
    }

    return;
}
