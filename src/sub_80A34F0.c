#include "global.h"
#include "hardware.h"
#include "fontgrp.h"

// JP-specific: write `count` special-chars across one BG2 tilemap row.
void sub_80A34F0(int base, int row, int color, int id, int count)
{
    u16 * tm;
    u16 * buf;
    int i;
    int idx;

    if (count > 0)
    {
        idx = base + row * 0x20;
        buf = gBG2TilemapBuffer;
        i = count;
        tm = buf + idx;

        do
        {
            PutSpecialChar(tm, color, id);
            tm++;
        } while (--i);
    }
}
