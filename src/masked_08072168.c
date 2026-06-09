#include "gbafe.h"





u32 GetEkrDragonStatusType_(struct Anim * anim);

/* prototypes for same-file helpers called by this run */
void EkrDragonTmCpyHFlip(int x, int y);

void EkrDragonTmCpyWithDistance(void)
{
    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
        EkrDragonTmCpyHFlip(0x90, 0);
        break;

    case EKR_DISTANCE_FAR:
        EkrDragonTmCpyHFlip(0x58, 0);
        break;

    case EKR_DISTANCE_FARFAR:
        EkrDragonTmCpyHFlip(-0x78, 0);
        break;

    default:
        break;
    }
}
