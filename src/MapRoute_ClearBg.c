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

//! FE8U = 0x080BC404
void MapRoute_ClearBg(struct GmRouteProc * proc)
{
    BG_Fill(BG_GetMapBuffer(proc->bgA), 0);
    BG_EnableSyncByMask((1 << proc->bgA));
    return;
}
