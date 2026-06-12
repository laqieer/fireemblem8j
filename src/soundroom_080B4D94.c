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

//! FE8U = 0x080B017C
void DrawSoundRoomVolumeGraphSprites(int x, int y, int c, int d)
{
    int count = 0;
    int pal = 0xd;

    if (d == 0)
    {
        return;
    }

    y = OAM0_Y(y);

    if (c > 7)
    {
        int x_ = x;

        for (; c > 7;)
        {
            c -= 8;

            PutSpriteExt(0, OAM1_X(x_), y, gObject_8x8, OAM2_PAL(pal) + OAM2_CHR(0x47) + OAM2_LAYER(2));

            x_ += 8;
            count++;

            if (count > 2)
            {
                pal = 0xe;
            }

            if (count > 4)
            {
                pal = 0xf;
            }
        }
    }

    PutSpriteExt(0, OAM1_X(count * 8 + x), y, gObject_8x8, c + OAM2_PAL(pal) + OAM2_CHR(0x40) + OAM2_LAYER(2));

    return;
}
