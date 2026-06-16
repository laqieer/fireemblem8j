#include "global.h"
#include "ekrbattle.h"
#include "ekrdragon.h"

void NewEkrUnitKakudai(int identifier)
{
    struct ProcUnitKakudai * proc =
        Proc_Start(ProcScr_ekrUnitKakudai, PROC_TREE_3);

    proc->type = identifier;
    proc->valid_r = 0;
    proc->valid_l = 0;

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
    case EKR_DISTANCE_MONOCOMBAT:
        if (gBanimValid[POS_L] == true && GetBanimDragonStatusType() == EKRDRGON_TYPE_NORMAL)
            proc->valid_l = 1;

        if (gBanimValid[POS_R] == true)
            proc->valid_r = 1;
        return;

    case EKR_DISTANCE_PROMOTION:
        if (identifier == 0)
        {
            proc->valid_l = 0;
            proc->valid_r = 1;
        }
        else
        {
            proc->valid_l = 1;
            proc->valid_r = 0;
        }
        break;

    default:
        break;
    }
}
