#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

void ClearText(struct Text *text)
{
    text->x = 0;
    text->colorId = TEXT_COLOR_SYSTEM_WHITE;
    CpuFastFill16(0, gActiveFont->get_draw_dest(text), text->tile_width * 2 * CHR_SIZE);
}
