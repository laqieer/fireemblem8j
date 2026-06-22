#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "rng.h"
#include "soundwrapper.h"
#include "uimenu.h"
#include "uiutils.h"
#include "bmmenu.h"
#include "bmguide.h"
#include "constants/chapters.h"
#include "constants/worldmap.h"
#include "worldmap.h"
#include "constants/songs.h"

int GetGmPathBetweenNodes(int nodeA, int nodeB, int * startingNode);
int GetGmPathWaypointCount(int pathId);

int BuildGmPathSplineData(int nodeA, int nodeB, s16 c, u16 * d, int * e, int f)
{
    int nodeId;
    int pathId;
    int i;
    int startingNodeIdx;
    int local_24;
    int cc;

    cc = c;
    pathId = GetGmPathBetweenNodes(nodeA, nodeB, &startingNodeIdx);

    if (pathId < 0)
    {
        return 0;
    }

    *d = 0;

    nodeId = pathId[gWMPathData].node[startingNodeIdx];

    e[0] = nodeId[gWMNodeData].x << (f);
    e[1] = nodeId[gWMNodeData].y << (f);

    d++;
    e += 2;

    local_24 = GetGmPathWaypointCount(pathId);

    if (startingNodeIdx == 0)
    {
        for (i = 0; i < local_24; i++)
        {
            *d = DivArm(0x1000, pathId[gWMPathData].movementPath[i].elapsedTime * cc);

            e[0] = pathId[gWMPathData].movementPath[i].x << (f);
            e[1] = pathId[gWMPathData].movementPath[i].y << (f);

            d++;
            e += 2;
        }
    }
    else
    {
        for (i = local_24 - 1; i >= 0; i--)
        {
            *d = DivArm(0x1000, cc * (0x1000 - (pathId[gWMPathData].movementPath[i].elapsedTime)));

            e[0] = pathId[gWMPathData].movementPath[i].x << (f);
            e[1] = pathId[gWMPathData].movementPath[i].y << (f);

            d++;
            e += 2;
        }
    }

    *d = cc;

    nodeId = pathId[gWMPathData].node[1 - startingNodeIdx];
    e[0] = nodeId[gWMNodeData].x << (f);
    e[1] = nodeId[gWMNodeData].y << (f);

    return local_24 + 2;
}
