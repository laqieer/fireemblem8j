#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



/* prototypes for same-file helpers called by this run */
int efxCrimsonEyeOBJ_WrapAngle(int a);
void efxCrimsonEyeOBJ_SetDrawPriority(struct Anim * anim, u32 b);
int efxCrimsonEyeOBJ_GetAdjustedOffsetX(int a, int b);
int efxCrimsonEyeOBJ_GetAdjustedOffsetY(int a, int b);
void efxCrimsonEyeOBJ_SetAffineScaleEx(int index, int b, int c);

//! FE8U = 0x0806AAA0
void efxCrimsonEyeOBJ_Loop_D(struct ProcEfxOBJ * proc)
{
    struct Anim * anim;
    int index;
    int i;
    int var;

    for (i = 0; i < 5; i++)
    {
        switch (i)
        {
            case 0:
                anim = proc->anim2;
                index = 31;
                break;

            case 1:
                anim = proc->anim3;
                index = 30;
                break;

            case 2:
                anim = proc->anim4;
                index = 29;
                break;

            case 3:
                anim = (struct Anim *)proc->unk44;
                index = 28;
                break;

            case 4:
                anim = (struct Anim *)proc->unk48;
                index = 27;
                break;
        }

        var = i * 18 + proc->terminator;
        var = efxCrimsonEyeOBJ_WrapAngle(var);

        efxCrimsonEyeOBJ_SetDrawPriority(anim, var);

        anim->xPosition = proc->unk32 + Interpolate(INTERPOLATE_SQUARE, efxCrimsonEyeOBJ_GetAdjustedOffsetX(24, var), 0, proc->timer, 8);
        anim->yPosition = proc->unk3A + Interpolate(INTERPOLATE_SQUARE, efxCrimsonEyeOBJ_GetAdjustedOffsetY(24, var), 0, proc->timer, 8);

        efxCrimsonEyeOBJ_SetAffineScaleEx(index, Interpolate(INTERPOLATE_SQUARE, 24, 0, proc->timer, 8), var);
    }

    AnimSort();

    proc->timer++;

    if (proc->timer == 8)
    {
        gEfxBgSemaphore--;

        AnimDelete(proc->anim2);
        AnimDelete(proc->anim3);
        AnimDelete(proc->anim4);
        AnimDelete((struct Anim *)(proc->unk44));
        AnimDelete((struct Anim *)(proc->unk48));

        Proc_Break(proc);
    }

    return;
}
