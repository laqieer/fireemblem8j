#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "scene.h"
#include "classdisplayfont.h"
#include "opinfo.h"
#include "anime.h"
#include "efxbattle.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "sysutil.h"
#include "constants/classes.h"



static inline int DarknessCoeff(int darkness, u8 lsr) {
    return 0x10 - (darkness >> (lsr));
}

void ClassIntro_LoopBackdropFadeIn(struct OpInfoEnterProc* proc) {

    SetBlendConfig(2, 0, 0, DarknessCoeff(proc->timer, 1));

    SetBlendBackdropA(1);

    proc->timer++;

    if (proc->timer == 32) {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}
