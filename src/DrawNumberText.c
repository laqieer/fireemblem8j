#include "global.h"
#include "fontgrp.h"
#include "hardware.h"

struct Text *DrawNumberText(struct Text *th, u16 number, u8 places, s8 x, s8 y, u8 colorId)
{
    int i;
    u8 shouldDraw;
    u8 digits[8];

    for (i = 0; i < places; i++)
    {
        digits[i] = DivRem(number, 10);
        number = Div(number, 10);
    }

    shouldDraw = 0;

    for (i = places - 1; i >= 0; i--)
    {
        if (digits[i] != 0)
            shouldDraw = 1;

        if (shouldDraw || i == 0)
        {
            InitText(th, 1);
            Text_SetParams(th, 0, colorId);
            Text_DrawNumber(th, digits[i]);
            PutText(th, &gBG0TilemapBuffer[y * 32 + (x - i)]);
        }

        th++;
    }

    return th;
}
