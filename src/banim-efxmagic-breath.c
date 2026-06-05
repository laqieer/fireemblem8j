#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



// clang-format on

//! FE8U = 0x0805D6CC
void StartSubSpell_efxDarkbreathOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkbreathOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 55;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_DarkBreath_Close, AnimScr_DarkBreath_Close, AnimScr_DarkBreath_Far, AnimScr_DarkBreath_Far);
    proc->anim2 = frontAnim;

    proc->unk32 = 20;
    proc->unk3A = -4;

    if (gEkrDistanceType != 0)
    {
        proc->unk32 = 44;
    }

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition += proc->unk32;
        frontAnim->yPosition += proc->unk3A;
    }
    else
    {
        frontAnim->xPosition -= proc->unk32;
        frontAnim->yPosition += proc->unk3A;
    }

    SpellFx_RegisterObjPal(Pal_DarkBreathSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BreathSprites, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x0805D774
void efxDarkbreathOBJ_Loop(struct ProcEfxOBJ * proc)
{
    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            proc->anim2->xPosition = proc->anim->xPosition + proc->unk32;
        }
        else
        {
            proc->anim2->xPosition = proc->anim->xPosition - proc->unk32;
        }
    }

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
