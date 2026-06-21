#include "global.h"

#include "worldmap.h"

//! FE8U = 0x080C5628
void GetWMCenteredCameraPosition(s16 xIn, s16 yIn, s16 * xOut, s16 * yOut)
{
    int x = xIn;
    int y = yIn;

    *xOut = (x - DISPLAY_WIDTH / 2);

    if (*xOut < 0)
    {
        *xOut = 0;
    }
    else if (*xOut > DISPLAY_WIDTH)
    {
        *xOut = DISPLAY_WIDTH;
    }

    *yOut = (y - DISPLAY_HEIGHT / 2);

    if (*yOut < 0)
    {
        *yOut = 0;
    }
    else if (*yOut > DISPLAY_HEIGHT)
    {
        *yOut = DISPLAY_HEIGHT;
    }

    return;
}
