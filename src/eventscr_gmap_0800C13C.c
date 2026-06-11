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

//! FE8U = 0x0800BE4C
u8 Event84_WmSetCameraOntoNode(struct EventEngineProc * proc)
{
    u16 x;
    u16 y;

    int nodeId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    GetWMCenteredCameraPosition(nodeId[gWMNodeData].x, nodeId[gWMNodeData].y, &x, &y);

    gGMData.xCamera = x;
    gGMData.yCamera = y;

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800BE8C
u8 Event85_WmSetCameraOntoUnit(struct EventEngineProc * proc)
{
    u16 x;
    u16 y;

    int unitId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    GetWMCenteredCameraPosition(
        gGMData.units[unitId].location[gWMNodeData].x, gGMData.units[unitId].location[gWMNodeData].y, &x, &y);

    gGMData.xCamera = x;
    gGMData.yCamera = y;

    return EVC_ADVANCE_CONTINUE;
}
