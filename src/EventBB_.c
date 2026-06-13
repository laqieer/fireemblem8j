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

//! FE8U = 0x0800CA9C
u8 EventBB_(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    int b = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    int c = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    int d = EVT_CMD_ARGV(proc->pEventCurrent)[4];
    int e = EVT_CMD_ARG32_LE(proc->pEventCurrent + 4);

    if (!EVENT_IS_SKIPPING(proc))
    {
        StartWmPlaceDot(a, b, c, d, e, NULL);
    }

    return EVC_ADVANCE_CONTINUE;
}
