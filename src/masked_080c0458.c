#include "global.h"

#include "ap.h"
#include "ctc.h"
#include "hardware.h"
#include "eventinfo.h"

#include "worldmap.h"

//! FE8U = 0x080BB628
int GetNodeAtPosition(void * unused, int x_point, int y_point, int x_range, int y_range)
{
    const struct NodeIcon * icon;
    int i;
    const struct GMapNodeData * node;

    for (i = 0, node = gWMNodeData; i < 0x1d; node++, i++)
    {
        int xNode;
        int iconWidth;
        int xIconCenter;
        int yNode;
        int yIconCenter;
        int iconHeight;
        int x1, x2;
        int y1, y2;

        if (!(gGMData.nodes[i].state & GM_NODE_STATE_VALID))
            continue;

        if (gGMData.nodes[i].state & GM_NODE_STATE_CLEARED)
            icon = &gWMNodeIconData[node->iconPreClear];
        else
            icon = &gWMNodeIconData[node->iconPostClear];

        xNode = node->x;
        iconWidth = icon->width;
        xIconCenter = icon->xCenter;

        x1 = xNode - xIconCenter - x_range;

        yNode = node->y;
        iconHeight = icon->height;
        yIconCenter = icon->yCenter;

        y1 = yNode - yIconCenter - y_range;

        x2 = xNode + iconWidth - xIconCenter + x_range;
        y2 = yNode + iconHeight - yIconCenter + y_range;

        if (x_point < x1)
            continue;

        if (x_point >= x2)
            continue;

        if (y_point < y1)
            continue;

        if (y_point >= y2)
            continue;

        return i;
    }

    return -1;
}
