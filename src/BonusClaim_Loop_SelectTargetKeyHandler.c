#include "global.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "hardware.h"
#include "fontgrp.h"
#include "icon.h"
#include "bm.h"
#include "bmcontainer.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sysutil.h"
#include "savemenu.h"
#include "bonusclaim.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/songs.h"

//! FE8U = 0x080B5EA4
void BonusClaim_Loop_SelectTargetKeyHandler(struct BonusClaimProc * proc)
{
    int tmp = proc->submenuIndex;

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        if (TryClaimBonusItem(proc) != 0) {
            Proc_Goto(proc, 2);
            return;
        }

        StartBonusClaimHelpBox(-1, -1, 0x82D, proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        Proc_Break(proc);
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        return;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        tmp--;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
        tmp++;
    }

    if (((tmp != proc->submenuIndex) && (-1 < tmp)) && (tmp < proc->targets)) {
        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
        proc->submenuIndex = tmp;
        ShowSysHandCursor(112, proc->submenuIndex * 16 + 48, 9, 0x800);
    }

    return;
}
