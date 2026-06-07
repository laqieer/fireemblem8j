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















struct ProcCmd CONST_DATA ProcScr_ChapterIntro_LightBurst[] =
{
    PROC_CALL(ChapterIntro_LightBurst_Init),
    PROC_REPEAT(ChapterIntro_LightBurst_Loop),

    PROC_END,
};







//! FE8U = 0x08020808
void ChapterIntro_LightBurst_Loop(struct ChapterIntroFxProc * proc)
{
    if (proc->unk_66 == 0)
    {
        SetBlendAlpha(16, proc->unk_4E);
        proc->unk_4E++;
    }
    else
    {
        SetBlendAlpha(proc->unk_4E >> 1, 16);
        proc->unk_4E--;
    }

    if (proc->timer < 256)
    {
        BgAffinRotScaling(BG_2, 0, 0, 0, 384, 384);
        BgAffinScaling(BG_2, (u16)proc->timer + DISPLAY_WIDTH, (u16)proc->timer + DISPLAY_WIDTH);
        BgAffinAnchoring(BG_2, 112, 88, 76, 76);
        FlushLCDControl();

        if (proc->unk_66 != 0)
        {
            proc->timer += 4;
        }
    }

    if (proc->unk_66 == 0)
    {
        if (proc->unk_4E < 16)
        {
            return;
        }

        proc->unk_4E = 32;
        SetBlendAlpha(16, 16);
        proc->unk_66++;

        return;
    }

    if (proc->unk_4E > 0)
    {
        return;
    }

    SetBlendAlpha(0, 16);

    Proc_EndEach(ProcScr_ChapterIntro_LightBurst);
    Proc_Break(proc);

    return;
}

//! FE8U = 0x080208F8
void ChapterIntro_InitBLDCNT(void)
{
    SetDispEnable(0, 1, 1, 0, 1);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);

    return;
}

//! FE8U = 0x08020944
void ChapterIntro_InitFogGfx(struct ChapterIntroFxProc * proc)
{
    SetDispEnable(1, 1, 1, 0, 1);

    proc->timer = 0;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);

    Decompress(Img_ChapterIntro_Fog, BG_CHR_ADDR(0x400));
    ApplyPalette(Pal_ChapterIntro_Fog, 4);

    Decompress(Tsa_ChapterIntro_Fog, gGenericBuffer);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, TILEREF(0x0, 4));

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}
