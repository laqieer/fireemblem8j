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

//! FE8U = 0x080BCDE4
int GetGmPathBetweenNodes(int nodeA, int nodeB, int * startingNode)
{
    u32 i;

    for (i = 0; i < WM_PATH_MAX; i++)
    {
        if ((nodeA == gWMPathData[i].node[0]) && (nodeB == gWMPathData[i].node[1]))
        {
            *startingNode = 0;
            return i;
        }

        if ((nodeA == gWMPathData[i].node[1]) && (nodeB == gWMPathData[i].node[0]))
        {
            *startingNode = 1;
            return i;
        }
    }
    return -1;
}
