#include "global.h"
#include "bmlib.h"
#include "hardware.h"
#include "bmmap.h"
#include "ekrbattle.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "mu.h"
void StartScriptBattleAnim(int useMapAnims) {
    int um = (s8)useMapAnims;
    int banimEnabled;
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
    gPaletteBuffer[0] = 0;
    EnablePaletteSync();
    RenderBmMap();
    banimEnabled = (s8)EkrBattleStarting_CheckBattleAnimEnabled();
    if (um)
        banimEnabled = 0;
    if (banimEnabled) {
        SetBanimLinkArenaFlag(0);
        BeginAnimsOnBattleAnimations();
    } else {
        EndAllMus();
        RenderBmMap();
        BeginBattleMapAnims();
        gBattleStats.config |= BATTLE_CONFIG_MAPANIMS;
    }
}
