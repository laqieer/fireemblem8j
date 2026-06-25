#include "global.h"
#include "worldmap.h"
#include "event.h"

u8 Event86_WmScrollCamera(struct EventEngineProc * proc)
{
    s16 xStart = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 yStart = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    s16 xEnd = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    s16 yEnd = EVT_CMD_ARGV(proc->pEventCurrent)[4];

    s16 speed = EVT_CMD_ARGV(proc->pEventCurrent)[5];
    s16 delay = EVT_CMD_ARGV(proc->pEventCurrent)[6];

    if (EVENT_IS_SKIPPING(proc) || (speed == 0 && delay == 0))
    {
        gGMData.xCamera = xEnd;
        gGMData.yCamera = yEnd;

        return EVC_ADVANCE_CONTINUE;
    }

    StartGmScroll(xStart, yStart, xEnd, yEnd, speed, delay);

    return EVC_ADVANCE_YIELD;
}
