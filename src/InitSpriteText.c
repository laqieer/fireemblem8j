#include <stdarg.h>
#include <stdio.h>
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

//! FE8U = 0x080044E0
void InitSpriteText(struct Text *th)
{
    th->chr_position = gActiveFont->chr_counter;
    th->tile_width = 32;
    th->db_id = 0;
    th->db_enabled = 0;
    th->is_printing = 0;
    gActiveFont->chr_counter += 64;
    th->x = 0;
    th->colorId = 0;
}
