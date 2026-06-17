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




u8 EventCD_(struct EventEngineProc * proc)
{
    if (!EVENT_IS_SKIPPING(proc))
    {
        Nop_EndingDetails_1();
    }

    return EVC_ADVANCE_CONTINUE;
}
