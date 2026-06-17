#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

void Text_DrawStringASCII(struct Text *text, const char *str)
{
    while (*str != 0) {
        struct Glyph *glyph = gActiveFont->glyphs[*str++];

        if (glyph == NULL)
            glyph = gActiveFont->glyphs['?'];

        gActiveFont->drawGlyph(text, glyph);
    }
}
