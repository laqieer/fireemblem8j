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

//! FE8U = 0x0808CFC4
void InitPlayerPhaseInterface(void)
{
    SetWinEnable(0, 0, 0);
    SetWOutLayers(1, 1, 1, 1, 1);
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);

    SetBlendAlpha(13, 3);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendBackdropA(0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    Decompress(gGfx_PlayerInterfaceFontTiles, BG_CHR_ADDR(0x100));
    Decompress(gGfx_PlayerInterfaceNumbers, OBJ_CHR_ADDR(0x2E0));

    CpuFastCopy(BG_CHR_ADDR(0x175), OBJ_CHR_ADDR(0x2EA), CHR_SIZE);

    ApplyPalette(gPaletteBuffer, 0x18);

    LoadIconPalette(1, 2);

    ResetTextFont();

    if (gPlaySt.config.disableTerrainDisplay == 0)
    {
        Proc_Start(gProcScr_TerrainDisplay, PROC_TREE_3);
    }

    if (gBmSt.gameStateBits & BM_FLAG_PREPSCREEN)
    {
        Proc_Start(gProcScr_PrepMap_MenuButtonDisplay, PROC_TREE_3);
    }
    else
    {
        if ((gPlaySt.config.disableGoalDisplay == 0) && (CheckFlag(EVFLAG_OBJWINDOW_DISABLE) == 0))
        {
            Proc_Start(gProcScr_GoalDisplay, PROC_TREE_3);
        }
    }

    if (gPlaySt.config.unitDisplayType == 0)
    {
        Proc_Start(gProcScr_UnitDisplay_MinimugBox, PROC_TREE_3);
    }

    if (gPlaySt.config.unitDisplayType == 1)
    {
        Proc_Start(gProcScr_UnitDisplay_Burst, PROC_TREE_3);
    }

    return;
}

//! FE8U = 0x0808D13C
void StartPlayerPhaseSideWindows(void)
{
    Proc_Start(gProcScr_SideWindowMaker, PROC_TREE_3);
    return;
}

//! FE8U = 0x0808D150
void EndPlayerPhaseSideWindows(void)
{
    Proc_EndEach(gProcScr_UnitDisplay_MinimugBox);
    Proc_EndEach(gProcScr_UnitDisplay_Burst);
    Proc_EndEach(gProcScr_TerrainDisplay);
    Proc_EndEach(gProcScr_GoalDisplay);
    Proc_EndEach(gProcScr_PrepMap_MenuButtonDisplay);

    SetDefaultColorEffects();

    ClearBg0Bg1();

    return;
}
