#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"


extern EWRAM_DATA u16 * gManimScanlineBufs[2];
extern EWRAM_DATA u16 * gManimActiveScanlineBuf;

/* file-scope type definitions used by this run */


struct ManimShiftingSineWaveScanlineBufProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 phase;
};

/* prototypes for same-file helpers called by this run */
void SwapScanlineBufs(void);
void InitScanlineBuf(u16 * buf);
void MapAnimEllipseScanlineCore(u16 * buf, int x, int y, int arg_4, int arg_5);

//! FE8U = 0x08082E40
void UpdateMapAnimEllipseScanline(int x, int y, int c, int d)
{
    InitScanlineBuf(gManimScanlineBufs[1]);
    MapAnimEllipseScanlineCore(gManimScanlineBufs[1], x, y, c, d);
    SwapScanlineBufs();
    return;
}
