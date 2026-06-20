#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bm.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "ctc.h"
#include "sysutil.h"
#include "bmsave.h"
#include "soundroom.h"
#include "constants/songs.h"

struct Unknown201F148
{
    /* 00 */ struct Font font;
    /* 18 */ struct Text text[7];
    /* 50 */ u16 unk_50;
};
extern struct Unknown201F148 gUnk_SoundRoom_0;

//! FE8U = 0x080AFF30
void SoundRoom_InitText(void)
{
    int i;

    u32 vram = 0x06014000;

    InitSpriteTextFont(&gUnk_SoundRoom_0.font, (void *)vram, 5);

    ApplyPalettes(Pal_Text, 0x1A, 2);
    gPaletteBuffer[0x1A * 0x10] = 0;

    EnablePaletteSync();

    SetTextFont(&gUnk_SoundRoom_0.font);
    InitSpriteText(&gUnk_SoundRoom_0.text[1]);
    InitSpriteText(&gUnk_SoundRoom_0.text[2]);

    for (i = 0; i < 3; i++)
    {
        InitSpriteText(&gUnk_SoundRoom_0.text[3 + i]);
    }

    SetTextFont(NULL);

    gUnk_SoundRoom_0.unk_50 = (((0x1FFFF & vram) >> 5) & 0x3FF) + 0xa000;

    SetTextFont(NULL);
    SetTextFontGlyphs(0);

    InitText(&gUnk_SoundRoom_0.text[0], 4);
    ClearText(&gUnk_SoundRoom_0.text[0]);

    Text_InsertDrawString(&gUnk_SoundRoom_0.text[0], 0, 0, GetStringFromIndex(0x535)); // TODO: msgid "Success[.]"

    InitText(&gUnk_SoundRoom_0.text[6], 2);
    ClearText(&gUnk_SoundRoom_0.text[6]);

    Text_DrawString(&gUnk_SoundRoom_0.text[6], GetStringFromIndex(0x748)); // TODO: msgid "%[.]"

    return;
}
