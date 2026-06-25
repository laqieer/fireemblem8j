#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

// clang-format off

extern struct ProcCmd ProcScr_efxDarkGradoOBJ01piece[];

/* prototypes for same-file helpers called by this run */
int efxDarkGradoGetPieceX(int a, int b, int c);
int efxDarkGradoGetPieceY(int a, int b, int c);

//! FE8U = 0x08069848
void NewEfxDarkGradoOBJ01piece(struct Anim * anim, s16 b, s16 c, s16 d, u16 e)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkGradoOBJ01piece, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 20;

    switch (b)
    {
        case 0:
            scr = AnimScr_EfxDarkGradoOBJ01piece1;
            break;

        case 1:
            scr = AnimScr_EfxDarkGradoOBJ01piece3;
            break;

        case 2:
            scr = AnimScr_EfxDarkGradoOBJ01piece2;
            break;

        default:
            scr = AnimScr_EfxDarkGradoOBJ01piece4;
            break;
    }

    proc->unk44 = c;
    proc->unk48 = d;
    proc->unk4C = e;

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(proc->anim) == 0)
    {
        proc->unk32 = 88;
    }
    else
    {
        proc->unk32 = 152;
    }

    proc->unk3A = 80;

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

    if (GetAnimPosition(proc->anim) == 0)
    {
        frontAnim->xPosition = proc->unk32 + efxDarkGradoGetPieceX(proc->timer, proc->unk44, proc->unk48);
    }
    else
    {
        frontAnim->xPosition = proc->unk32 - efxDarkGradoGetPieceX(proc->timer, proc->unk44, proc->unk48);
    }

    frontAnim->yPosition = proc->unk3A + efxDarkGradoGetPieceY(proc->timer, proc->unk44, proc->unk48);

    return;
}
