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

//! FE8U = 0x0809F150
void PrepItemList_RedrawPageContents(struct PrepItemListProc * proc)
{
    ResetIconGraphics_();
    SomethingPrepListRelated(proc->unit, proc->currentPage, 3);
    PrepItemList_ClampCursorAndScroll(proc);

    PrepItemSupply_DrawItemList(PrepItemSuppyTexts.th + 7, gBG2TilemapBuffer + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4, proc->unit);
    DrawPrepScreenItemIcons(gBG0TilemapBuffer + 0x122, proc->unit);

    ShowSysHandCursor(
        0x80,
        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
        0xb,
        0x800
    );

    BG_EnableSyncByMask(5);

    StartParallelFiniteLoop(PrepItemList_DrawCurrentOwnerText, 2, proc);

    if (proc->unk_36 == 0) {
        return;
    }

    if (gPrepscreen_2 != 0) {
        int item = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
        StartItemHelpBox(
            0x80,
            proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
            item
        );
        proc->unk_36 = 1;
    } else {
        CloseHelpBox();
        proc->unk_36 = 0xff;
    }

    return;
}
