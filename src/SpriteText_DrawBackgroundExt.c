#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

void SpriteText_DrawBackgroundExt(struct Text *text, u32 b)
{
    text->x = 0;
    CpuFastFill(b, gActiveFont->get_draw_dest(text), 0x800);
}
