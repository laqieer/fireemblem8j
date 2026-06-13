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

union GradientEffectData {
    u16 lines[320];
    u16 fireGradient[8][0x40];
};

extern EWRAM_OVERLAY(0) union GradientEffectData sGradientEffect;

void WfxBlueHSync(void) {
    u16 nextLine = (REG_VCOUNT + 1);

    if (nextLine > 160)
        nextLine = 0;

    nextLine += gBmSt.camera.y / 2;

    if (nextLine >= 320)
        ((u16*)(PLTT))[0] = 0;
    else
        ((u16*)(PLTT))[0] = nextLine[sGradientEffect.lines];
}
