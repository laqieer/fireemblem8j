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

//! FE8U = 0x0800B910
void CopyBgImage(u8 bg1, u8 bg2, u8 c)
{
    CpuFastCopy(
        (void *)(VRAM + GetBackgroundTileDataOffset(bg1)),
        (void *)(VRAM + GetBackgroundTileDataOffset(bg2)), c * 0x800);
}
