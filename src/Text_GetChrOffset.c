#include <stdarg.h>
#include <stdio.h>
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

//! FE8U = 0x08003D70
int Text_GetChrOffset(struct Text *text)
{
    return (text->db_id * text->tile_width + text->chr_position) * 2;
}
