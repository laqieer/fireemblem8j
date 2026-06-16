#include "global.h"
#include "fontgrp.h"
#include "soundroom.h"
#include "functions.h"

struct Unknown201F148
{
    /* 00 */ struct Font font;
    /* 18 */ struct Text text[7];
    /* 50 */ u16 unk_50;
};

extern struct Unknown201F148 gUnk_SoundRoom_0;

// JP region-different msgid 0x7D0->0x747
void DrawSoundRoomSongTitle(int index)
{
    const char * str;

    if (index == -1)
    {
        str = GetStringFromIndex(0x747);
    }
    else
    {
        str = GetStringFromIndex(gSoundRoomTable[index].nameTextId);
    }

    SetTextFont(&gUnk_SoundRoom_0.font);
    SetTextFontGlyphs(1);

    SpriteText_DrawBackgroundExt(&gUnk_SoundRoom_0.text[1], 0);

    Text_SetCursor(&gUnk_SoundRoom_0.text[1], GetStringTextCenteredPos(176, str));
    Text_SetColor(&gUnk_SoundRoom_0.text[1], 0);
    Text_DrawString(&gUnk_SoundRoom_0.text[1], str);

    SetTextFont(NULL);

    return;
}
