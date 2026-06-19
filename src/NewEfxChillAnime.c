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




void NewEfxChillAnime(struct Anim *anim, int arg1)
{
    u32 *scr1, *scr2;
    struct ProcEfxOBJ * proc;
    struct Anim *anim2;

    if (arg1 == 0) {
        scr1 = AnimScr_EfxChill_R;
        scr2 = AnimScr_EfxChill_L;
    }

    proc = Proc_Start(ProcScr_efxChillAnime, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;
    gEkrbattle_0[GetAnimPosition(proc->anim)] = proc->anim2;

    anim2->oam2Base &= 0xC00;

    anim2->drawLayerPriority = 0x64;
    AnimSort();

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7200;
    else
        anim2->oam2Base |= 0x9300;
    
    SetAnimStateHidden(GetAnimPosition(proc->anim));
}
