#include "global.h"
#include "fontgrp.h"

extern u16 gUnk_085D3EB8[];

void sub_8048DC0(struct Text * th, int number, s8 centerFlag, int color)
{
    int w[4];
    int width;
    int x;
    int half;
    int tens;
    int units;
    int odd;
    u16 * pUnits;

    x = 0;
    if (number == 0)
        return;
    if (number == 0x32)
    {
        width = GetStringTextLen(GetStringFromIndex(0xE2));
        if (centerFlag != 0)
            x = (0x30 - width) >> 1;
        Text_InsertDrawString(th, x, color, GetStringFromIndex(0xE2));
        return;
    }
    w[0] = GetStringTextLen(GetStringFromIndex(0xDF));
    width = w[0];
    half = number >> 1;
    tens = half / 10;
    units = half % 10;
    if (tens != 0)
    {
        w[1] = GetStringTextLen(GetStringFromIndex(gUnk_085D3EB8[tens])) - 1;
        width += w[1];
    }
    pUnits = gUnk_085D3EB8 + units;
    w[2] = GetStringTextLen(GetStringFromIndex(*pUnits)) - 1;
    width += w[2];
    w[3] = GetStringTextLen(GetStringFromIndex(0xE0));
    width += w[3];
    odd = number & 1;
    if (odd != 0)
        width += GetStringTextLen(GetStringFromIndex(0xE1));
    if (centerFlag != 0)
        x = (0x30 - width) >> 1;
    Text_InsertDrawString(th, x, color, GetStringFromIndex(0xDF));
    x += w[0];
    if (tens != 0)
    {
        Text_InsertDrawString(th, x, color, GetStringFromIndex(gUnk_085D3EB8[tens]));
        x += w[1];
    }
    Text_InsertDrawString(th, x, color, GetStringFromIndex(*pUnits));
    x += w[2];
    Text_InsertDrawString(th, x, color, GetStringFromIndex(0xE0));
    x += w[3];
    if (odd != 0)
        Text_InsertDrawString(th, x, color, GetStringFromIndex(0xE1));
}
