#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmitem.h"
#include "hardware.h"
#include "chapterdata.h"
#include "bmudisp.h"
#include "worldmap.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sio.h"
#include "prepscreen.h"
#include "constants/chapters.h"
#include "constants/items.h"
#include "constants/songs.h"

void Prep_DrawChapterGoal(int VRAM_offset, int pal)
{
    int msg;
    const char *str;
    struct Font font;
    struct Text th;

    InitSpriteTextFont(&font, OBJ_VRAM0 + VRAM_offset, pal);
    ApplyPalette(Pal_Text, 0x10 + pal);
    InitSpriteText(&th);
    SetTextFont(&font);
    SetTextFontGlyphs(0);
    SpriteText_DrawBackgroundExt(&th, 0);

    if (GetBattleMapKind() != BATTLEMAP_KIND_SKIRMISH)
        msg = GetROMChapterStruct(gPlaySt.chapterIndex)->goalWindowTextId;
    else
        msg = 0x126;

    str = GetStringFromIndex(msg);

    Text_InsertDrawString(
        &th,
        GetStringTextCenteredPos(0x60, str),
        0, str);

    SetTextFont(0);
}
