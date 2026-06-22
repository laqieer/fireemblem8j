#include "global.h"
#include "proc.h"
#include "event.h"
#include "eventscript.h"
#include "bmfx.h"

//! FE8U = 0x08010D24
u8 Event41_Warp(struct EventEngineProc * proc)
{
    int x;
    int y;
    u8 subcmd;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    switch (subcmd)
    {
        case EVSUBCMD_WARP_OUT:
        case EVSUBCMD_WARP_IN:
            x = ((s8 *)proc->pEventCurrent)[2];
            y = ((s8 *)proc->pEventCurrent)[2];

            if (x < 0)
            {
                x = ((s8 *)(gEventSlots + 0xB))[0];
                y = ((s8 *)(gEventSlots + 0xB))[2];
            }

            if (!(proc->evStateBits & EV_STATE_0040))
            {
                StartEventWarpAnim_ret(proc, x, y, subcmd, 1);
            }
            else
            {
                StartEventWarpAnim_ret(proc, x, y, subcmd, 0);
            }

            break;

        case 0xf:
            if (EventWarpAnimExists_ret() == 1)
            {
                return EVC_STOP_YIELD;
            }

            break;
    }

    return EVC_ADVANCE_YIELD;
}
