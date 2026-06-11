#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

//! FE8U = 0x080C9FF8
void OpAnimCharacterFlyIn1(struct ProcOpAnim * proc)
{
    int ret;

    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;
    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    ret = Interpolate(INTERPOLATE_RSQUARE, 0, proc->unk40, proc->timer, 0x1e);

    if (proc->unk47 != 0)
    {
        TsaModifyFirstPalMaybe(ret, proc->unk30, proc->unk44, 0, proc->unk48, proc->unk4C, 0);
    }
    else
    {
        TsaModifyFirstPalReverse(ret, proc->unk30, proc->unk44, 0, proc->unk48, proc->unk4C, 0);
    }

    proc->unk30 = ret;

    if (proc->timer == 0x1e)
    {
        BG_EnableSyncByMask(BG1_SYNC_BIT);

        proc->unk32 = (proc->unk42 + DISPLAY_WIDTH) - proc->unk40;

        if (proc->unk47 != 0)
        {
            TsaModifyFirstPalReverse(proc->unk32, 0, proc->unk44, 1, proc->unk48, proc->unk4C, 1);
        }
        else
        {
            TsaModifyFirstPalMaybe(proc->unk32, 0, proc->unk44, 1, proc->unk48, proc->unk4C, 1);
        }

        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}
