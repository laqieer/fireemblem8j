#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

#include "opanim.h"

/* prototypes for same-file helpers called by this run */
void OpAnim1_UpdateScroll(int new, int old);

//! FE8U = 0x080CA10C
void OpAnimCharacterFlyIn2(struct ProcOpAnim * proc)
{
    int ret;

    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;
    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    ret = Interpolate(1, 8, 0, proc->timer, 0x28);
    SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 16 - ret, 8);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    ret = Interpolate(INTERPOLATE_LINEAR, proc->unk40, proc->unk40 + 0x10, proc->timer, 0x1e);

    if (proc->unk47 != 0)
    {
        TsaModifyFirstPalMaybe(ret, proc->unk30, proc->unk44, 0, proc->unk48, proc->unk4C, 0);
    }
    else
    {
        TsaModifyFirstPalReverse(ret, proc->unk30, proc->unk44, 0, proc->unk48, proc->unk4C, 0);
    }

    proc->unk30 = ret;

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    ret = ((DISPLAY_WIDTH - proc->unk40) + proc->unk42) + Interpolate(INTERPOLATE_LINEAR, 0, 0x60, proc->timer, 0x3c) +
        Interpolate(INTERPOLATE_SQUARE, 0, 0x60, proc->timer, 0x3c);

    if (proc->unk47 != 0)
    {
        TsaModifyFirstPalReverse(ret, proc->unk32, proc->unk44, 1, proc->unk48, proc->unk4C, 1);
    }
    else
    {
        TsaModifyFirstPalMaybe(ret, proc->unk32, proc->unk44, 1, proc->unk48, proc->unk4C, 1);
    }

    proc->unk32 = ret;

    if (proc->timer == 0x1e)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}
