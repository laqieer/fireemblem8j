#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "popup.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"

//! FE8U = 0x08010834
u8 Event3A_DisplayPopup(struct EventEngineProc * proc)
{
    int textId;
    u8 subcmd;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    textId = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (textId < 0)
    {
        textId = (s16)gEventSlots[2];
    }

    switch (subcmd) {
    case 0:
    {
        u16 songId = EVT_CMD_ARGV(proc->pEventCurrent)[1];
        NewPopup_VerySimple(textId, songId, proc);
        break;
    }

    case 1:
    {
        s8 x = EVT_CMD_ARGV(proc->pEventCurrent)[2];
        s8 y = EVT_CMD_ARGV(proc->pEventCurrent)[2] >> 8;
        StartBrownTextBox(textId, x, y, proc);
        break;
    }
    }
    return EVC_ADVANCE_YIELD;
}
