#include "global.h"

#include "proc.h"
#include "event.h"
#include "eventscript.h"

u8 Event07_SlotQueueOperations(struct EventEngineProc * proc)
{
    const u16 * scr = proc->pEventCurrent;
    u8 sub_cmd = EVT_SUB_CMD(scr);
    int slot;

    switch (sub_cmd) {
    case EVSUBCMD_SENQUEUE:
        slot = EVT_CMD_ARGV(scr)[0];
        SlotQueuePush(gEventSlots[slot]);
        break;

    case EVSUBCMD_SENQUEUE_S1:
        SlotQueuePush(gEventSlots[0x1]);
        break;

    case EVSUBCMD_SDEQUEUE:
        slot = EVT_CMD_ARGV(scr)[0];
        gEventSlots[slot] = SlotQueuePop();
        break;
    }
    return EVC_ADVANCE_CONTINUE;
}
