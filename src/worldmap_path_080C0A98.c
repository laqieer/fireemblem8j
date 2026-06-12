extern int MapRoute_RenderPathGfx();
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
/* TU-private data externs bound at their JP addresses */
extern u16 gUnk_9[];

//! FE8U = 0x080BBC54
void MapRoute_RenderOpenPaths(struct GmRouteProc * proc)
{
    int i;

    u16 oam2Base = (proc->chr / CHR_SIZE) | (proc->pal << 0xc);

    CpuFill16(0, gUnk_9, 0x12C0);

    for (i = 0; i < proc->pOpenPaths->openPathsLength; i++)
    {
        MapRoute_RenderPathGfx(
            proc->pOpenPaths->openPaths[i][gWMPathData].gfxData,
            gUnk_9,
            60,
            oam2Base
        );
    }

    return;
}
