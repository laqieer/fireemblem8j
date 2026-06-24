#include "global.h"

#include "bmunit.h"
#include "bmsave.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "unitlistscreen.h"
#include "uiutils.h"
#include "prepscreen.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x0804429C
void SioTeamList_1(struct SioTeamListProc * proc)
{
    struct SioProc85AAA78 * unk_2C = proc->unk_2c;

    s8 xPos = gSioMain2_1[proc->unk_44];

    if (xPos == -1)
    {
        Proc_Goto(proc, 3);
    }

    proc->unk_44++;

    if (xPos == -2)
    {
        gLCDControlBuffer.bg1cnt.priority = 0;
        gLCDControlBuffer.bg2cnt.priority = 1;
        gLCDControlBuffer.bg0cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;

        unk_2C->unk_44 = 0;
    }
    else
    {
        BG_SetPosition(BG_0, xPos, 0);
        SioTeamList_SetTeamSpriteXOffsets(unk_2C, xPos);
    }

    return;
}
