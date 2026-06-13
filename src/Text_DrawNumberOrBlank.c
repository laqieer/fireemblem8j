#include "global.h"
#include <stdarg.h>
#include <stdio.h>
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

void Text_DrawNumberOrBlank(struct Text *th, int n)
{
    if (n == 255 || n == -1) {
        Text_Skip(th, -8);
        Text_DrawString(th, GetStringFromIndex(0x4C5));
        return;
    }

    Text_DrawNumber(th, n);
}
