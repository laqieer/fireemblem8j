#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "soundwrapper.h"
#include "event.h"
#include "eventscript.h"

u8 Event14_BgmOverideRestore(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    int evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    int song = evArgument;

    switch (subcode)
    {
        case 0:
            if (EVENT_IS_SKIPPING(proc))
                return EVC_ADVANCE_CONTINUE;

            if (evArgument < 0)
                song = (s16)gEventSlots[2];

            OverrideBgm(song);

            break;

        case 1:
            DeleteAll6CWaitMusicRelated();
            _RestoreBgm(evArgument);

            break;

    } // switch (subcode)

    return EVC_ADVANCE_YIELD;
}
