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

//! FE8U = 0x0800C8D4
u8 EventB0_WmHideTextBox_Bugged(struct EventEngineProc * proc)
{
    u16 a = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 b = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    if (!EVENT_IS_SKIPPING(proc))
    {
        GmMuEntryStartHide(a, b);
    }

    return EVC_ADVANCE_CONTINUE;
}
