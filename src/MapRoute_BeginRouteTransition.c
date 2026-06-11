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

//! FE8U = 0x080BC29C
void MapRoute_BeginRouteTransition(struct GmRouteProc * proc, int unk)
{
    if (unk < 2)
    {
        proc->flags |= 3;
        proc->unk_32 &= ~1;
    }
    else
    {
        proc->unk_3c = unk;
        proc->unk_3e = 0;
        proc->unk_32 |= 1;

        Proc_Goto(proc, 1);
    }

    return;
}
