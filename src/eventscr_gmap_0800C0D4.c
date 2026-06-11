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

//! FE8U = 0x0800BDE8
u8 Event81_WmFadeOut(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        SetDispEnable(0, 0, 0, 0, 0);
        return EVC_ADVANCE_CONTINUE;
    }

    StartSlowLockingFadeToBlack(proc);
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800BE2C
u8 Event82_WmEnd(struct EventEngineProc * proc)
{
    EndWM(proc);
    return EVC_ADVANCE_CONTINUE;
}
