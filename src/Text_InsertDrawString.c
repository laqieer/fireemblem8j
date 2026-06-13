#include "global.h"
#include <stdarg.h>
#include <stdio.h>
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

void Text_InsertDrawString(struct Text *text, int x, int colorId, const char *str)
{
    Text_SetCursor(text, x);
    Text_SetColor(text, colorId);
    Text_DrawString(text, str);
}
