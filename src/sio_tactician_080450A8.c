#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "proc.h"
#include "sio.h"
#include "bmunit.h"
#include "sio_core.h"
#include "bmlib.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "constants/characters.h"

extern struct ProcCmd CONST_DATA ProcScr_TacticianNameSelection[];

extern const struct TacticianTextConf gTacticianTextConf[];

extern const s16 SioTacticianIndexMap[];

extern const int gLinkArenaStatusMsg[];

//! FE8U = 0x08045108
void NameSelect_ConfirmLoop(struct ProcTactician * proc)
{
    PutLinkArenaChoiceBannerSprite(0x40, 0x58);

    if (((gKeyStatusPtr->newKeys & DPAD_LEFT) != 0) && (proc->unk3B == 1))
    {
        proc->unk3B = 0;
        SioPlaySoundEffect(3);
    }

    if (((gKeyStatusPtr->newKeys & DPAD_RIGHT) != 0) && (proc->unk3B == 0))
    {
        proc->unk3B = 1;
        SioPlaySoundEffect(3);
    }

    DisplayUiHand(proc->unk3B * 40 + 80, 96);

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);

        TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 11, 12), 12, 2, 0);
        BG_EnableSyncByMask(BG0_SYNC_BIT);

        Proc_Break(proc);

        return;
    }

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        if (proc->unk3B == 0)
        {
            SioPlaySoundEffect(2);
            gUnk_Sio_12 = 1;
            Proc_Goto(proc, 2);
        }
        else
        {
            SioPlaySoundEffect(1);
        }

        TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 11, 12), 12, 2, 0);
        BG_EnableSyncByMask(BG0_SYNC_BIT);

        Proc_Break(proc);
    }

    return;
}
