#include "global.h"
#include "gbafe.h"

void EfxInitTerrainBg(void);
void EfxPrepareScreenFx(void);

void EfxClearScreenFx(void)
{
    gLCDControlBuffer.dispcnt.mode = 0;
    SetDispEnable(1, 1, 1, 1, 1);
    gLCDControlBuffer.dispcnt.obj1dMap = 0;

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);

    SetBackgroundTileDataOffset(BG_0, 0);
    SetBackgroundTileDataOffset(BG_1, 0);
    SetBackgroundTileDataOffset(BG_2, 0);
    SetBackgroundTileDataOffset(BG_3, 0x8000);

    SetBackgroundMapDataOffset(BG_0, 0x6000);
    SetBackgroundMapDataOffset(BG_1, 0x6800);
    SetBackgroundMapDataOffset(BG_2, 0x7000);
    SetBackgroundMapDataOffset(BG_3, 0x7800);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    CpuFastFill16(0, gBG0TilemapBuffer, 0x800);
    CpuFastFill16(0, gBG1TilemapBuffer, 0x800);
    CpuFastFill16(0, gBG2TilemapBuffer, 0x800);

    if (GetBattleAnimArenaFlag() == false)
        EfxInitTerrainBg();
    else
        CpuFastFill16(0, gBG2TilemapBuffer, 0x800);

    EfxPrepareScreenFx();
    EnablePaletteSync();

    BG_EnableSyncByMask(BG0_SYNC_BIT);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
    SetDefaultColorEffects();
}
