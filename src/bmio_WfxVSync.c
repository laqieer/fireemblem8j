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

 void WfxSnow_VSync(void);
 void WfxRain_VSync(void);
 void WfxSandStorm_VSync(void);
 void WfxSnowStorm_VSync(void);
 void WfxBlue_VSync(void);
 void WfxFlames_VSync(void);
 void WfxClouds_VSync(void);

void WfxVSync(void) {
    switch (gPlaySt.chapterWeatherId) {

    case WEATHER_SNOW:
        WfxSnow_VSync();
        break;

    case WEATHER_SANDSTORM:
        WfxSandStorm_VSync();
        break;

    case WEATHER_SNOWSTORM:
        WfxSnowStorm_VSync();
        break;

    case WEATHER_RAIN:
        WfxRain_VSync();
        break;

    case WEATHER_NIGHT:
        WfxBlue_VSync();
        break;

    case WEATHER_FLAMES:
        WfxFlames_VSync();
        break;

    case WEATHER_CLOUDS:
        WfxClouds_VSync();
        break;

    } /* switch (gPlaySt.chapterWeatherId) */
}
