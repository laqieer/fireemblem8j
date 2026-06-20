#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

void OpAnimApplyScrollPalettes(u8 type)
{
    SetDefaultColorEffects();

    if (type == 0)
    {
        SetDispEnable(0, 0, 1, 0, 0);
    }
    else
    {
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;

        SetDispEnable(0, 1, 1, 0, 0);

        SetBackgroundTileDataOffset(BG_1, 0x4000);
        SetBackgroundMapDataOffset(BG_1, 0xF000);

        SetBlendTargetA(0, 1, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 0, 0);

        ApplyPalettesOpAnim(Pal_OpAnimShiningRing, 8, 4);

        BG_SetPosition(BG_1, 0, 0);
        SetWinEnable(0, 0, 0);
    }

    SetBackgroundTileDataOffset(BG_2, 0x8000);
    SetBackgroundMapDataOffset(BG_2, 0xE800);
    ApplyPalettesOpAnim(pal_OpanimGfx_0, 0, 8);
}
