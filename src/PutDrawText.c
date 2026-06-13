#include "global.h"
#include <stdarg.h>
#include <stdio.h>
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

void PutDrawText(struct Text * text, u16 * tm, int color, int x, int tile_width, char const * str)
{
    struct Text tmpText;

    if (text == NULL) {
        text = &tmpText;
        InitText(text, tile_width);
    }

    Text_SetCursor(text, x);
    Text_SetColor(text, color);
    Text_DrawString(text, str);

    PutText(text, tm);
}
