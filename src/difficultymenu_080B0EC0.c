#include "global.h"

#include "bmsave.h"
#include "hardware.h"
#include "worldmap.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "spline.h"
#include "sysutil.h"
#include "savemenu.h"
#include "constants/songs.h"

extern struct Unknown_08A209FC gDifficultymenu_0[];

extern EWRAM_OVERLAY(0) u8 gPlayStChapterBits[4];
extern EWRAM_OVERLAY(0) u8 gPlayStChapterMode[4];
extern EWRAM_OVERLAY(0) struct PlaySt_OptionBits gPlayStOptionBits[4];

// clang-format on

//! FE8U = 0x080AC418
void DrawDifficultyMenuCursorMaybe(struct DifficultyMenuSpritesProc * proc)
{
    if (proc->flags_0)
    {
        proc->unk_38 = proc->unk_34 - proc->unk_30;
        proc->unk_3a = proc->unk_36 - proc->unk_32;
        proc->unk_2c = proc->unk_30;
        proc->unk_2e = proc->unk_32;
        proc->unk_3c = 0;
        proc->flags_0 = 0;
        proc->flags_1 = 1;
    }

    if (proc->flags_1)
    {
        proc->unk_3c++;

        if (proc->unk_3c < 4)
        {
            int unk = _DivArm2(proc->unk_3c, 4, 0);

            proc->unk_2c = proc->unk_30 + DivArm(0x1000, proc->unk_38 * unk);
            proc->unk_2e = proc->unk_32 + DivArm(0x1000, proc->unk_3a * unk);
        }
        else
        {
            proc->unk_2c = proc->unk_34;
            proc->unk_2e = proc->unk_36;
            proc->flags_1 = 0;
        }
    }

    PutSpriteExt(
        4, proc->unk_2c, OAM0_Y(proc->unk_2e + gDifficultymenu_1[(proc->unk_2a >> 3) & 7]), gSprite_Difficultymenu_0, OAM2_PAL(3));

    return;
}
