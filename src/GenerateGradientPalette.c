#include "global.h"
#include "ctc.h"
#include "scene.h"
#include "hardware.h"
#include "worldmap.h"

//! FE8U = 0x080C34D0
void GenerateGradientPalette(u16 * dstPal, int b, u16 colorA, u16 colorB)
{
    int i;

    for (i = 0; i < b; i++)
    {
        int color = (b - i);

        dstPal[i] = (((color * (colorA & RED_MASK) + i * (colorB & RED_MASK)) / b) & RED_MASK) +
            (((color * (colorA & GREEN_MASK) + i * (colorB & GREEN_MASK)) / b) & GREEN_MASK) +
            (((color * (colorA & BLUE_MASK) + i * (colorB & BLUE_MASK)) / b) & BLUE_MASK);
    }

    return;
}
