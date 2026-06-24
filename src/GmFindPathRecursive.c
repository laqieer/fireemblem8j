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

s8 GmIsNodeInList(struct Unknown0201B100 * buf, int target);

//! FE8U = 0x080BCAB8
int GmFindPathRecursive(struct Unknown0201B0D8 * buf, struct GMapNodeLink * links, s8 param_3, s8 param_4, s8 param_5, int param_6)
{
    s8 * connections;
    int i;
    int j;
    struct GMapNodeLink * link;

    if (param_6 < buf->unk_20)
    {
        link = &links[param_4];

        for (i = 0; i < link->numConnections; i++)
        {
            s8 r2;

            connections = link->connections;
            if (connections[i] == param_3)
                continue;

            r2 = connections[i] == param_5;

            if (r2 || !GmIsNodeInList(gUnk_12, connections[i]))
            {
                connections = link->connections; // redundant
                buf->unk_10[param_6] = connections[i];

                if (r2)
                {
                    if (param_6 < buf->unk_20)
                    {
                        for (j = 1; j <= param_6; j++)
                            buf->unk_00[j] = buf->unk_10[j];

                        buf->unk_20 = param_6;
                    }

                    return 1;
                }

                GmFindPathRecursive(buf, links, param_4, connections[i], param_5, param_6 + 1);
            }
        }
    }

    return 0;
}
