#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

EWRAM_DATA u16 gManimScanlineBufA[DISPLAY_HEIGHT * 2 * 2] = { 0 };
EWRAM_DATA u16 * gManimScanlineBufs[2] = { NULL };
EWRAM_DATA u16 * gManimActiveScanlineBuf = NULL;

/* file-scope type definitions used by this run */


struct ManimShiftingSineWaveScanlineBufProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 phase;
};

/* prototypes for same-file helpers called by this run */
void InitScanlineBuf(u16 * buf);

//! FE8U = 0x08081E78
void InitScanline(void)
{
    InitScanlineBuf(gManimScanlineBufA);
    InitScanlineBuf(gManimScanlineBufA + 0x140);

    gManimScanlineBufs[0] = gManimScanlineBufA;
    gManimScanlineBufs[1] = gManimScanlineBufA + 0x140;

    gManimActiveScanlineBuf = gManimScanlineBufA;

    return;
}
