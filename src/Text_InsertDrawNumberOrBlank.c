#include "global.h"
#include "fontgrp.h"

void Text_InsertDrawNumberOrBlank(struct Text *text, int x, int colorId, int n)
{
    Text_SetCursor(text, x);
    Text_SetColor(text, colorId);
    Text_DrawNumberOrBlank(text, n);
}
