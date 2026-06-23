#include "global.h"
#include "fontgrp.h"

extern const char Str_FullwidthZero[];

void Text_DrawNumber(struct Text *text, int number)
{
    if (number == 0)
    {
        Text_DrawCharacter(text, Str_FullwidthZero);
        return;
    }

    while (number != 0)
    {
        s16 chr = 0x4F82 + ((number % 10) << 8);
        number /= 10;

        Text_DrawCharacter(text, (char const *)&chr);

        text->x -= 16;
    }
}
