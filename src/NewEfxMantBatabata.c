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




void NewEfxMantBatabata(struct Anim *anim)
{
    s16 banim_index;
    u32 *scr1, *scr2;
    struct ProcEfxOBJ * proc;
    struct Anim *anim2;

    banim_index = gBanimIdx[GetAnimPosition(anim)] - 0x6A;
    switch (banim_index) {
    case 0x2:
    case 0x4:
        scr1 = AnimScr_EfxMantBatabata2_R;
        scr2 = AnimScr_EfxMantBatabata2_L;
        break;

    case 0xA:
    case 0xB:
        scr1 = AnimScr_EfxMantBatabata3_R;
        scr2 = AnimScr_EfxMantBatabata3_L;
        break;

    case 0x2A:
        scr1 = AnimScr_EfxMantBatabata4_R;
        scr2 = AnimScr_EfxMantBatabata4_L;
        break;

    case 0x32:
    case 0x33:
        scr1 = AnimScr_EfxMantBatabata5_R;
        scr2 = AnimScr_EfxMantBatabata5_L;
        break;

    case 0x4F:
    case 0x50:
        scr1 = AnimScr_EfxMantBatabata6_R;
        scr2 = AnimScr_EfxMantBatabata6_L;
        break;

    case 0x51:
        scr1 = AnimScr_EfxMantBatabata7_R;
        scr2 = AnimScr_EfxMantBatabata7_L;
        break;

    case 0x0:
    case 0x1:
    default:
        scr1 = AnimScr_EfxMantBatabata1_R;
        scr2 = AnimScr_EfxMantBatabata1_L;
        break;
    }

    proc = Proc_Start(ProcScr_efxMantBatabata, PROC_TREE_3);
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
