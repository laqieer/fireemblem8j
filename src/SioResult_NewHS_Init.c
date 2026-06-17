#include "global.h"
#include "hardware.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "bmsave.h"
#include "constants/msg.h"
#include "sio.h"




void SioResult_NewHS_Init(struct SioResultProc * proc)
{
    int i;

    ClearSioBG();
    InitSioBG();

    StartMuralBackgroundExt(proc, 0, 0, 0, 0);

    Decompress(Img_LinkArenaRankIcons, GetBackgroundTileDataOffset(BG_1) + BG_CHR_ADDR(0x78));
    ApplyPalette(Pal_LinkArenaRankIcons, 6);

    Decompress(Img_TacticianSelObj, OBJ_CHR_ADDR(0x240));
    Decompress(gUnkData_7, OBJ_CHR_ADDR(0x300));
    ApplyPalette(Pal_LinkArenaActiveBannerFx, 0x13);

    CallARM_FillTileRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 1, 4), Tsa_SioResultRankings, TILEREF(0x0, 1));

    SetTextFont(&Font_0);
    InitSystemTextFont();
    ResetTextFont();

    proc->unk_34 = 5;
    proc->unk_36 = 280;
    proc->unk_39 = 0;
    proc->unk_38 = 0;
    proc->unk_35 = SioResult_GetNewHSScrollTarget(proc->unk_3c);
    proc->unk_40 = 0;

    BG_SetPosition(BG_1, 0, proc->unk_36);

    for (i = 0; i < 10; i++)
    {
        InitText(&Texts_1[i], 24);
    }

    InitText(&gSioTexts[0], 24);
    InitText(&gSioTexts[1], 24);

    ClearText(&gSioTexts[0]);

    Text_InsertDrawString(&gSioTexts[0], 16, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x5a)); // "Name"
    Text_InsertDrawString(&gSioTexts[0], 94, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x5b)); // "Points"
    Text_InsertDrawString(&gSioTexts[0], 132, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x5d)); // "Rank"
    Text_InsertDrawString(&gSioTexts[0], 156, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x5f)); // "Players"

    PutText(&gSioTexts[0], TILEMAP_LOCATED(gBG0TilemapBuffer, 5, 5));

    ReadMultiArenaSaveRankings(gSioResultRankings);
    DrawLinkArenaRankings();

    SetWinEnable(1, 1, 0);

    SetWin0Box(0, 58, DISPLAY_WIDTH, 136);
    SetWin0Layers(1, 1, 1, 1, 1);

    SetWin1Box(0, 24, DISPLAY_WIDTH, 56);
    SetWin1Layers(1, 0, 1, 1, 0);

    SetWOutLayers(1, 0, 1, 1, 1);

    SetLinkArenaUiBlend();

    proc->unk_2c = StartLinkArenaResultBanner(14, proc->unk_3c * 16 - 24, proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}
