#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

char const * Text_DrawCharacter(struct Text * text, char const * str)
{
    struct Glyph *glyph;
    char byte2, byte1;

    if (gActiveFont->lang != LANG_JAPANESE)
        return Text_DrawCharacterAscii(text, str);

    byte1 = *str++;
    byte2 = *str++;

retry_draw:
    glyph = gActiveFont->glyphs[byte2 - 0x40];

    while (glyph) {
        if (glyph->sjisByte1 == byte1) {
            gActiveFont->drawGlyph(text, glyph);
            break;
        }

        glyph = glyph->sjisNext;
    }

    if (glyph == NULL) {
        byte1 = 0x81;
        byte2 = 0xA7;

        goto retry_draw;
    }

    return str;
}
