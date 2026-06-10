#include "global.h"
#include "fontgrp.h"
#include "variables.h"

extern struct Font *gActiveFont;

void SetTextFontGlyphs(int glyphset)
{
    if (glyphset == TEXT_GLYPHS_SYSTEM)
        gActiveFont->glyphs = TextGlyphs_System;
    else
        gActiveFont->glyphs = TextGlyphs_Talk;
}
