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

//! FE8U = 0x080B9D14
void WorldMap_GenerateRandomMonsters(ProcPtr proc)
{
    int i;
    int monster_amt;

    int flag = 0;

    if (!(gGMData.state.bits.monster_merged))
    {
        flag = 1;
    }
    else
    {
        if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME)
        {
            for (i = WM_MONS_UID_ENTRY; i < WM_MONS_UID_END; i++)
                if (gGMData.units[i].id != 0)
                    break;

            if (i == 7)
                flag = 1;
        }
        else
        {
            if (gGMData.units[0].location[gWMNodeData].placementFlag == GMAP_NODE_PLACEMENT_DUNGEON)
            {
                for (i = WM_MONS_UID_ENTRY; i < WM_MONS_UID_END; i++)
                    if (gGMData.units[i].id != 0)
                        break;

                if (i == WM_MONS_UID_END)
                    flag = 1;
            }
        }
    }

    if (flag)
    {
        NewGmapTimeMons(NULL, &monster_amt);
        if (monster_amt > 0)
            Proc_Goto(proc, 2);
    }
    WmShowMonsters();
}
