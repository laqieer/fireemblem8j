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
/* TU-private aggregate type defs (file-local) */
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
/* TU-private data externs bound at their JP addresses */
extern u16 sObj_BackgroundClouds[];
extern union WeatherEffectData sWeatherEffect;

void WfxCloudsOffsetGraphicsEffect(u32* lines) {
    u32 lineBuf[8];
    int iy, ix;

    // What this function is doing is "shifting" a 14
    // tile wide 4bpp image one pixel to the right(?)

    // Remember: lowest nibble of any gfx data is the leftmost pixel

    // Saving the rightmost tile column for later
    for (iy = 0; iy < 8; ++iy)
        lineBuf[iy] = lines[iy + 0x68];

    // Shift all tiles right one pixel
    for (ix = (14 - 1); ix >= 0; --ix) {
        for (iy = 0; iy < 8; ++iy) {
            lines[(8*(ix - 1)) + iy + 8] =
                (lines[(8*(ix - 1)) + iy + 8] << 4) | (lines[(8*(ix - 1)) + iy] >> 28);
        }
    }

    // the leftmost pixel column now contains garbage
    // but that's only, we're fixing it now
    // this is why we needed the rightmost column to be saved
    for (iy = 0; iy < 8; ++iy) {
        lines[iy] &= ~0xF;
        lines[iy] = (lines[iy]) | (lineBuf[iy] >> 28);
    }
}

void WfxClouds_Init(void) {
    AllocWeatherParticles(WEATHER_FINE);

    Decompress(
        gParticlesFx_4,
        sWeatherEffect.gfxData
    );

    ApplyPalette(gParticlesFx_5, 0x10 + BM_OBJPAL_10);
}

void WfxClouds_VSync(void) {
    u32* gfx = sWeatherEffect.gfxData;

    switch (GetGameClock() % 8) {

    case 0:
        WfxCloudsOffsetGraphicsEffect(gfx + 0 * (14 * 8));
        break;

    case 2:
        WfxCloudsOffsetGraphicsEffect(gfx + 1 * (14 * 8));
        break;

    case 4:
        WfxCloudsOffsetGraphicsEffect(gfx + 2 * (14 * 8));
        break;

    case 6:
        WfxCloudsOffsetGraphicsEffect(gfx + 3 * (14 * 8));
        break;

    case 7:
        Copy2dChr(gfx, OBJ_VRAM0 + (0x20 * 18), 14, 4);
        break;

    } // switch (GetGameClock() % 8)
}

void WfxClouds_Update(void) {
    int y = gBmSt.camera.y;

    PutSprite(
        14,
        0, -(y / 5),
        sObj_BackgroundClouds,
        0xAC12
    );
}
