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

//! FE8U = 0x0800CC18
u8 EventC3_SpawnLord(struct EventEngineProc * proc)
{
    u16 unitId = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 pid = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    int nodeId = EVT_CMD_ARG32_LE(proc->pEventCurrent + 2);

    if (!(gGMData.units[unitId].state & 2))
    {
        if (gGMData.units[unitId].id == pid)
        {
            return EVC_ADVANCE_CONTINUE;
        }
    }
    else if (pid == 0)
    {
        return EVC_ADVANCE_CONTINUE;
    }

    SetGmCharUnit(unitId, pid, -1, nodeId);

    return EVC_ADVANCE_CONTINUE;
}
