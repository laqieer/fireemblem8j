#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "bmio.h"
#include "bm.h"
#include "bmmap.h"
#include "event.h"
#include "eventscript.h"

//! FE8U = 0x08010850
u8 Event3C_MoveCursor(struct EventEngineProc * proc)
{
    int x;
    int y;

    switch (EVT_SUB_CMD(proc->pEventCurrent)) {
    case EVSUBCMD_CHECK_CURSOR:
        ((u16 *)(gEventSlots + 0xC))[0] = gBmSt.playerCursor.x;
        ((u16 *)(gEventSlots + 0xC))[1] = gBmSt.playerCursor.y;

        break;

    case EVSUBCMD_SET_CURSOR:
        x = (s8)EVT_CMD_ARGV(proc->pEventCurrent)[0];
        y = (s8)(EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8);

        if ((x < 0) || (y < 0))
        {
            x = ((s8 *)(gEventSlots + 0xB))[0];
            y = ((s8 *)(gEventSlots + 0xB))[2];
        }

        SetCursorMapPosition(x, y);

        break;
    }

    return EVC_ADVANCE_CONTINUE;
}
