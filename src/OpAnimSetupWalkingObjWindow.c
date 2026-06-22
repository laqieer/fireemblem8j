#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "opanim.h"

void OpAnimSetupWalkingObjWindow(void)
{
    Proc_EndEach(gUnkData_99);

    BG_SetPosition(BG_3, 0, 0);

    SetDispEnable(0, 0, 0, 1, 1);
    SetWinEnable(0, 0, 1);

    SetWObjLayers(0, 0, 0, 1, 1);
    SetWOutLayers(0, 0, 0, 0, 0);

    gLCDControlBuffer.wincnt.wobj_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetBlendConfig(BLEND_EFFECT_ALPHA, 4, 8, 8);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    return;
}
