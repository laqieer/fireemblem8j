#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

void PrepareSineWaveScanlineBufExt(u16 * buf, s16 phase, s16 amplitude, s16 frequency, int yStart, int yEnd)
{
    int i;

    for (i = yStart; i < yEnd; i++)
    {
        *buf++ = (SIN(i * frequency + phase) * amplitude) >> 12;
    }

    return;
}
