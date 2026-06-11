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
extern union GradientEffectData sGradientEffect;
extern const u16 sInitialParticleConfigTemplates[];
extern union WeatherEffectData sWeatherEffect;

void WfxBlue_VSync(void) {}

void WfxFlamesHSync(void) {
    const u16* src;
    u16* dst;

    u16 nextLine = (REG_VCOUNT + 1);

    if (nextLine < 96)
        return;

    if (nextLine >= 160)
        return;

    nextLine -= 96;

    src  = sGradientEffect.fireGradient[0];
    src += nextLine * 8;

    dst = ((u16*)(PLTT)) + 0x70 + (nextLine % 8) * 8;

    CpuFastCopy(src, dst, 8);
}

void WfxFlamesInitGradientPublic(void) {
    int k, j, i;

    for (i = 0; i < 4; ++i) {
        for (j = 0; j < 0x10; ++j) {
            const int color = gPaletteBuffer[PAL_COLOR_OFFSET(i + BM_BGPAL_TILESET_BASE, j)];

            int r = RED_VALUE(color);
            int g = GREEN_VALUE(color);
            int b = BLUE_VALUE(color);

            for (k = 0; k < 8; ++k) {
                r = r + 2;

                if (r > 31)
                    r = 31;

                sGradientEffect.fireGradient[k][0x10 * i + j] = 
                    (b << 10) + (g << 5) + r;
            }
        }
    }
}

void WfxFlamesInitGradient(void) {
    int i, j, k;

    UnpackChapterMapPalette();

    for (i = 0; i < 4; ++i) {
        for (j = 0; j < 0x10; ++j) {
            const int color = gPaletteBuffer[PAL_COLOR_OFFSET(i + BM_BGPAL_TILESET_BASE, j)];

            int r = RED_VALUE(color);
            int g = GREEN_VALUE(color);
            int b = BLUE_VALUE(color);

            for (k = 0; k < 8; ++k) {
                r = r + 2;

                if (r > 31)
                    r = 31;

                sGradientEffect.fireGradient[k][0x10 * i + j] = 
                    (b << 10) + (g << 5) + r;
            }
        }
    }

    SetSecondaryHBlankHandler(WfxFlamesHSync);
}

void WfxFlamesInitParticles(void) {
    int i;

    AllocWeatherParticles(gPlaySt.chapterWeatherId);
    Decompress(gParticlesFx_2, OBJ_VRAM0 + 0x18 * 0x20);
    ApplyPalette(gParticlesFx_3, 0x1A);

    for (i = 0; i < 0x10; ++i) {
        sWeatherEffect.particles[i].xPosition = AdvanceGetLCGRNValue();
        sWeatherEffect.particles[i].yPosition = AdvanceGetLCGRNValue();

        sWeatherEffect.particles[i].xSpeed = -sInitialParticleConfigTemplates[i*3 + 0];
        sWeatherEffect.particles[i].ySpeed = -sInitialParticleConfigTemplates[i*3 + 1];
    }
}
