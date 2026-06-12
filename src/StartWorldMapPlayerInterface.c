#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "face.h"
#include "bmlib.h"
#include "uiutils.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GMapPlayerInterface[];

// clang-format on

//! FE8U = 0x080BF048
void StartWorldMapPlayerInterface(struct Proc * parent)
{
    SetWinEnable(0, 0, 0);
    SetWOutLayers(1, 1, 1, 1, 1);
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);

    SetBlendAlpha(14, 3);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);
    SetBlendBackdropA(0);

    Decompress(gGfx_GMapPI_LevelNums, gGenericBuffer);
    Copy2dChr(gGenericBuffer, (void *)0x06004660, 13, 2);
    ApplyPalette(gPal_GMapPI_LevelNums, 5);

    Decompress(gGfx_GMapPI_ShopIcons, (void *)0x06004620);
    ApplyPalette(gPal_GMapPI_ShopIcons, 3);

    ResetTextFont();
    Proc_Start(ProcScr_GMapPlayerInterface, parent->proc_parent);

    return;
}
