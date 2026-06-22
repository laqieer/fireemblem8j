#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "bmunit.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"

struct MapCursorProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);

    /* 64 */ s16 x;
    /* 66 */ s16 y;
    /* 68 */ u16 subcmd;
    /* 6A */ u16 timer;
};

//! FE8U = 0x080108E4
u8 Event3B_DisplayCursor(struct EventEngineProc * proc)
{
    struct MapCursorProc * childProc;
    struct Unit * unit;
    u8 subcmd;
    int x;
    int y;

    if (EVENT_IS_SKIPPING(proc))
    {
        Proc_EndEach(ProcScr_EventDisplayCursor);
        return EVC_ADVANCE_CONTINUE;
    }

    subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    switch (subcmd & 3) {
    case EVSUBCMD_CURSOR_AT:
        x = (s8)EVT_CMD_ARGV(proc->pEventCurrent)[0];
        y = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

        if (x < 0 || y < 0)
        {
            x = ((s8 *)(gEventSlots + 0xB))[0];
            y = ((s8 *)(gEventSlots + 0xB))[2];
        }

        break;

    case EVSUBCMD_CURSOR_UNIT:
        unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
        if (!unit)
            return EVC_ERROR;

        x = unit->xPos;
        y = unit->yPos;

        break;

    case EVSUBCMD_CURE:
        Proc_EndEach(ProcScr_EventDisplayCursor);
        return EVC_ADVANCE_YIELD;
    }

    childProc = Proc_Start(ProcScr_EventDisplayCursor, proc);
    childProc->x = x;
    childProc->y = y;
    childProc->subcmd = subcmd;
    childProc->timer = 0;

    return EVC_ADVANCE_CONTINUE;
}
