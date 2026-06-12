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
void efxCrimsonEyeOBJ_SetAffineScale(int index, int denom, int c);
int efxCrimsonEyeOBJ_GetOffsetX(int index, int b);
int efxCrimsonEyeOBJ_GetOffsetY(int index, int b);

//! FE8U = 0x0806A8E8
void efxCrimsonEyeOBJ_Loop_B(struct ProcEfxOBJ * proc)
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

        anim->xPosition = proc->unk32 + efxCrimsonEyeOBJ_GetOffsetX(var, 0x100);
        anim->yPosition = proc->unk3A + efxCrimsonEyeOBJ_GetOffsetY(var, 0x100);

        efxCrimsonEyeOBJ_SetAffineScale(index, 0x100, var);
    }

    AnimSort();

    proc->terminator++;

    proc->timer++;

    if (proc->timer == 126)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}
