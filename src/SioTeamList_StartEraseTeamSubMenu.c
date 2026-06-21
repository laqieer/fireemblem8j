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

//! FE8U = 0x080443B0
void SioTeamList_StartEraseTeamSubMenu(struct SioTeamListProc * proc)
{
    int var;

    proc->unk_55 = 1;

    LoadLinkArenaChoiceBoxGfx();

    var = proc->unk_40 - proc->unk_48;

    if (var > 2)
    {
        proc->unk_58 = var * 2 - 2;
    }
    else
    {
        proc->unk_58 = var * 2 + 5;
    }

    ClearText(&Texts_0);
    Text_DrawString(&Texts_0, GetStringFromIndex(0x7C1)); // "Erase"
    Text_SetCursor(&Texts_0, 38);
    Text_DrawString(&Texts_0, GetStringFromIndex(0x7C3)); // "Back"
    PutText(&Texts_0, TILEMAP_LOCATED(gBG0TilemapBuffer, 15, (proc->unk_58 + 4)));

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}
