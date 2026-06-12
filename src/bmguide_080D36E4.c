#include "global.h"

#include "eventinfo.h"
#include "bmshop.h"
#include "fontgrp.h"
#include "ctc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmlib.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bm.h"

#include "bmguide.h"
#include "constants/songs.h"

extern struct GuideSt * CONST_DATA gGuideSt;

// clang-format off









extern u16 CONST_DATA gTextIds_GuideCategoriesTopic[];

// clang-format on

extern u8 Tsa_UnkData_5[]; // tsa
extern u8 Img_UnkData_2[]; // gfx
extern u8 Img_UnkData_3[]; // gfx
extern u16 Pal_UnkData_3[]; // pal

// TODO: Implicit declarations
void UpdateMenuScrollBarConfig(int, int, int, int);
ProcPtr StartMenuScrollBarExt(ProcPtr, int, int, int, int);
void UnlockMenuScrollBar(void);
void LockMenuScrollBar(void);
void EndMenuScrollBar(void);

//! FE8U = 0x080CE9E8
void GuideDetailsRedraw_Loop(struct GuideProc * proc)
{
    int iy;
    int ix;
    int baseA;
    int baseB;

    if (proc->unk_38 == 0)
    {
        baseA = 0x1c0;
        baseB = 0x260;
        for (iy = 0; iy < 7; iy++)
        {
            for (ix = 0; ix < 19; ix++)
            {
                gBG1TilemapBuffer[baseA + 0x2a + ix] = gBG1TilemapBuffer[baseA + 0x0a + ix];
            }
            baseA -= 0x20;
        }

        if (proc->unk_34 != 0)
        {
            baseB -= 0x20;
        }

        for (ix = 0; ix < 19; ix++)
        {
            gBG1TilemapBuffer[baseA + 0x2a + ix] = gBG1TilemapBuffer[baseB + 0x0a + ix];
        }
    }
    else
    {
        baseA = 0x100;
        baseB = 0x220;
        for (iy = 0; iy < 7; iy++)
        {
            for (ix = 0; ix < 19; ix++)
            {
                gBG1TilemapBuffer[baseA + 0x0a + ix] = gBG1TilemapBuffer[baseA + 0x2a + ix];
            }
            baseA += 0x20;
        }

        if (proc->unk_34 != 0)
        {
            baseB += 0x20;
        }

        for (ix = 0; ix < 0x13; ix++)
        {
            gBG1TilemapBuffer[baseA + 0x0a + ix] = gBG1TilemapBuffer[baseB + 0x2a + ix];
        }
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    if (proc->unk_34 == 0)
    {
        proc->unk_34 = 1;
        return;
    }

    Proc_Break(proc);

    return;
}
