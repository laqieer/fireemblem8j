#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

u16 *GetColorLut(int color);

void DrawTextGlyph(struct Text *text, struct Glyph *glyph)
{
    void *draw_dest = gActiveFont->get_draw_dest(text);
    int subx = text->x & 7;
    u32 *bitmap = glyph->bitmap;

    DrawGlyphRam(GetColorLut(text->colorId), draw_dest, bitmap, subx);
    text->x += glyph->width;
}
