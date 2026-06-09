#include "global.h"

#include "bmsave.h"
#include "hardware.h"
#include "worldmap.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "spline.h"
#include "sysutil.h"
#include "savemenu.h"
#include "constants/songs.h"







//! FE8U = 0x080AC680
void DifficultyMenu_StartCursorMove(struct DifficultyMenuSpritesProc * proc, int param_2, int param_3)
{
    proc->unk_30 = proc->unk_2c;
    proc->unk_32 = proc->unk_2e;
    proc->unk_34 = param_2;
    proc->unk_36 = param_3;
    proc->flags_0 = 1;

    return;
}
