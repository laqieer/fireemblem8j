#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

void DrawTextGlyph(struct Text *text, struct Glyph *glyph);

void InitTalkTextFont(void)
{
    ApplyPalette(Pal_TalkText, gActiveFont->palid);
    PAL_COLOR(gActiveFont->palid, 0) = 0;

    gActiveFont->drawGlyph = DrawTextGlyph;
    SetTextFontGlyphs(TEXT_GLYPHS_TALK);
}
