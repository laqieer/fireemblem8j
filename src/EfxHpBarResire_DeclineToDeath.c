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

void EfxHpBarResire_DeclineToDeath(struct ProcEfxHpBar * proc)
{
    struct Anim * anim_main_other_f, * anim_main_other_b, * anim_main_this_f, * anim_main_this_b;

    anim_main_other_f = gAnims[GetAnimPosition(proc->anim_main_other) * 2];
    anim_main_other_b = gAnims[GetAnimPosition(proc->anim_main_other) * 2 + 1];
    anim_main_this_f  = gAnims[GetAnimPosition(proc->anim_main_this) * 2];
    anim_main_this_b  = gAnims[GetAnimPosition(proc->anim_main_this) * 2 + 1];

    if (proc->finished == false)
    {
        if (++proc->timer == 4)
        {
            proc->timer = 0;
            proc->cur += proc->diff;
            gEkrGaugeHp[GetAnimPosition(proc->anim_main_other)] += proc->diff;
            EfxPlaySE(SONG_75, 0x100);
            M4aPlayWithPostionCtrl(SONG_75, anim_main_other_f->xPosition, 1);

            if (proc->cur == proc->next)
                proc->finished = true;
        }
    }

    if (proc->timer2 == 30 && proc->finished == true)
    {
        gEfxHpLutOff[GetAnimPosition(proc->anim_main_other)]++;
        gEkrHitNow[GetAnimPosition(proc->anim_main_other)] = 0;
    
        if (proc->death == true)
        {
            int ret;
            if (GetBanimLinkArenaFlag() == true)
                ret = 0;
            else
                ret = CheckBattleDefeatTalk(gEkrPids[GetAnimPosition(anim_main_this_f)]);

            if (ret == true)
                NewEfxDeadEvent(anim_main_this_f, anim_main_this_b);
            else
            {
                PlayDeathSoundForArena();
                NewEfxDead(anim_main_this_f, anim_main_this_b);
                gBanimValid[GetAnimPosition(proc->anim_main_this)] = false;
            }
        }
    
        Proc_Break(proc);
        return;
    }

    if (++proc->timer2 >= 0x1Eu)
        proc->timer2 = 0x1E;
}
