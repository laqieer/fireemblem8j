#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "scene.h"
#include "cgtext.h"
#include "helpbox.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"

//! FE8U = 0x0800E8C8
u8 Event1E_(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    int evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (evArgument == -1)
        evArgument = (s16)gEventSlots[2];

    if (evArgument != -3)
    {
        if (evArgument != -2)
        {
            if (EVENT_IS_SKIPPING(proc))
                return EVC_ADVANCE_CONTINUE;

            gUnk_36.str[0] = subcode + 8;
            gUnk_36.str[1] = 0x10;
            gUnk_36.str[2] = evArgument;
            gUnk_36.str[3] = 1;

            gUnk_36.unk04 = 1;
            gUnk_36.unk05 = 0;

            InitTalk(0x80, 2, 1);
        }
        else
        {
            gUnk_36.str[0] = subcode + 8;
            gUnk_36.str[1] = 0x11;
            gUnk_36.str[2] = 1;
            gUnk_36.str[3] = 0;

            ClearTalkBubble();
        }
    }
    else
    {
        EndTalk();
        EndCgText();
        EndAllBoxDialogue();

        if (proc->execType == EV_EXEC_CUTSCENE)
            ChangeUnitSpritePalette(proc->mapSpritePalIdOverride);

        EndEventFaces(proc);

        return EVC_ADVANCE_YIELD;
    }

    StartTalk(0, 0, gUnk_36.str);
    return EVC_ADVANCE_CONTINUE;
}
