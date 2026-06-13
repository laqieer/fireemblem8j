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

//! FE8U = 0x0800C5BC
u8 EventA3_WmShowUnitFaded(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    u16 index = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    int delay = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    if (EVENT_IS_SKIPPING(proc))
    {
        ShowGmUnit(index);
        return EVC_ADVANCE_CONTINUE;
    }
    GmMu_StartFadeIn(GM_MU, index, delay);
    return EVC_ADVANCE_CONTINUE;
}
