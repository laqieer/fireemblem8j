extern int SoundRoom_DrawSlidingUi();
extern int SoundRoom_PutHandCursor();
extern int SoundRoom_UpdateScrollBar();
#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bm.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "ctc.h"
#include "sysutil.h"
#include "bmsave.h"
#include "soundroom.h"
#include "constants/songs.h"

//! FE8U = 0x080AFCF8
void SoundRoomUi_Loop_MainUiSlideIn(struct SoundRoomProc * proc)
{
    int tmp;

    proc->unk_3a++;

    tmp = 8 - proc->unk_3a;
    tmp = (((tmp) * 2 + (tmp)) << 3) * tmp;

    proc->unk_3b = (tmp / 64);

    SoundRoom_DrawSlidingUi(proc);

    if (proc->unk_3b == 0)
    {
        SoundRoom_PutHandCursor(proc);
        SoundRoom_UpdateScrollBar(proc);
        Proc_Break(proc);
    }

    return;
}
