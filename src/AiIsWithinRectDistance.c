#include "global.h"
#include "cp_common.h"

s8 AiIsWithinRectDistance(s16 x, s16 y, u8 x2, u8 y2, u8 maxDistance)
{
    u16 distance = RECT_DISTANCE(x, y, x2, y2);

    if (distance <= maxDistance)
    {
        return 1;
    }

    return 0;
}
