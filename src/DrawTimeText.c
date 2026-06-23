#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmdifficulty.h"

struct Text *DrawTimeText(struct Text *th, int time, s8 xBase, s8 yBase, u8 colorId)
{
    s8 xOffset;
    const char *str;
    u16 hours;
    u16 minutes;
    u16 seconds;

    FormatTime(time * 60, &hours, &minutes, &seconds);

    xOffset = xBase - 7;

    if (hours < 10)
        th = DrawNumberText(th, 0, 1, xOffset, yBase, colorId);
    else
        th = DrawNumberText(th, hours / 10, 1, xOffset, yBase, colorId);

    xOffset++;

    th = DrawNumberText(th, hours % 10, 1, xOffset, yBase, colorId);

    xOffset = xBase - 5;

    str = GetStringFromIndex(0x194);

    InitText(th, 1);
    Text_SetParams(th, 0, colorId);
    Text_DrawCharacter(th, str);
    PutText(th, &gBG0TilemapBuffer[yBase * 32 + xOffset]);

    th++;

    xOffset = xBase - 4;

    if (minutes < 10)
        th = DrawNumberText(th, 0, 1, xOffset, yBase, colorId);
    else
        th = DrawNumberText(th, minutes / 10, 1, xOffset, yBase, colorId);

    xOffset++;

    th = DrawNumberText(th, minutes % 10, 1, xOffset, yBase, colorId);

    xOffset = xBase - 2;

    str = GetStringFromIndex(0x194);

    InitText(th, 1);
    Text_SetParams(th, 0, colorId);
    Text_DrawCharacter(th, str);
    PutText(th, &gBG0TilemapBuffer[yBase * 32 + xOffset]);

    th++;

    xOffset = xBase - 1;

    if (seconds < 10)
        th = DrawNumberText(th, 0, 1, xOffset, yBase, colorId);
    else
        th = DrawNumberText(th, seconds / 10, 1, xOffset, yBase, colorId);

    xOffset++;

    th = DrawNumberText(th, seconds % 10, 1, xOffset, yBase, colorId);

    return th;
}
