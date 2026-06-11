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

//! FE8U = 0x0800C254
u8 Event96_WmEnablePathTargetDisplayed(struct EventEngineProc * proc)
{
    int nodeId;
    int i;

    int pathId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    for (i = 0; i < 2; i++)
    {
        nodeId = (pathId)[gWMPathData].node[i];

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
    }
    else
    {
        StartGmBaseEntry(nodeId, 0, NULL);
    }

    return EVC_ADVANCE_CONTINUE;
}
