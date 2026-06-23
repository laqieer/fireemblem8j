#include "global.h"
#include "hardware.h"
#include "ap.h"
#include "bmlib.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "ctc.h"
#include "mu.h"
#include "spline.h"
#include "worldmap.h"

//! FE8U = 0x080BE080
void GmMu_SetBlendEnabled(struct GMapMuProc * muProc, int index, s8 blendEnabled)
{
    struct GMapMuPrimProc * muPrimProc;

    // The JP build sign-extends blendEnabled at function entry (lsls/asrs before
    // the proc/array chain); the US build does it just before the call. The empty
    // `if` forces agbcc to materialize (s8)blendEnabled first, matching JP. The
    // s8 (signed) prototype of MapUnitC_SetBlendEnabled makes it emit asrs (not lsrs).
    if (blendEnabled)
    {
    }

    muPrimProc = muProc->unk_2c[index];
    MapUnitC_SetBlendEnabled(
        ((struct WorldMapMainProc *)(muProc->proc_parent))->gm_unitc, muPrimProc->unk_2b, blendEnabled);
}
