#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

//! FE8U = 0x080845A8
void PrepareSineWaveScanlineBufOffset(u16 * buf, s16 phase, s16 amplitude, s16 frequency, int arg5)
{
    int i;
    int iPhase = phase;
    int iAmplitude = amplitude;
    int iFrequency = frequency;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        *buf++ = ((SIN((i * iFrequency + iPhase)) * iAmplitude) >> 12) + arg5;
    }

    return;
}
