#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "ekrdragon.h"
#include "bmlib.h"
#include "hardware.h"
#include "ctc.h"
#include "efxbattle.h"

void efxQuake_Loop(struct ProcEfxQuake * proc)
{
    int x1;
    int y1;
    int x2;
    int y2;

    const s16 * vec = proc->vec;

    if (vec[proc->timer * 2 + 0] == INT16_MAX)
    {
        x1 = gEkrXPosReal[0] - gEkrBgPosition;
        y1 = gEkrYPosReal[0];
        x2 = gEkrXPosReal[1] - gEkrBgPosition;
        y2 = gEkrYPosReal[1];

        SetEkrFrontAnimPostion(0, x1, y1);
        SetEkrFrontAnimPostion(1, x2, y2);

        BG_SetPosition(BG_2, 0, 0);

        if (GetBanimDragonStatusType() != 0)
        {
            BG_SetPosition(BG_3, proc->ix, proc->iy);
            SetEkrBg2QuakeVec(0, 0);
        }

        gEfxQuakeExist = 0;
        Proc_End(proc);
    }
    else
    {
        SetEkrBg2QuakeVec(vec[proc->timer * 2 + 0], vec[proc->timer * 2 + 1]);
        proc->timer++;

        BG_SetPosition(BG_2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);

        if (GetBanimDragonStatusType() != 0)
        {
            BG_SetPosition(BG_3, proc->ix + gEkrBg2QuakeVec.x, proc->iy + gEkrBg2QuakeVec.y);
        }

        if (GetBanimDragonStatusType() != 0)
        {
            x1 = (gEkrXPosReal[0] - gEkrBg2QuakeVec.x) - gEkrBgPosition;
            y1 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y;
        }
        else
        {
            x1 = (gEkrXPosReal[0] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
            y1 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y;
        }

        x2 = (gEkrXPosReal[1] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
        y2 = gEkrYPosReal[1] - gEkrBg2QuakeVec.y;

        switch (gEkrDistanceType) {
        case EKR_DISTANCE_CLOSE:
            SetEkrFrontAnimPostion(0, x1, y1);
            SetEkrFrontAnimPostion(1, x2, y2);
            break;

        case EKR_DISTANCE_FAR:
        case EKR_DISTANCE_FARFAR:
            if (GetAnimPosition(proc->anim_l) == 0)
                SetEkrFrontAnimPostion(0, x1, y1);
            else
                SetEkrFrontAnimPostion(1, x2, y2);

            break;
        }
    }

    return;
}
