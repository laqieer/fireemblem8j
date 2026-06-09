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























//! FE8U = 0x0801FDAC
void ChapterIntro_KeyListen_Init(struct ChapterIntroFxProc * proc)
{
    struct ChapterIntroFxProc * parent = proc->proc_parent;

    parent->skipTarget = 0;
    proc->skipTarget = 0;

    return;
}
