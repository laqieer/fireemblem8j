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

// clang-format on

//! FE8U = 0x0801FD90
void ChapterIntro_Bg2Scroll_Loop(void)
{
    int offset = (GetGameClock() / 2) & 0xFF;
    BG_SetPosition(BG_2, offset, offset);

    return;
}
