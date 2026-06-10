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

//! FE8U = 0x080BC3D4
int GetGmPathWaypointCount(int pathId)
{
    int count;

    const struct GMapMovementPathData * pMovementPath = pathId[gWMPathData].movementPath;

    if (pMovementPath == NULL)
    {
        return 0;
    }

    count = 0;

    while (pMovementPath->elapsedTime >= 0)
    {
        pMovementPath++;
        count++;
    }

    return count;
}
