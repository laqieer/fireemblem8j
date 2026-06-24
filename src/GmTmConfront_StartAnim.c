#include "global.h"

#include "soundwrapper.h"
#include "m4a.h"
#include "spline.h"
#include "bmlib.h"
#include "ap.h"

#include "worldmap.h"
#include "constants/songs.h"

struct GmapTmConfrontProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 unk_2a;
    /* 2C */ u16 unk_2c;
    /* 2E */ u8 unk_2e[2];
    /* 30 */ struct Vec2 unk_30[2];
    /* 38 */ struct Vec2 unk_38[2];
    /* 42 */ struct Vec2 unk_40[2];
    /* 48 */ void * unk_48;
};

//! FE8U = 0x080C054C
void GmTmConfront_StartAnim(struct GmapTmConfrontProc * proc)
{
    int i;
    s16 x_;
    s16 x;
    s16 y;

    Decompress(gImg_WorldmapSkirmish, (void *)0x06013000);

    x_ = 0;

    for (i = 0; i < 2; i++)
    {
        GmMu_GetPosition(
            GM_MU, proc->unk_2e[i], &x, &y);

        x_ = x_ + x;
    }

    x_ = x_ / 2;
    x = x_ - gGMData.xCamera;

    y = (y - 12);
    y -= gGMData.yCamera;

    if (((u16)y < DISPLAY_HEIGHT) && ((u16)x < DISPLAY_WIDTH))
    {
        proc->unk_48 = APProc_Create(SpriteAnim_WorldmapSkirmish, x, y, 0x3980, 0, 7);
    }

    PlaySoundEffect(SONG_314);

    return;
}
