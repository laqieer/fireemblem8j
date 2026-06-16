#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

const char *Text_DrawCharacterAscii(struct Text *th, const char *str)
{
    struct Glyph *glyph = gActiveFont->glyphs[*str++];

    if (glyph == NULL)
        glyph = gActiveFont->glyphs['?'];

    gActiveFont->drawGlyph(th, glyph);
    return str;
}
