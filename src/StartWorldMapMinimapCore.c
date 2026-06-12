#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GmapRader[];

// clang-format on

//! FE8U = 0x080C3DAC
void StartWorldMapMinimapCore(struct Proc * proc)
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

    Decompress(Img_WorldmapMinimap, (void *)0x06003C00);

    ApplyPalette(Pal_WorldmapMinimap, 7);
    ApplyPalette(gPal_GMapPI_ShopIcons, 0x19);
    EnablePaletteSync();

    Proc_Start(ProcScr_GmapRader, proc->proc_parent);

    return;
}
