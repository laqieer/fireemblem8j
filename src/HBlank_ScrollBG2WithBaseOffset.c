#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

//! FE8U = 0x08082B84
void HBlank_ScrollBG2WithBaseOffset(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT)
    {
        gManimActiveScanlineBuf = gManimScanlineBufs[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    if ((vcount & 1) != 0)
    {
        REG_BG2HOFS = ((vu16 *)(gManimActiveScanlineBuf))[vcount + DISPLAY_HEIGHT] + gLCDControlBuffer.bgoffset[2].x;
        REG_BG2VOFS = ((vu16 *)(gManimActiveScanlineBuf))[vcount + 0] + gLCDControlBuffer.bgoffset[2].y;
    }

    return;
}
