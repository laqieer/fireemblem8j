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

/**
 * Battle result screen for the Link Arena.
 * Not to be confused with "sio_result.c", which refers to the
 * "Battle Data" UI.
 */

// clang-format off

extern u16 const * CONST_DATA SpriteArray_SioPostbattle_0[];

extern u16 const * CONST_DATA SpriteArray_SioPostbattle_1[];

extern s16 const gSioPostbattle_0[5][4];

extern u8 const gSioPostbattle_1[3];

//! FE8U = 0x080454E4
void SioPostBattle_DrawRankingRowBar(struct SioPostBattleProc * proc)
{
    int i;

    int unk_40 = proc->unk_40;
    u16 * tm = gBG2TilemapBuffer;

    if (proc->playerId == proc->unk_44[(proc->unk_41 - 1)].playerId)
    {
        CallARM_FillTileRect(
            tm + TILEMAP_INDEX(0, gSioPostbattle_0[unk_40][(proc->unk_41 - 1)]), gUnkData_13, 0x2078);
    }
    else
    {
        for (i = 0; i < 0x60; i++)
        {
            tm[TILEMAP_INDEX(i, gSioPostbattle_0[unk_40][(proc->unk_41 - 1)])] = 0x1034;
        }
    }

    return;
}
