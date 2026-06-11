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









extern struct ProcCmd CONST_DATA ProcScr_ChapterIntro_LightBurst[];



extern struct ProcCmd CONST_DATA gProcScr_ChapterIntro[];



/* prototypes for same-file helpers called by this run */
void PutOppositeLightExplosionSprites(struct ChapterIntroFxProc * proc, int affineId, int xTarget, int yTarget);

/**
 * Draws the 6 (3 above right, 3 below left) "light explosion" sprites that
 * appear while the lens flare is active.
 */
//! FE8U = 0x08020578
void ChapterIntro_LightExplosion_Loop(struct ChapterIntroFxProc * proc)
{
    int scale;

    if (proc->unk_64 <= 70)
    {
        scale = Interpolate(INTERPOLATE_RSQUARE, 320, 16, proc->unk_64, 70);

        // clang-format off
        SetObjAffine(
            1,
            Div(+COS(0) * 16, scale),
            Div(-SIN(0) * 16, scale),
            Div(+SIN(0) * 16, scale),
            Div(+COS(0) * 16, scale)
        );
        // clang-format on

        proc->unk_64++;
    }

    PutOppositeLightExplosionSprites(proc, 1, 215, 17);

    if (proc->unk_66 <= 70)
    {
        scale = Interpolate(INTERPOLATE_RSQUARE, 320, 16, proc->unk_66, 70);

        // clang-format off
        SetObjAffine(
            2,
            Div(+COS(0) * 16, scale),
            Div(-SIN(0) * 16, scale),
            Div(+SIN(0) * 16, scale),
            Div(+COS(0) * 16, scale)
        );
        // clang-format on

        proc->unk_66++;
    }

    PutOppositeLightExplosionSprites(proc, 2, 192, 32);

    if (proc->unk_68 <= 70)
    {
        scale = Interpolate(INTERPOLATE_RSQUARE, 320, 16, proc->unk_68, 70);

        // clang-format off
        SetObjAffine(
            3,
            Div(+COS(0) * 16, scale),
            Div(-SIN(0) * 16, scale),
            Div(+SIN(0) * 16, scale),
            Div(+COS(0) * 16, scale)
        );
        // clang-format on

        proc->unk_68++;
    }

    PutOppositeLightExplosionSprites(proc, 3, 169, 47);

    proc->timer++;

    if (proc->timer >= 70)
    {
        Proc_Break(proc);
    }

    return;
}
