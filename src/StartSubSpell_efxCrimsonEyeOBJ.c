#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxCrimsonEyeOBJ[];

// clang-format on

//! FE8U = 0x0806ABCC
void StartSubSpell_efxCrimsonEyeOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxCrimsonEyeOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;

    if (GetAnimPosition(anim) == 0)
    {
        proc->unk32 = 88;
    }
    else
    {
        proc->unk32 = 152;
    }

    proc->unk3A = 72;

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            proc->unk32 -= 24;
        }
        else
        {
            proc->unk32 += 24;
        }
    }

    proc->unk32 -= 16;
    proc->unk3A -= 16;

    scr = AnimScr_EfxCrimsonEyeOBJ;

    proc->anim2 = frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);

    frontAnim->xPosition = proc->unk32;
    frontAnim->yPosition = proc->unk3A;
    frontAnim->oamBase = 0x3E000300;

    proc->anim3 = frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    frontAnim->xPosition = proc->unk32;
    frontAnim->yPosition = proc->unk3A;
    frontAnim->oamBase = 0x3C000300;

    proc->anim4 = frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    frontAnim->xPosition = proc->unk32;
    frontAnim->yPosition = proc->unk3A;
    frontAnim->oamBase = 0x3A000300;

    (struct Anim *)(proc->unk44) = frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    frontAnim->xPosition = proc->unk32;
    frontAnim->yPosition = proc->unk3A;
    frontAnim->oamBase = 0x38000300;

    (struct Anim *)(proc->unk48) = frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    frontAnim->xPosition = proc->unk32;
    frontAnim->yPosition = proc->unk3A;
    frontAnim->oamBase = 0x36000300;

    // clang-format off
    SetObjAffine(
        31,
        Div(+COS(0) * 16, 2),
        Div(-SIN(0) * 16, 2),
        Div(+SIN(0) * 16, 2),
        Div(+COS(0) * 16, 2)
    );

    SetObjAffine(
        30,
        Div(+COS(0) * 16, 2),
        Div(-SIN(0) * 16, 2),
        Div(+SIN(0) * 16, 2),
        Div(+COS(0) * 16, 2)
    );

    SetObjAffine(
        29,
        Div(+COS(0) * 16, 2),
        Div(-SIN(0) * 16, 2),
        Div(+SIN(0) * 16, 2),
        Div(+COS(0) * 16, 2)
    );

    SetObjAffine(
        28,
        Div(+COS(0) * 16, 2),
        Div(-SIN(0) * 16, 2),
        Div(+SIN(0) * 16, 2),
        Div(+COS(0) * 16, 2)
    );

    SetObjAffine(
        27,
        Div(+COS(0) * 16, 2),
        Div(-SIN(0) * 16, 2),
        Div(+SIN(0) * 16, 2),
        Div(+COS(0) * 16, 2)
    );
    // clang-format on

    SpellFx_RegisterObjPal(Pal_CrimsonEyeSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_CrimsonEyeSprites, 32 * 4 * CHR_SIZE);

    return;
}
