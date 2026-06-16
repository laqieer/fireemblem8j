#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

void SpecialCharTest(void)
{
    int ix, iy;

    int cnt = GetGameClock();

    for (iy = 0; iy < 10; ++iy)
        for (ix = 0; ix < 30; ++ix)
            PutSpecialChar(gBG0TilemapBuffer + TILEMAP_INDEX(ix, iy * 2), TEXT_COLOR_SYSTEM_WHITE, (cnt++) & 1);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}
