#include "global.h"
#include "hardware.h"
#include "bmsave.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "constants/msg.h"
#include "sio_core.h"
#include "sio.h"




void SioRuleSettings_Init(struct ProcSioRuleSettings * proc)
{
    int i;
    u8 buf[4];

    ClearSioBG();
    InitSioBG();
    StartMuralBackgroundExt(proc, 0, 0x12, 2, 0);

    Decompress(Img_LinkArenaRankIcons, GetBackgroundTileDataOffset(BG_1) + BG_CHR_ADDR(0x78));
    ApplyPalette(Pal_LinkArenaRankIcons, 6);

    Decompress(Img_TacticianSelObj, OBJ_CHR_ADDR(0x240));
    ApplyPalettes(Pal_TacticianSelObj, 0x13, 4);

    Nop_SioUiutils_2(0);

    Decompress(gUnkData_15, gGenericBuffer);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 1, 5), gGenericBuffer, TILEREF(0x0, 1));

    SetTextFont(&Font_0);
    ResetTextFont();

    InitSioTexts();

    proc->unk_30 = 0;
    proc->unk_2c = StartRuleSettingSpriteDrawInteractive(proc);

    BG_SetPosition(BG_1, 254, 0);

    LoadLinkArenaRuleSettings(buf);

    UpdateRuleSettingSprites(
        proc->unk_2c, proc->unk_30, gLinkArenaRuleData[proc->unk_30].xPos[buf[proc->unk_30]] * 8,
        ((proc->unk_30 * 3) * 8) + 48);

    for (i = 0; i < 3; i++)
    {
        ClearText(&gLinkArenaSt.texts[i]);
        Text_SetColor(&gLinkArenaSt.texts[i], TEXT_COLOR_SYSTEM_WHITE);
        Text_DrawString(&gLinkArenaSt.texts[i], GetStringFromIndex(gLinkArenaRuleData[i].labelTextId));
        PutText(&gLinkArenaSt.texts[i], TILEMAP_LOCATED(gBG0TilemapBuffer, 6, 6 + i * 3));

        SioRuleSettings_DrawRuleOptions(i, buf[i]);
    }

    DrawLinkArenaModeIcon(gBG1TilemapBuffer + 0x11E + gLinkArenaRuleData[1].xPos[0], 0);
    DrawLinkArenaModeIcon(gBG1TilemapBuffer + 0x11E + gLinkArenaRuleData[1].xPos[1], 1);

    StartLinkArenaTitleBanner(proc->unk_2c, 6, 0);

    SetLinkArenaUiBlendAndWindowOff();

    PutSioText(0x6D0 + proc->unk_30, 1); // "Set whether to hide enemy units."

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}
