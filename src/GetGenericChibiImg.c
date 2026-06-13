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

u8* GetGenericChibiImg(int fid) {

    u8* gUnknown_080DC3FC[] = {
        gGenericIcon_3,
        gGenericIcon_2,
        gGenericIcon_0,
        gGenericIcon_0,
        gGenericIcon_3,
        gGenericIcon_1,
        gGenericIcon_1,
        gGenericIcon_3,
    };

    fid = fid - FID_FACTION_CHIBI;

    return gUnknown_080DC3FC[fid];
}
