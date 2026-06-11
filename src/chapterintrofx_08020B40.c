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



//! FE8U = 0x08020E48
void ChapterIntro_BeginFadeOut(struct ChapterIntroFxProc * proc)
{
    Sound_FadeOutBGM(4);

    MaybeResetSomePal();

    MaybeSmoothChangeSomePal(PAL_BG(0), 0, 3, -2);
    MaybeSmoothChangeSomePal(PAL_BG(4), 4, 2, -2);
    MaybeSmoothChangeSomePal(PAL_BG(14), 14, 2, -2);
    MaybeSmoothChangeSomePal(PAL_OBJ(2), 18, 1, -2);

    proc->timer = 15;

    Sound_FadeOutSE(1);

    return;
}
