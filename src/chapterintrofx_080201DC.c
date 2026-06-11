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



//! FE8U = 0x080204E4
void PutOppositeLightExplosionSprites(struct ChapterIntroFxProc * proc, int affineId, int xTarget, int yTarget)
{
    int x = Interpolate(INTERPOLATE_RCUBIC, DISPLAY_WIDTH / 2, xTarget, proc->timer, 70);
    int y = Interpolate(INTERPOLATE_RCUBIC, DISPLAY_HEIGHT / 2, yTarget, proc->timer, 70);

    CallARM_PushToSecondaryOAM(
        OAM1_X(x - 8) | OAM1_AFFINE_ID(affineId), ((y - 8) & 0x1FF) | OAM0_AFFINE_ENABLE, gObject_16x16,
        OAM2_CHR(0x218) + OAM2_PAL(2));

    CallARM_PushToSecondaryOAM(
        OAM1_X(232 - x) | OAM1_AFFINE_ID(affineId), ((152 - y) & 0x1FF) | OAM0_AFFINE_ENABLE, gObject_16x16,
        OAM2_CHR(0x218) + OAM2_PAL(2));

    return;
}
