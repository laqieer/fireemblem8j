#include "global.h"

#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmitem.h"
#include "bmshop.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "bmunit.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "constants/faces.h"
#include "constants/songs.h"

/* prototypes for same-file helpers called by this run */
void WmSell_ConfirmSellItem(struct WmSellProc* proc);

//! FE8U = 0x080A064C
void WmSell_OnLoop_ConfirmSellKeyHandler(struct WmSellProc* proc) {
    int previous = proc->unk_31;

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        if (previous == 0) {
            WmSell_ConfirmSellItem(proc);
            return;
        } else {
            Proc_Goto(proc, 1);

            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);

            return;
        }
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        Proc_Goto(proc, 1);

        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);

        return;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
        proc->unk_31 = 0;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
        proc->unk_31 = 1;
    }

    if (previous == proc->unk_31) {
        return;
    }

    PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);

    ShowSysHandCursor(proc->unk_31 * 32 + 164, 111, 0, 0x400);

    return;
}
