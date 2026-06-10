#include "global.h"
#include <string.h>
#include "constants/classes.h"
#include "proc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "chapterdata.h"
#include "rng.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "bmtrick.h"
#include "mu.h"
#include "uimenu.h"
#include "bmtrap.h"
#include "gamecontrol.h"
#include "bmarena.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "bmlib.h"
#include "worldmap.h"
#include "bmio.h"
#include "bmmind.h"

void BMapDispSuspend(void) {
    if (++gBmSt.gameGfxSemaphore > 1)
        return; // gfx was already blocked, nothing needs to be done.

    SetSecondaryHBlankHandler(NULL);
    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    EnablePaletteSync();
    Proc_BlockEachMarked(1);
}
