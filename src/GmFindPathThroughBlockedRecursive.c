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

//! FE8U = 0x080BCBAC
int GmFindPathThroughBlockedRecursive(struct Unknown0201B0D8 * buf, struct GMapNodeLink * param_2, s8 param_3, s8 param_4, s8 param_5, int param_6, int param_7)
{
    int i;
    int j;
    s8 * connections;
    struct GMapNodeLink * link;
    int next;

    if (param_6 < buf->unk_20)
    {

        link = &param_2[param_4];

        for (i = 0; i < link->numConnections; i++)
        {
            s8 r2;

            next = param_6 + 1;

            connections = link->connections;

            if (connections[i] == param_3)
            {
                continue;
            }

            r2 = connections[i] == param_5;

            buf->unk_10[param_6] = connections[i];

            if (param_7 >= 0)
            {
                connections = link->connections; // redundant here too ?
                if (r2)
                {
                    s8 r2 = 0;
                    register int r1 asm("r1");

                    asm("":::"r1");
                    if (param_7 < buf->unk_24)
                    {
                        r1 = param_7;
                        ++r1;
                        --r1;
                        buf->unk_24 = r1;
                        r2 = 1;
                    }
                    else if ((param_7 == buf->unk_24) && (param_6 < buf->unk_20))
                    {
                        r2 = 1;
                    }

                    if (r2)
                    {

                        for (j = 1; j <= param_6; j++)
                        {
                            buf->unk_00[j] = buf->unk_10[j];
                        }

                        buf->unk_20 = param_6;
                    }

                    return 1;
                }
                else
                {
                    GmFindPathThroughBlockedRecursive(buf, param_2, param_4, connections[i], param_5, next, param_7 + 1);
                    continue;
                }
            }
            else
            {
                if (!r2)
                {

                    if (GmIsNodeInList(gUnk_12, connections[i]))
                    {
                        GmFindPathThroughBlockedRecursive(buf, param_2, param_4, connections[i], param_5, next, param_7 + 1);
                        continue;
                    }
                }
                else
                {
                    if (param_6 < buf->unk_20)
                    {
                        for (j = 1; j <= param_6; j++)
                        {
                            buf->unk_00[j] = buf->unk_10[j];
                        }

                        buf->unk_20 = param_6;
                    }

                    return 1;
                }
            }

            GmFindPathThroughBlockedRecursive(buf, param_2, param_4, connections[i], param_5, next, param_7);
        }
    }

    return 0;
}
