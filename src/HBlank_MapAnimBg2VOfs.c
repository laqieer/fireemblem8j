#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

//! FE8U = 0x080828EC
void HBlank_MapAnimBg2VOfs(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount >= DISPLAY_HEIGHT)
    {
        vcount = 0;
    }

    REG_BG2VOFS = gManimActiveScanlineBuf[vcount];

    return;
}
