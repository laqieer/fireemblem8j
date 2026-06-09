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

//! FE8U = 0x0800C1CC
u8 Event93_WmEnableNode(struct EventEngineProc * proc)
{
    int nodeId = EVT_CMD_ARG32_LE(proc->pEventCurrent);
    gGMData.nodes[nodeId].state |= 1;
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C1E8
u8 Event94_WmDisableNode(struct EventEngineProc * proc)
{
    int nodeId = EVT_CMD_ARG32_LE(proc->pEventCurrent);
    gGMData.nodes[nodeId].state &= ~1;
    return EVC_ADVANCE_CONTINUE;
}
