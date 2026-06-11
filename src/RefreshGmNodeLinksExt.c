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

#define GMapNodeLinkNextConnSlot(gmnl) ((gmnl)->connections[(gmnl)->numConnections])
#define GMapNodeLinkNextConnSlot(gmnl) ((((s8 *)(gmnl)) + ((s8 *)(gmnl))[0])[1])

/* https://decomp.me/scratch/yGsRY */

//! FE8U = 0x080BC970
void RefreshGmNodeLinksExt(struct GMapData * param_1, struct GMapNodeLink * param_2)
{
    int pathId;
    int i, j;
    struct GMapNodeLink * pcVar6;
    s8 * r0, * r9;

    CpuFill32(0, param_2, sizeof(struct GMapNodeLink) * 0x1d);
    i = 0;
    r0 = param_1->openPaths.openPaths;
    if (i < param_1->openPaths.openPathsLength)
    {
        for (r9 = r0; i < param_1->openPaths.openPathsLength; i++, r0 = r9)
        {
            pathId = r0[i];

            for (j = 0; j < 2; j++)
            {
                int r2 = pathId[gWMPathData].node[j];

                pcVar6 = param_2 + r2;
                GMapNodeLinkNextConnSlot(pcVar6) = pathId[gWMPathData].node[1-j];
                pcVar6->numConnections++;

                if (r2 == 0)
                    GMapNodeLinkNextConnSlot(pcVar6) = pathId[gWMPathData].node[1-j];
            }
        }
    }

    return;
}
