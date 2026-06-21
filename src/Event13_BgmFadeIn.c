#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "event.h"
#include "eventscript.h"
#include "eventinfo.h"

//! FE8U = 0x0800E004
u8 Event13_BgmFadeIn(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    int evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (evArgument < 0)
        evArgument = (s16)gEventSlots[2];

    if (evArgument != INT16_MAX)
    {
        if (EVENT_IS_SKIPPING(proc))
            return EVC_ADVANCE_CONTINUE;

        StartBgmFadeIn(evArgument, subcode, 0);
        return EVC_ADVANCE_YIELD;
    }
    else
    {
        if (EVENT_IS_SKIPPING(proc))
            subcode = 1;

        Sound_FadeOutBGM(subcode);
        return EVC_ADVANCE_YIELD;
    }
}
