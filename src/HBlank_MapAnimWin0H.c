#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

//! FE8U = 0x08081F64
void HBlank_MapAnimWin0H(void)
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

    REG_WIN0H = gManimActiveScanlineBuf[vcount];

    return;
}
