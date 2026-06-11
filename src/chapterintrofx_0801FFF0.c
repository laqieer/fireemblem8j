#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmfx.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmlib.h"
#include "sysutil.h"
#include "worldmap.h"

#include "constants/songs.h"

// clang-format off





extern struct ProcCmd CONST_DATA ProcScr_ChapterIntro_Bg1And3Scroll[];

u8 CONST_DATA gChapterIntroLightXLerpLut[] =
{
    208, 208,
    204, 192,
    160, 128,
    96, 64,
    36, 32,
    48, 72,
    96, 120,
    136, 136,
    120, 0,
};

u8 CONST_DATA gChapterIntroLightYLerpLut[] =
{
    160, 128,
    96, 64,
    40, 32,
    36, 44,
    72, 104,
    136, 152,
    156, 144,
    120, 96,
    80, 0,
};





extern struct ProcCmd CONST_DATA ProcScr_ChapterIntro_LightBurst[];



extern struct ProcCmd CONST_DATA gProcScr_ChapterIntro[];



//! FE8U = 0x080202F8
void ChapterIntro_TwinLights_Loop(struct ChapterIntroFxProc * proc)
{
    proc->xLight = Interpolate(
        INTERPOLATE_LINEAR, gChapterIntroLightXLerpLut[proc->timer], gChapterIntroLightXLerpLut[proc->timer + 1],
        proc->unk_4E, proc->unk_68);
    proc->yLight = Interpolate(
        INTERPOLATE_LINEAR, gChapterIntroLightYLerpLut[proc->timer], gChapterIntroLightYLerpLut[proc->timer + 1],
        proc->unk_4E, proc->unk_68);

    if (proc->unk_64 <= 100)
    {
        int scale = Interpolate(INTERPOLATE_RSQUARE, 320, 64, proc->unk_64, 100);

        // clang-format off
        SetObjAffine(
            0,
            Div(+COS(0) * 16, scale),
            Div(-SIN(0) * 16, scale),
            Div(+SIN(0) * 16, scale),
            Div(+COS(0) * 16, scale)
        );
        // clang-format on

        proc->unk_64++;
    }

    CallARM_PushToSecondaryOAM(
        OAM1_X(proc->xLight - 16), ((proc->yLight - 16) & 0x1FF) | OAM0_AFFINE_ENABLE, gObject_32x32,
        OAM2_CHR(0x210) + OAM2_PAL(2));
    CallARM_PushToSecondaryOAM(
        OAM1_X(224 - proc->xLight), ((144 - proc->yLight) & 0x1FF) | OAM0_AFFINE_ENABLE, gObject_32x32,
        OAM2_CHR(0x214) + OAM2_PAL(2));

    proc->unk_4E++;

    if (proc->unk_4E >= proc->unk_68)
    {
        proc->unk_4E = 0;

        proc->timer++;

        proc->unk_68 = Interpolate(INTERPOLATE_LINEAR, 3, 8, proc->unk_66, 18);

        proc->unk_66++;

        if (gChapterIntroLightXLerpLut[proc->timer + 1] == 0)
        {
            Proc_Break(proc);
        }
    }

    return;
}
