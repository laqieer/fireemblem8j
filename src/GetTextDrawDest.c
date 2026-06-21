#include <stdarg.h>
#include <stdio.h>
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

//! FE8U = 0x08004120
void *GetTextDrawDest(struct Text *th)
{
    int chrNumber = (th->db_id * th->tile_width + th->chr_position + th->x / 8);

    return gActiveFont->vramDest + chrNumber * 2 * CHR_SIZE;
}
