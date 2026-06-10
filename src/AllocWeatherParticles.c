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

void AllocWeatherParticles(unsigned weatherId) {
    switch (weatherId) {

    case WEATHER_SNOW:
    case WEATHER_SNOWSTORM:
    case WEATHER_RAIN:
    case WEATHER_SANDSTORM:
        InitOam(0x20);
        break;

    case WEATHER_FLAMES:
        InitOam(0x10);
        break;

    default:
        InitOam(0);
        break;

    } // switch (weatherId)
}
