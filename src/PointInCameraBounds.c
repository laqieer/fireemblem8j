#include "global.h"
#include "bmmap.h"

u8 PointInCameraBounds(s16 x, s16 y, u8 xBound, u8 yBound)
{
    if (y - gBmSt.camera.y > -yBound &&
        y - gBmSt.camera.y <= 0x9f &&
        x - gBmSt.camera.x > -xBound &&
        x - gBmSt.camera.x <= 0xef)
    {
        return 1;
    }

    return 0;
}
