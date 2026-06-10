#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "rng.h"
#include "soundwrapper.h"
#include "uimenu.h"
#include "uiutils.h"
#include "bmmenu.h"
#include "bmguide.h"
#include "constants/chapters.h"
#include "constants/worldmap.h"
#include "worldmap.h"
#include "constants/songs.h"

extern const u8 gWorldmapPath_20[];

//! FE8U = 0x080BD20C
int GetGmUnitFaction(int index)
{
    if (index >= 7)
    {
        index = 0;
    }

    return gWorldmapPath_20[index];
}
