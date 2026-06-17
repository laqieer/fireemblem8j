#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

u16 *GetColorLut(int color);

void DrawSpriteTextGlyph(struct Text *text, struct Glyph *glyph)
{
    u64 bmpRow;
    int i;
    u32 *dest = gActiveFont->get_draw_dest(text);
    int xoffset = text->x & 7;
    u32 *bitmap = glyph->bitmap;
    u16 *r8 = GetColorLut(text->colorId);

    for (i = 0; i < 8; i++) {
        // read one row of 32 bits from the bitmap
        bmpRow = (u64)*bitmap << xoffset * 2;
        bitmap++;

        dest[0] |= r8[bmpRow & 0xFF] | (r8[(bmpRow >> 8) & 0xFF] << 16);
        dest[8] |= r8[(bmpRow >> 16) & 0xFF] | (r8[(bmpRow >> 24) & 0xFF] << 16);
        dest[16] |= r8[(bmpRow >> 32) & 0xFF] | (r8[(bmpRow >> 40) & 0xFF] << 16);

        dest++;
    }

    dest = gActiveFont->get_draw_dest(text) + 0x400;

    for (i = 0; i < 8; i++) {
        // read one row of 32 bits from the bitmap
        bmpRow = (u64)*bitmap << xoffset * 2;
        bitmap++;

        dest[0] |= r8[bmpRow & 0xFF] | (r8[(bmpRow >> 8) & 0xFF] << 16);
        dest[8] |= r8[(bmpRow >> 16) & 0xFF] | (r8[(bmpRow >> 24) & 0xFF] << 16);
        dest[16] |= r8[(bmpRow >> 32) & 0xFF] | (r8[(bmpRow >> 40) & 0xFF] << 16);

        dest++;
    }

    text->x += glyph->width;
}
