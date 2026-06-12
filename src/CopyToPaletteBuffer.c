#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

void CopyToPaletteBuffer(const void* src, int b, int size)
{
    if (size & 0x1F)  // size is not a multiple of 32
        CpuCopy16(src, gPaletteBuffer + (b >> 1), size);
    else
        CpuFastCopy(src, gPaletteBuffer + (b >> 1), size);
    sModifiedPalette = 1;
}
