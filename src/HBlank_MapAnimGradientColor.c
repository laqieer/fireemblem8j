#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

//! FE8U = 0x08081FFC
void HBlank_MapAnimGradientColor(void)
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

    ((vu16 *)PLTT)[0x10 * (1 + 0) + 1] = gManimActiveScanlineBuf[vcount];
    ((vu16 *)PLTT)[0x10 * (1 + 1) + 1] = gManimActiveScanlineBuf[DISPLAY_HEIGHT + vcount];

    return;
}
