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

/* prototypes for same-file helpers called by this run */
bool IsSoundRoomSongPlayable(struct SoundRoomProc * proc, int flag);

//! FE8U = 0x080AF3C8
void SoundRoom_DrawSongList(struct SoundRoomProc * proc)
{
    int i;
    int color;

    int var = ((proc->bgYOffset >> 4) - 1) * 4;
    BG_Fill(gBG2TilemapBuffer, 0);

    for (i = var; i < (var + 28); i++)
    {
        color = TEXT_COLOR_SYSTEM_GRAY;

        if (i < 0)
        {
            continue;
        }

        if (i >= proc->totalSongs)
        {
            break;
        }

        if (IsSoundRoomSongPlayable(proc, i))
        {
            color = TEXT_COLOR_SYSTEM_WHITE;
        }
        else
        {
            if ((gSoundRoomTable[i].displayCondFunc) != 0)
            {
                PutTwoSpecialChar(
                    gBG2TilemapBuffer + TILEMAP_INDEX(12 + (i % 4) * 4, (((i / 4) * 2 + 8) & 0x1f)),
                    TEXT_COLOR_SYSTEM_GRAY, TEXT_SPECIAL_DASH, TEXT_SPECIAL_DASH);

                continue;
            }
        }

        if (i >= 99)
        {
            PutNumber(gBG2TilemapBuffer + TILEMAP_INDEX(13 + (i % 4) * 4, (((i / 4) * 2 + 8) & 0x1f)), color, i + 1);
        }
        else
        {
            PutNumber2Digit(
                gBG2TilemapBuffer + TILEMAP_INDEX(13 + (i % 4) * 4, (((i / 4) * 2 + 8) & 0x1f)), color, i + 1);
        }
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}
