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

void EfxHpBarResire_WaitOnCurrentSide(struct ProcEfxHpBar * proc)
{
    GetAnimPosition(proc->anim_main_this);
    GetAnimPosition(proc->anim_main_this);

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

    if (proc->timer2 == 0x54 && proc->finished == true)
    {
        gEfxHpLutOff[GetAnimPosition(proc->anim_main_this)]++;
        gEkrHitNow[GetAnimPosition(proc->anim_main_this)] = 0;

        if (proc->next == 0)
            proc->death = true;

        proc->timer = 0;
        proc->cur = 10;
        gEfxHpBarResireFlag = 1;

        Proc_Break(proc);
        return;
    }

    if (++proc->timer2 >= 0x54u)
        proc->timer2 = 0x54;
}
