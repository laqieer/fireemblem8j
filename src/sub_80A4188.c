#include "global.h"
#include "functions.h"
#include "variables.h"
#include "fontgrp.h"
#include "hardware.h"
#include "chapterdata.h"
#include "worldmap.h"

void sub_80A4188(int VRAM_offset, int pal)
{
    int msg;
    const char *str;
    struct Font font;
    struct Text th;

    if (GetBattleMapKind() != BATTLEMAP_KIND_SKIRMISH)
        msg = GetROMChapterStruct(gPlaySt.chapterIndex)->goalWindowTextId;
    else
        msg = 0x126;

    str = GetStringFromIndex(msg);

    InitSpriteTextFont(&font, OBJ_VRAM0 + VRAM_offset, 1);
    ApplyPalette(Pal_Text, 0x10 + pal);
    InitSpriteText(&th);
    SetTextFont(&font);
    SetTextFontGlyphs(0);
    SpriteText_DrawBackgroundExt(&th, 0);

    Text_InsertDrawString(
        &th,
        GetStringTextCenteredPos(0x60, str),
        0, str);

    SetTextFont(0);
}
