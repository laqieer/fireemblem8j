#include "global.h"
#include "hardware.h"
#include "bmunit.h"
#include "mu.h"
#include "spline.h"
#include "worldmap.h"
#include "constants/classes.h"

//! FE8U = 0x080BE0A4
void GmMu_GetRawPosition(struct GMapMuProc * muProc, int index, s16 * x, s16 * y)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];
    MapUnitC_GetPosition(((struct WorldMapMainProc *)(muProc->proc_parent))->gm_unitc, muPrimProc->unk_2b, x, y);
    return;
}
