#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

#include "opanim.h"

//! FE8U = 0x080C9EE8
void OpAnimCharacterScrollOutBegin(void)
{
    CopyToPalOpAnim(pal_OpanimGfx_0, 0, 0x100);

    SetBlendConfig(BLEND_EFFECT_ALPHA, 0, 0x10, 8);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetDispEnable(0, 0, 1, 1, 1);

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    return;
}
