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

//! FE8U = 0x0800C8B0
u8 EventAF_WmShowTextBox(struct EventEngineProc * proc)
{
    u16 speed = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 blend = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    if (!EVENT_IS_SKIPPING(proc))
    {
        GmMuEntryStartShow(speed, blend);
    }

    return EVC_ADVANCE_CONTINUE;
}
