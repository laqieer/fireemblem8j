#include "global.h"
#include "fontgrp.h"
#include "variables.h"
#include "hardware.h"

extern struct Font *gActiveFont;
void DrawTextGlyph(struct Text *, struct Glyph *);

void InitSystemTextFont(void)
{
    ApplyPalette(Pal_Text, gActiveFont->palid);
    PAL_COLOR(gActiveFont->palid, 0) = 0;
    gActiveFont->drawGlyph = DrawTextGlyph;
    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);
}
