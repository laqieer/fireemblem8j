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














































//! FE8U = 0x08015D30
void StoreAdjustedCameraPositions(int xIn, int yIn, int* xOut, int* yOut) {

    *xOut = xIn - 7;
    *yOut = yIn - 5;

    if (*xOut < 0) {
        *xOut = 0;
    }

    if (*yOut < 0) {
        *yOut = 0;
    }

    if (*xOut + 8 > gBmMapSize.x - 1) {
        *xOut = gBmMapSize.x - 0xf;
    }

    if (*yOut + 4 > gBmMapSize.y - 1) {
        *yOut = gBmMapSize.y - 10;
    }

    return;
}
