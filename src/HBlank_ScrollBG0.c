#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

//! FE8U = 0x08082A24
void HBlank_ScrollBG0(void)
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
        REG_BG0HOFS = gManimActiveScanlineBuf[vcount + DISPLAY_HEIGHT];
        REG_BG0VOFS = gManimActiveScanlineBuf[vcount + 0];
    }

    return;
}
