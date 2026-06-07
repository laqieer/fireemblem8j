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

//! FE8U = 0x0800C2DC
u8 Event97_WmInitNextStoryNode(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    int nodeId = WMLoc_GetNextLocId(gGMData.current_node);

    if (nodeId < 0)
    {
        return EVC_ADVANCE_CONTINUE;
    }

    if (EVENT_IS_SKIPPING(proc))
    {
        ResetGmStoryNode();
        gGMData.nodes[nodeId].state |= 1;
        gGMData.nodes[nodeId].state |= 2;

        GM_ICON->nodeId = nodeId;
        GM_ICON->merge_next_node = true;
    }
    else
    {
        if (!(gGMData.nodes[nodeId].state & 1))
        {
            StartGmBaseEntry(nodeId, 0, NULL);
            ResetGmStoryNode();
            gGMData.nodes[nodeId].state |= 2;
        }
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C36C
u8 Event98_WmSetNextStoryNodePath(struct EventEngineProc * proc)
{
    int nodeId;
    int i;
    struct WorldMapMainProc * worldMapProc;

    int pathId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    for (i = 0; i < 2; i++)
    {
        nodeId = pathId[gWMPathData].node[i];
        if (!(gGMData.nodes[nodeId].state & 1))
        {
            break;
        }
    }

    if (i >= 2)
    {
        return EVC_ADVANCE_CONTINUE;
    }

    if (EVENT_IS_SKIPPING(proc))
    {
        gGMData.nodes[nodeId].state |= 1;
        gGMData.nodes[nodeId].state |= 2;

        GM_ICON->nodeId = nodeId;
        GM_ICON->merge_next_node = true;
    }
    else
    {
        StartGmBaseEntry(nodeId, 0, NULL);
        ResetGmStoryNode();
        gGMData.nodes[nodeId].state |= 2;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C434
u8 Event99_GmNodeDisplayWait(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        if (GmBaseEntryExists())
        {
            EndGmBaseEntry();
        }

        return EVC_ADVANCE_CONTINUE;
    }

    if (!GmBaseEntryExists())
    {
        return EVC_ADVANCE_YIELD;
    }

    return EVC_STOP_YIELD;
}

//! FE8U = 0x0800C468
u8 Event9A_WmSetStoryNodeSilent(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    int nodeId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    gGMData.nodes[nodeId].state |= 2;

    GM_ICON->nodeId = nodeId;
    GM_ICON->merge_next_node = true;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800C4C8
u8 Event9B_WmSetNextStoryNodeSilentNoFlag(struct EventEngineProc * proc)
{
    int nodeId = EVT_CMD_ARG32_LE(proc->pEventCurrent);
    gGMData.nodes[nodeId].state |= 2;

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C4E4
u8 Event9C_(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    int nodeId = WMLoc_GetNextLocId(gGMData.current_node);

    if (nodeId >= 0)
    {
        ResetGmStoryNode();

        gGMData.nodes[nodeId].state |= 2;

        GM_ICON->nodeId = nodeId;
    }

    return EVC_ADVANCE_CONTINUE;
}
