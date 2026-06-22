#include "global.h"

#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "uiutils.h"
#include "prepscreen.h"

//! FE8U = 0x080A2108
void WmSell_InitMenuSpriteText(void) {
    InitSpriteTextFont(&_PrepItemSuppyTexts->font, (void*)0x06011000, 11);
    ApplyPalette(Pal_Text, 0x1B);

    InitSpriteText(&_PrepItemSuppyTexts->textC);

    SetTextFont(&_PrepItemSuppyTexts->font);
    SetTextFontGlyphs(0);

    SpriteText_DrawBackgroundExt(&_PrepItemSuppyTexts->textC, 0);

    Text_InsertDrawString(&_PrepItemSuppyTexts->textC, 0, 0, GetStringFromIndex(0x527)); // TODO msgid "Sell     Quit[.]"
    Text_InsertDrawString(&_PrepItemSuppyTexts->textC, 64, 0, GetStringFromIndex(0x526)); // TODO msgid "Sell?[.]"
    Text_InsertDrawString(&_PrepItemSuppyTexts->textC, 128, 3, GetStringFromIndex(0x528)); // TODO msgid "Value[.]"

    SetTextFont(0);

    return;
}
