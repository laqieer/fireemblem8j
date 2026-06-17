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

void EfxHpBar_DeclineToDeath(struct ProcEfxHpBar * proc)
{
    struct Anim * anim_f = gAnims[GetAnimPosition(proc->anim_main_this) * 2];
    struct Anim * anim_b = gAnims[GetAnimPosition(proc->anim_main_this) * 2 + 1];

    if (proc->finished == false)
    {
        if (++proc->timer == 2)
        {
            proc->timer = 0;
            proc->cur += proc->diff;
            gEkrGaugeHp[GetAnimPosition(proc->anim_main_this)] += proc->diff;

            if (proc->cur == proc->next)
                proc->finished = true;
        }
    }

    if (proc->timer2 == 0x1E && proc->finished == true)
    {
        gEfxHpLutOff[GetAnimPosition(proc->anim_main_this)]++;
        gEkrHitNow[GetAnimPosition(proc->anim_main_this)] = 0;
    
        if (proc->next == 0)
        {
            int ret;
            if (GetBanimLinkArenaFlag() == true)
                ret = 0;
            else
                ret = CheckBattleDefeatTalk(gEkrPids[GetAnimPosition(anim_f)]);

            if (ret == true)
                NewEfxDeadEvent(anim_f, anim_b);
            else
            {
                PlayDeathSoundForArena();
                NewEfxDead(anim_f, anim_b);
                gBanimValid[GetAnimPosition(proc->anim_main_this)] = false;
            }
        }

        Proc_Break(proc);
        return;
    }

    if (++proc->timer2 >= 0x1Eu)
        proc->timer2 = 0x1E;
}
