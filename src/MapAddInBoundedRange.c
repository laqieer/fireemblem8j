#include "global.h"
#include "bmidoten.h"

void MapAddInBoundedRange(short x, short y, short minRange, short maxRange)
{
    int ix = x;
    int iy = y;
    int imin = minRange;
    int imax = maxRange;
    MapAddInRange(ix, iy, imax,     +1);
    MapAddInRange(ix, iy, imin - 1, -1);
}
