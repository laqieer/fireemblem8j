#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

extern int MapAnimDitheredCircleScanlineCore();

//! FE8U = 0x08082730
void UpdateMapAnimDitheredCircleScanline(int x, int y, int unk)
{
    InitScanlineBuf(gManimScanlineBufs[1]);
    MapAnimDitheredCircleScanlineCore(gManimScanlineBufs[1], x, y, unk);
    SwapScanlineBufs();
    return;
}
