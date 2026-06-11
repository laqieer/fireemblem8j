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



/* prototypes for same-file helpers called by this run */
void NewEfxHurtmutEff00OBJ(struct Anim *anim);
void NewEfxHurtmutEff01OBJ(struct Anim *anim);

void efxYushaSpinShieldOBJ_2(struct ProcEfxOBJ * proc)
{
    struct Anim *anim2 = proc->anim2;

    if (CheckEkrHitDone() != true)
        return;

    if (proc->unk29 == 0) {
        if (GetAnimPosition(proc->anim) == EKR_POS_L) {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ3_LeftTypeA;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ3_LeftTypeA;
        } else {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ3_RightTypeA;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ3_RightTypeA;
        }
    } else {
        if (GetAnimPosition(proc->anim) == EKR_POS_L) {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ3_LeftTypeB;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ3_LeftTypeB;
        } else {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ3_RightTypeB;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ3_RightTypeB;
        }
    }

    anim2->timer = 0;
    proc->timer = 0;
    Proc_Break(proc);
}

void efxYushaSpinShieldOBJ_3(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == 0x14) {
        proc->timer = 0;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

/**
 * C2C: banim_code_effect_sealed_sword_fire
 */
void NewEfxHurtmutEff00(struct Anim *anim)
{
    struct ProcEfx * proc;

    if (gEfxBgSemaphore != 0)
        return;
    
    proc = Proc_Start(ProcScr_efxHurtmutEff00, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    if (gEkrDistanceType == EKR_POS_L)
        NewEfxHurtmutEff00OBJ(anim);
    else
        NewEfxHurtmutEff01OBJ(anim);
}
