#include "global.h"
#include "hardware.h"
#include "bmunit.h"
#include "mu.h"
#include "spline.h"
#include "worldmap.h"
#include "constants/classes.h"

//! FE8U = 0x080BE40C
void GmMu_StartFadeIn(struct GMapMuProc * muProc, int index, int arg)
{
    StartGmapUnitFadeIn(muProc->unk_2c[index]->unk_2b, arg, NULL);
    return;
}
