#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxGorgonOBJTwister[];

// clang-format on

//! FE8U = 0x0806BEEC
void StartSubSpell_efxGorgonOBJTwister(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxGorgonOBJTwister, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

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

    // clang-format off
    SetObjAffine(
        31,
        Div(+COS(0) * 16, 128),
        Div(-SIN(0) * 16, 128),
        Div(+SIN(0) * 16, 128),
        Div(+COS(0) * 16, 128)
    );

    SetObjAffine(
        30,
        Div(+COS(0) * 16, 256),
        Div(-SIN(0) * 16, 256),
        Div(+SIN(0) * 16, 256),
        Div(+COS(0) * 16, 256)
    );
    // clang-format on

    SpellFx_RegisterObjPal(Pal_CrimsonEyeSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_CrimsonEyeSprites, 32 * 4 * CHR_SIZE);

    return;
}
