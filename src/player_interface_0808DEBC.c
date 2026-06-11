#include "global.h"

#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmmap.h"
#include "ctc.h"
#include "bmtrick.h"
#include "icon.h"
#include "uiutils.h"
#include "uichapterstatus.h"
#include "chapterdata.h"
#include "face.h"
#include "bm.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "bmlib.h"
#include "worldmap.h"

#include "player_interface.h"

#include "constants/event-flags.h"
#include "constants/msg.h"
#include "constants/terrains.h"

// clang-format off

extern struct PlayerInterfaceConfigEntry CONST_DATA sPlayerInterfaceConfigLut[4];

extern s8 CONST_DATA gUnitBurstMapUiTextXTable[6];

extern s8 CONST_DATA gUnitBurstMapUiTextYTable[18];

extern s8 CONST_DATA gUnitBurstMapUiXOffsetTable[6];

extern s8 CONST_DATA gUnitBurstMapUiYOffsetTable[6];

extern u16 * CONST_DATA gPlayerInterface_0[6];

extern u16 * CONST_DATA gPlayerInterface_1[6];









extern struct ProcCmd CONST_DATA gProcScr_TerrainDisplay[];

extern struct ProcCmd CONST_DATA gProcScr_UnitDisplay_MinimugBox[];

extern struct ProcCmd CONST_DATA gProcScr_UnitDisplay_Burst[];

extern struct ProcCmd CONST_DATA gProcScr_SideWindowMaker[];

extern s8 CONST_DATA sGoalSlideInWidthLut[5];



extern struct ProcCmd CONST_DATA gProcScr_GoalDisplay[];

extern struct ProcCmd CONST_DATA gProcScr_PrepMap_MenuButtonDisplay[];

// clang-format on

//! FE8U = 0x0808BBAC
int GetWindowQuadrant(int x, int y)
{
    if (x < 0)
    {
        if (y < 0)
        {
            return 0;
        }
        else
        {
            return 1;
        }
    }
    else if (y < 0)
    {
        return 2;
    }
    else
    {
        return 3;
    }
}
