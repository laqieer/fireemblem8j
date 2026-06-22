#include "global.h"

#include "event.h"
#include "eventscript.h"
#include "eventinfo.h"

u8 Event03_CheckEvBitOrId(struct EventEngineProc * proc)
{
    int sub_cmd = EVT_SUB_CMD(proc->pEventCurrent);
    int arg = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    s16 bitck, tst;

    if (arg < 0)
        arg = (s16)gEventSlots[2];

    switch (sub_cmd) {
    case EVSUBCMD_CHECK_EVBIT:
        if (((proc->evStateBits >> arg) & 0x1) == 0)
            gEventSlots[0xC] = false;
        else
            gEventSlots[0xC] = true;
        break;

    case EVSUBCMD_CHECK_EVENTID:
        tst = arg;
        if (CheckFlag(tst) == false)
            gEventSlots[0xC] = false;
        else
            gEventSlots[0xC] = true;
        break;
    }

    return EVC_ADVANCE_CONTINUE;
}
