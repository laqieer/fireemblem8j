#include "global.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmlib.h"
#include "worldmap.h"
#include "face.h"
#include "scene.h"
#include "savemenu.h"
#include "eventscript.h"
#include "event.h"

//! FE8U = 0x0800C198
u8 Event92_WmRemovePath(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    int pathId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    RemoveGmPath(&gGMData, &gGMData.openPaths, pathId);

    GM_SCREEN->gmroute->flags |= 3;

    return EVC_ADVANCE_CONTINUE;
}
