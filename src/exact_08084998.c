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

/* prototypes for same-file helpers called by this run */
void SetScanlineBufWinL(u16 * buf, int x, int y);
void SetScanlineBufWinR(u16 * buf, int x, int y);

//! FE8U = 0x08082658
void MapAnimDitheredCircleScanlineCore(u16 * buf, int x, int y, int unk)
{
    int r1;
    int r9;

    int r7 = unk;
    int sl = unk;

    for (r9 = 0; r7 >= r9; r9++)
    {

        if (((y + r9) & 1) == 0)
        {
            SetScanlineBufWinR(buf, x + r7, y + r9);
            SetScanlineBufWinR(buf, x + r7, y - r9);
            SetScanlineBufWinL(buf, x - r7, y + r9);
            SetScanlineBufWinL(buf, x - r7, y - r9);
        }

        if (((y + r7) & 1) == 0)
        {
            SetScanlineBufWinR(buf, x + r9, y + r7);
            SetScanlineBufWinR(buf, x + r9, y - r7);
            SetScanlineBufWinL(buf, x - r9, y + r7);
            SetScanlineBufWinL(buf, x - r9, y - r7);
        }

        sl = (r1 = sl + 1) - (r9) * 2;
        if (sl < 0)
        {
            sl = sl + (r7 - 1) * 2;
            r7 = r7 - 1;
        }
    }

    return;
}
