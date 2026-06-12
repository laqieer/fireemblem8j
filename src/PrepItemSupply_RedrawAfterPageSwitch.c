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

//! FE8U = 0x0809DEFC
void PrepItemSupply_RedrawAfterPageSwitch(struct PrepItemSupplyProc * proc)
{
    ResetIconGraphics_();
    SomethingPrepListRelated(proc->unit, proc->currentPage, 1);
    PrepItemSupply_DrawItemList(&PrepItemSuppyTexts.th[7], gBG2TilemapBuffer + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4, proc->unit);
    DrawPrepScreenItemIcons(gBG0TilemapBuffer + 0x122, proc->unit);
    ShowSysHandCursor(0x80, proc->idxPerPage[proc->currentPage] * 16 + 0x28 - proc->yOffsetPerPage[proc->currentPage], 0xb, 0x800);

    BG_EnableSyncByMask(5);

    if (proc->unk_38 == 0) {
        return;
    }

    if (gPrepscreen_2 != 0) {
        int item = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
        StartItemHelpBox(
            0x80,
            proc->idxPerPage[proc->currentPage] * 0x10 + 0x28 - proc->yOffsetPerPage[proc->currentPage],
            item
        );
        proc->unk_38 = 1;
    } else {
        CloseHelpBox();
        proc->unk_38 = 0xff;
    }

    return;
}
