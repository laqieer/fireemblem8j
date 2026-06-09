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







//! FE8U = 0x080AC3F4
void DrawDifficultySprite_Init(struct DifficultyMenuSpritesProc * proc)
{
    proc->flags_0 = 0;
    proc->flags_1 = 0;

    proc->unk_2a = 0;
    proc->unk_2e = 0;
    proc->unk_2c = 0;

    return;
}
