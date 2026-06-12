#include "global.h"
#include "gbafe.h"

void InitEkrDragonStatus(void)
{
    switch (GetBanimDragonStatusType()) {
    case EKRDRGON_TYPE_DRACO_ZOMBIE:
        SetAnimStateHidden(EKR_POS_L);
        break;

    case EKRDRGON_TYPE_DEMON_KING:
        SetAnimStateHidden(EKR_POS_L);
        break;

    case EKRDRGON_TYPE_NORMAL:
    case EKRDRGON_TYPE_MYRRH:
    default:
        break;
    }
}
