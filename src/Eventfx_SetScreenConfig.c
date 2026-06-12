#include "global.h"
#include "bmfx.h"
#include "ap.h"
#include "proc.h"
#include "bmlib.h"
#include "bmunit.h"
#include "mapanim.h"
#include "hardware.h"
#include "constants/songs.h"

/**
 * a shinning stone anime effect
 * seems unused
 */

void Eventfx_SetScreenConfig(void)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);
}
