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



//! FE8U = 0x08020A40
void ChapterIntro_1(struct ChapterIntroFxProc * proc)
{
    proc->timer = 30;

    MaybeResetSomePal();

    MaybeSmoothChangeSomePal(PAL_BG(4), 4, 2, -1);
    MaybeSmoothChangeSomePal(PAL_BG(14), 14, 2, -1);
    MaybeSmoothChangeSomePal(PAL_OBJ(2), 18, 1, -1);

    return;
}
