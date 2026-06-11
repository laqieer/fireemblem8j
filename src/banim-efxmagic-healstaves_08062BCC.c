#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxReblowOBJ[];

// clang-format on

//! FE8U = 0x08061ACC
void StartSubSpell_efxReblowOBJ(struct Anim * anim, u32 kind)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReblowOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk29 = kind;

    if (kind == 0)
    {
        proc->terminator = 43;
        proc->unk30 = 68;
    }
    else
    {
        proc->terminator = 31;
        proc->unk30 = 61;
    }

    return;
}

//! FE8U = 0x08061B14
void efxReblowOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim;
    int x;
    int y;
    u32 * scrA;
    u32 * scrB;

    proc->timer++;

    if (proc->timer != proc->terminator)
    {
        return;
    }

    proc->timer = 0;

    if (proc->unk29 == 0)
    {
        scrA = AnimScr_EfxReblowOBJ_Right1;
        scrB = AnimScr_EfxReblowOBJ_Left1;

        if (gEkrDistanceType != 0)
        {
            x = (GetAnimPosition(proc->anim) == 0) ? 104 : 136;
        }
        else
        {
            x = (GetAnimPosition(proc->anim) == 0) ? 128 : 112;
        }

        y = 78;
    }
    else
    {
        scrA = AnimScr_EfxReblowOBJ_Right2;
        scrB = AnimScr_EfxReblowOBJ_Left2;

        if (gEkrDistanceType != 0)
        {
            x = (GetAnimPosition(proc->anim) == 0) ? 164 : 76;
        }
        else
        {
            x = (GetAnimPosition(proc->anim) == 0) ? 140 : 100;
        }

        y = 64;
    }

    anim = EfxCreateFrontAnim(proc->anim, scrB, scrA, scrB, scrA);
    proc->anim2 = anim;
    anim->xPosition = x;
    anim->yPosition = y;

    Proc_Break(proc);

    return;
}
