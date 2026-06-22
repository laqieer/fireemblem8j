#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

//! FE8U = 0x080845EC
void PrepareSineWaveScanlineBufInterleaved(u16 * buf, s16 phase, s16 amplitude, s16 frequency)
{
    int i;
    int phase_i = phase;
    int amplitude_i = amplitude;
    int frequency_i = frequency;

    buf++;

    for (i = 0; i < DISPLAY_HEIGHT - 1; i += 2)
    {
        *buf = ((SIN((i * frequency_i + frequency_i + phase_i)) * amplitude_i) >> 12);
        buf += 2;
    }

    return;
}
