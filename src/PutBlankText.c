#include <stdarg.h>
#include <stdio.h>
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

//! FE8U = 0x08003DEC
void PutBlankText(struct Text *text, u16 *tm)
{
    int i;

    for (i = 0; i < text->tile_width; i++) {
        tm[0x00] = 0;
        tm[0x20] = 0;

        tm++;
    }
}
