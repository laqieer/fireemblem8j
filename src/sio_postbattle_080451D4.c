#include "global.h"
#include "face.h"
#include "bmlib.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "bmio.h"
#include "prepscreen.h"
#include "sio_core.h"
#include "sio.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern u16 const * SpriteArray_SioPostbattle_0[];
extern u16 const * SpriteArray_SioPostbattle_1[];

//! FE8U = 0x08045234
void SioPostBattleSprites_Loop_DrawSlideIn(struct SioPostBattleSpritesProc * proc)
{
    struct SioPostBattleProc * unk2C = proc->unk_2c;

    if (unk2C->unk_64 == 0)
    {
        if (proc->timer > 32)
        {
            Proc_Break(proc);
        }
    }

    if (unk2C->unk_64 != 0)
    {
        proc->y++;
    }

    proc->delayMaybe--;

    if (proc->delayMaybe < 0)
    {
        proc->delayMaybe = 0;
    }

    if (proc->delayMaybe == 0)
    {
        if (proc->timer <= 32)
        {
            proc->x = Interpolate(INTERPOLATE_RSQUARE, -80, 0, proc->timer, 32);
        }

        proc->timer++;

        PutSprite(4, proc->x, proc->y - 16, SpriteArray_SioPostbattle_1[proc->ranking], 0);
        PutSprite(4, proc->x + 72, proc->y - 6, SpriteArray_SioPostbattle_0[proc->oam2], 0);
        PutSprite(4, proc->x + 96, proc->y + 8, Sprite_SioMain2_8, 0);
        PutSprite(4, proc->x + 64, proc->y + 8, Sprite_SioMain2_10, proc->ranking * 4 + 0x50);
        PutSprite(4, -proc->x + 112, proc->y - 8, Sprite_LinkArena_NameBanner, OAM2_PAL(proc->oam2) + 0x400);
        PutSprite(4, -proc->x + 124, proc->y, Sprite_SioMain2_9, proc->oam2 == 3 ? 0x40 : proc->oam2 * 9);
        PutSprite(
            5, -proc->x + 208, proc->y - 8, Sprite_SioMain2_11, OAM2_PAL(proc->oam2 + 10) + 0x180 + (proc->oam2 << 3));
    }

    return;
}
