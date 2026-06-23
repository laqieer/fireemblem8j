#include "global.h"
#include "worldmap.h"
#include "event.h"

//! FE8U = 0x0800C68C
u8 EventA7_WmUnitSetPosition(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    s16 index = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 x = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    s16 y = EVT_CMD_ARGV(proc->pEventCurrent)[4];

    GmMu_SetPosition(GM_MU, index, x, y);

    return EVC_ADVANCE_CONTINUE;
}
