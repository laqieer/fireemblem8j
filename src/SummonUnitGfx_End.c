#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

void SummonUnitGfx_End(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}
