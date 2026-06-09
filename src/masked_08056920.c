#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

int EfxGetCamMovDuration(void)
{
    if (gEkrDistanceType == EKR_DISTANCE_FARFAR)
        return 0x18;
    else if (gEkrDistanceType == EKR_DISTANCE_FAR)
        return 0x10;
    else
        return 0x0;
}
