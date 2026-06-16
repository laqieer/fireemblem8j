#include "global.h"
#include "fontgrp.h"
#include "hardware.h"

extern struct Font gDefaultFont;

void InitTextFont(struct Font *font, void *vramDest, int chr, int palid)
{
    if (font == NULL)
        font = &gDefaultFont;
    font->vramDest = vramDest;
    font->get_draw_dest = GetTextDrawDest;
    font->palid = palid;
    font->tileref = TILEREF(chr, palid);
    font->chr_counter = 0;
    font->lang = GetLang();
    SetTextFont(font);
    InitSystemTextFont();
}
