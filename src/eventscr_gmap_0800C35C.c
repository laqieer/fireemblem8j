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

//! FE8U = 0x0800C084
u8 Event89_WmScrollWait(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        if (GmScrollManageExist())
        {
            EndGmScroll();
        }

        return EVC_ADVANCE_CONTINUE;
    }

    if (!GmScrollManageExist())
    {
        return EVC_ADVANCE_YIELD;
    }

    return EVC_STOP_YIELD;
}
