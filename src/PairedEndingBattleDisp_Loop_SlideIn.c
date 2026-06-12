extern int PutEndingBattleDisplayBg();
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
extern u8 gCharEndingSlideOffsetLut[];

//! FE8U = 0x080B71DC
void PairedEndingBattleDisp_Loop_SlideIn(struct EndingBattleDisplayProc * proc)
{
    int xBase = 30;

    int xOffset = gCharEndingSlideOffsetLut[proc->timer];
    proc->timer++;

    xBase -= xOffset;

    SetFacePosition(0, (xBase * 8 + 64) & 0x1FF, 48);
    SetFacePosition(1, (xBase * 8 + 176) & 0x1FF, 48);

    PutEndingBattleDisplayBg(xBase, 0);

    if (xOffset == 30)
    {
        Proc_Break(proc);
    }

    return;
}
