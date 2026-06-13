#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmusemind.h"
#include "bmbattle.h"
#include "bmudisp.h"
#include "bm.h"
#include "statscreen.h"
#include "scene.h"
#include "face.h"
#include "icon.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "classchg.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "prepscreen.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/songs.h"

void PrepItemUseClearSubBox(void);

void PrepItemUse_ConfirmWindowCtrlLoop(struct ProcPrepItemUse * proc)
{
    int old = proc->pos_subbox;

    PrepItemDrawPopupBox(0x88, 0x64, 0xB, 0x4, 0xA440);

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        ShowSysHandCursor(0x10, proc->slot * 0x10 + 0x48, 0xB, 0x800);
        ClearUiCursorHandConfig(0);
        PrepItemUseClearSubBox();
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        Proc_Break(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        PrepItemUseClearSubBox();
        
        if (proc->pos_subbox == POS_L) {
            HideSysHandCursor();
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
            Proc_Goto(proc, PROC_LABEL_PREPITEMUSE_EXEC_ITEMEFFECT);
            return;
        } else {
            ShowSysHandCursor(0x10, proc->slot * 0x10 + 0x48, 0xB, 0x800);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            ClearUiCursorHandConfig(0);
            Proc_Break(proc);
            return;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT)
        proc->pos_subbox = POS_L;

    if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT)
        proc->pos_subbox = POS_R;

    if (old != proc->pos_subbox) {
        ShowSysHandCursor(proc->pos_subbox * 0x20 + 0x94, 0x78, 0, 0x800);
        PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
    }
}
