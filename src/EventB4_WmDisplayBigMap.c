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

//! FE8U = 0x0800C950
u8 EventB4_WmDisplayBigMap(struct EventEngineProc * proc)
{
    int x = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    int y = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    int c = EVT_CMD_ARG32_LE(proc->pEventCurrent + 2);

    if (!EVENT_IS_SKIPPING(proc))
    {
        StartGmapRm((s16)x, (s16)y, c, NULL);
    }

    return EVC_ADVANCE_CONTINUE;
}
