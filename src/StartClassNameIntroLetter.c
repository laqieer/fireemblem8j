#include "global.h"
#include <stdio.h>
#include <string.h>
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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_opinfoview[];

ProcPtr StartClassNameIntroLetter(ProcPtr parent, u8 index) {
    struct OpInfoViewProc* proc = Proc_Start(gProcScr_opinfoview, parent);

    proc->charIndex = index;

    return proc;
}
