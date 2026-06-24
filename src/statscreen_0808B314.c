#include "global.h"
#include <stdlib.h>
#include "proc.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "uiutils.h"
#include "mu.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "constants/classes.h"
#include "statscreen.h"
#include "constants/songs.h"

void HbMoveCtrl_OnIdle(struct HelpBoxProc* proc)
{
    s8 boxMoved = FALSE;

    DisplayUiHand(
        sHbOrigin.x*8 + proc->info->xDisplay,
        sHbOrigin.y*8 + proc->info->yDisplay);

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
        boxMoved |= TryRelocateHbUp(proc);

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
        boxMoved |= TryRelocateHbDown(proc);

    if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT)
        boxMoved |= TryRelocateHbLeft(proc);

    if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT)
        boxMoved |= TryRelocateHbRight(proc);

    if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
    {
        Proc_Break((void*) proc);
        return;
    }

    if (boxMoved)
    {
        PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
        Proc_Goto((void*) proc, 0); // TODO: label constants?
    }
}
