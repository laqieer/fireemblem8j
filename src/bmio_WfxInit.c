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

 void WfxNone_Init(void);
 void WfxSnow_Init(void);
 void WfxRain_Init(void);
 void WfxSandStorm_Init(void);
 void WfxSnowStorm_Init(void);
 void WfxBlue_Init(void);
 void WfxFlames_Init(void);
 void WfxClouds_Init(void);

void WfxInit(void) {
    switch (gPlaySt.chapterWeatherId) {

    case WEATHER_FINE:
        WfxNone_Init();
        break;

    case WEATHER_SNOW:
        WfxSnow_Init();
        break;

    case WEATHER_SANDSTORM:
        WfxSandStorm_Init();
        break;

    case WEATHER_SNOWSTORM:
        WfxSnowStorm_Init();
        break;

    case WEATHER_RAIN:
        WfxRain_Init();
        break;

    case WEATHER_NIGHT:
        WfxBlue_Init();
        break;

    case WEATHER_FLAMES:
        WfxFlames_Init();
        break;

    case WEATHER_CLOUDS:
        WfxClouds_Init();
        break;

    } /* switch (gPlaySt.chapterWeatherId) */
}
