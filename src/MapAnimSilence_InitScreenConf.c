#include "global.h"
#include "proc.h"
#include "bmlib.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "hardware.h"
#include "bmitem.h"
#include "bmmind.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "ap.h"
#include "eventinfo.h"
#include "efxbattle.h"
#include "constants/items.h"
#include "constants/video-global.h"
#include "constants/songs.h"

void MapAnimSilence_InitScreenConf(struct MAEffectProc * proc)
{
    PlaySeSpacial(SONG_84, proc->xDisplay);

    PutTmRectSequential(
        gBG2TilemapBuffer,
        proc->xDisplay / 8 - 2,
        proc->yDisplay / 8 - 2,
        TILEREF(BGCHR_MANIM_140, BGPAL_MANIM_4), 4, 4);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);
    SetBlendAlpha(0x10, 0x10);
}
