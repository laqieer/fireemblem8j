#include <stdarg.h>
#include <stdio.h>
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

//! FE8U = 0x080048E8
void DrawSpecialCharGlyph_old(struct Text *th, u16 *b, int c)
{
    int r1 = gActiveFont->tileref + (th->db_id * th->tile_width + th->chr_position) * 2;
    int i;

    for (i = 0; i < th->tile_width && i < c; i++)
    {
        b[0] = r1;
        r1++;

        b[32] = r1;
        r1++;

        b++;
    }

    if (th->db_enabled != 0)
        th->db_id ^= 1;
}
