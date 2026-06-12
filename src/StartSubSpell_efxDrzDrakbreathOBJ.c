#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxDrzDrakbreathOBJ[];

//! FE8U = 0x080688C0
void StartSubSpell_efxDrzDrakbreathOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDrzDrakbreathOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 52;

    if (GetAnimPosition(anim) == 0)
    {
        scr = AnimScr_FirebreathOBJ_Left;
    }
    else
    {
        scr = AnimScr_FirebreathOBJ_Right;
    }

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    if (gEkrDistanceType == 0)
    {
        if (GetAnimPosition(anim) == 0)
        {
            frontAnim->xPosition += 16;
        }
        else
        {
            frontAnim->xPosition -= 16;
        }
    }
    else
    {
        if (GetAnimPosition(anim) == 0)
        {
            frontAnim->xPosition += 72;
        }
        else
        {
            frontAnim->xPosition -= 72;
        }
    }

    SpellFx_RegisterObjPal(Pal_WretchedAirSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BreathSprites, 32 * 4 * CHR_SIZE);

    return;
}
