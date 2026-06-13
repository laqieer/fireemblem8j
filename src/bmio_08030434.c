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













void WfxSandStorm_VSync(void) {
    if (GetPrimaryOAMSize()) {
        int i;

        struct WeatherParticle* it = sWeatherEffect.particles + ((GetGameClock() % 2) * 0x20);

        for (i = 0; i < 0x20; ++i) {
            it->xPosition += it->xSpeed;

            CallARM_PushToPrimaryOAM(
                ((it->xPosition & 0xFF) - 0x10) & 0x1FF,
                it->yPosition,
                gObject_32x32,
                (BM_OBJPAL_1 << 12) + 0x1C
            );

            ++it;
        }
    }
}
