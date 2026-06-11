#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

//! FE8U = 0x080CA26C
void OpAnimCharacterFlyOutBg1(struct ProcOpAnim * proc)
{
    int ret;

    if (proc->timer == 0xb)
    {
        SetDispEnable(1, 0, 0, 1, 1);

        SetBlendTargetA(1, 0, 0, 0, 0);
        SetBlendTargetB(0, 0, 0, 1, 0);
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x10, 0, 8);

        SetDispEnable(1, 0, 0, 1, 1);
    }

    if (proc->timer < 0xb)
    {
        ret = Interpolate(INTERPOLATE_SQUARE, 8, 0, proc->timer + 0x1e, 0x28);
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 16 - ret, 8);

        BG_EnableSyncByMask(BG1_SYNC_BIT);

        ret = ((DISPLAY_WIDTH - proc->unk40) + proc->unk42) +
            Interpolate(INTERPOLATE_LINEAR, 0, 0x60, proc->timer + 0x1e, 0x3c) +
            Interpolate(INTERPOLATE_SQUARE, 0, 0x60, proc->timer + 0x1e, 0x3c);

        if (proc->unk47 != 0)
        {
            TsaModifyFirstPalReverse(ret, proc->unk32, proc->unk44, 1, proc->unk48, proc->unk4C, 1);
        }
        else
        {
            TsaModifyFirstPalMaybe(ret, proc->unk32, proc->unk44, 1, proc->unk48, proc->unk4C, 1);
        }

        proc->unk32 = ret;
    }

    return;
}
