#include "global.h"
#include "fontgrp.h"

extern struct Text tmp_text;

struct Text * PutString(u16 * tm, int color, char const * str)
{
    struct Text * const text = &tmp_text;

    InitText(text, (GetStringTextLen(str) + 7) / 8);

    Text_SetColor(text, color);
    Text_DrawString(text, str);

    PutText(text, tm);

    return text;
}
