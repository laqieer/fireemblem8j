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

//! FE8U = 0x0800C980
u8 EventB5_WmHideBigMap(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        GmapRm_EndAll();
        return EVC_ADVANCE_CONTINUE;
    }

    GmapRm_SetUnblocked();
    return EVC_ADVANCE_CONTINUE;
}
