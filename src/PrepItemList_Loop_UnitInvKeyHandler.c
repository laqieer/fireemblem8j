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

s8 PrepItemList_MoveUnitInvCursor(struct PrepItemListProc * proc);

//! FE8U = 0x0809FC24
void PrepItemList_Loop_UnitInvKeyHandler(struct PrepItemListProc * proc)
{
    u16 item;

    if (proc->unk_36 == 1) {
        if (gKeyStatusPtr->newKeys & (R_BUTTON | B_BUTTON)) {
            CloseHelpBox();
            proc->unk_36 = 0;
            return;
        }
    } else {
        if (gKeyStatusPtr->newKeys & R_BUTTON) {
            item = proc->unit->items[proc->unitInvIdx];
            if (item == 0) {
                return;
            }
            StartItemHelpBox(16, proc->unitInvIdx * 16 + 72, item);
            proc->unk_36 = 1;
            return;
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            if (CheckValidLinkArenaItemSupply(proc->unit, proc->unitInvIdx, gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item) == 0) {
                StartPrepErrorHelpbox(-1, -1, 0x6FC, proc);
                return;
            }
            ClearUiCursorHandConfig(0);
            Proc_Break(proc);
            PrepItemList_SwapItemWithUnitSlot(proc);
            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            ClearUiCursorHandConfig(0);
            Proc_Break(proc);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            return;
        }
    }

    if (PrepItemList_MoveUnitInvCursor(proc) != 0) {
        ShowSysHandCursor(16, proc->unitInvIdx * 16 + 72, 0xb, 0x800);
        if (proc->unk_36 == 1) {
            item = proc->unit->items[proc->unitInvIdx];
            if (item != 0) {
                StartItemHelpBox(16, proc->unitInvIdx * 16 + 72, item);
            }
        }
    }

    return;
}
