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

//! FE8U = 0x080A032C
s8 WmSell_MainLoop_HandleDpadKeys(struct WmSellProc* proc) {
    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        int count = GetUnitItemCount(proc->unit);

        if (proc->unk_30 != 0) {
            proc->unk_30--;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            return 1;
        } else {
            if (!(gKeyStatusPtr->newKeys & DPAD_UP)) {
                return 0;
            }

            proc->unk_30 = count - 1;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            return 1;
        }
    } else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
        int count = GetUnitItemCount(proc->unit);

        if (proc->unk_30 < count - 1) {
            proc->unk_30++;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            return 1;
        } else {
            if (!(gKeyStatusPtr->newKeys & DPAD_DOWN)) {
                return 0;
            }

            proc->unk_30 = 0;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            return 1;
        }
    }

    return 0;
}
