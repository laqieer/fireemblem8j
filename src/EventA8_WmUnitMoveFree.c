#include "global.h"
#include "event.h"
#include "worldmap.h"

//! FE8U = 0x0800C6C0
u8 EventA8_WmUnitMoveFree(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;
    struct Sub80C33D4 local;

    // Order needed to match
    u16 flag;
    u16 delay;
    u16 time;

    s16 index = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 acceleration = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    s16 x1 = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    s16 y1 = EVT_CMD_ARGV(proc->pEventCurrent)[4];
    s16 x2 = EVT_CMD_ARGV(proc->pEventCurrent)[5];
    s16 y2 = EVT_CMD_ARGV(proc->pEventCurrent)[6];

    time = EVT_CMD_ARGV(proc->pEventCurrent)[7];
    flag = EVT_CMD_ARGV(proc->pEventCurrent)[8];
    delay = EVT_CMD_ARGV(proc->pEventCurrent)[9];

    if (((proc->evStateBits >> 1) >> 1) & 1)
    {
        GmMu_SetPosition(GM_MU, index, x2, y2);

        if ((flag & 2) != 0)
        {
            HideGmUnit(index);
        }
    }
    else
    {
        // Grouping + register reuse needed to match the JP register coloring.
        do
        {
            local.wm_uid = index;
            local.unk_01 = acceleration;
            local.unk_02 = 0;
            local.x1 = x1;
            local.y1 = y1;
            local.x2 = x2;
        } while (0);
        local.y2 = y2;
        local.speed = time;
        local.delay = delay;
        y2 = 0;
        StartGmapAutoMu_Type1(&local, flag, (void *)(int)y2);
    }

    return EVC_ADVANCE_CONTINUE;
}
