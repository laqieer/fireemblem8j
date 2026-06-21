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

//! FE8U = 0x0800CAF4
u8 EventAC_WmUnitMoveWait(struct EventEngineProc * proc)
{
    int unitId = EVT_CMD_ARGV(proc->pEventCurrent)[1];

    if (EVENT_IS_SKIPPING(proc))
    {
        if (IsGmAutoMuActiveFor(unitId))
        {
            EndGmAutoMuFor(unitId);
        }

        return EVC_ADVANCE_CONTINUE;
    }

    if (!IsGmAutoMuActiveFor(unitId))
    {
        return EVC_ADVANCE_YIELD;
    }

    return EVC_STOP_YIELD;
}
