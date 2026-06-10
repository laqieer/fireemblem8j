#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

//! FE8U = 0x08081F24
void UpdateMapAnimScanline(int x, int y, int arg3)
{
    InitScanlineBuf(gManimScanlineBufs[1]);
    MapAnimScanlineCore(gManimScanlineBufs[1], x, y, arg3);
    SwapScanlineBufs();
}
