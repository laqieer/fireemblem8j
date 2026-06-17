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




void NewEfxAvoid(struct Anim * anim)
{
    s16 off_this, off_next;
    struct ProcEfxHpBar * proc;

    if (gEkrHpBarCount != 0)
        return;

    gEkrHpBarCount = 1;

    proc = Proc_Start(ProcScr_EfxAvoid, PROC_TREE_3);
    proc->timer = 0;

    if (GetAnimPosition(anim) == POS_L)
    {
        proc->anim_main_other = gAnims[2];
        proc->anim_main_this = gAnims[0];
    }
    else
    {
        proc->anim_main_other = gAnims[0];
        proc->anim_main_this = gAnims[2];
    }

    NewEfxDamageMojiEffect(proc->anim_main_this, 1);
    proc->anim_this = anim;
    proc->death = false;
    EfxPlaySE(SONG_D7, 0x100);
    M4aPlayWithPostionCtrl(SONG_D7, anim->xPosition, 1);
}
