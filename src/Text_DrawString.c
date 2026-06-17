#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"



void Text_DrawString(struct Text *text, const char* str)
{
    struct Glyph *glyph;
    char byte1;
    char byte2;

    if (gActiveFont->lang != LANG_JAPANESE) {
        Text_DrawStringASCII(text, str);
        return;
    }

    while (*str != 0 && *str != CHAR_NEWLINE) {
        byte1 = *str++;
        if (byte1 >= 0x20) {
            byte2 = *str++;

        retry_draw:
            glyph = gActiveFont->glyphs[byte2 - 0x40];
            while (glyph != NULL)
            {
                if (glyph->sjisByte1 == byte1)
                {
                    gActiveFont->drawGlyph(text, glyph);
                    break;
                }

                glyph = glyph->sjisNext;
                if (glyph == NULL)
                {
                    byte1 = 0x81;
                    byte2 = 0xA7;
                    goto retry_draw;
                }
            }
        }
    }
}
