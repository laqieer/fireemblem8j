#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

//! FE8U = 0x08082390
void SwapScanlineBufs(void)
{
    u16 * tmp = gManimScanlineBufs[0];
    gManimScanlineBufs[0] = gManimScanlineBufs[1];
    gManimScanlineBufs[1] = tmp;

    return;
}
