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
void PrepItemList_RedrawPageContents(struct PrepItemListProc * proc);

//! FE8U = 0x0809F2C4
void PrepItemList_SwitchPageRight(struct PrepItemListProc* proc) {
    int x;

    int four = 4;

    proc->unk_32++;

    if (proc->unk_32 < four) {
        int tmp = (((4 - proc->unk_32) * 0x60 * (4 - proc->unk_32)) / (four * four));
        x = 0x60 - tmp;
    }

    if (proc->unk_32 == four) {
        if (proc->currentPage == 8) {
            proc->currentPage = 0;
        } else {
            proc->currentPage++;
        }
        PrepItemList_RedrawPageContents(proc);
    }

    if (proc->unk_32 >= four) {
        int tmp = four - (proc->unk_32 - four);
        x = -((tmp * 0x60 * tmp) / (four * four));
    }

    BG_SetPosition(2, (x & 0xff), proc->yOffsetPerPage[proc->currentPage] - 40);

    if (proc->unk_32 == four * 2) {
        Proc_Goto(proc, 1);
    }

    return;
}
