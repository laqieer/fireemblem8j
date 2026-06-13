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

//! FE8U = 0x0800CDF8
u8 EventCC_(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    int b = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    int c = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    if (!EVENT_IS_SKIPPING(proc))
    {
        Nop_EndingDetails_2(b, c, a);
    }

    return EVC_ADVANCE_CONTINUE;
}
