#include "global.h"
#include "fontgrp.h"
#include "hardware.h"

extern struct Text tmp_text;

struct Text * PutStringCentered(u16 * tm, int color, int width, char const * str)
{
    struct Text * const text = &tmp_text;

    InitText(text, width);

    Text_SetCursor(text, (width * 8 - GetStringTextLen(str) - 1) / 2);
    Text_SetColor(text, color);
    Text_DrawString(text, str);

    PutText(text, tm);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return text;
}
