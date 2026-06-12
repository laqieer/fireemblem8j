#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

//! FE8U = 0x08082A7C
void HBlank_ScrollBG1(void)
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
        REG_BG1HOFS = gManimActiveScanlineBuf[vcount + DISPLAY_HEIGHT];
        REG_BG1VOFS = gManimActiveScanlineBuf[vcount + 0];
    }

    return;
}
