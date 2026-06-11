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

void EfxHPBarLiveMain(struct ProcEfxHpBar * proc)
{
    struct Anim * anim = proc->anim_main_this;

    if (proc->finished == false)
    {
        if (++proc->timer == 4)
        {
            proc->timer = 0;
            proc->cur += proc->diff;
            gEkrGaugeHp[GetAnimPosition(anim)] += proc->diff;

            EfxPlaySE(SONG_75, 0x100);
            M4aPlayWithPostionCtrl(SONG_75, anim->xPosition, 1);

            if (proc->cur == proc->next)
                proc->finished = true;
        }
    }

    if (proc->timer2 == 0x1E && proc->finished == true)
    {
        gEfxHpLutOff[GetAnimPosition(anim)]++;
        gEkrHitNow[GetAnimPosition(anim)] = 0;
        Proc_Break(proc);
        return;
    }

    if (++proc->timer2 >= 0x1Eu)
        proc->timer2 = 0x1E;
}
