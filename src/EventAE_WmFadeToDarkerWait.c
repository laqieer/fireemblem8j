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

//! FE8U = 0x0800C884
u8 EventAE_WmFadeToDarkerWait(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        EndGmPalFade();
        return EVC_ADVANCE_CONTINUE;
    }

    if (!IsGmPalFadeActive())
    {
        return EVC_ADVANCE_YIELD;
    }

    return EVC_STOP_YIELD;
}
