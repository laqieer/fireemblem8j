#include "global.h"

#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmitem.h"
#include "bmshop.h"
#include "uiutils.h"
#include "bm.h"
#include "bmunit.h"
#include "statscreen.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "constants/songs.h"

s8 WmSell_MainLoop_HandleDpadKeys(struct WmSellProc* proc);
void WmSell_DrawItemGoldValue(int item);

//! FE8U = 0x080A26C0
void WmSell_OnLoop_MainKeyHandler(struct WmSellProc* proc) {
    u16 item;

    if (proc->unk_34 == 1) {
        if (gKeyStatusPtr->newKeys & (R_BUTTON | B_BUTTON)) {
            CloseHelpBox();
            proc->unk_34 = 0;
            return;
        }
    } else {
        if (gKeyStatusPtr->newKeys & R_BUTTON) {
            item = proc->unit->items[proc->unk_30];
            if (item) {
                StartItemHelpBox(0x10, proc->unk_30 * 0x10 + 0x48, item);
                proc->unk_34 = 1;
            }

            return;
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            u16 item = proc->unit->items[proc->unk_30];
            if ((GetItemSellPrice(item) == 0) || (GetItemAttributes(item) & IA_UNSELLABLE)) {
                StartPrepErrorHelpbox(
                    16,
                    proc->unk_30 * 16 + 72,
                    0x7CE,
                    proc
                );
            } else {
                Proc_Goto(proc, 2);
                PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
            }
            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            Proc_Goto(proc, 3);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            return;
        }
    }

    if (WmSell_MainLoop_HandleDpadKeys(proc) != 0) {
        ShowSysHandCursor(16, proc->unk_30 * 16 + 72, 11, 0x400);
        WmSell_DrawItemGoldValue(proc->unit->items[proc->unk_30]);
        if (proc->unk_34 == 1) {
            item = proc->unit->items[proc->unk_30];
            if (item) {
                StartItemHelpBox(0x10, proc->unk_30 * 0x10 + 0x48, item);
            }
        }
    }

    return;
}
