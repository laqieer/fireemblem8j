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

 // implicit?

//! FE8U = 0x0800BDCC
u8 Event80_WmSkip_Unsure(struct EventEngineProc * proc)
{
    int delay = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    WorldMap_RestartWithTimer(delay);
    Nop_EndingDetails_0(delay);

    return EVC_ADVANCE_YIELD;
}
