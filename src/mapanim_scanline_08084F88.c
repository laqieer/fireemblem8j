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
void SetScanlineBufWinL(u16 * buf, int x, int y);
void SetScanlineBufWinR(u16 * buf, int x, int y);

//! FE8U = 0x08082C50
void MapAnimEllipseScanlineCore(u16 * buf, int x, int y, int arg_4, int arg_5)
{
    int sl;
    int r8;
    int r9;
    int sp_0c;
    int sp_10;
    int sp_14;
    int sp_18;
    int sp_1c;
    int sp_20;

    if (arg_4 > arg_5)
    {
        r9 = arg_4;
        sp_10 = arg_4;
        sp_0c = 0;

        if (arg_4 < 0)
        {
            return;
        }

        for (sp_1c = 0, sp_20 = arg_5 * arg_4; r9 >= sp_0c; sp_0c++)
        {
            sl = sp_20 / arg_4;
            r8 = sp_1c / arg_4;

            SetScanlineBufWinR(buf, x + r9, y + r8);
            SetScanlineBufWinR(buf, x + r9, y - r8);
            SetScanlineBufWinL(buf, x - r9, y + r8);
            SetScanlineBufWinL(buf, x - r9, y - r8);

            SetScanlineBufWinR(buf, x + sp_0c, y + sl);
            SetScanlineBufWinR(buf, x + sp_0c, y - sl);
            SetScanlineBufWinL(buf, x - sp_0c, y + sl);
            SetScanlineBufWinL(buf, x - sp_0c, y - sl);

            sp_10 -= (2 * sp_0c - 1);

            if (sp_10 < 0)
            {
                sp_10 += (r9 - 1) * 2;
                sp_20 -= arg_5;
                r9--;
            }

            sp_1c += arg_5;
        }
    }
    else
    {
        r9 = arg_5;
        sp_10 = arg_5;
        sp_0c = 0;

        if (arg_5 < 0)
        {
            return;
        }

        for (sp_14 = 0, sp_18 = arg_4 * arg_5; r9 >= sp_0c; sp_0c++)
        {
            sl = sp_18 / arg_5;
            r8 = sp_14 / arg_5;

            SetScanlineBufWinR(buf, x + sl, y + sp_0c);
            SetScanlineBufWinR(buf, x + sl, y - sp_0c);
            SetScanlineBufWinL(buf, x - sl, y + sp_0c);
            SetScanlineBufWinL(buf, x - sl, y - sp_0c);

            SetScanlineBufWinR(buf, x + r8, y + r9);
            SetScanlineBufWinR(buf, x + r8, y - r9);
            SetScanlineBufWinL(buf, x - r8, y + r9);
            SetScanlineBufWinL(buf, x - r8, y - r9);

            sp_10 -= (2 * sp_0c - 1);

            if (sp_10 < 0)
            {
                sp_10 += (r9 - 1) * 2;
                sp_18 -= arg_4;
                r9--;
            }

            sp_14 += arg_4;
        }
    }

    return;
}
