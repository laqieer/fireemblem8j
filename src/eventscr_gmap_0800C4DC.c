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

//! FE8U = 0x0800C204
u8 Event95_WmEnableNodeDisplayed(struct EventEngineProc * proc)
{
    int nodeId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        gGMData.nodes[nodeId].state |= 1;
        return EVC_ADVANCE_CONTINUE;
    }

    if (!(gGMData.nodes[nodeId].state & 1))
    {
        StartGmBaseEntry(nodeId, 0, NULL);
    }

    return EVC_ADVANCE_CONTINUE;
}
