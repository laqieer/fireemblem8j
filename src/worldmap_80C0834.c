#include "global.h"

#include "worldmap.h"

//! FE8U = 0x080C089C
int GetWMCursorScreenQuadrant(int a, int b, int c, int d)
{
    s16 x1;
    s16 y1;
    s16 x2;
    s16 y2;

    *&x1 = (gGMData.ix >> 8);
    *&y1 = (gGMData.iy >> 8);

    *&x2 = gGMData.xCamera;
    *&y2 = gGMData.yCamera;

    x1 = (x1 + 8) - x2;
    y1 = (y1 + 8) - y2;

    if ((a != 0) || (b != 0))
    {
        if (x1 >= DISPLAY_WIDTH / 2 - d)
        {
            if ((x1 < c + DISPLAY_WIDTH / 2))
            {
                return 4;
            }
        }
    }

    if ((c != 0) || (d != 0))
    {
        if (y1 >= DISPLAY_HEIGHT / 2 - a)
        {
            if (y1 < b + DISPLAY_HEIGHT / 2)
            {
                return 4;
            }
        }
    }

    if ((x1 <= DISPLAY_WIDTH / 2) && (y1 <= DISPLAY_HEIGHT / 2))
    {
        return 0;
    }

    if ((x1 > DISPLAY_WIDTH / 2) && (y1 <= DISPLAY_HEIGHT / 2))
    {
        return 1;
    }

    if ((x1 <= DISPLAY_WIDTH / 2) && (y1 > DISPLAY_HEIGHT / 2))
    {
        return 2;
    }

    if ((x1 > DISPLAY_WIDTH / 2) && (y1 > DISPLAY_HEIGHT / 2))
    {
        return 3;
    }
}
