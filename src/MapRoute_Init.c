extern int MapRoute_RenderOpenPaths();
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

//! FE8U = 0x080BBEB8
void MapRoute_Init(struct GmRouteProc * proc)
{
    proc->flags = 4;
    proc->unk_32 = 0;
    proc->unk_33 = -1;
    proc->bgA = 2;
    proc->bgB = 1;
    proc->bgPriority = BG_GetPriority(BG_1);

    *&proc->x1 = ((struct GmScreenProc *)(proc->proc_parent))->x;
    *&proc->y1 = ((struct GmScreenProc *)(proc->proc_parent))->y;

    proc->y2 = -2;
    proc->x2 = -2;

    MapRoute_RenderOpenPaths(proc);
    proc->flags |= 3;

    return;
}
