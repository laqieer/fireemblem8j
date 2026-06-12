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

//! FE8U = 0x0800C938
u8 EventB3_WmFancyFadeWait(struct EventEngineProc * proc)
{
    if (!IsGmapLineFadeActive())
    {
        return EVC_ADVANCE_YIELD;
    }

    return EVC_STOP_YIELD;
}
