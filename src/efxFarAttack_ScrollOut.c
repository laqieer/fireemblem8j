#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "ekrdragon.h"
#include "bmlib.h"
#include "hardware.h"
#include "ctc.h"
#include "efxbattle.h"

void EfxFarAttack_SetAnimXPositions(struct ProcEfxFarAttack * unused, int x);

//! FE8U = 0x08053584
void efxFarAttack_ScrollOut(struct ProcEfxFarAttack * proc)
{
    u32 ret = Interpolate(INTERPOLATE_RSQUARE, proc->unk_36, proc->unk_38, proc->timer, proc->terminator);
    gEkrBgPosition = ret;

    EfxFarAttack_SetAnimXPositions(proc, ret);
    EkrDragonTmCpyExt(gEkrBgPosition, 0);
    EfxUpdateBg2Scroll(gEkrBgPosition);

    if (GetBattleAnimArenaFlag() != 0)
    {
        EkrArenaBgScroll(gEkrBgPosition);
    }

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        if (proc->pos == POS_L)
            gEkrInitPosReal = POS_R;
        else
            gEkrInitPosReal = POS_L;

        gEfxFarAttackExist = false;

        Proc_Break(proc);
    }

    return;
}
