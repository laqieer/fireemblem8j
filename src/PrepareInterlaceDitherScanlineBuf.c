#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

//! FE8U = 0x0808291C
void PrepareInterlaceDitherScanlineBuf(void)
{
    int i;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        gManimActiveScanlineBuf[i] = -((i & 1) + (i >> 1));
    }

    SwapScanlineBufs();

    return;
}
