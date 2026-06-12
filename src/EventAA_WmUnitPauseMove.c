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

//! FE8U = 0x0800C7B4
u8 EventAA_WmUnitPauseMove(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    unsigned long index = EVT_CMD_ARGV(proc->pEventCurrent)[1];

    if (!EVENT_IS_SKIPPING(proc))
    {
        GmMu_PauseMovement(GM_MU, index);
    }

    return EVC_ADVANCE_CONTINUE;
}
