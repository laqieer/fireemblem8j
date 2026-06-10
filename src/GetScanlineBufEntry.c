#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

//! FE8U = 0x08082644
u16 * GetScanlineBufEntry(int bufId, int scanline)
{
    return &gManimScanlineBufs[bufId][scanline];
}
