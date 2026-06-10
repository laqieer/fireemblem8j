#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

//! FE8U = 0x08081FA8
void HBlank_MapAnimEffect_Unk_0(void)
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
    REG_BG2HOFS = gManimActiveScanlineBuf[DISPLAY_HEIGHT + vcount];

    return;
}
