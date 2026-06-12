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
static void WfxRain_VSync(void);
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

static CONST_DATA struct ProcCmd sProc_BMVSync[] = { // gProc_VBlankHandler
    PROC_MARK(PROC_MARK_DISP),
    PROC_SET_END_CB(BMapVSync_OnEnd),

    PROC_SLEEP(0),

PROC_LABEL(0),
    PROC_CALL(BMapVSync_UpdateMapImgAnimations),
    PROC_CALL(BMapVSync_UpdateMapPalAnimations),

    PROC_CALL(SyncUnitSpriteSheet),
    PROC_CALL(WfxVSync),

    PROC_REPEAT(BMapVSync_OnLoop),

    PROC_END
};

extern CONST_DATA struct ProcCmd gProc_MapTask[];

// TODO: better repr?
static CONST_DATA u16 sObj_RainParticle1[] = {
    1, 0x0000, 0x0000, 0x102A
};

// TODO: better repr?
static CONST_DATA u16 sObj_RainParticle2[] = {
    1, 0x8000, 0x0000, 0x100A
};

static CONST_DATA u16* sRainParticleObjLookup[3] = { // Weather particle Obj Data Lookup
    sObj_RainParticle1, sObj_RainParticle2, sObj_RainParticle2
};

// TODO: better repr?
static CONST_DATA u16 sObj_BackgroundClouds[] = { // Obj Data
    18,

    0x4000, 0xC000, 0,
    0x4000, 0xC030, 6,
    0x4000, 0xC070, 0,
    0x4000, 0xC0A0, 6,
    0x8000, 0x80E0, 0,
    0x0020, 0x8000, 10,
    0x4020, 0xC020, 0,
    0x4020, 0xC050, 6,
    0x4020, 0xC090, 0,
    0x4020, 0xC0C0, 6,
    0x4040, 0xC000, 0,
    0x4040, 0xC0B0, 0,
    0x4060, 0xC000, 4,
    0x4060, 0xC0B0, 4,
    0x4080, 0xC000, 0,
    0x4080, 0xC0B0, 0,
    0x40A0, 0xC000, 0,
    0x40A0, 0xC0B0, 0,
};

static CONST_DATA struct ProcCmd sProc_DelayedBMapDispResume[] = { // gProc_GameGfxUnblocker
    PROC_SLEEP(0),

    PROC_CALL(BMapDispResume),
    PROC_END
};



void WfxRain_VSync(void) {
    if (GetPrimaryOAMSize()) {
        int i;

        struct WeatherParticle* it = sWeatherEffect.particles + ((GetGameClock() % 2) * 0x20);

        for (i = 0; i < 0x20; ++i) {
            it->xPosition += it->xSpeed;
            it->yPosition += it->ySpeed;

            CallARM_PushToPrimaryOAM(
                ((it->xPosition >> 8) - gBmSt.camera.x) & 0xFF,
                ((it->yPosition >> 8) - gBmSt.camera.y) & 0xFF,
                sRainParticleObjLookup[it->gfxIndex],
                0
            );

            ++it;
        }
    }
}
