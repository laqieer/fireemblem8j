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

// TODO: Implicit declarations
void PutMenuScrollBarAt(int, int);
void UpdateMenuScrollBarConfig(int, int, int, int);
ProcPtr StartMenuScrollBarExt(ProcPtr, int, int, int, int);

struct VolumeGraphBufferProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
};

struct SoundRoomSpriteDrawProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
};

struct Unknown_08A212DC
{
    u8 x;
    u8 y;
} __attribute__((packed));

struct Unknown201F148
{
    /* 00 */ struct Font font;
    /* 18 */ struct Text text[7];
    /* 50 */ u16 unk_50;
};

extern struct Unknown201F148 gUnk_SoundRoom_0;
extern u8 gSoundRoomVolumeGraphBuffer[][0x31];

extern u8 gMenuSoundroom_3[]; // gfx
extern u16 gUnkData_30[]; // pal
extern u16 gUnkData_31[]; // pal
extern u8 gMenuSoundroom_0[]; // tsa
extern u8 gMenuSoundroom_1[]; // tsa

extern u8 Img_PlayStatusSprites[]; // gfx
extern u16 Pal_PlayStatusSprites[]; // pal

extern u8 Img_SoundRoomUiElements[];
extern u16 Pal_SoundRoomUiElements[];

extern u8 gMenuSoundroom_4[];
extern u8 gMenuSoundroom_2[];

extern u16 * CONST_DATA gSoundroom_0;
extern void * CONST_DATA gSoundroom_1;
extern struct Unknown_08A212DC * CONST_DATA gSoundroom_2;
extern s8 * CONST_DATA gSoundRoomShuffleBuffer;

//! FE8U = 0x080B0088
void SoundRoom_DrawSongTitleSprites(int y, u16 unk)
{
    int i;

    if (unk > 32)
    {
        y = OAM0_Y(y);

        // clang-format off
        SetObjAffine(
            0,
            Div(+COS(0) * 16, 256),
            Div(-SIN(0) * 16, unk),
            Div(+SIN(0) * 16, 256),
            Div(+COS(0) * 16, unk)
        );
        // clang-format on

        for (i = 0; i < 5; i++)
        {
            PutSpriteExt(4, 36 + i * 32, y + 264, gObject_32x16, i * 4 + gUnk_SoundRoom_0.unk_50 + 0x1000);
        }

        for (i = 0; i < 3; i++)
        {
            PutSpriteExt(4, 24 + i * 64, y + 256, gObject_64x32, 0xcb00 + i * 8);
        }
    }

    return;
}
