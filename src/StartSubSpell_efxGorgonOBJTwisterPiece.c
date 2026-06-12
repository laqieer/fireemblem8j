#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxGorgonOBJTwisterPiece[];

// clang-format on

//! FE8U = 0x0806BC98
void StartSubSpell_efxGorgonOBJTwisterPiece(struct Anim * anim, int flag, int c, int terminator)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxGorgonOBJTwisterPiece, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;
    proc->unk44 = c;

    scr = AnimScr_EfxCrimsonEyeOBJ;
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

    frontAnim->yPosition = 88;

    if (gEkrDistanceType == 1)
    {

        if (GetAnimPosition(proc->anim) == 0)
        {
            frontAnim->xPosition -= 0x18;
        }
        else
        {
            frontAnim->xPosition += 0x18;
        }
    }

    switch (proc->unk44)
    {
        case 0:
            frontAnim->xPosition -= 12;
            break;

        case 1:
            frontAnim->xPosition -= 24;
            break;

        case 2:
            frontAnim->xPosition -= 36;
            break;

        case 3:
            frontAnim->xPosition += 12;
            break;

        case 4:
            frontAnim->xPosition += 24;
            break;

        case 5:
            frontAnim->xPosition += 36;
            break;
    }

    if (flag == 0)
    {
        frontAnim->oamBase = 0x3E000100;
    }
    else
    {
        frontAnim->oamBase = 0x3C000100;
    }

    return;
}
