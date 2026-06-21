#include <stdarg.h>
#include <stdio.h>
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

//! FE8U = 0x08003DA0
void PutText(struct Text *text, u16 *tm)
{
    int i;
    int tileref = gActiveFont->tileref + (text->db_id * text->tile_width + text->chr_position) * 2;

    for (i = 0; i < text->tile_width; i++) {
        tm[0x00] = tileref++;
        tm[0x20] = tileref++;
        tm++;
    }

    if (text->db_enabled != 0)
        text->db_id ^= 1;
}
