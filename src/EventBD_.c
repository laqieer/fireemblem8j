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

//! FE8U = 0x0800CB48
u8 EventBD_(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        EndWmPlaceDotByIndex(-1);

        return EVC_ADVANCE_CONTINUE;
    }

    SetWmPlaceDotFlagForIndex(a);

    return EVC_ADVANCE_CONTINUE;
}
