#include "global.h"
#include "fontgrp.h"

extern const char Str_FullwidthZero[];

void Text_DrawNumberOrSpace(struct Text *text, int n)
{
    int length;
    int r0;
    int i;

    if (n == 0) {
        Text_DrawCharacter(text, Str_FullwidthZero);
        text->x += 8;
        return;
    }

    length = 1;
    r0 = n / 10;
    while (r0 != 0) {
        length++;
        r0 /= 10;
    }

    text->x += (length - 1) * 8;

    for (i = 0; i < length; i++) {
        s16 c = 0x4F82 + ((n % 10) << 8);

        n /= 10;
        Text_DrawCharacter(text, (char const *)&c);
        text->x -= 16;
    }

    text->x += length * 8 + 8;
}
