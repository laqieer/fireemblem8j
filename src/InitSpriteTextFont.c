#include "global.h"
#include "fontgrp.h"
#include "hardware.h"

void InitSpriteTextFont(struct Font *font, void *vramDest, int c)
{
    font->vramDest = (void *)vramDest;
    font->get_draw_dest = GetSpriteTextDrawDest;
    font->palid = (c & 0xF) + 16;
    font->tileref = ((uintptr_t)vramDest & 0x1FFFF) >> 5;
    font->chr_counter = 0;
    font->lang = GetLang();
    SetTextFont(font);
    font->drawGlyph = DrawSpriteTextGlyph;
}
