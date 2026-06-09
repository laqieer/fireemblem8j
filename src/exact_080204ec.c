#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmfx.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmlib.h"
#include "sysutil.h"
#include "worldmap.h"

#include "constants/songs.h"

// clang-format off























//! FE8U = 0x080207F4
void ChapterIntro_LightBurst_Init(struct ChapterIntroFxProc * proc)
{
    proc->timer = 0;
    proc->unk_4E = 0;
    proc->unk_66 = 0;
    return;
}
