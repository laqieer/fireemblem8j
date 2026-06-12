#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

int efxCrimsonEyeOBJ_GetOffsetX(int index, int b);

//! FE8U = 0x0806A7C4
void efxCrimsonEyeOBJ_Loop_A(struct ProcEfxOBJ * proc)
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

        var = efxCrimsonEyeOBJ_WrapAngle(i * 18);
        efxCrimsonEyeOBJ_SetDrawPriority(anim, var);

        anim->xPosition = proc->unk32 + Interpolate(INTERPOLATE_RSQUARE, efxCrimsonEyeOBJ_GetOffsetX(var, 0), efxCrimsonEyeOBJ_GetOffsetX(var, 0x100), proc->timer, 0x10);
        anim->yPosition = proc->unk3A + Interpolate(INTERPOLATE_RSQUARE, efxCrimsonEyeOBJ_GetOffsetY(var, 0), efxCrimsonEyeOBJ_GetOffsetY(var, 0x100), proc->timer, 0x10);

        efxCrimsonEyeOBJ_SetAffineScale(index, Interpolate(INTERPOLATE_RSQUARE, 2, 0x100, proc->timer, 0x10), var);
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
