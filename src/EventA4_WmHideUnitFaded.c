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

//! FE8U = 0x0800C5F8
u8 EventA4_WmHideUnitFaded(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    u16 index = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    int b = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    if (EVENT_IS_SKIPPING(proc))
    {
        HideGmUnit(index);
        return EVC_ADVANCE_CONTINUE;
    }

    GmMu_StartFadeOut(GM_MU, index, b);

    return EVC_ADVANCE_CONTINUE;
}
