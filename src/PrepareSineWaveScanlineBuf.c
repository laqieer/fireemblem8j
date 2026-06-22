#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

void PrepareSineWaveScanlineBuf(u16 * buf, s16 phase, s16 amplitude, s16 frequency)
{
    int ph = phase;
    int amp = amplitude;
    int freq = frequency;
    int i;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        *buf++ = (SIN((i * freq + ph)) * amp) >> 12;
    }

    return;
}
