#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "ekrdragon.h"
#include "bmlib.h"
#include "hardware.h"
#include "ctc.h"
#include "efxbattle.h"

void EfxFarAttack_SetAnimXPositions(struct ProcEfxFarAttack * unused, int x);

//! FE8U = 0x08053514
void efxFarAttack_ScrollIn(struct ProcEfxFarAttack * proc)
{
    u32 ret = Interpolate(INTERPOLATE_SQUARE, proc->unk_32, proc->unk_34, proc->timer, proc->unk_2e);
    gEkrBgPosition = ret;

    EfxFarAttack_SetAnimXPositions(proc, ret);
    EkrDragonTmCpyExt(gEkrBgPosition, 0);
    EfxUpdateBg2Scroll(gEkrBgPosition);

    if (GetBattleAnimArenaFlag() != 0)
    {
        EkrArenaBgScroll(gEkrBgPosition);
    }

    proc->timer++;

    if (proc->timer > proc->unk_2e)
    {
        proc->timer = 1;
        Proc_Break(proc);
    }

    return;
}
