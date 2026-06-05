#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



//! FE8U = 0x08064568
void efxExcaliburBG_Loop_A(struct ProcEfxBG * proc)
{
    if (GetAnimPosition(proc->anim) == 0)
    {
        EfxTmCpyBgHFlip(gEkrTsaBuffer, gBG1TilemapBuffer, 32, 32, 1, 0x100);
    }
    else
    {
        EfxTmCpyBG(gEkrTsaBuffer, gBG1TilemapBuffer, 32, 32, 1, 0x100);
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        proc->timer = 0;
        proc->terminator = 6;
        proc->unk32 = 0;

        if (GetAnimPosition(proc->anim) == 0)
        {
            proc->unk34 = +128;
        }
        else
        {
            proc->unk34 = -128;
        }

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080645FC
void efxExcaliburBG_Loop_B(struct ProcEfxBG * proc)
{
    gLCDControlBuffer.bgoffset[BG_1].x =
        Interpolate(INTERPOLATE_LINEAR, proc->unk32, proc->unk34, proc->timer, proc->terminator);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        proc->timer = 0;
        proc->terminator = 12;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0806464C
void efxExcaliburBG_Loop_C(struct ProcEfxBG * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}
