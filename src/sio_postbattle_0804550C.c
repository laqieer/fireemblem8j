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

//! FE8U = 0x0804556C
void SioPostBattle_DrawRankingText(struct SioPostBattleProc * proc)
{
    int i;

    int unk_40 = proc->unk_40;
    SetTextFont(&Font_Sio_0);

    for (i = 0; i < unk_40; i++)
    {
        char * str = gUnk_Sio_9[i];

        int len = GetStringTextLen(str);
        len = (72 - len) / 2;

        if (i < 3)
        {
            Text_InsertDrawString(Texts_1, 72 * i + len, 0, str);
        }
        else
        {
            Text_InsertDrawString(gUnk_Sio_10, len, 0, str);
        }

        SioDrawNumber(gUnk_Sio_10, i * 32 + 152, 2, proc->unk_44[i].points);
    }

    return;
}
