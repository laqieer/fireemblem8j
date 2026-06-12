#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxDarkGradoOBJ02piece[];

//! FE8U = 0x08069C18
void StartSubSpell_efxDarkGradoOBJ02piece_B(struct Anim * anim, int xOffset, int yPosition, int unk, int terminator)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkGradoOBJ02piece, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    proc->unk44 = unk;
    proc->unk48 = 0;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxDarkGradoOBJ02piece2_L, AnimScr_EfxDarkGradoOBJ02piece2_R, AnimScr_EfxDarkGradoOBJ02piece2_L, AnimScr_EfxDarkGradoOBJ02piece2_R);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = 120;
    frontAnim->yPosition = yPosition;

    if (GetAnimPosition(proc->anim) == 0)
    {
        frontAnim->xPosition -= xOffset;
    }
    else
    {
        frontAnim->xPosition += xOffset;
    }

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

    proc->unk32 = frontAnim->xPosition;
    proc->unk3A = frontAnim->yPosition;

    frontAnim->drawLayerPriority = 20;
    frontAnim->oam2Base |= OAM2_LAYER(3);
    AnimSort();

    return;
}
