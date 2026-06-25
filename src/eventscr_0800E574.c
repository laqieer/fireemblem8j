#include "global.h"
#include "proc.h"
#include "event.h"
#include "helpbox.h"

void EventText_StartBoxDialogueMsg(struct EventEngineProc * proc, u16 stringIndex, u32 flags)
{
    u8 x = ((u16 *)(gEventSlots + 0xB))[0];
    u8 y = ((u16 *)(gEventSlots + 0xB))[1];

    if (x == (u8)(-1) && y == (u8)(-1))
    {
        x = 0;
        y = 0;
        flags |= 0x0100;
    }

    if (proc->evStateBits & EV_STATE_0020)
        flags |= 0x0080;

    if (proc->evStateBits & EV_STATE_0040)
        flags |= 0x0008;

    StartBoxDialogue(x, y, stringIndex, NULL);
    SetDialogueBoxConfig(flags);
}
