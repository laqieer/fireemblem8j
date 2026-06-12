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

//! FE8U = 0x0808294C
void HBlank_MapAnimBg1OfsInterlaced(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT)
    {
        gManimActiveScanlineBuf = gManimScanlineBufs[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    if ((vcount & 1) != 0)
    {
        REG_BG1HOFS = gManimActiveScanlineBuf[vcount + DISPLAY_HEIGHT];
        REG_BG1VOFS = gManimActiveScanlineBuf[vcount + 0];
    }

    return;
}
