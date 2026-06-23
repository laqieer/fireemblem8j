#include "global.h"
#include "worldmap.h"
#include "event.h"

void GetWMCenteredCameraPosition(s16 xIn, s16 yIn, s16 * xOut, s16 * yOut);

u8 Event88_WmScrollCameraOntoUnit(struct EventEngineProc * proc)
{
    s16 xEnd;
    s16 yEnd;

    s16 xStart = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 yStart = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    u16 unitId = EVT_CMD_ARGV(proc->pEventCurrent)[3];

    s16 speed = EVT_CMD_ARGV(proc->pEventCurrent)[4];
    s16 delay = EVT_CMD_ARGV(proc->pEventCurrent)[5];

    GetWMCenteredCameraPosition(
        gGMData.units[unitId].location[gWMNodeData].x, gGMData.units[unitId].location[gWMNodeData].y, &xEnd, &yEnd);

    if (EVENT_IS_SKIPPING(proc) || (speed == 0 && delay == 0))
    {
        gGMData.xCamera = xEnd;
        gGMData.yCamera = yEnd;

        return EVC_ADVANCE_CONTINUE;
    }

    StartGmScroll(xStart, yStart, xEnd, yEnd, speed, delay);

    return EVC_ADVANCE_YIELD;
}
