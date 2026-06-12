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
extern struct ProcCmd ProcScr_GMapRoute[];

// clang-format on

//! FE8U = 0x080BC3A4
ProcPtr StartGMapRoute(ProcPtr parent, struct OpenPaths * pPaths, int c, int d)
{
    struct GmRouteProc * proc = Proc_Start(ProcScr_GMapRoute, parent);
    proc->chr = c;
    proc->pal = d;
    proc->pOpenPaths = pPaths;
    return proc;
}
