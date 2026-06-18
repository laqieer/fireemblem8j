#include "global.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmtrick.h"
#include "event.h"
#include "hardware.h"
#include "prepscreen.h"
#include "ekrbattle.h"
#include "bmmap.h"
#include "bksel.h"
#include "chapterdata.h"

void CopyBgTiles(u8 src, u8 dst, u8 nbgs)
{
    u16 * bgs[4] = {
        gBG0TilemapBuffer,
        gBG1TilemapBuffer,
        gBG2TilemapBuffer,
        gBG3TilemapBuffer,
    };

    CpuFastCopy(bgs[src], bgs[dst], nbgs * 0x800);
    BG_EnableSyncByMask(1 << dst);
}
