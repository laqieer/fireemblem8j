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
extern union WeatherEffectData sWeatherEffect;

void WfxSnowStorm_Init(void) {
    int i;

    u8 typeLookup[] = { 0, 0, 0, 0, 0, 0, 1, 1 };

    AllocWeatherParticles(gPlaySt.chapterWeatherId);

    Decompress(gParticlesFx_1, gGenericBuffer);
    Copy2dChr(gGenericBuffer, OBJ_VRAM0 + 0x18 * 0x20, 8, 4);

    for (i = 0; i < 0x40; ++i) {
        unsigned type = typeLookup[i & 7];

        sWeatherEffect.particles[i].xPosition = AdvanceGetLCGRNValue();
        sWeatherEffect.particles[i].yPosition = AdvanceGetLCGRNValue();

        sWeatherEffect.particles[i].ySpeed    = (AdvanceGetLCGRNValue() & 0x3FF) - 0x100;
        sWeatherEffect.particles[i].gfxIndex  = type;

        switch (type) {

        case 0:
            sWeatherEffect.particles[i].xSpeed = 0x700 + (AdvanceGetLCGRNValue() & 0x1FF);
            break;

        case 1:
            sWeatherEffect.particles[i].xSpeed = 0xA00 + (AdvanceGetLCGRNValue() & 0x1FF);
            break;

        } // switch(type)
    }
}
