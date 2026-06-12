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
void PrepItemSupply_RedrawAfterPageSwitch(struct PrepItemSupplyProc * proc);

//! FE8U = 0x0809DFB0
void PrepItemSupply_SwitchPageLeft(struct PrepItemSupplyProc * proc)
{
    int x = 0;
    int four = 4;

    proc->unk_34++;

    if (proc->unk_34 < four) {
        int tmp = (((4 - proc->unk_34) * 0x60 * (4 - proc->unk_34)) / (four * four));
        x = tmp - 0x60;
    }

    if (proc->unk_34 == four) {
        if (proc->currentPage == 0) {
            proc->currentPage = 8;
        } else {
            proc->currentPage--;
        }
        PrepItemSupply_RedrawAfterPageSwitch(proc);
    }

    if (proc->unk_34 >= four) {
        int tmp = four - (proc->unk_34 - four);
        x = (tmp * 0x60 * tmp) / (four * four);
    }

    BG_SetPosition(2, (x & 0xff), proc->yOffsetPerPage[proc->currentPage] - 40);

    if (proc->unk_34 == four * 2) {
        Proc_Goto(proc, 4);
    }

    return;
}
