#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "event.h"
#include "eventscript.h"

u8 sub_80106A0(struct EventEngineProc * proc)
{
    short pid;
    s8 x1, y1, x2, y2;
    u8 ret;
    struct Unit * unit;

    pid = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    x1 = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    y1 = EVT_CMD_ARGV(proc->pEventCurrent)[1] >> 8;

    x2 = x1 + ((u16 *)EVT_CMD_ARGV(proc->pEventCurrent))[2] - 1;
    y2 = y1 + (((u16 *)EVT_CMD_ARGV(proc->pEventCurrent))[2] >> 8) - 1;

    unit = GetUnitStructFromEventParameter(pid);

    gEventSlots[0xc] = ret = 0;
    if (unit->xPos < x1)
        return ret;
    if (x2 >= unit->xPos && unit->yPos >= y1 && y2 >= unit->yPos)
        gEventSlots[0xc] = 1;

    ret = 0;
    return ret;
}
