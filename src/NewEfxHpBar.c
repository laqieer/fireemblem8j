#include "global.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "anime.h"
#include "ekrlevelup.h"
#include "bmitem.h"
#include "proc.h"
#include "banim_data.h"
#include "ekrdragon.h"
#include "eventinfo.h"
#include "constants/items.h"
#include "constants/songs.h"

/* During dmage, cause hp bar change value effect */
void NewEfxHpBar(struct Anim * anim)
{
    s16 off_this;
    int off_next;
    struct ProcEfxHpBar * proc;

    if (ANIM_ROUND_GREAT_SHIELD & GetRoundFlagByAnim(anim) || gEkrHpBarCount != 0)
        return;

    gEkrHpBarCount = 1;

    proc = Proc_Start((const struct ProcCmd *)0x085E37E4, PROC_TREE_3);
    proc->anim_this = anim;

    if (GetAnimPosition(anim) == EKR_POS_L)
    {
        proc->anim_main_other = gAnims[EKR_POS_R * 2];
        proc->anim_main_this  = gAnims[EKR_POS_L * 2];
    }
    else
    {
        proc->anim_main_other = gAnims[EKR_POS_L * 2];
        proc->anim_main_this  = gAnims[EKR_POS_R * 2];
    }

    off_this = gEfxHpLutOff[GetAnimPosition(proc->anim_main_this)];
    off_next = (s16)(off_this + 1);

    proc->this = GetEfxHp(off_this * 2 + GetAnimPosition(proc->anim_main_this));
    proc->next = GetEfxHp(off_next * 2 + GetAnimPosition(proc->anim_main_this));

    if (proc->this > proc->next)
        proc->diff = -1;
    else
        proc->diff = 1;

    proc->timer = 0;
    proc->cur = proc->this;
    proc->timer2 = 0;
    proc->finished = false;
    gEkrHitNow[GetAnimPosition(proc->anim_main_this)] = 1;
}
