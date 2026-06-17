#include "global.h"
#include "hardware.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "bmsave.h"
#include "constants/msg.h"
#include "sio.h"




void SioResult_Init(struct SioResultProc * proc)
{
    int i;

    ClearSioBG();
    InitSioBG();

    StartMuralBackgroundExt(proc, 0, 0x12, 2, 0);

    Decompress(Img_LinkArenaRankIcons, GetBackgroundTileDataOffset(BG_1) + BG_CHR_ADDR(0x78));
    ApplyPalette(Pal_LinkArenaRankIcons, 6);

    Decompress(Img_TacticianSelObj, OBJ_CHR_ADDR(0x240));
    ApplyPalettes(Pal_TacticianSelObj, 0x13, 4);

    CallARM_FillTileRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 1, 4), Tsa_SioResultRankings, TILEREF(0x0, 1));

    SetTextFont(&Font_0);
    InitSystemTextFont();
    ResetTextFont();

    proc->unk_36 = 200;
    proc->unk_39 = 0;
    proc->unk_38 = 0;
    proc->unk_34 = 0;

    BG_SetPosition(BG_1, 0, proc->unk_36);

    for (i = 0; i < 10; i++)
    {
        InitText(&Texts_1[i], 22);
    }

    InitText(&gSioTexts[0], 24);
    InitText(&gSioTexts[1], 24);

    ClearText(&gSioTexts[0]);

    Text_InsertDrawString(&gSioTexts[0], 16, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x5a)); // "Name"
    Text_InsertDrawString(&gSioTexts[0], 92, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x5b)); // "Points"
    Text_InsertDrawString(&gSioTexts[0], 129, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x5d)); // "Rank"
    Text_InsertDrawString(&gSioTexts[0], 156, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x5f)); // "Players"

    PutText(&gSioTexts[0], TILEMAP_LOCATED(gBG0TilemapBuffer, 5, 5));

    PutSioText(0x6cf, 1); // "+Control Pad: move/B Button: back."

    ReadMultiArenaSaveRankings(gSioResultRankings);
    DrawLinkArenaRankings();

    SetWinEnable(1, 0, 0);

    SetWin0Box(0, 58, DISPLAY_WIDTH, 136);
    SetWin0Layers(1, 1, 1, 1, 1);

    SetWOutLayers(1, 0, 1, 1, 1);

    StartLinkArenaMenuScrollBar(217, 57, 10, 5, proc->unk_36 + 56, proc);
    StartLinkArenaTitleBanner(proc, 5, 0);
    SetLinkArenaUiBlend();
    StartLinkArenaButtonSpriteDraw(192, 16, proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}
