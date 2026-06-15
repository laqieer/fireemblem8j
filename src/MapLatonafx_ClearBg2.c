#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

void MapLatonafx_ClearBg2(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}
