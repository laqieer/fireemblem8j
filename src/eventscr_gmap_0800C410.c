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

//! FE8U = 0x0800C138
u8 Event90_WmAddPathDisplayed(struct EventEngineProc * proc)
{
    int pathId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        AddAndDrawGmPath(pathId, 0);
        return EVC_ADVANCE_CONTINUE;
    }

    AddAndDrawGmPath(pathId, 0x1e);
    return EVC_ADVANCE_YIELD;
}
