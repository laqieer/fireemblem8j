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
























/* prototypes for same-file helpers called by this run */
void SetupFinScreenGfx(void);

//! FE8U = 0x080B74B0
void Fin_Init(struct FinScreenProc * proc)
{
    proc->blendTimer = 0;
    proc->timer = 0;

    SetupBackgrounds(NULL);

    SetupFinScreenGfx();

    StartBgmFadeIn(SONG_BGM_ED_STAFF_2, 7, 0);
    SetDefaultColorEffects();

    return;
}

//! FE8U = 0x080B74D8
void Fin_Loop_KeyListener(struct FinScreenProc * proc)
{
    proc->timer++;

    if (gKeyStatusPtr->newKeys & (A_BUTTON | START_BUTTON))
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080B7500
void Fin_InitBlend(struct FinScreenProc * proc)
{
    SetBlendAlpha(0, 0x10);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    proc->blendTimer = 0;

    SetupFinScreenGfx();

    return;
}

//! FE8U = 0x080B7540
void Fin_Loop_Blend(struct FinScreenProc * proc)
{
    int blendAmt;

    s16 timer = proc->blendTimer;
    proc->blendTimer++;

    blendAmt = timer >> 2;
    SetBlendAlpha(blendAmt, 0x10);

    if (blendAmt == 16)
    {
        Proc_Break(proc);
        proc->blendTimer = 0;
    }

    return;
}

//! FE8U = 0x080B7574
void Fin_End(void)
{
    SetBlendDarken(0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    return;
}
