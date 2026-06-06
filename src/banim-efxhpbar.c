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

void NewEfxNoDamage(struct Anim * anim1, struct Anim * anim2, int death)
{
    struct BattleUnit * bu;
    struct ProcEfxHpBar * proc;

    if (ANIM_ROUND_GREAT_SHIELD & GetRoundFlagByAnim(anim1))
        return;

    if (GetAnimPosition(anim1) == 0)
        bu = gpEkrBattleUnitRight;
    else
        bu = gpEkrBattleUnitLeft;

    if (GetItemIndex(bu->weaponBefore) != ITEM_MONSTER_STONE)
    {
        gEkrHpBarCount++;
        proc = Proc_Start(ProcScr_efxNoDamage, PROC_TREE_3);
        proc->anim_main_other = anim1;
        proc->anim_main_this = anim2;
        proc->timer = 0;
        proc->death = death;
        proc->anim_this = anim1;
        NewEfxDamageMojiEffect(proc->anim_main_other, 0);
        NewEfxNoDamageYure(proc->anim_main_other, proc->anim_main_this);
    }
}

void EfxNoDamageMain(struct ProcEfxHpBar * proc)
{
    s32 time;
    struct Anim * anim = GetAnimAnotherSide(proc->anim_main_other);

    ++proc->timer;
    time = proc->timer;
    if (time == 8)
    {
        gEfxHpLutOff[GetAnimPosition(proc->anim_main_other)]++;
    
        if (proc->death == true)
            gEfxHpLutOff[GetAnimPosition(anim)]++;
    
        Proc_Break(proc);
    }
}

void NewEfxNoDamageYure(struct Anim * anim1, struct Anim * anim2)
{
    struct ProcEfxHpBar *proc = Proc_Start(ProcScr_efxNoDamageYure, PROC_TREE_3);
    proc->anim_main_other = anim1;
    proc->anim_main_this = anim2;
    proc->timer = 0;
    proc->cur = 0;
}
