#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

void SpriteText_DrawBackground(struct Text *th)
{
    if (th->tile_width != 0)
    {
        th->x = 0;
        CpuFastFill(0x44444444, gActiveFont->get_draw_dest(th), 0x360);
        CpuFastFill(0x44444444, gActiveFont->get_draw_dest(th) + 0x400, 0x360);
    }
}
