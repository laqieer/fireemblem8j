#include "global.h"
#include "fontgrp.h"
#include "hardware.h"

struct Text *DrawNumberText_WithReset(struct Text *th, u16 number, u8 count, s8 startX, s8 yPos, u8 colorId)
{
    u8 digits[8];
    int i;
    int hasNonZero;

    for (i = 0; i < count; i++)
    {
        digits[i] = DivRem(number, 10);
        number = Div(number, 10);
    }

    hasNonZero = 0;

    for (i = count - 1; i >= 0; i--)
    {
        if (th->chr_position != 0xFFFF)
            ClearText(th);

        if (digits[i] != 0)
            hasNonZero = 1;

        if (hasNonZero || i == 0)
        {
            if (th->chr_position == 0xFFFF)
                InitText(th, 1);

            Text_SetParams(th, 0, colorId);
            Text_DrawNumber(th, digits[i]);
            PutText(th, &gBG0TilemapBuffer[yPos * 32 + (startX - i)]);
        }

        th++;
    }

    return th;
}
