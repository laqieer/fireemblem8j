#include "global.h"
#include "hardware.h"

void sub_80A3DC8(int x)
{
    int left;
    int right;

    left = 0;
    right = 0xf0;

    if (x > 0)
        left = x;

    if (x < 0)
        right = x + 0x100;

    right = (right > 0xf0) ? 0xf0 : ((right < 0) ? 0 : right);
    left = (left > 0xf0) ? 0xf0 : ((left < 0) ? 0 : left);

    SetWin0Box(left, 0, right, 0xa0);
}
