#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "mu.h"
#include "spline.h"

#include "worldmap.h"

#include "constants/classes.h"

void GmMu_SetPosition(struct GMapMuProc * muProc, int index, s16 xBase, s16 yBase)
{
    int x = xBase;
    int y = yBase;

    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];

    y = (s16)(y + 6);

    MapUnitC_SetPosition(((struct WorldMapMainProc *)(muPrimProc->proc_parent))->gm_unitc, muPrimProc->unk_2b, x, y);

    muPrimProc->unk_44 = x;
    muPrimProc->unk_46 = y;

    muPrimProc->unk_40 = 0;

    return;
}
