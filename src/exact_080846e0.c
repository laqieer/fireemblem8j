#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"






/* file-scope type definitions used by this run */


struct ManimShiftingSineWaveScanlineBufProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 phase;
};

//! FE8U = 0x080823A0
void InitScanlineBuf(u16 * buf)
{
    int i;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        *buf++ = DISPLAY_WIDTH | (DISPLAY_WIDTH << 8);
    }

    return;
}

//! FE8U = 0x080823BC
void SetScanlineBufWinL(u16 * buf, int x, int y)
{
    u16 * tmp;

    if (y < 0 || y >= DISPLAY_HEIGHT)
    {
        return;
    }

    if (x < 0)
    {
        x = 0;
    }

    if (x > DISPLAY_WIDTH)
    {
        x = DISPLAY_WIDTH;
    }

    tmp = buf + y;

    ((u8 *)(tmp))[1] = x;
    return;
}
