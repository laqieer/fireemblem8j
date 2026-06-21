#include <stdarg.h>
#include <stdio.h>
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

//! FE8U = 0x08003C8C
void InitText(struct Text *text, int tileWidth)
{
    text->chr_position = gActiveFont->chr_counter;
    text->tile_width = tileWidth;
    text->db_id = 0;
    text->db_enabled = false;
    text->is_printing = false;
    gActiveFont->chr_counter += tileWidth;
    ClearText(text);
}
