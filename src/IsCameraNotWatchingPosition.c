#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "ctc.h"
#include "bmreliance.h"
#include "event.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "playerphase.h"
#include "cp_common.h"
#include "bmmind.h"
#include "bmtrick.h"
#include "bmio.h"
#include "fontgrp.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "bmphase.h"
#include "bmusailment.h"
#include "bmsave.h"
#include "worldmap.h"
#include "eventcall.h"
#include "bm.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

//! FE8U = 0x08015E9C
s8 IsCameraNotWatchingPosition(int x, int y) {
    int xTarget = GetCameraAdjustedX(x * 16);
    int yTarget = GetCameraAdjustedY(y * 16);

    if ((xTarget == gBmSt.camera.x) && (yTarget == gBmSt.camera.y)) {
        return 0;
    }

    return 1;
}
