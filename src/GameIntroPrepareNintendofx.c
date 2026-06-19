#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "opanim.h"




void GameIntroPrepareNintendofx(struct ProcOpAnimHS * proc)
{
    Sound_FadeOutBGM(1);
    SetupBackgrounds(NULL);
    SetPrimaryHBlankHandler(NULL);
    SetDispEnable(0, 0, 0, 0, 0);

    Decompress(Img_GameIntroNintendo, (void *)VRAM);
    Decompress(Tsa_GameIntroNintendo, gGenericBuffer);
    CallARM_FillTileRect(gBG0TilemapBuffer, gGenericBuffer, 0);

    Decompress(Img_IntelligentSystems, (void *)VRAM + 0x2000);
    Decompress(Tsa_IntelligentSystems, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1100);

    CpuFastFill16(0, gPaletteBuffer, 0x400);
    EnablePaletteSync();
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    SetDispEnable(1, 0, 0, 0, 0);

    (*(int *)((char *)proc + 0x2c)) = 0;
}
