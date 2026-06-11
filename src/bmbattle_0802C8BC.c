#include "global.h"
#include "rng.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmmind.h"
#include "bmreliance.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "proc.h"
#include "mu.h"
#include "bmarch.h"
#include "bmarena.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "worldmap.h"
#include "constants/songs.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/terrains.h"
#include "constants/chapters.h"




void UpdateObstacleFromBattle(struct BattleUnit* bu) {
    struct Trap* trap = GetTrapAt(bu->unit.xPos, bu->unit.yPos);

    trap->extra = bu->unit.curHP;

    if (trap->extra == 0) {
        int mapChangeId = GetMapChangeIdAt(bu->unit.xPos, bu->unit.yPos);

        if (gBmMapTerrain[bu->unit.yPos][bu->unit.xPos] == TERRAIN_SNAG)
            PlaySoundEffect(SONG_2D7);

        RenderBmMapOnBg2();

        ApplyMapChangesById(mapChangeId);

        // This is kind of jank: it sets trap type to 0 (TRAP_NONE) which should be the terminating id
        // But then immediately calls the map change trap adding routine, which would effectively replace
        // the 0-id trap with the new map change trap, even if it is not actually the end of the trap array

        trap->type = TRAP_NONE;
        EnableMapChange(mapChangeId);

        RefreshTerrainBmMap();
        UpdateRoofedUnits();
        RenderBmMap();

        NewBMXFADE(FALSE);
    }
}

void BeginBattleAnimations(void) {
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(1 << 2);

    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    EnablePaletteSync();

    RenderBmMap();

    if (EkrBattleStarting_CheckBattleAnimEnabled()) {
        SetBanimLinkArenaFlag(0);
        BeginAnimsOnBattleAnimations();
    } else {
        EndAllMus();
        RenderBmMap();
        BeginBattleMapAnims();

        gBattleStats.config |= BATTLE_CONFIG_MAPANIMS;
    }
}
