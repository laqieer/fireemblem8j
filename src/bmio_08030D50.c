#include "global.h"

#include <string.h>

#include "constants/classes.h"

#include "proc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "chapterdata.h"
#include "rng.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "bmtrick.h"
#include "mu.h"
#include "uimenu.h"
#include "bmtrap.h"
#include "gamecontrol.h"
#include "bmarena.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "bmlib.h"
#include "worldmap.h"
#include "bmio.h"
#include "bmmind.h"

// General Battle Map System Stuff, mostly low level hardware stuff but also more

struct WeatherParticle {
    /* 00 */ short xPosition;
    /* 02 */ short yPosition;

    /* 04 */ short xSpeed;
    /* 06 */ short ySpeed;

    /* 08 */ u8  gfxIndex;
    /* 09 */ u8  typeId;
};

union WeatherEffectData {
    /**
     * Array of weather particles
     */
    struct WeatherParticle particles[0x40];

    /**
     * Buffer for cloud graphics
     */
    u32 gfxData[0xC0];
};

union GradientEffectData {
    /**
     * Buffer holding colors for vertical gradient.
     */
    u16 lines[320];

    /**
     * Buffer holding 8 different variations of the tileset palette
     * Variations have increasing amounts of red; used for flames weather effect
     */
    u16 fireGradient[8][0x40];
};

struct BMVSyncProc {
    PROC_HEADER;

    /* 2C */ const struct TileGfxAnim* tileGfxAnimStart;
    /* 30 */ const struct TileGfxAnim* tileGfxAnimCurrent;

    /* 34 */ short tileGfxAnimClock;
    /* 36 */ short tilePalAnimClock;

    /* 38 */ const struct TilePalAnim* tilePalAnimStart;
    /* 3C */ const struct TilePalAnim* tilePalAnimCurrent;
};

 void BMapVSync_UpdateMapImgAnimations(struct BMVSyncProc* proc);
 void BMapVSync_UpdateMapPalAnimations(struct BMVSyncProc* proc);
 void BMapVSync_InitMapAnimations(struct BMVSyncProc* proc);
 void BMapVSync_OnEnd(struct BMVSyncProc* proc);
 void BMapVSync_OnLoop(struct BMVSyncProc* proc);

 void WfxNone_Init(void);
 void WfxSnow_Init(void);
 void WfxSnow_VSync(void);
 void WfxRain_Init(void);
 void WfxRain_VSync(void);
 void WfxSandStorm_Init(void);
 void WfxSandStorm_VSync(void);
 void WfxSnowStorm_Init(void);
 void WfxSnowStorm_VSync(void);
 void WfxBlueHSync(void);
 void WfxBlue_Init(void);
 void WfxBlue_VSync(void);
 void WfxFlamesHSync(void);
 void WfxFlamesInitGradient(void);
 void WfxFlamesInitParticles(void);
 void WfxFlames_Init(void);
 void WfxFlamesUpdateGradient(void);
 void WfxFlamesUpdateParticles(void);
 void WfxFlames_VSync(void);
 void WfxCloudsOffsetGraphicsEffect(u32* lines);
 void WfxClouds_Init(void);
 void WfxClouds_VSync(void);
 void WfxClouds_Update(void);
 void WfxInit(void);
 void WfxVSync(void);
 void WfxUpdate(void);

 void ClearBattleMapState(void);
 void InitMoreBMapGraphics(void);

extern EWRAM_OVERLAY(0) union WeatherEffectData sWeatherEffect;
extern EWRAM_OVERLAY(0) union GradientEffectData sGradientEffect;



extern CONST_DATA struct ProcCmd gProc_MapTask[];













/* prototypes for same-file helpers called by this run */
void ClearBattleMapState(void);
struct BMapMainProc* StartBMapMain(struct GameCtrlProc* gameCtrl);

void StartBattleMap(struct GameCtrlProc* gameCtrl) {
    int i;

    SetupBackgrounds(NULL);

    SetMainUpdateRoutine(OnMain);
    SetInterrupt_LCDVBlank(OnVBlank);

    ClearBattleMapState();
    LoadGameCoreGfxLegacyFrame();
    ApplyUnitSpritePalettes();
    ResetChapterFlags();
    ResetUnitSprites();
    ResetMenuOverrides();
    ClearTraps();

    gPlaySt.faction = FACTION_GREEN; // TODO: PHASE/ALLEGIANCE DEFINITIONS
    gPlaySt.chapterTurnNumber = 0;

    if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) {
        if (!(gPlaySt.chapterStateBits & PLAY_FLAG_PREPSCREEN))
            gPlaySt.chapterVisionRange = 3 * (NextRN_100() & 1);
    } else {
        gPlaySt.chapterVisionRange =
            GetROMChapterStruct(gPlaySt.chapterIndex)->initialFogLevel;
    }

    gPlaySt.chapterWeatherId =
        GetROMChapterStruct(gPlaySt.chapterIndex)->initialWeather;

    InitBmBgLayers();
    InitChapterMap(gPlaySt.chapterIndex);
    InitMapObstacles();

    gPlaySt.time_chapter_started = GetGameClock();
    gPlaySt.chapterTotalSupportGain = 0;

    gPlaySt.unk48 = 0;
    gPlaySt.unk4A_1 = 0;
    gPlaySt.tutorial_counter = 0;
    gPlaySt.tutorial_exec_type = 0;

    for (i = 1; i < 0x40; ++i) {
        struct Unit* unit = GetUnit(i);

        if (unit && unit->pCharacterData) {
            if (unit->state & US_BIT21)
                unit->state = unit->state | US_NOT_DEPLOYED;
            else
                unit->state = unit->state &~ US_NOT_DEPLOYED;
        }
    }

    ClearTemporaryUnits();
    LoadChapterTraps();

    if (gameCtrl)
        StartBMapMain(gameCtrl);

    // TODO: MACRO?
    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    EnablePaletteSync();

    SetBlendTargetA(TRUE, TRUE, TRUE, TRUE, TRUE);
    SetBlendBackdropA(TRUE);

    SetBlendConfig(3, 0, 0, 0x10);
}
