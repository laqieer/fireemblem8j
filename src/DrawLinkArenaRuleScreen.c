#include "global.h"
#include "bmsave.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "scene.h"
#include "hardware.h"
#include "bmlib.h"
#include "face.h"
#include "rng.h"
#include "sioerror.h"
#include "sio.h"
#include "sio_core.h"
#include "constants/faces.h"
#include "constants/msg.h"
#include "constants/songs.h"




void DrawLinkArenaRuleScreen(ProcPtr proc)
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
    StartRuleSettingSpriteDrawStatic();
    LoadLinkArenaRuleSettings(buf);

    BG_SetPosition(BG_1, 0xfe, 0);

    for (i = 0; i < 3; i++)
    {
        int y = 6 + i * 3;

        ClearText(&gLinkArenaSt.texts[i]);
        Text_SetColor(&gLinkArenaSt.texts[i], TEXT_COLOR_SYSTEM_WHITE);
        Text_DrawString(&gLinkArenaSt.texts[i], GetStringFromIndex(gLinkArenaRuleData[i].labelTextId));
        PutText(&gLinkArenaSt.texts[i], TILEMAP_LOCATED(gBG0TilemapBuffer, 6, y));

        SioRuleSettings_DrawRuleOptions(i, buf[i]);
    }

    DrawLinkArenaModeIcon(TILEMAP_LOCATED(gBG1TilemapBuffer, 30 + gLinkArenaRuleData[1].xPos[0], 8), 0);
    DrawLinkArenaModeIcon(TILEMAP_LOCATED(gBG1TilemapBuffer, 30 + gLinkArenaRuleData[1].xPos[1], 8), 1);

    StartLinkArenaTitleBanner(proc, gSioMain2_0[gLinkArenaSt.unk_00], 0);

    SetLinkArenaUiBlendAndWindowOff();
    PutSioText(0x6D6, 1); // "The rules for this battle."

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}
