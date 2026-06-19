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
extern struct ProcCmd gProcScr_opinfoenter[];

ProcPtr StartClassNameIntro(ProcPtr parent, struct ClassReelEnt* entry) {
    struct OpInfoEnterProc* proc = Proc_Start(gProcScr_opinfoenter, parent);

    (*(ProcPtr *)((char*)proc+0x60)) = parent;
    (*(struct ClassReelEnt **)((char*)proc+0x64)) = entry;

    return proc;
}
