#include "global.h"
#include "bmlib.h"
#include "bmsave.h"
#include "bmudisp.h"
#include "face.h"
#include "fontgrp.h"
#include "hardware.h"
#include "mu.h"
#include "scene.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "proc.h"
#include "event.h"
#include "chapterdata.h"
#include "ap.h"
#include "uiconfig.h"
#include "savemenu.h"
#include "sysutil.h"
#include "unitlistscreen.h"
#include "bmshop.h"
#include "worldmap.h"
#include "constants/songs.h"

//! FE8U = 0x080B92D0
s8 WorldMap_HandleNodeConfirm(struct WorldMapMainProc * param_1, int param_2)
{
    int iVar4;
    int i;

    if (gGMData.units[0].location == param_2)
    {
        if (((gGMData.nodes[param_2].state & 2) == 0) && (param_2[gWMNodeData].placementFlag != 3))
        {
            if (GetGmSkirmishUnitAtNode(param_2) >= 0)
                Proc_Goto(param_1, 16);
            else
            {
                iVar4 = GetNextUnclearedNode(&gGMData);
                if (!(gPlaySt.chapterStateBits & 4) && !gPlaySt.config.controller && iVar4 == 2)
                    return 0;

                Proc_Goto(param_1, 18);
            }
        }
        else
        {
            param_1->unk_3e = param_2;
            Proc_Goto(param_1, 14);
            return 1; // :/
        }

        return 1;
    }

    if (GmFindPath(gGMData.units[0].location, param_2, 0) != 0)
    {
        if ((GetGmPathLength() == 2) && (gGMData.nodes[param_2].state & 2) != 0)
        {
            param_1->unk_3e = param_2;
            Proc_Goto(param_1, 14);
        }
        else
        {
            Proc_Goto(param_1, 6);
        }

        return 1;
    }
    else
    {
        i = gGMData.units[0].location;
        if (GmFindPath(i, param_2, 1) != 0)
        {
            if (GetGmPathLength() == 2)
            {
                if (param_2[gWMNodeData].placementFlag != 3)
                {
                    if ((gGMData.nodes[param_2].state & 2) != 0)
                    {
                        param_1->unk_3e = param_2;
                        Proc_Goto(param_1, 14);
                    }
                    else
                        Proc_Goto(param_1, 6);
                }
                else
                    Proc_Goto(param_1, 6);
            }
            else
                Proc_Goto(param_1, 6);

            return 1;
        }
    }

    return 0;
}
