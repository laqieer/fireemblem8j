#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "bmlib.h"
#include "worldmap.h"
#include "face.h"
#include "scene.h"
#include "savemenu.h"

#include "eventscript.h"
#include "event.h"

void GetWMCenteredCameraPosition(s16, s16, s16 *, s16 *);

// TODO: In "worldmap_scrollmanage.c", the signature returns a ProcPtr instead of s8/bool
s8 GmScrollManageExist(void);
int IsWmPlaceDotActiveAtIndex(int);

//! FE8U = 0x0800CD50
u8 EventC6_WmDisplayText(struct EventEngineProc * proc)
{
    u16 a;
    u16 b;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    a = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    b = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    StartWmTextMsg(a | b);

    if (proc->evStateBits & EV_STATE_0020)
    {
        SetTalkFlag(TALK_FLAG_NOSKIP);
    }

    return EVC_ADVANCE_YIELD;
}
