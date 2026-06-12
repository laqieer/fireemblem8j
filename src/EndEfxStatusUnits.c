#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "anime.h"
#include "hardware.h"
#include "bmmap.h"
#include "mu.h"
#include "bmudisp.h"
#include "constants/video-banim.h"

void EndEfxStatusUnits(struct Anim *anim)
{
    if (gpProcEfxStatusUnits[GetAnimPosition(anim)]) {
        Proc_End(gpProcEfxStatusUnits[GetAnimPosition(anim)]);
        gpProcEfxStatusUnits[GetAnimPosition(anim)] = NULL;
    }
}
