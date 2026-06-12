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
void InitScanlineBuf(u16 * buf);
void SetScanlineBufWinL(u16 * buf, int x, int y);
void SetScanlineBufWinR(u16 * buf, int x, int y);

//! FE8U = 0x0808218C
void PrepareProfileScanlineWindow(int x, int y, int a, int b, const u8 * unk)
{
    int var;

    InitScanlineBuf(gManimScanlineBufs[1]);

    for (; *unk != 0xFF && y >= 0; y--)
    {
        var = Div(*unk * a, b);
        unk++;

        if (var > 0)
        {
            SetScanlineBufWinR(gManimScanlineBufs[1], x + var - 1, y);
            SetScanlineBufWinL(gManimScanlineBufs[1], x - var, y);
        }
    }

    if (var > 0)
    {
        while (y >= 0)
        {
            SetScanlineBufWinR(gManimScanlineBufs[1], x + var - 1, y);
            SetScanlineBufWinL(gManimScanlineBufs[1], x - var, y);
            y--;
        }
    }

    return;
}
