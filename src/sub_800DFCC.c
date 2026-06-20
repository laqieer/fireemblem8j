#include "global.h"

#include "proc.h"
#include "hardware.h"
#include "soundwrapper.h"
#include "event.h"

u8 Event12_StartBGM(struct EventEngineProc * proc)
{
    int evArgument;

    if (EVENT_IS_SKIPPING(proc))
        return EVC_ADVANCE_CONTINUE;

    evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (evArgument < 0)
        evArgument = (s16)gEventSlots[2];

    StartBgmExt(evArgument, 3, NULL);
    return EVC_ADVANCE_YIELD;
}
