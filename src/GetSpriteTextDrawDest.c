#include <stdarg.h>
#include <stdio.h>
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

//! FE8U = 0x080045E8
void *GetSpriteTextDrawDest(struct Text *text)
{
    int r1 = (text->db_id * text->tile_width + text->chr_position + text->x / 8);
    return gActiveFont->vramDest + r1 * 32;
}
