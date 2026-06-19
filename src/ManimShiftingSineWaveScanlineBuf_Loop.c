#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

struct ManimShiftingSineWaveScanlineBufProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 phase;
};

//! FE8U = 0x080825B8
int PrepareSineWaveScanlineBuf();
void ManimShiftingSineWaveScanlineBuf_Loop(struct ManimShiftingSineWaveScanlineBufProc * proc)
{
    PrepareSineWaveScanlineBuf(gManimScanlineBufs[1] + DISPLAY_HEIGHT, proc->phase++, 0x10, 8);
    SwapScanlineBufs();
    return;
}
