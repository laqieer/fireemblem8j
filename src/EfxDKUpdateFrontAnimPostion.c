#include "global.h"
#include "gbafe.h"

void EfxDKUpdateFrontAnimPostion(struct ProcEfxDKfx * proc)
{
    int val1, val2, val3, val4;

    if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL) {
        val1 = gEkrXPosReal[0] - gEkrBg2QuakeVec.x - gEkrBgPosition - gUnk_76;
        val2 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y - gUnk_77;
    } else {
        val1 = gEkrXPosReal[0] + gEkrBg2QuakeVec.x - gEkrBgPosition;
        val2 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y;
    }

    val3 = gEkrXPosReal[1] + gEkrBg2QuakeVec.x - gEkrBgPosition - gUnk_76;
    val4 = gEkrYPosReal[1] - gEkrBg2QuakeVec.y - gUnk_77;

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
        SetEkrFrontAnimPostion(0, val1, val2);
        SetEkrFrontAnimPostion(1, val3, val4);
        break;

    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
        if (GetAnimPosition(proc->anim) == 0)
            SetEkrFrontAnimPostion(0, val1, val2);
        else
            SetEkrFrontAnimPostion(1, val3, val4);
        break;

        default:
        break;
    }
}
