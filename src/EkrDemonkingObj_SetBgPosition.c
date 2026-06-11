#include "global.h"
#include "gbafe.h"

void EkrDemonkingObj_SetBgPosition(int x, int y)
{
    int type = gEkrDistanceType;
    switch (type) {
    case EKR_DISTANCE_CLOSE:
        x += 0x8;
        break;
    
    case EKR_DISTANCE_FAR:
        x += 0x20;
        break;

    case EKR_DISTANCE_FARFAR:
        x += 0x20;
        break;
    }

    BG_SetPosition(BG_1, x, y);
}
