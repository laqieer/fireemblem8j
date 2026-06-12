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

//! FE8U = 0x0806A9C4
void efxCrimsonEyeOBJ_Loop_C(struct ProcEfxOBJ * proc)
{
    struct Anim * anim;
    int index;
    int i;
    int var;

    int ret = Interpolate(INTERPOLATE_RSQUARE, 0, 24, proc->timer, 16);

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

        anim->xPosition = proc->unk32 + efxCrimsonEyeOBJ_GetAdjustedOffsetX(ret, var);
        anim->yPosition = proc->unk3A + efxCrimsonEyeOBJ_GetAdjustedOffsetY(ret, var);

        efxCrimsonEyeOBJ_SetAffineScaleEx(index, ret, var);
    }

    AnimSort();

    proc->timer++;

    if (proc->timer == 16)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}
