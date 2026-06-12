#include "global.h"
#include "chapterdata.h"
#include "bmsave.h"
#include "hardware.h"
#include "face.h"
#include "bmreliance.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "ctc.h"
#include "bmlib.h"
#include "bmtrade.h"
#include "worldmap.h"
#include "savemenu.h"
#include "sysutil.h"
#include "scene.h"
#include "ending_details.h"
#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * SpriteArray_EndingDetails_0[];
extern u16 * SpriteArray_EndingDetails_1[];
extern u16 Sprite_EndingDetails_0[];
extern u16 Sprite_EndingDetails_1[];
extern u16 Sprite_EndingDetails_2[];
extern u16 Sprite_EndingDetails_3[];
extern u16 Sprite_EndingDetails_4[];
extern u16 Sprite_EndingDetails_5[];
extern u16 Sprite_EndingDetails_6[];
extern u16 Sprite_EndingDetails_7[];

/**
 * Unused / unrelated to this file. Appears to be leftover from FE6/FE7.
 * Seems to be used in a parallel worker proc for drawing the "Player Rank"
 * sprites in FE6.
 */
//! FE8U = 0x080B7BD8
void EndingDetails_PutSprites(struct UnkProc * proc)
{
    int i;

    PutSpriteExt(2, 24, 20, Sprite_EndingDetails_0, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(9));
    PutSpriteExt(2, 16, 128, Sprite_EndingDetails_7, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(6));

    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)
    {
        PutSpriteExt(2, 16, 56, Sprite_EndingDetails_1, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 128, 56, Sprite_EndingDetails_2, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 16, 88, Sprite_EndingDetails_4, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 128, 88, Sprite_EndingDetails_6, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(7));

        for (i = 0; i < 3; i++)
        {
            if (proc->unk_4c[i] > 0x10)
            {
                SetObjAffine(
                    i,
                    Div(+COS(0) * 16, proc->unk_4c[i]),
                    Div(-SIN(0) * 16, 0x100),
                    Div(+SIN(0) * 16, proc->unk_4c[i]),
                    Div(+COS(0) * 16, 0x100)
                );

                PutSpriteExt(
                    2,
                    (i & 1) * 112 + 80 + i * 512,
                    (i >> 1) * 32 + 304,
                    SpriteArray_EndingDetails_0[proc->unk_40[i]],
                    OAM2_PAL(i + 10) + OAM2_CHR(0x80) + OAM2_LAYER(1)
                );
            }
        }

        if (proc->unk_4c[i] > 0x10)
        {
            SetObjAffine(
                i,
                Div(+COS(0) * 16, proc->unk_4c[i]),
                Div(-SIN(0) * 16, 0x100),
                Div(+SIN(0) * 16, proc->unk_4c[i]),
                Div(+COS(0) * 16, 0x100)
            );

            PutSpriteExt(
                2,
                (i & 1) * 112 + 80 + i * 512,
                (i >> 1) * 32 + 304,
                SpriteArray_EndingDetails_1[proc->unk_40[i]],
                OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(15)
            );
        }
    }
    else
    {
        PutSpriteExt(2, 16, 48, Sprite_EndingDetails_1, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 128, 48, Sprite_EndingDetails_2, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 16, 72, Sprite_EndingDetails_5, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 128, 72, Sprite_EndingDetails_3, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 16, 96, Sprite_EndingDetails_4, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 128, 96, Sprite_EndingDetails_6, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(7));

        for (i = 0; i < 5; i++)
        {
            if (proc->unk_4c[i] > 0x10)
            {
                SetObjAffine(
                    i,
                    Div(+COS(0) * 16, proc->unk_4c[i]),
                    Div(-SIN(0) * 16, 0x100),
                    Div(+SIN(0) * 16, proc->unk_4c[i]),
                    Div(+COS(0) * 16, 0x100)
                );

                PutSpriteExt(
                    2,
                    (i & 1) * 112 + 80 + i * 512,
                    (i >> 1) * 24 + 296,
                    SpriteArray_EndingDetails_0[proc->unk_40[i]],
                    OAM2_PAL(i + 10) + OAM2_CHR(0x80) + OAM2_LAYER(1)
                );
            }
        }

        if (proc->unk_4c[i] > 0x10)
        {
            SetObjAffine(
                i,
                Div(+COS(0) * 16, proc->unk_4c[i]),
                Div(-SIN(0) * 16, 0x100),
                Div(+SIN(0) * 16, proc->unk_4c[i]),
                Div(+COS(0) * 16, 0x100)
            );

            PutSpriteExt(
                2,
                (i & 1) * 112 + 80 + (i * 512),
                (i >> 1) * 24 + 296,
                SpriteArray_EndingDetails_1[proc->unk_40[i]],
                OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(15)
            );
        }
    }

    return;
}
