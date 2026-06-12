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

//! FE8U = 0x0800C634
u8 EventA5_WmUnitFadeWait(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        EndGmapUnitFade();
    }

    if (!GmUnitFadeExists())
    {
        return EVC_ADVANCE_YIELD;
    }

    return EVC_STOP_YIELD;
}
