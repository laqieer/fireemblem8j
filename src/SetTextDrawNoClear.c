#include "global.h"
#include "fontgrp.h"

extern struct Font *gActiveFont;
void DrawTextGlyphNoClear(struct Text * text, struct Glyph * glyph);

void SetTextDrawNoClear(void)
{
    gActiveFont->drawGlyph = DrawTextGlyphNoClear;
}
