#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxHurtmutOBJ[];

// clang-format on

//! FE8U = 0x0805CFC0
void StartSubSpell_efxHurtmutOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHurtmutOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 52;

    if (GetAnimPosition(anim) == 0)
    {
        scr = AnimScr_EfxBindingBlade_Left;
    }
    else
    {
        scr = AnimScr_EfxBindingBlade_Right;
    }

    proc->anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);

    SpellFx_RegisterObjPal(Pal_FireBreathSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BreathSprites, 32 * 4 * CHR_SIZE);

    return;
}
