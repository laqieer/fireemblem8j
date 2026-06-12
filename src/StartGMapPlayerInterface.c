#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "face.h"
#include "bmlib.h"
#include "uiutils.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gWorldmapPlayerInterface_1[];

// clang-format on

//! FE8U = 0x080BF13C
ProcPtr StartGMapPlayerInterface(ProcPtr parent)
{
    ResetText();
    ClearWMPlayerInterfaceTilemapBuffers();
    return Proc_Start(gWorldmapPlayerInterface_1, parent);
}
