#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "hardware.h"
#include "rng.h"
#include "bm.h"
#include "bmlib.h"
#include "prepscreen.h"
#include "constants/faces.h"
#include "face.h"


void ApplyGenericChibiPal(int fid, int pal) {

    // generic minimug palette lut
    u16* gUnknown_080D77DC[] = {
        gGenericIcon_4,
        gGenericIcon_5,
        gGenericIcon_6,
        gGenericIcon_5,
        gGenericIcon_5,
        gGenericIcon_6,
        gGenericIcon_5,
        gGenericIcon_4,
    };

    fid = fid - FID_FACTION_CHIBI;

    ApplyPalette(gUnknown_080D77DC[fid], pal);

    return;
}
