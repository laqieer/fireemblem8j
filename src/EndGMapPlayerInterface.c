#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "face.h"
#include "bmlib.h"
#include "uiutils.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GMapPlayerInterface[];
extern struct ProcCmd gWorldmapPlayerInterface_1[];

//! FE8U = 0x080BF15C
void EndGMapPlayerInterface(void)
{
    Proc_EndEach(ProcScr_GMapPlayerInterface);
    Proc_EndEach(gWorldmapPlayerInterface_1);

    SetDefaultColorEffects();
    ClearBg0Bg1();

    return;
}
