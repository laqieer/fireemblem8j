#include "global.h"
#include "ap.h"
#include "ctc.h"
#include "hardware.h"
#include "eventinfo.h"
#include "worldmap.h"

//! FE8U = 0x080BBA28
const char * GetWorldMapNodeName(u32 nodeId)
{
    if (nodeId < 0x1d)
    {
        return GetStringFromIndex(nodeId[gWMNodeData].nameTextId);
    }

    return GetStringFromIndex(0x5FF); // TODO: msgid "[DashedLine][DashedLine][DashedLine][DashedLine][DashedLine]"
}
