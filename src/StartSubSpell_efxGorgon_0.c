#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_EfxmagicDemonsurge_0[];

// clang-format on

//! FE8U = 0x0806B680
void StartSubSpell_efxGorgon_0(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_EfxmagicDemonsurge_0, PROC_TREE_3);
    proc->anim = anim;

    scr = AnimScr_efxGorgon;
    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(proc->anim) == 0)
    {
        frontAnim->xPosition = 88;
    }
    else
    {
        frontAnim->xPosition = 152;
    }

    frontAnim->yPosition = 84;

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            frontAnim->xPosition -= 24;
        }
        else
        {
            frontAnim->xPosition += 24;
        }
    }

    if ((GetBanimDragonStatusType() == 1) || (GetBanimDragonStatusType() == 2))
    {
        frontAnim->oam2Base |= 0xc00;
    }

    frontAnim->drawLayerPriority = 20;

    AnimSort();

    SpellFx_RegisterObjGfx(Img_efxGorgon, 32 * 4 * CHR_SIZE);
    SpellFx_RegisterObjPal(Pal_efxGorgon, PLTT_SIZE_4BPP);

    return;
}
