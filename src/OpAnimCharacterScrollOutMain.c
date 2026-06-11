#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

//! FE8U = 0x080C9F7C
void OpAnimCharacterScrollOutMain(struct ProcOpAnim * proc)
{
    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    if (proc->timer < 0x11)
    {
        int bldAmt = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, 0x10);

        gLCDControlBuffer.blendCoeffA = bldAmt;
        gLCDControlBuffer.blendCoeffB = 16 - bldAmt;

        if (proc->timer == 0x10)
        {
            proc->timer = 0;
            Proc_Break(proc);
            return;
        }
    }

    proc->timer++;

    return;
}
