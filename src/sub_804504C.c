#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "ctc.h"
#include "sio.h"

void NameSelect_DrawName(struct ProcTactician * proc)
{
    proc->unk3B = 1;

    LoadLinkArenaChoiceBoxGfx();

    ClearText(&Texts_0);

    Text_DrawString(&Texts_0, GetStringFromIndex(0x7C2));
    Text_SetCursor(&Texts_0, 38);

    Text_DrawString(&Texts_0, GetStringFromIndex(0x7C3));
    PutText(&Texts_0, TILEMAP_LOCATED(gBG0TilemapBuffer, 11, 12));

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}
