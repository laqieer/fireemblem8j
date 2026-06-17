#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"



int GetStringTextLen(const char *str)
{
    int width = 0;
    struct Glyph *glyph;
    char byte1;
    char byte2;

    if (gActiveFont->lang)
        return GetStringTextLenASCII(str);
    while (*str != 0 && *str != CHAR_NEWLINE) {
        byte1 = *str++;
        if (byte1 >= 0x20) {
            byte2 = *str++;
            glyph = gActiveFont->glyphs[byte2 - 0x40];

            while (glyph != NULL) {
                if (glyph->sjisByte1 == byte1) {
                    width += glyph->width;
                    break;
                }
                glyph = glyph->sjisNext;
            }
        }
    }
    return width;
}
