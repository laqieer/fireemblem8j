#include "global.h"
#include "fontgrp.h"
#include "variables.h"

struct SpecialCharSt {
    s8 color;
    s8 id;
    s16 chr_position;
};

extern struct Font *gActiveFont;
void DrawSpecialCharGlyph(int chr, int color, struct Glyph * glyph);

int AddSpecialChar(struct SpecialCharSt *st, int color, int id)
{
    st->color = color;
    st->id = id;
    st->chr_position = gActiveFont->chr_counter++;

    (st + 1)->color = -1;

    DrawSpecialCharGlyph(st->chr_position, color, TextGlyphs_Special[id]);

    return st->chr_position;
}
