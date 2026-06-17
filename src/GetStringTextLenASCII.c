#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

int GetStringTextLenASCII(const char *str)
{
    int width = 0;

    while (*str != 0)
    {
        struct Glyph *glyph = gActiveFont->glyphs[*str++];

        width += glyph->width;
    }
    return width;
}
