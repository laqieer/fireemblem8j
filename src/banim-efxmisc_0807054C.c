#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"
#include "ctc.h"
#include "constants/terrains.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmlib.h"
#include "constants/songs.h"

/**
 * Misc banim effects
 */



void EfxChillAnime_Loop(struct ProcEfxOBJ * proc)
{
    struct Anim *_anim1, *_anim2;
    proc->anim2->xPosition = proc->anim->xPosition;

    if (++proc->timer == 0x14) {
        SetAnimStateUnHidden(GetAnimPosition(proc->anim));
        AnimDelete(proc->anim2);
        gEkrbattle_0[GetAnimPosition(proc->anim)] = NULL;
        
        _anim1 = gAnims[GetAnimPosition(proc->anim) * 2];
        _anim2 = gAnims[GetAnimPosition(proc->anim) * 2 + 1];

        _anim1->state3 |= ANIM_BIT3_BLOCKEND;
        _anim2->state3 |= ANIM_BIT3_BLOCKEND;
        Proc_Break(proc);
    }
}
