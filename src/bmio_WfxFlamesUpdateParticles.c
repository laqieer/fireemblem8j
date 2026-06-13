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

/* TU-private data externs bound at their JP addresses */
extern EWRAM_OVERLAY(0) union WeatherEffectData sWeatherEffect;
extern EWRAM_OVERLAY(0) union GradientEffectData sGradientEffect;

void WfxFlamesUpdateParticles(void) {
    struct WeatherParticle* it = sWeatherEffect.particles;

    if (GetPrimaryOAMSize()) {
        int i;

        for (i = 0; i < 0x10; ++i, ++it) {
            int yDisplay;
            int objTile;

            it->xPosition += it->xSpeed;
            it->yPosition += it->ySpeed;

            yDisplay = ((it->yPosition >> 8) - gBmSt.camera.y) & 0xFF;

            if (yDisplay < 0x40)
                continue;

            if (yDisplay > 0xA0)
                continue;

            objTile = 31 - ((yDisplay - 0x40) / 8);

            if (objTile < 24)
                objTile = 24;

            CallARM_PushToPrimaryOAM(
                ((it->xPosition >> 8) - gBmSt.camera.x) & 0xFF,
                yDisplay,
                gObject_8x8,
                (BM_OBJPAL_10 << 12) + objTile
            );
        }
    }
}
